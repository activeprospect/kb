#!/usr/bin/env python3
"""
Script to download images from all remaining markdown files
"""

import os
import re
import json
import subprocess
from urllib.parse import urlparse, unquote

def extract_image_urls(content):
    """Extract all image URLs from markdown content"""
    pattern = r'!\[([^\]]*)\]\(([^)]+)\)'
    matches = re.findall(pattern, content)
    return matches

def sanitize_filename(filename):
    """Sanitize filename for safe file system usage"""
    invalid_chars = '<>:"/\\|?*'
    for char in invalid_chars:
        filename = filename.replace(char, '-')
    filename = ' '.join(filename.split())[:100]
    return filename

def get_file_extension(url):
    """Extract file extension from URL"""
    parsed = urlparse(url)
    path = unquote(parsed.path)
    ext = os.path.splitext(path)[1].lower()
    if not ext or ext not in ['.jpg', '.jpeg', '.png', '.gif', '.webp', '.svg']:
        ext = '.png'
    return ext

def download_image_curl(url, save_path):
    """Download image using curl"""
    cmd = [
        'curl',
        '-L',
        '-s',
        '--max-time', '30',
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
        return False

def process_markdown_file(md_path, output_dir, doc_name):
    """Process a single markdown file and download its images"""
    print(f"\nProcessing: {os.path.basename(md_path)}")
    
    with open(md_path, 'r', encoding='utf-8') as f:
        content = f.read()
    
    images = extract_image_urls(content)
    if not images:
        return []
    
    # Filter out tracking/analytics images
    filtered_images = []
    for alt_text, url in images:
        if any(skip in url.lower() for skip in ['bat.bing.com', 'doubleclick.net', 'googleadservices', 'chilipiper', 'javascript:']):
            continue
        filtered_images.append((alt_text, url))
    
    if not filtered_images:
        print(f"  No downloadable images (all were tracking pixels)")
        return []
    
    print(f"  Found {len(filtered_images)} downloadable images")
    
    downloaded_images = []
    doc_dir = os.path.join(output_dir, doc_name)
    os.makedirs(doc_dir, exist_ok=True)
    
    for i, (alt_text, url) in enumerate(filtered_images, 1):
        ext = get_file_extension(url)
        
        # Create descriptive filename
        if alt_text and alt_text.strip() and alt_text not in ['', 'iframe']:
            description = alt_text.strip()
            if '_' in description and description.count('_') > 2:
                parts = description.split('_')
                description = parts[0]
            description = sanitize_filename(description)[:40]
        else:
            description = 'image'
            
        filename = f"{doc_name}-{i:02d}-{description}{ext}"
        save_path = os.path.join(doc_dir, filename)
        
        print(f"  [{i}/{len(filtered_images)}] Downloading...")
        
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
    
    # Files to exclude (already processed or explicitly excluded)
    exclude_files = {
        'advanced options when implementing the trustedform.md',
        'advanced options when implementing the trustedform-1.md',
        'advanced options when implementing the trustedform-2.md',
        'step by step guide on how to create a bridge.md',
        'trustedform consent language manager.md',
        'how to setup facebook conversion api.md',
        'implementing trustedform certify on third party fo.md',
        'implementing trustedform certify on third party fo-1.md',
        'implementing trustedform on your unbounce page.md',
        'implementing trustedform on your unbounce page-1.md'
    }
    
    # Load existing mappings
    mapping_file = os.path.join(output_dir, 'image_mappings.json')
    if os.path.exists(mapping_file):
        with open(mapping_file, 'r') as f:
            all_mappings = json.load(f)
    else:
        all_mappings = []
    
    # Get all markdown files
    md_files = []
    for filename in sorted(os.listdir(bloomfire_dir)):
        if filename.endswith('.md') and filename not in exclude_files:
            md_files.append(filename)
    
    print(f"Found {len(md_files)} markdown files to process")
    print(f"Excluding {len(exclude_files)} files")
    
    # Process each file
    for i, filename in enumerate(md_files, 1):
        print(f"\n[{i}/{len(md_files)}] ", end='')
        
        # Create a safe directory name from the filename
        doc_name = filename.replace('.md', '').replace(' ', '-')
        doc_name = sanitize_filename(doc_name)[:50]
        
        md_path = os.path.join(bloomfire_dir, filename)
        mappings = process_markdown_file(md_path, output_dir, doc_name)
        all_mappings.extend(mappings)
    
    # Save updated mapping file
    with open(mapping_file, 'w', encoding='utf-8') as f:
        json.dump(all_mappings, f, indent=2, ensure_ascii=False)
    
    print(f"\n" + "="*60)
    print(f"✓ Processed {len(md_files)} files")
    print(f"✓ Total images in mapping: {len(all_mappings)}")
    print(f"✓ Updated mapping file: {mapping_file}")
    print("="*60)

if __name__ == '__main__':
    main()