#!/usr/bin/env node

const axios = require('axios');
const fs = require('fs-extra');
const path = require('path');
const glob = require('glob');
const crypto = require('crypto');
const matter = require('gray-matter');
const marked = require('marked');

// Configuration
const ZENDESK_SUBDOMAIN = process.env.ZENDESK_SUBDOMAIN;
const ZENDESK_EMAIL = process.env.ZENDESK_EMAIL;
const ZENDESK_API_TOKEN = process.env.ZENDESK_API_TOKEN;
const DOCS_PATH = process.env.DOCS_PATH || './docs/v2';
const DEPLOY_MODE = process.env.DEPLOY_MODE || 'incremental';
const CHANGED_FILES = process.env.CHANGED_FILES ? process.env.CHANGED_FILES.split(' ') : [];
const DRY_RUN = process.env.DRY_RUN === 'true';
const ZENDESK_LOCALE = process.env.ZENDESK_LOCALE || 'en-us';

// Validate required environment variables
if (!ZENDESK_SUBDOMAIN || !ZENDESK_EMAIL || !ZENDESK_API_TOKEN) {
  console.error('Error: Missing required environment variables');
  console.error('Required: ZENDESK_SUBDOMAIN, ZENDESK_EMAIL, ZENDESK_API_TOKEN');
  process.exit(1);
}

// Zendesk API setup
const BASE_URL = `https://${ZENDESK_SUBDOMAIN}.zendesk.com/api/v2/help_center`;
const auth = Buffer.from(`${ZENDESK_EMAIL}/token:${ZENDESK_API_TOKEN}`).toString('base64');

const headers = {
  'Authorization': `Basic ${auth}`,
  'Content-Type': 'application/json',
  'Accept': 'application/json'
};

// Configure marked to down-shift headers (h1 -> h2, h2 -> h3, etc.)
marked.use({
  renderer: {
    heading(text, level) {
      // Shift headers down by 1 level since article title is h1
      const actualLevel = Math.min(level + 1, 6);
      const id = text.toLowerCase().replace(/[^\w]+/g, '-');
      return `<h${actualLevel} id="${id}">${text}</h${actualLevel}>\n`;
    },
    code(code, language) {
      return `<pre><code class="language-${language || ''}">${code}</code></pre>\n`;
    }
  },
  gfm: true,
  breaks: true
});

// Caches for storing IDs and preventing duplicates
const categoryCache = new Map(); // path -> category_id
const sectionCache = new Map();  // path -> section_id
const articleCache = new Map();   // path -> article_id
const checksumCache = new Map();  // file -> checksum

// Load configuration
const CONFIG_PATH = path.join(__dirname, 'zendesk-config.json');
let config = {
  categoryMapping: {},
  sectionMapping: {},
  excludePatterns: ['**/README.md', '**/_category_.json', '**/images/**'],
  contentTransformations: {
    convertRelativeLinks: true,
    processImages: true,
    imageBaseUrl: ''
  },
  defaultPermissions: {
    viewableBy: 'everyone',
    manageableBy: 'staff'
  }
};

if (fs.existsSync(CONFIG_PATH)) {
  config = { ...config, ...require(CONFIG_PATH) };
}

/**
 * Make API request with error handling
 */
async function apiRequest(method, endpoint, data = null) {
  try {
    const options = {
      method,
      url: `${BASE_URL}${endpoint}`,
      headers,
      ...(data && { data })
    };
    
    if (DRY_RUN && method !== 'GET') {
      console.log(`[DRY RUN] Would make ${method} request to ${endpoint}`);
      return { data: { id: `dry-run-${Date.now()}` } };
    }
    
    const response = await axios(options);
    return response.data;
  } catch (error) {
    if (error.response) {
      console.error(`Zendesk API Error: ${error.response.status} - ${JSON.stringify(error.response.data)}`);
      throw new Error(`Zendesk API Error: ${error.response.status}`);
    }
    throw error;
  }
}

/**
 * Load all existing Zendesk content to prevent duplicates
 */
