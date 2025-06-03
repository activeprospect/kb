const fs = require('fs');
const path = require('path');

// Pre-process markdown files to remove Jekyll/Liquid syntax
function processMarkdownFile(filePath) {
  try {
    let content = fs.readFileSync(filePath, 'utf8');
    
    // Replace Jekyll/Liquid syntax
    content = content
      .replace(/\{\{[^}]*\}\}/g, '') // Remove {{ variable }}
      .replace(/\{%[^%]*%\}/g, '');  // Remove {% tags %}
    
    return content;
  } catch (error) {
    console.error(`Error processing ${filePath}:`, error);
    return null;
  }
}

// Export for use in webpack loader
module.exports = processMarkdownFile;