#!/usr/bin/env node

const axios = require('axios');
const fs = require('fs-extra');
const path = require('path');
const glob = require('glob');
const crypto = require('crypto');

// Load configuration
const CONFIG_PATH = path.join(__dirname, '../context/doc360/api-mapping.json');
const config = fs.existsSync(CONFIG_PATH) ? require(CONFIG_PATH) : {};

// Configuration
const API_KEY = process.env.D360_API_KEY;
const PROJECT_ID = process.env.D360_PROJECT_ID;
const BASE_URL = 'https://apihub.document360.io/v2';
const DOCS_PATH = process.env.DOCS_PATH || './docs/v2';
const DEPLOY_MODE = process.env.DEPLOY_MODE || 'incremental';
const CHANGED_FILES = process.env.CHANGED_FILES ? process.env.CHANGED_FILES.split(' ') : [];
const DRY_RUN = process.env.DRY_RUN === 'true';

// API headers
const headers = {
  'api_token': API_KEY,
  'Content-Type': 'application/json'
};

// Caches
const categoryCache = new Map();
const articleCache = new Map();
const checksumCache = new Map();

/**
 * Calculate checksum for content
 */
function calculateChecksum(content) {
  return crypto.createHash('md5').update(content).digest('hex');
}

/**
 * Load checksums from previous deployment
 */
async function loadChecksums() {
  const checksumFile = path.join(__dirname, '.document360-checksums.json');
  if (await fs.pathExists(checksumFile)) {
    const data = await fs.readJson(checksumFile);
    Object.entries(data).forEach(([file, checksum]) => {
      checksumCache.set(file, checksum);
    });
  }
}

/**
 * Save checksums after deployment
 */
async function saveChecksums() {
  const checksumFile = path.join(__dirname, '.document360-checksums.json');
  const data = Object.fromEntries(checksumCache);
  await fs.writeJson(checksumFile, data, { spaces: 2 });
}

/**
 * Transform markdown content for Document360
 */
function transformContent(content, filePath) {
  let transformed = content;
  
  if (config.contentTransformations) {
    // Convert relative links to absolute
    if (config.contentTransformations.convertRelativeLinks) {
      transformed = transformed.replace(
        /\[([^\]]+)\]\((?!http)([^)]+)\)/g,
        (match, text, link) => {
          const absoluteLink = path.join('/docs/v2', path.dirname(filePath), link);
          return `[${text}](${absoluteLink})`;
        }
      );
    }
    
    // Process images
    if (config.contentTransformations.processImages && config.contentTransformations.imageBaseUrl) {
      transformed = transformed.replace(
        /!\[([^\]]*)\]\((?!http)([^)]+)\)/g,
        (match, alt, src) => {
          const absoluteSrc = `${config.contentTransformations.imageBaseUrl}/${src}`;
          return `![${alt}](${absoluteSrc})`;
        }
      );
    }
  }
  
  return transformed;
}

/**
 * Extract and process metadata from markdown frontmatter
 */
