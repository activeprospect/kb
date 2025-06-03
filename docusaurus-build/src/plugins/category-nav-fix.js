module.exports = function (context, options) {
  return {
    name: 'category-nav-fix',
    injectHtmlTags() {
      return {
        postBodyTags: [
          {
            tagName: 'script',
            innerHTML: `
              // Fix category navigation clicks
              (function() {
                function setupCategoryLinks() {
                  // Find all category links with href
                  const categoryLinks = document.querySelectorAll('.menu__link--sublist[href]');
                  
                  categoryLinks.forEach(link => {
                    // Remove the default click handler
                    const newLink = link.cloneNode(true);
                    link.parentNode.replaceChild(newLink, link);
                    
                    // Add our custom handler
                    newLink.addEventListener('click', function(e) {
                      // Check if click is on the caret/arrow area (right 40px)
                      const rect = newLink.getBoundingClientRect();
                      const clickX = e.clientX - rect.left;
                      const isCaretClick = clickX > rect.width - 40;
                      
                      if (isCaretClick) {
                        // Toggle the collapse state
                        e.preventDefault();
                        e.stopPropagation();
                        const listItem = newLink.closest('.menu__list-item');
                        if (listItem) {
                          listItem.classList.toggle('menu__list-item--collapsed');
                        }
                      } else {
                        // Navigate to the link
                        // Let the default behavior happen
                      }
                    });
                  });
                }
                
                // Run on page load
                if (document.readyState === 'loading') {
                  document.addEventListener('DOMContentLoaded', setupCategoryLinks);
                } else {
                  setupCategoryLinks();
                }
                
                // Run on route changes (for SPA navigation)
                let lastUrl = location.href;
                new MutationObserver(() => {
                  const url = location.href;
                  if (url !== lastUrl) {
                    lastUrl = url;
                    setTimeout(setupCategoryLinks, 100);
                  }
                }).observe(document, {subtree: true, childList: true});
              })();
            `,
          },
        ],
      };
    },
  };
};