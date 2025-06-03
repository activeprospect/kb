#!/usr/bin/env python3
"""
Script to download images from markdown files and create a mapping file
"""

import os
import re
import json
import hashlib
import requests
from pathlib import Path
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
    return filename[:100]  # Limit length

def get_file_extension(url):
    """Extract file extension from URL"""
    parsed = urlparse(url)
    path = unquote(parsed.path)
    ext = os.path.splitext(path)[1]
    if not ext or ext not in ['.jpg', '.jpeg', '.png', '.gif', '.webp', '.svg']:
        # Default to .png if no valid extension found
        ext = '.png'
    return ext

def download_image(url, save_path, max_retries=3):
    """Download image from URL with retry logic"""
    headers = {
        'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36'
    }
    
    for attempt in range(max_retries):
        try:
            response = requests.get(url, headers=headers, timeout=30, stream=True)
            response.raise_for_status()
            
            with open(save_path, 'wb') as f:
                for chunk in response.iter_content(chunk_size=8192):
                    f.write(chunk)
            
            return True
        except Exception as e:
            print(f"  Attempt {attempt + 1} failed: {str(e)}")
            if attempt < max_retries - 1:
                time.sleep(2)  # Wait before retry
    
    return False

def process_markdown_file(md_path, output_dir, doc_name):
    """Process a single markdown file and download its images"""
    print(f"\nProcessing: {md_path}")
    
    with open(md_path, 'r', encoding='utf-8') as f:
        content = f.read()
    
    images = extract_image_urls(content)
    if not images:
        print(f"  No images found in {md_path}")
        return []
    
    print(f"  Found {len(images)} images")
    
    downloaded_images = []
    doc_dir = os.path.join(output_dir, doc_name)
    os.makedirs(doc_dir, exist_ok=True)
    
    for i, (alt_text, url) in enumerate(images, 1):
        # Skip certain tracking pixels or analytics images
        if any(skip in url.lower() for skip in ['bat.bing.com', 'doubleclick.net', 'googleadservices']):
            print(f"  Skipping tracking/analytics image: {url[:50]}...")
            continue
        
        # Generate filename
        ext = get_file_extension(url)
        
        # Create descriptive filename from alt text or URL
        if alt_text and alt_text.strip() and alt_text != 'iframe':
            description = sanitize_filename(alt_text.strip())[:30]
        else:
            # Extract something meaningful from URL
            url_parts = urlparse(url).path.split('/')
            description = 'image'
            for part in reversed(url_parts):
                if part and not part.startswith('thumbnails') and len(part) > 5:
                    description = sanitize_filename(part)[:30]
                    break
        
        filename = f"{doc_name}-{i:02d}-{description}{ext}"
        save_path = os.path.join(doc_dir, filename)
        
        print(f"  Downloading image {i}: {url[:50]}...")
        
        if download_image(url, save_path):
            downloaded_images.append({
                'original_url': url,
                'local_path': save_path,
                'source_document': md_path,
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
            print(f"Warning: File not found - {md_path}")
    
    # Save mapping file
    mapping_file = os.path.join(output_dir, 'image_mappings.json')
    with open(mapping_file, 'w', encoding='utf-8') as f:
        json.dump(all_mappings, f, indent=2, ensure_ascii=False)
    
    print(f"\n✓ Downloaded {len(all_mappings)} images")
    print(f"✓ Mapping file saved to: {mapping_file}")

if __name__ == '__main__':
    main()