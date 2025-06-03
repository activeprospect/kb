// Plugin to handle Jekyll/Liquid syntax in markdown files
const visit = require('unist-util-visit').visit;

function removeLiquidSyntax() {
  return (tree, file) => {
    // First pass: Replace Liquid syntax in all text nodes
    visit(tree, 'text', (node) => {
      if (node.value) {
        // Replace Jekyll/Liquid variables and tags
        node.value = node.value
          .replace(/\{\{[^}]*\}\}/g, '') // Remove {{ variable }}
          .replace(/\{%[^%]*%\}/g, '');  // Remove {% tags %}
      }
    });
    
    // Second pass: Fix URLs in links
    visit(tree, 'link', (node) => {
      if (node.url) {
        // Clean up Jekyll variables in URLs
        node.url = node.url.replace(/\{\{[^}]*\}\}/g, '').trim();
        // If URL is empty after cleanup, set to #
        if (!node.url) {
          node.url = '#';
        }
      }
    });
    
    // Third pass: Fix inline code that might contain Liquid syntax
    visit(tree, 'inlineCode', (node) => {
      if (node.value) {
        node.value = node.value
          .replace(/\{\{[^}]*\}\}/g, '{{ }}') // Replace with placeholder
          .replace(/\{%[^%]*%\}/g, '{% %}');
      }
    });
  };
}

module.exports = {
  removeLiquidSyntax
};