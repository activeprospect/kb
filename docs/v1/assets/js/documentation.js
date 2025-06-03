// Documentation JavaScript
(function() {
  'use strict';

  // DOM Elements
  const menuToggle = document.getElementById('menu-toggle');
  const sidebar = document.getElementById('doc-sidebar');
  const searchInput = document.getElementById('search-input');
  const navItems = document.querySelectorAll('.nav-item.has-children');

  // Mobile Menu Toggle
  if (menuToggle) {
    menuToggle.addEventListener('click', function() {
      sidebar.classList.toggle('active');
      document.body.classList.toggle('sidebar-open');
    });

    // Close sidebar when clicking outside on mobile
    document.addEventListener('click', function(e) {
      if (window.innerWidth <= 768) {
        if (!sidebar.contains(e.target) && !menuToggle.contains(e.target)) {
          sidebar.classList.remove('active');
          document.body.classList.remove('sidebar-open');
        }
      }
    });
  }

  // Collapsible Navigation
  navItems.forEach(function(item) {
    const toggle = item.querySelector('.nav-toggle');
    const link = item.querySelector('.nav-link, .nav-section');
    
    if (toggle && link) {
      // Handle click on toggle arrow
      toggle.addEventListener('click', function(e) {
        e.preventDefault();
        e.stopPropagation();
        toggleNavItem(item);
      });

      // Handle click on nav section (for sections without URLs)
      if (link.classList.contains('nav-section')) {
        link.addEventListener('click', function(e) {
          e.preventDefault();
          toggleNavItem(item);
        });
      }
    }
  });

  function toggleNavItem(item) {
    const wasExpanded = item.classList.contains('expanded');
    
    // Close other items at the same level
    const siblings = Array.from(item.parentElement.children);
    siblings.forEach(function(sibling) {
      if (sibling !== item && sibling.classList.contains('has-children')) {
        sibling.classList.remove('expanded');
      }
    });

    // Toggle current item
    if (!wasExpanded) {
      item.classList.add('expanded');
    } else {
      item.classList.remove('expanded');
    }
  }

  // Auto-expand active navigation item
  function expandActiveNavigation() {
    const activeLink = document.querySelector('.nav-link.active');
    if (activeLink) {
      let parent = activeLink.parentElement;
      while (parent) {
        if (parent.classList.contains('nav-item')) {
          parent.classList.add('expanded');
        }
        parent = parent.parentElement.closest('.nav-item');
      }
    }
  }

  // Search Functionality
  if (searchInput) {
    let searchTimeout;
    
    searchInput.addEventListener('input', function(e) {
      clearTimeout(searchTimeout);
      const query = e.target.value.toLowerCase().trim();
      
      searchTimeout = setTimeout(function() {
        performSearch(query);
      }, 300);
    });

    function performSearch(query) {
      const navLinks = document.querySelectorAll('.nav-link, .nav-section');
      
      if (query === '') {
        // Reset search - show all items
        navLinks.forEach(function(link) {
          link.parentElement.style.display = '';
        });
        
        // Collapse all except active
        navItems.forEach(function(item) {
          if (!item.querySelector('.nav-link.active')) {
            item.classList.remove('expanded');
          }
        });
        
        expandActiveNavigation();
      } else {
        // Perform search
        navLinks.forEach(function(link) {
          const text = link.textContent.toLowerCase();
          const item = link.parentElement;
          
          if (text.includes(query)) {
            item.style.display = '';
            
            // Expand parent items
            let parent = item.parentElement.closest('.nav-item');
            while (parent) {
              parent.style.display = '';
              parent.classList.add('expanded');
              parent = parent.parentElement.closest('.nav-item');
            }
          } else {
            // Hide if no match and no matching children
            const hasMatchingChild = item.querySelector('.nav-link, .nav-section') && 
              Array.from(item.querySelectorAll('.nav-link, .nav-section')).some(function(child) {
                return child.textContent.toLowerCase().includes(query);
              });
            
            if (!hasMatchingChild) {
              item.style.display = 'none';
            }
          }
        });
      }
    }
  }

  // Smooth Scroll for Anchor Links
  document.addEventListener('click', function(e) {
    const link = e.target.closest('a[href^="#"]');
    if (link) {
      const target = document.querySelector(link.getAttribute('href'));
      if (target) {
        e.preventDefault();
        const offset = 80; // Account for fixed header
        const targetPosition = target.getBoundingClientRect().top + window.scrollY - offset;
        
        window.scrollTo({
          top: targetPosition,
          behavior: 'smooth'
        });
      }
    }
  });

  // Handle Window Resize
  let resizeTimeout;
  window.addEventListener('resize', function() {
    clearTimeout(resizeTimeout);
    resizeTimeout = setTimeout(function() {
      if (window.innerWidth > 768) {
        sidebar.classList.remove('active');
        document.body.classList.remove('sidebar-open');
      }
    }, 250);
  });

  // Initialize on Load
  document.addEventListener('DOMContentLoaded', function() {
    expandActiveNavigation();
    
    // Add loading class removal
    document.body.classList.add('loaded');
  });

  // Handle Back/Forward Navigation
  window.addEventListener('popstate', function() {
    expandActiveNavigation();
  });

})();