async function loadExistingContent() {
  try {
    console.log('Loading existing Zendesk content...');
    
    // Load categories
    const categoriesResponse = await apiRequest('GET', `/${ZENDESK_LOCALE}/categories.json?per_page=100`);
    const categories = categoriesResponse.categories || [];
    
    for (const category of categories) {
      // Store by name for lookup
      categoryCache.set(category.name.toLowerCase(), category.id);
    }
    console.log(`Found ${categories.length} existing categories`);
    
    // Load sections
    const sectionsResponse = await apiRequest('GET', `/${ZENDESK_LOCALE}/sections.json?per_page=100`);
    const sections = sectionsResponse.sections || [];
    
    for (const section of sections) {
      // Store by name and parent for lookup
      const key = `${section.category_id || section.parent_section_id}-${section.name.toLowerCase()}`;
      sectionCache.set(key, section.id);
    }
    console.log(`Found ${sections.length} existing sections`);
    
    // Load articles
    const articlesResponse = await apiRequest('GET', `/${ZENDESK_LOCALE}/articles.json?per_page=100`);
    const articles = articlesResponse.articles || [];
    
    for (const article of articles) {
      // Store by title and section for lookup
      const key = `${article.section_id}-${article.title.toLowerCase()}`;
      articleCache.set(key, article.id);
    }
    console.log(`Found ${articles.length} existing articles`);
    
  } catch (error) {
    console.error('Error loading existing content:', error.message);
    if (!DRY_RUN) {
      throw error;
    }
  }
}

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
  const checksumFile = path.join(__dirname, '.zendesk-checksums.json');
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
  if (DRY_RUN) return;
  
  const checksumFile = path.join(__dirname, '.zendesk-checksums.json');
  const data = Object.fromEntries(checksumCache);
  await fs.writeJson(checksumFile, data, { spaces: 2 });
}

/**
 * Transform markdown content for Zendesk
 */
function transformContent(content, filePath) {
  let transformed = content;
  
  // First, convert markdown to HTML with down-shifted headers
  transformed = marked.parse(transformed);
  
  if (config.contentTransformations) {
    // Convert relative links to absolute (now in HTML)
    if (config.contentTransformations.convertRelativeLinks) {
      // Handle markdown-style links that might still exist
      transformed = transformed.replace(
        /\[([^\]]+)\]\((?!http)([^)]+)\)/g,
        (match, text, link) => {
          const cleanLink = link.replace(/\.md$/, '');
          return `<a href="/hc/en-us/articles/${cleanLink}">${text}</a>`;
        }
      );
      
      // Handle HTML links
      transformed = transformed.replace(
        /<a href="(?!http)([^"]+)">/g,
        (match, link) => {
          const cleanLink = link.replace(/\.md$/, '');
          return `<a href="/hc/en-us/articles/${cleanLink}">`;
        }
      );
    }
    
    // Process images (now in HTML)
    if (config.contentTransformations.processImages && config.contentTransformations.imageBaseUrl) {
      transformed = transformed.replace(
        /<img([^>]*?)src="(?!http)([^"]+)"([^>]*?)>/g,
        (match, before, src, after) => {
          const absoluteSrc = `${config.contentTransformations.imageBaseUrl}/${src}`;
          return `<img${before}src="${absoluteSrc}"${after}>`;
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
  const parsed = matter(content);
  const metadata = parsed.data || {};
  
  // Transform content
  const transformedContent = transformContent(parsed.content, filePath);
  
  return { metadata, content: transformedContent };
}

/**
 * Get metadata from index.md file
 */
async function getIndexMetadata(dirPath) {
  const indexPath = path.join(dirPath, 'index.md');
  
  if (await fs.pathExists(indexPath)) {
    const content = await fs.readFile(indexPath, 'utf-8');
    const { metadata } = extractMetadata(content, indexPath);
    return metadata;
  }
  
  return null;
}

/**
 * Get or create category for top-level directory
 */
async function getOrCreateCategory(categoryDir) {
  const categoryPath = path.basename(categoryDir);
  
  // Get metadata from index.md
  const metadata = await getIndexMetadata(categoryDir);
  const categoryName = metadata?.title || 
    config.categoryMapping[categoryPath] ||
    categoryPath.replace(/-/g, ' ').replace(/\b\w/g, l => l.toUpperCase());
  
  // Check if category already exists
  const existingCategoryId = categoryCache.get(categoryName.toLowerCase());
  if (existingCategoryId) {
    console.log(`Using existing category: ${categoryName}`);
    return existingCategoryId;
  }
  
  if (DRY_RUN) {
    console.log(`[DRY RUN] Would create category: ${categoryName}`);
    const dryRunId = `dry-category-${categoryPath}`;
    categoryCache.set(categoryName.toLowerCase(), dryRunId);
    return dryRunId;
  }
  
  try {
    // Create new category
    const categoryData = {
      category: {
        name: categoryName,
        description: metadata?.description || `Documentation for ${categoryName}`,
        locale: ZENDESK_LOCALE
      }
    };
    
    const createResponse = await apiRequest('POST', `/${ZENDESK_LOCALE}/categories.json`, categoryData);
    const newCategoryId = createResponse.category.id;
    
    categoryCache.set(categoryName.toLowerCase(), newCategoryId);
    console.log(`Created category: ${categoryName}`);
    
    return newCategoryId;
  } catch (error) {
    console.error(`Error creating category ${categoryName}:`, error.message);
    return null;
  }
}