function extractMetadata(content, filePath) {
  const metadataRegex = /^---\n([\s\S]*?)\n---/;
  const match = content.match(metadataRegex);
  
  let metadata = config.metadataDefaults ? { ...config.metadataDefaults } : {};
  
  if (match) {
    const metadataContent = match[1];
    const lines = metadataContent.split('\n');
    
    lines.forEach(line => {
      const [key, ...valueParts] = line.split(':');
      if (key && valueParts.length) {
        const value = valueParts.join(':').trim().replace(/^["']|["']$/g, '');
        
        // Map frontmatter fields using configuration
        if (config.frontmatterMapping && config.frontmatterMapping[key]) {
          metadata[config.frontmatterMapping[key]] = value;
        } else {
          metadata[key.trim()] = value;
        }
      }
    });
    
    // Remove frontmatter from content
    content = content.replace(metadataRegex, '').trim();
  }
  
  // Transform content
  content = transformContent(content, filePath);
  
  return { metadata, content };
}

/**
 * Get or create category based on file path
 */
async function getOrCreateCategory(filePath) {
  const relativePath = path.relative(DOCS_PATH, filePath);
  const pathParts = path.dirname(relativePath).split(path.sep).filter(p => p !== '.');
  
  if (pathParts.length === 0) {
    return null; // Root level, no category
  }
  
  let parentId = null;
  let categoryPath = '';
  
  for (const part of pathParts) {
    categoryPath = categoryPath ? `${categoryPath}/${part}` : part;
    
    if (categoryCache.has(categoryPath)) {
      parentId = categoryCache.get(categoryPath);
      continue;
    }
    
    // Map category name if configured
    const categoryName = config.categoryMapping && config.categoryMapping[part] 
      ? config.categoryMapping[part] 
      : part.replace(/-/g, ' ').replace(/\b\w/g, l => l.toUpperCase());
    
    if (DRY_RUN) {
      console.log(`[DRY RUN] Would create category: ${categoryName}`);
      categoryCache.set(categoryPath, `dry-run-${categoryPath}`);
      parentId = `dry-run-${categoryPath}`;
      continue;
    }
    
    try {
      // Check if category exists
      const response = await axios.get(`${BASE_URL}/categories`, {
        headers,
        params: {
          project_version_id: PROJECT_ID
        }
      });
      
      const existingCategory = response.data.data.find(cat => 
        cat.name.toLowerCase() === categoryName.toLowerCase() && 
        cat.parent_category_id === parentId
      );
      
      if (existingCategory) {
        categoryCache.set(categoryPath, existingCategory.id);
        parentId = existingCategory.id;
      } else {
        // Create new category
        const createResponse = await axios.post(`${BASE_URL}/categories`, {
          name: categoryName,
          project_version_id: PROJECT_ID,
          parent_category_id: parentId,
          description: `Documentation for ${categoryName}`
        }, { headers });
        
        const newCategoryId = createResponse.data.data.id;
        categoryCache.set(categoryPath, newCategoryId);
        parentId = newCategoryId;
        console.log(`Created category: ${categoryName}`);
      }
    } catch (error) {
      console.error(`Error managing category ${categoryName}:`, error.message);
      if (error.response) {
        console.error('Response:', error.response.data);
      }
      return null;
    }
  }
  
  return parentId;
}

/**
 * Check if file should be excluded
 */
function shouldExclude(filePath) {
  if (!config.excludePatterns) return false;
  
  const relativePath = path.relative(DOCS_PATH, filePath);
  return config.excludePatterns.some(pattern => {
    const regex = new RegExp(pattern.replace(/\*/g, '.*'));
    return regex.test(relativePath);
  });
}

/**
 * Create or update article in Document360
 */
async function createOrUpdateArticle(filePath) {
  if (shouldExclude(filePath)) {
    console.log(`Skipping excluded file: ${filePath}`);
    return { success: true, skipped: true };
  }
  
  try {
    const content = await fs.readFile(filePath, 'utf-8');
    const checksum = calculateChecksum(content);
    const relativePath = path.relative(DOCS_PATH, filePath);
    
    // Check if content has changed
    if (DEPLOY_MODE === 'incremental' && checksumCache.get(relativePath) === checksum) {
      console.log(`No changes detected: ${relativePath}`);
      return { success: true, unchanged: true };
    }
    
    const { metadata, content: articleContent } = extractMetadata(content, relativePath);
    
    // Determine article title
    let title = metadata.title;
    if (!title) {
      // Try to extract from first H1
      const h1Match = articleContent.match(/^#\s+(.+)$/m);
      title = h1Match ? h1Match[1] : path.basename(filePath, '.md').replace(/-/g, ' ');
    }
    
    // Get category
    const categoryId = await getOrCreateCategory(filePath);
    
    if (DRY_RUN) {
      console.log(`[DRY RUN] Would deploy article: ${title}`);
      console.log(`  Category ID: ${categoryId}`);
      console.log(`  Status: ${metadata.is_draft ? 'Draft' : 'Published'}`);
      return { success: true, title, dryRun: true };
    }
    
    // Check if article exists
    const searchResponse = await axios.get(`${BASE_URL}/articles`, {
      headers,
      params: {
        project_version_id: PROJECT_ID
      }
    });
    
    const existingArticle = searchResponse.data.data.find(article => 
      article.title.toLowerCase() === title.toLowerCase() && 
      (categoryId ? article.category_id === categoryId : true)
    );
    
    const articleData = {
      title,
      content: articleContent,
      category_id: categoryId,
      project_version_id: PROJECT_ID,
      status: metadata.is_draft === 'true' || metadata.draft === true ? 0 : 1,
      slug: metadata.slug || title.toLowerCase().replace(/[^a-z0-9]+/g, '-'),
      description: metadata.description || '',
      tags: metadata.tags ? metadata.tags.split(',').map(t => t.trim()) : [],
      author: metadata.author || config.metadataDefaults?.author
    };
    
    // Add display order if specified
    if (metadata.display_order) {
      articleData.display_order = parseInt(metadata.display_order);
    }
    
    let response;
    if (existingArticle) {
      // Update existing article
      console.log(`Updating article: ${title}`);
      response = await axios.put(`${BASE_URL}/articles/${existingArticle.id}`, 
        articleData, 
        { headers }
      );
    } else {
      // Create new article
      console.log(`Creating article: ${title}`);
      response = await axios.post(`${BASE_URL}/articles`, 
        articleData, 
        { headers }
      );
    }
    
    if (response.status === 200 || response.status === 201) {
      console.log(`✓ Successfully deployed: ${title}`);
      checksumCache.set(relativePath, checksum);
      return { success: true, title };
    } else {
      console.error(`✗ Failed to deploy: ${title}`);
      return { success: false, title, error: response.statusText };
    }
    
  } catch (error) {
    console.error(`✗ Error processing ${filePath}:`, error.message);
    if (error.response && error.response.data) {
      console.error('API Error:', JSON.stringify(error.response.data, null, 2));
    }
    return { success: false, file: filePath, error: error.message };
  }
}

/**
 * Main deployment function
 */
async function deploy() {
  console.log('Starting Document360 deployment...');
  console.log(`Deployment mode: ${DEPLOY_MODE}`);
  if (DRY_RUN) {
    console.log('🔍 DRY RUN MODE - No changes will be made');
  }
  
  // Load previous checksums
  await loadChecksums();
  
  let filesToProcess = [];
  
  if (DEPLOY_MODE === 'full' || CHANGED_FILES.length === 0) {
    // Full deployment - process all markdown files
    filesToProcess = glob.sync(`${DOCS_PATH}/**/*.{md,mdx}`, {
      ignore: ['**/node_modules/**']
    });
  } else {
    // Incremental deployment - process only changed files
    filesToProcess = CHANGED_FILES.filter(file => 
      file.startsWith(DOCS_PATH) && (file.endsWith('.md') || file.endsWith('.mdx'))
    );
  }
  
  console.log(`Found ${filesToProcess.length} files to process`);
  
  const results = {
    successful: [],
    failed: [],
    skipped: [],
    unchanged: []
  };
  
  // Process files in batches to avoid rate limits
  const batchSize = 5;
  for (let i = 0; i < filesToProcess.length; i += batchSize) {
    const batch = filesToProcess.slice(i, i + batchSize);
    const batchResults = await Promise.all(
      batch.map(file => createOrUpdateArticle(file))
    );
    
    batchResults.forEach(result => {
      if (result.skipped) {
        results.skipped.push(result);
      } else if (result.unchanged) {
        results.unchanged.push(result);
      } else if (result.success) {
        results.successful.push(result);
      } else {
        results.failed.push(result);
      }
    });
    
    // Add delay between batches to respect rate limits
    if (i + batchSize < filesToProcess.length && !DRY_RUN) {
      await new Promise(resolve => setTimeout(resolve, 1000));
    }
  }
  
  // Save checksums
  if (!DRY_RUN) {
    await saveChecksums();
  }
  
  // Summary
  console.log('\n=== Deployment Summary ===');
  console.log(`Total files processed: ${filesToProcess.length}`);
  console.log(`Successful: ${results.successful.length}`);
  console.log(`Unchanged: ${results.unchanged.length}`);
  console.log(`Skipped: ${results.skipped.length}`);
  console.log(`Failed: ${results.failed.length}`);
  
  if (results.successful.length > 0) {
    console.log('\nSuccessfully deployed:');
    results.successful.forEach(item => {
      console.log(`✓ ${item.title}`);
    });
  }
  
  if (results.failed.length > 0) {
    console.log('\nFailed deployments:');
    results.failed.forEach(fail => {
      console.log(`✗ ${fail.title || fail.file}: ${fail.error}`);
    });
    process.exit(1);
  }
  
  console.log('\nDeployment completed successfully!');
}

// Run deployment
deploy().catch(error => {
  console.error('Deployment failed:', error);
  process.exit(1);
});