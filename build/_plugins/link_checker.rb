# Jekyll Link Checker Plugin
# Validates internal links during build

Jekyll::Hooks.register :site, :post_write do |site|
  link_checker = LinkChecker.new(site)
  link_checker.check
end

class LinkChecker
  def initialize(site)
    @site = site
    @broken_links = []
  end
  
  def check
    puts "🔗 Checking internal links..."
    
    @site.pages.each do |page|
      check_page_links(page)
    end
    
    if @broken_links.empty?
      puts "✅ All internal links are valid"
    else
      puts "❌ Found #{@broken_links.length} broken links:"
      @broken_links.each do |link|
        puts "  - #{link[:source]} -> #{link[:target]}"
      end
    end
  end
  
  private
  
  def check_page_links(page)
    return unless page.content
    
    # Find all markdown links
    links = page.content.scan(/\[([^\]]+)\]\(([^)]+)\)/)
    
    links.each do |text, url|
      next if external_link?(url)
      next if anchor_only?(url)
      
      target_exists = link_target_exists?(url, page)
      
      unless target_exists
        @broken_links << {
          source: page.url,
          target: url,
          text: text
        }
      end
    end
  end
  
  def external_link?(url)
    url.start_with?('http://', 'https://', 'mailto:', 'tel:')
  end
  
  def anchor_only?(url)
    url.start_with?('#')
  end
  
  def link_target_exists?(url, source_page)
    # Remove anchors for file checking
    file_url = url.split('#').first
    
    # Handle relative URLs
    if file_url.start_with?('/')
      target_path = file_url
    else
      source_dir = File.dirname(source_page.url)
      target_path = File.join(source_dir, file_url)
    end
    
    # Normalize path
    target_path = File.expand_path(target_path, '/')
    target_path += '/' unless target_path.end_with?('/')
    
    # Check if target page exists
    @site.pages.any? { |page| page.url == target_path }
  end
end