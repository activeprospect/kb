#!/usr/bin/env python3
"""
Script to download images from markdown files using curl
"""

import os
import re
import json
import subprocess
from urllib.parse import urlparse, unquote
import time

def extract_image_urls(content):
    """Extract all image URLs from markdown content"""
    # Pattern to match markdown images: ![alt text](url)
    pattern = r'!\[([^\]]*)\]\(([^)]+)\)'
    matches = re.findall(pattern, content)
    return matches

def sanitize_filename(filename):
    """Sanitize filename for safe file system usage"""
    # Remove or replace invalid characters
    invalid_chars = '<>:"/\\|?*'
    for char in invalid_chars:
        filename = filename.replace(char, '-')
    # Remove extra spaces and limit length
    filename = ' '.join(filename.split())[:100]
    return filename

def get_file_extension(url):
    """Extract file extension from URL"""
    parsed = urlparse(url)
    path = unquote(parsed.path)
    ext = os.path.splitext(path)[1].lower()
    if not ext or ext not in ['.jpg', '.jpeg', '.png', '.gif', '.webp', '.svg']:
        # Default to .png if no valid extension found
        ext = '.png'
    return ext

def download_image_curl(url, save_path):
    """Download image using curl"""
    cmd = [
        'curl',
        '-L',  # Follow redirects
        '-s',  # Silent mode
        '--max-time', '30',  # Timeout
        '-H', 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36',
        '-o', save_path,
        url
    ]
    
    try:
        result = subprocess.run(cmd, capture_output=True, text=True)
        if result.returncode == 0 and os.path.exists(save_path) and os.path.getsize(save_path) > 0:
            return True
        else:
            if os.path.exists(save_path):
                os.remove(save_path)
            return False
    except Exception as e:
        print(f"    Error: {str(e)}")
        return False

def process_markdown_file(md_path, output_dir, doc_name):
    """Process a single markdown file and download its images"""
    print(f"\nProcessing: {os.path.basename(md_path)}")
    
    with open(md_path, 'r', encoding='utf-8') as f:
        content = f.read()
    
    images = extract_image_urls(content)
    if not images:
        print(f"  No images found")
        return []
    
    # Filter out tracking/analytics images
    filtered_images = []
    for alt_text, url in images:
        if any(skip in url.lower() for skip in ['bat.bing.com', 'doubleclick.net', 'googleadservices', 'chilipiper']):
            continue
        filtered_images.append((alt_text, url))
    
    print(f"  Found {len(filtered_images)} downloadable images (excluded {len(images) - len(filtered_images)} tracking pixels)")
    
    downloaded_images = []
    doc_dir = os.path.join(output_dir, doc_name)
    os.makedirs(doc_dir, exist_ok=True)
    
    for i, (alt_text, url) in enumerate(filtered_images, 1):
        # Generate filename
        ext = get_file_extension(url)
        
        # Create descriptive filename from alt text or URL
        if alt_text and alt_text.strip() and alt_text not in ['', 'iframe']:
            # Clean up the alt text
            description = alt_text.strip()
            # Extract meaningful part from complex alt text
            if '_' in description and description.count('_') > 2:
                # Looks like it might be a title_author_date format
                parts = description.split('_')
                description = parts[0]  # Just use the title part
            description = sanitize_filename(description)[:40]
        else:
            # Extract something meaningful from URL
            description = 'image'
            
        filename = f"{doc_name}-{i:02d}-{description}{ext}"
        save_path = os.path.join(doc_dir, filename)
        
        print(f"  [{i}/{len(filtered_images)}] Downloading: {url[:60]}...")
        
        if download_image_curl(url, save_path):
            downloaded_images.append({
                'original_url': url,
                'local_path': save_path,
                'source_document': os.path.basename(md_path),
                'alt_text': alt_text,
                'image_number': i
            })
            print(f"    ✓ Saved as: {filename}")
        else:
            print(f"    ✗ Failed to download")
    
    return downloaded_images

def main():
    base_dir = '/Users/alex/Dev/kb'
    bloomfire_dir = os.path.join(base_dir, 'content/bloomfire-2')
    output_dir = os.path.join(base_dir, 'media/images')
    
    # Priority files to process
    priority_files = [
        ('advanced options when implementing the trustedform.md', 'advanced-options-trustedform'),
        ('advanced options when implementing the trustedform-1.md', 'advanced-options-trustedform-1'),
        ('advanced options when implementing the trustedform-2.md', 'advanced-options-trustedform-2'),
        ('step by step guide on how to create a bridge.md', 'step-by-step-bridge'),
        ('trustedform consent language manager.md', 'trustedform-consent-language'),
        ('how to setup facebook conversion api.md', 'facebook-conversion-api'),
        ('implementing trustedform certify on third party fo.md', 'implementing-third-party'),
        ('implementing trustedform certify on third party fo-1.md', 'implementing-third-party-1')
    ]
    
    all_mappings = []
    
    for filename, doc_name in priority_files:
        md_path = os.path.join(bloomfire_dir, filename)
        if os.path.exists(md_path):
            mappings = process_markdown_file(md_path, output_dir, doc_name)
            all_mappings.extend(mappings)
        else:
            print(f"Warning: File not found - {filename}")
    
    # Save mapping file
    mapping_file = os.path.join(output_dir, 'image_mappings.json')
    with open(mapping_file, 'w', encoding='utf-8') as f:
        json.dump(all_mappings, f, indent=2, ensure_ascii=False)
    
    print(f"\n" + "="*60)
    print(f"✓ Successfully downloaded {len(all_mappings)} images")
    print(f"✓ Mapping file saved to: {mapping_file}")
    print("="*60)

if __name__ == '__main__':
    main()