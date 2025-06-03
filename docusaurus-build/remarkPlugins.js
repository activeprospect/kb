// Plugin to handle Jekyll/Liquid syntax in markdown files
function removeLiquidSyntax() {
  return (tree, file) => {
    const visit = require('unist-util-visit');
    
    visit(tree, 'text', (node) => {
      // Replace Jekyll/Liquid variables with empty strings or placeholders
      node.value = node.value
        .replace(/\{\{[^}]+\}\}/g, '') // Remove {{ variable }}
        .replace(/\{%[^%]+%\}/g, '');  // Remove {% tags %}
    });
    
    visit(tree, 'link', (node) => {
      if (node.url) {
        // Clean up Jekyll variables in URLs
        node.url = node.url.replace(/\{\{[^}]+\}\}/g, '');
      }
    });
  };
}

module.exports = {
  removeLiquidSyntax
};