/**
 * Get or create section based on directory path
 */
async function getOrCreateSection(dirPath, parentId, isCategory = false) {
  const sectionName = path.basename(dirPath);
  
  // Get metadata from index.md
  const metadata = await getIndexMetadata(dirPath);
  const displayName = metadata?.title ||
    config.sectionMapping?.[sectionName] ||
    sectionName.replace(/-/g, ' ').replace(/\b\w/g, l => l.toUpperCase());
  
  // Check if section already exists
  const lookupKey = `${parentId}-${displayName.toLowerCase()}`;
  const existingSectionId = sectionCache.get(lookupKey);
  if (existingSectionId) {
    console.log(`Using existing section: ${displayName}`);
    return existingSectionId;
  }
  
  if (DRY_RUN) {
    console.log(`[DRY RUN] Would create section: ${displayName}`);
    const dryRunId = `dry-section-${sectionName}`;
    sectionCache.set(lookupKey, dryRunId);
    return dryRunId;
  }
  
  try {
    // Create new section
    const sectionData = {
      section: {
        name: displayName,
        description: metadata?.description || `Documentation for ${displayName}`,
        locale: ZENDESK_LOCALE,
        ...config.defaultPermissions
      }
    };
    
    if (isCategory) {
      sectionData.section.category_id = parentId;
    } else {
      sectionData.section.parent_section_id = parentId;
    }
    
    const endpoint = isCategory 
      ? `/categories/${parentId}/sections.json`
      : `/${ZENDESK_LOCALE}/sections.json`;
    
    const createResponse = await apiRequest('POST', endpoint, sectionData);
    const newSectionId = createResponse.section.id;
    
    sectionCache.set(lookupKey, newSectionId);
    console.log(`Created section: ${displayName}`);
    
    return newSectionId;
  } catch (error) {
    console.error(`Error creating section ${displayName}:`, error.message);
    return null;
  }
}

/**
 * Get the appropriate section for a file based on its path
 */
