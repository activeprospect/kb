#!/usr/bin/env node

const axios = require('axios');
const fs = require('fs-extra');
const path = require('path');
const glob = require('glob');

// Configuration
const API_KEY = process.env.D360_API_KEY;
const PROJECT_ID = process.env.D360_PROJECT_ID;
const BASE_URL = 'https://api.document360.com/v1';
const DOCS_PATH = process.env.DOCS_PATH || './docs/v2';
const DEPLOY_MODE = process.env.DEPLOY_MODE || 'incremental';
const CHANGED_FILES = process.env.CHANGED_FILES ? process.env.CHANGED_FILES.split(' ') : [];

// API headers
const headers = {
  'api_token': API_KEY,
  'Content-Type': 'application/json'
};

// Cache for categories
const categoryCache = new Map();

/**
 * Extract metadata from markdown frontmatter
 */
function extractMetadata(content) {
  const metadataRegex = /^---\n([\s\S]*?)\n---/;
  const match = content.match(metadataRegex);
  
  if (match) {
    const metadata = {};
    const metadataContent = match[1];
    const lines = metadataContent.split('\n');
    
    lines.forEach(line => {
      const [key, ...valueParts] = line.split(':');
      if (key && valueParts.length) {
        metadata[key.trim()] = valueParts.join(':').trim().replace(/^["']|["']$/g, '');
      }
    });
    
    // Remove frontmatter from content
    content = content.replace(metadataRegex, '').trim();
    
    return { metadata, content };
  }
  
  return { metadata: {}, content };
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
    
    // Check if category exists
    try {
      const response = await axios.get(`${BASE_URL}/categories`, {
        headers,
        params: {
          project_version_id: PROJECT_ID,
          name: part
        }
      });
      
      const existingCategory = response.data.data.find(cat => 
        cat.name.toLowerCase() === part.toLowerCase() && 
        cat.parent_category_id === parentId
      );
      
      if (existingCategory) {
        categoryCache.set(categoryPath, existingCategory.id);
        parentId = existingCategory.id;
      } else {
        // Create new category
        const createResponse = await axios.post(`${BASE_URL}/categories`, {
          name: part,
          project_version_id: PROJECT_ID,
          parent_category_id: parentId
        }, { headers });
        
        const newCategoryId = createResponse.data.data.id;
        categoryCache.set(categoryPath, newCategoryId);
        parentId = newCategoryId;
      }
    } catch (error) {
      console.error(`Error managing category ${part}:`, error.message);
      return null;
    }
  }
  
  return parentId;
}

/**
 * Create or update article in Document360
 */
async function createOrUpdateArticle(filePath) {
  try {
    const content = await fs.readFile(filePath, 'utf-8');
    const { metadata, content: articleContent } = extractMetadata(content);
    
    // Determine article title
    let title = metadata.title;
    if (!title) {
      // Try to extract from first H1
      const h1Match = articleContent.match(/^#\s+(.+)$/m);
      title = h1Match ? h1Match[1] : path.basename(filePath, '.md').replace(/-/g, ' ');
    }
    
    // Get category
    const categoryId = await getOrCreateCategory(filePath);
    
    // Check if article exists
    const searchResponse = await axios.get(`${BASE_URL}/articles`, {
      headers,
      params: {
        project_version_id: PROJECT_ID,
        title: title
      }
    });
    
    const existingArticle = searchResponse.data.data.find(article => 
      article.title.toLowerCase() === title.toLowerCase()
    );
    
    const articleData = {
      title,
      content: articleContent,
      category_id: categoryId,
      project_version_id: PROJECT_ID,
      status: metadata.draft === 'true' ? 0 : 1, // 0 = draft, 1 = published
      slug: metadata.slug || title.toLowerCase().replace(/\s+/g, '-'),
      description: metadata.description || '',
      tags: metadata.tags ? metadata.tags.split(',').map(t => t.trim()) : []
    };
    
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
      return { success: true, title };
    } else {
      console.error(`✗ Failed to deploy: ${title}`);
      return { success: false, title, error: response.statusText };
    }
    
  } catch (error) {
    console.error(`✗ Error processing ${filePath}:`, error.message);
    return { success: false, file: filePath, error: error.message };
  }
}

/**
 * Main deployment function
 */
async function deploy() {
  console.log('Starting Document360 deployment...');
  console.log(`Deployment mode: ${DEPLOY_MODE}`);
  
  let filesToProcess = [];
  
  if (DEPLOY_MODE === 'full' || CHANGED_FILES.length === 0) {
    // Full deployment - process all markdown files
    filesToProcess = glob.sync(`${DOCS_PATH}/**/*.{md,mdx}`, {
      ignore: ['**/node_modules/**', '**/README.md']
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
    failed: []
  };
  
  // Process files in batches to avoid rate limits
  const batchSize = 5;
  for (let i = 0; i < filesToProcess.length; i += batchSize) {
    const batch = filesToProcess.slice(i, i + batchSize);
    const batchResults = await Promise.all(
      batch.map(file => createOrUpdateArticle(file))
    );
    
    batchResults.forEach(result => {
      if (result.success) {
        results.successful.push(result);
      } else {
        results.failed.push(result);
      }
    });
    
    // Add delay between batches to respect rate limits
    if (i + batchSize < filesToProcess.length) {
      await new Promise(resolve => setTimeout(resolve, 1000));
    }
  }
  
  // Summary
  console.log('\n=== Deployment Summary ===');
  console.log(`Total files processed: ${filesToProcess.length}`);
  console.log(`Successful: ${results.successful.length}`);
  console.log(`Failed: ${results.failed.length}`);
  
  if (results.failed.length > 0) {
    console.log('\nFailed deployments:');
    results.failed.forEach(fail => {
      console.log(`- ${fail.title || fail.file}: ${fail.error}`);
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