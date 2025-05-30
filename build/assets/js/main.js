// LeadConduit User Guide JavaScript

document.addEventListener('DOMContentLoaded', function() {
    // Mobile menu toggle
    initMobileMenu();
    
    // Table of contents generation
    generateTableOfContents();
    
    // Smooth scrolling for anchor links
    initSmoothScrolling();
    
    // Code block enhancements
    enhanceCodeBlocks();
    
    // Search functionality (if implemented)
    initSearch();
});

/**
 * Initialize mobile menu functionality
 */
function initMobileMenu() {
    // Add mobile menu button to header
    const header = document.querySelector('.header-content');
    const sidebar = document.querySelector('.sidebar');
    
    if (window.innerWidth <= 768) {
        // Create mobile menu button
        const menuButton = document.createElement('button');
        menuButton.className = 'mobile-menu-toggle';
        menuButton.innerHTML = '<i class="fas fa-bars"></i>';
        menuButton.setAttribute('aria-label', 'Toggle navigation');
        
        // Insert before header nav or at end
        const headerNav = document.querySelector('.header-nav');
        if (headerNav) {
            headerNav.parentNode.insertBefore(menuButton, headerNav);
        } else {
            header.appendChild(menuButton);
        }
        
        // Add click handler
        menuButton.addEventListener('click', function() {
            sidebar.classList.toggle('open');
            document.body.classList.toggle('menu-open');
        });
        
        // Close menu when clicking outside
        document.addEventListener('click', function(e) {
            if (!sidebar.contains(e.target) && !menuButton.contains(e.target)) {
                sidebar.classList.remove('open');
                document.body.classList.remove('menu-open');
            }
        });
    }
    
    // Handle window resize
    window.addEventListener('resize', function() {
        if (window.innerWidth > 768) {
            sidebar.classList.remove('open');
            document.body.classList.remove('menu-open');
        }
    });
}

/**
 * Generate table of contents for the current page
 */
function generateTableOfContents() {
    const tocContainer = document.getElementById('toc-content');
    const content = document.querySelector('.page-content');
    
    if (!tocContainer || !content) return;
    
    const headings = content.querySelectorAll('h2, h3, h4');
    
    if (headings.length === 0) {
        // Hide TOC if no headings
        const tocSidebar = document.querySelector('.toc-sidebar');
        if (tocSidebar) tocSidebar.style.display = 'none';
        return;
    }
    
    const tocList = document.createElement('ul');
    
    headings.forEach(function(heading, index) {
        // Generate ID if not present
        if (!heading.id) {
            heading.id = 'heading-' + index;
        }
        
        const listItem = document.createElement('li');
        const link = document.createElement('a');
        
        link.href = '#' + heading.id;
        link.textContent = heading.textContent;
        link.className = 'toc-link';
        
        // Add level class for styling
        link.classList.add('toc-level-' + heading.tagName.toLowerCase());
        
        listItem.appendChild(link);
        tocList.appendChild(listItem);
    });
    
    tocContainer.appendChild(tocList);
    
    // Highlight current section on scroll
    initTocScrollSpy();
}

/**
 * Initialize table of contents scroll spy
 */
function initTocScrollSpy() {
    const tocLinks = document.querySelectorAll('.toc-link');
    const headings = document.querySelectorAll('.page-content h2, .page-content h3, .page-content h4');
    
    if (tocLinks.length === 0 || headings.length === 0) return;
    
    function updateActiveTocLink() {
        let currentHeading = null;
        
        headings.forEach(function(heading) {
            const rect = heading.getBoundingClientRect();
            if (rect.top <= 100) {
                currentHeading = heading;
            }
        });
        
        // Remove active class from all links
        tocLinks.forEach(function(link) {
            link.classList.remove('active');
        });
        
        // Add active class to current heading's link
        if (currentHeading) {
            const activeLink = document.querySelector('.toc-link[href="#' + currentHeading.id + '"]');
            if (activeLink) {
                activeLink.classList.add('active');
            }
        }
    }
    
    // Update on scroll
    window.addEventListener('scroll', updateActiveTocLink);
    
    // Initial update
    updateActiveTocLink();
}

/**
 * Initialize smooth scrolling for anchor links
 */
function initSmoothScrolling() {
    const anchorLinks = document.querySelectorAll('a[href^="#"]');
    
    anchorLinks.forEach(function(link) {
        link.addEventListener('click', function(e) {
            const target = document.querySelector(this.getAttribute('href'));
            
            if (target) {
                e.preventDefault();
                
                const headerHeight = 70; // Fixed header height
                const targetPosition = target.offsetTop - headerHeight - 20;
                
                window.scrollTo({
                    top: targetPosition,
                    behavior: 'smooth'
                });
            }
        });
    });
}

/**
 * Enhance code blocks with copy functionality
 */
function enhanceCodeBlocks() {
    const codeBlocks = document.querySelectorAll('pre code');
    
    codeBlocks.forEach(function(block) {
        const pre = block.parentElement;
        
        // Create copy button
        const copyButton = document.createElement('button');
        copyButton.className = 'copy-button';
        copyButton.innerHTML = '<i class="fas fa-copy"></i>';
        copyButton.setAttribute('aria-label', 'Copy code');
        copyButton.title = 'Copy to clipboard';
        
        // Position copy button
        pre.style.position = 'relative';
        copyButton.style.position = 'absolute';
        copyButton.style.top = '0.5rem';
        copyButton.style.right = '0.5rem';
        copyButton.style.background = 'rgba(0, 0, 0, 0.1)';
        copyButton.style.border = 'none';
        copyButton.style.borderRadius = '0.25rem';
        copyButton.style.padding = '0.5rem';
        copyButton.style.cursor = 'pointer';
        copyButton.style.fontSize = '0.875rem';
        copyButton.style.color = '#64748b';
        
        pre.appendChild(copyButton);
        
        // Copy functionality
        copyButton.addEventListener('click', function() {
            const text = block.textContent;
            
            navigator.clipboard.writeText(text).then(function() {
                copyButton.innerHTML = '<i class="fas fa-check"></i>';
                copyButton.style.color = '#10b981';
                
                setTimeout(function() {
                    copyButton.innerHTML = '<i class="fas fa-copy"></i>';
                    copyButton.style.color = '#64748b';
                }, 2000);
            }).catch(function() {
                // Fallback for older browsers
                const textArea = document.createElement('textarea');
                textArea.value = text;
                document.body.appendChild(textArea);
                textArea.select();
                document.execCommand('copy');
                document.body.removeChild(textArea);
                
                copyButton.innerHTML = '<i class="fas fa-check"></i>';
                copyButton.style.color = '#10b981';
                
                setTimeout(function() {
                    copyButton.innerHTML = '<i class="fas fa-copy"></i>';
                    copyButton.style.color = '#64748b';
                }, 2000);
            });
        });
    });
}

/**
 * Initialize search functionality (placeholder for future implementation)
 */
function initSearch() {
    // This could be expanded to include client-side search
    // or integration with search services like Algolia
    
    const searchInput = document.querySelector('.search-input');
    if (searchInput) {
        searchInput.addEventListener('input', function() {
            const query = this.value.toLowerCase();
            
            // Placeholder: highlight matching text
            if (query.length > 2) {
                // Implement search highlighting
                console.log('Searching for:', query);
            }
        });
    }
}

/**
 * Utility function to debounce events
 */
function debounce(func, wait) {
    let timeout;
    return function executedFunction(...args) {
        const later = function() {
            clearTimeout(timeout);
            func(...args);
        };
        clearTimeout(timeout);
        timeout = setTimeout(later, wait);
    };
}