async function getSectionForFile(filePath) {
  const relativePath = path.relative(DOCS_PATH, filePath);
  const pathParts = relativePath.split(path.sep);
  
  if (pathParts.length < 2) {
    console.error(`Invalid file path structure: ${relativePath}`);
    return null;
  }
  
  // First part is the category
  const categoryDir = path.join(DOCS_PATH, pathParts[0]);
  const categoryId = await getOrCreateCategory(categoryDir);
  
  if (!categoryId) {
    console.error(`Failed to get category for: ${categoryDir}`);
    return null;
  }
  
  // If file is directly under category (e.g., exports/index.md)
  if (pathParts.length === 2) {
    // Create or get a section with the same name as the category
    return await getOrCreateSection(categoryDir, categoryId, true);
  }
  
  // Build section hierarchy
  let currentParentId = categoryId;
  let isFirstSection = true;
  
  // Process each subdirectory as a section
  for (let i = 1; i < pathParts.length - 1; i++) {
    const sectionPath = path.join(DOCS_PATH, ...pathParts.slice(0, i + 1));
    currentParentId = await getOrCreateSection(sectionPath, currentParentId, isFirstSection);
    isFirstSection = false;
    
    if (!currentParentId) {
      console.error(`Failed to create section hierarchy for: ${filePath}`);
      return null;
    }
  }
  
  return currentParentId;
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
 * Convert tags array to labels for Zendesk
 */
function processLabels(tags) {
  if (!tags || !Array.isArray(tags)) return [];
  
  return tags.map(tag => 
    tag.toLowerCase()
      .replace(/\s+/g, '-')
      .replace(/[^a-z0-9-]/g, '')
  ).filter(Boolean);
}

/**
 * Create or update article in Zendesk
 */
async function createOrUpdateArticle(filePath) {
  if (shouldExclude(filePath)) {
    console.log(`Skipping excluded file: ${filePath}`);
    return { success: true, skipped: true };
  }
  
  // Skip index.md files as they're used for category/section metadata
  if (path.basename(filePath) === 'index.md') {
    console.log(`Skipping index file: ${filePath}`);
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
    
    // Get section
    const sectionId = await getSectionForFile(filePath);
    if (!sectionId) {
      console.error(`No section found for: ${filePath}`);
      return { success: false, error: 'No section' };
    }
    
    // Process labels from tags
    const labels = processLabels(metadata.tags);
    
    // Check if article already exists
    const lookupKey = `${sectionId}-${title.toLowerCase()}`;
    const existingArticleId = articleCache.get(lookupKey);
    
    const articleData = {
      article: {
        title: title,
        body: articleContent,
        locale: ZENDESK_LOCALE,
        section_id: sectionId,
        draft: metadata.draft || false,
        label_names: labels,
        user_segment_id: null, // null means everyone can view
        permission_group_id: 291706, // Admins can edit
        ...config.defaultPermissions
      }
    };
    
    let result;
    if (existingArticleId) {
      // Update existing article
      if (DRY_RUN) {
        console.log(`[DRY RUN] Would update article: ${title}`);
      } else {
        result = await apiRequest('PUT', `/articles/${existingArticleId}.json`, {
          article: {
            title: articleData.article.title,
            body: articleData.article.body,
            draft: articleData.article.draft,
            label_names: articleData.article.label_names
          }
        });
        console.log(`Updated article: ${title}`);
      }
    } else {
      // Create new article
      if (DRY_RUN) {
        console.log(`[DRY RUN] Would create article: ${title}`);
      } else {
        result = await apiRequest('POST', `/sections/${sectionId}/articles.json`, articleData);
        const newArticleId = result.article.id;
        articleCache.set(lookupKey, newArticleId);
        console.log(`Created article: ${title}`);
      }
    }
    
    // Update checksum cache
    checksumCache.set(relativePath, checksum);
    
    return { 
      success: true, 
      title, 
      articleId: existingArticleId || (result?.article?.id),
      action: existingArticleId ? 'updated' : 'created' 
    };
    
  } catch (error) {
    console.error(`Error processing ${filePath}:`, error.message);
    return { success: false, error: error.message };
  }
}

/**
 * Process all markdown files
 */
async function processFiles() {
  await loadChecksums();
  await loadExistingContent();
  
  let files;
  if (DEPLOY_MODE === 'changed' && CHANGED_FILES.length > 0) {
    // Only process changed files
    files = CHANGED_FILES.filter(f => f.endsWith('.md') && f.startsWith(DOCS_PATH));
  } else {
    // Process all markdown files
    files = glob.sync(`${DOCS_PATH}/**/*.md`);
  }
  
  console.log(`\nProcessing ${files.length} files...`);
  
  const results = {
    success: 0,
    failed: 0,
    skipped: 0,
    unchanged: 0
  };
  
  // Sort files to process categories and sections first (index.md files)
  files.sort((a, b) => {
    const aIsIndex = path.basename(a) === 'index.md';
    const bIsIndex = path.basename(b) === 'index.md';
    if (aIsIndex && !bIsIndex) return -1;
    if (!aIsIndex && bIsIndex) return 1;
    return a.localeCompare(b);
  });
  
  for (const file of files) {
    const result = await createOrUpdateArticle(file);
    
    if (result.success) {
      if (result.skipped) {
        results.skipped++;
      } else if (result.unchanged) {
        results.unchanged++;
      } else {
        results.success++;
      }
    } else {
      results.failed++;
    }
  }
  
  await saveChecksums();
  
  console.log('\nDeployment Summary:');
  console.log(`✓ Success: ${results.success}`);
  console.log(`✗ Failed: ${results.failed}`);
  console.log(`→ Skipped: ${results.skipped}`);
  console.log(`= Unchanged: ${results.unchanged}`);
  
  if (results.failed > 0) {
    process.exit(1);
  }
}

// Main execution
async function main() {
  try {
    console.log('Starting Zendesk deployment...');
    console.log(`Mode: ${DEPLOY_MODE}`);
    console.log(`Dry Run: ${DRY_RUN}`);
    console.log(`Docs Path: ${path.resolve(DOCS_PATH)}`);
    
    await processFiles();
    
    console.log('\nDeployment completed successfully!');
  } catch (error) {
    console.error('Deployment failed:', error.message);
    process.exit(1);
  }
}

// Run if called directly
if (require.main === module) {
  main();
}

module.exports = {
  apiRequest,
  createOrUpdateArticle,
  processFiles
};