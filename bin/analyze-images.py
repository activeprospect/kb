#!/usr/bin/env python3
"""
Image Analysis Tool for Documentation
Discovers, downloads, and catalogs images from markdown files
"""

import os
import re
import sys
import json
import hashlib
import requests
from pathlib import Path
from urllib.parse import urlparse, unquote
from datetime import datetime
from typing import List, Dict, Tuple, Optional

class ImageAnalyzer:
    def __init__(self, base_dir: str = "."):
        self.base_dir = Path(base_dir).absolute()
        self.media_dir = self.base_dir / "media" / "images"
        self.content_dir = self.base_dir / "content"
        self.image_inventory = []
        self.download_errors = []
        
    def find_markdown_files(self, directory: Path = None) -> List[Path]:
        """Find all markdown files in the content directory"""
        if directory is None:
            directory = self.content_dir
            
        md_files = []
        for file_path in directory.rglob("*.md"):
            md_files.append(file_path)
        return sorted(md_files)
    
    def extract_images_from_markdown(self, file_path: Path) -> List[Dict]:
        """Extract all images from a markdown file"""
        images = []
        
        try:
            with open(file_path, 'r', encoding='utf-8') as f:
                content = f.read()
                lines = content.split('\n')
        except Exception as e:
            print(f"Error reading {file_path}: {e}")
            return images
        
        # Pattern for markdown images: ![alt text](url)
        md_pattern = r'!\[([^\]]*)\]\(([^)]+)\)'
        # Pattern for HTML images: <img src="url" ...>
        html_pattern = r'<img\s+[^>]*src\s*=\s*["\']([^"\']+)["\']'
        
        for i, line in enumerate(lines):
            # Find markdown images
            for match in re.finditer(md_pattern, line):
                alt_text = match.group(1)
                url = match.group(2)
                
                # Get context (previous and next non-empty lines)
                context_before = ""
                context_after = ""
                
                # Look backward for context
                for j in range(i-1, max(0, i-5), -1):
                    if lines[j].strip():
                        context_before = lines[j].strip()
                        break
                
                # Look forward for context
                for j in range(i+1, min(len(lines), i+5)):
                    if lines[j].strip():
                        context_after = lines[j].strip()
                        break
                
                images.append({
                    'url': url,
                    'alt_text': alt_text,
                    'line_number': i + 1,
                    'context_before': context_before,
                    'context_after': context_after,
                    'type': 'markdown'
                })
            
            # Find HTML images
            for match in re.finditer(html_pattern, line):
                url = match.group(1)
                images.append({
                    'url': url,
                    'alt_text': '',
                    'line_number': i + 1,
                    'context_before': '',
                    'context_after': '',
                    'type': 'html'
                })
        
        return images
    
    def generate_filename(self, source_doc: str, image_num: int, url: str) -> str:
        """Generate a descriptive filename for the downloaded image"""
        # Extract file extension from URL
        parsed_url = urlparse(url)
        path = unquote(parsed_url.path)
        ext = Path(path).suffix or '.png'
        
        # Clean up source doc name
        doc_name = Path(source_doc).stem.replace(' ', '-').lower()
        
        # Create descriptive filename
        filename = f"{doc_name}-{image_num:02d}{ext}"
        
        return filename
    
    def download_image(self, url: str, target_path: Path) -> bool:
        """Download an image from URL to local path"""
        try:
            # Handle relative URLs
            if url.startswith('//'):
                url = 'https:' + url
            elif not url.startswith(('http://', 'https://')):
                print(f"Skipping non-HTTP URL: {url}")
                return False
            
            # Create target directory if needed
            target_path.parent.mkdir(parents=True, exist_ok=True)
            
            # Download with timeout
            response = requests.get(url, timeout=30, headers={
                'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36'
            })
            response.raise_for_status()
            
            # Write to file
            with open(target_path, 'wb') as f:
                f.write(response.content)
            
            print(f"Downloaded: {target_path.name}")
            return True
            
        except Exception as e:
            print(f"Error downloading {url}: {e}")
            self.download_errors.append({
                'url': url,
                'error': str(e),
                'target_path': str(target_path)
            })
            return False
    
    def process_document(self, file_path: Path) -> Dict:
        """Process a single markdown document"""
        relative_path = file_path.relative_to(self.base_dir)
        doc_name = file_path.stem
        
        print(f"\nProcessing: {relative_path}")
        
        # Extract images
        images = self.extract_images_from_markdown(file_path)
        
        if not images:
            print(f"  No images found")
            return None
        
        print(f"  Found {len(images)} images")
        
        # Create directory for this document's images
        doc_dir = self.media_dir / doc_name
        doc_dir.mkdir(parents=True, exist_ok=True)
        
        # Process each image
        processed_images = []
        for i, img in enumerate(images, 1):
            filename = self.generate_filename(doc_name, i, img['url'])
            local_path = doc_dir / filename
            
            # Download image
            if self.download_image(img['url'], local_path):
                img['local_path'] = str(local_path.relative_to(self.base_dir))
                img['filename'] = filename
                img['image_number'] = i
            else:
                img['local_path'] = None
                img['filename'] = None
                img['image_number'] = i
            
            processed_images.append(img)
        
        return {
            'source_document': str(relative_path),
            'doc_name': doc_name,
            'images': processed_images,
            'total_images': len(images),
            'downloaded': sum(1 for img in processed_images if img['local_path'])
        }
    
    def generate_analysis_template(self, doc_data: Dict) -> str:
        """Generate the analysis template for a document"""
        template_lines = [
            f"# {doc_data['doc_name'].replace('-', ' ').title()} - Image Analysis",
            "",
            f"Document: `{doc_data['source_document']}`",
            f"Analysis Date: {datetime.now().strftime('%B %Y')}",
            f"Total Images: {doc_data['total_images']}",
            f"Successfully Downloaded: {doc_data['downloaded']}",
            "",
            "## Image Inventory",
            ""
        ]
        
        for img in doc_data['images']:
            template_lines.extend([
                f"### Image {img['image_number']}: [Brief Title]",
                f"**Original URL:** `{img['url']}`",
                f"**Local File:** `{img['local_path'] or 'DOWNLOAD FAILED'}`",
                f"**Source Document:** `{doc_data['source_document']}`",
                f"**Line Number:** {img['line_number']}",
                f"**Context:** [One sentence describing where/why it appears]",
                "",
                "**Description:** [1-2 sentences about what the image shows]",
                "",
                f"**Alt Text:** \"{img['alt_text'] or '[Write concise alt text under 125 chars]'}\"",
                "",
                "**Key Elements:**",
                "- [Element 1]",
                "- [Element 2]",
                "- [Element 3]",
                "- [Element 4]",
                "",
                "**Concepts:** #tag1 #tag2 #tag3",
                "",
                "---",
                ""
            ])
        
        template_lines.extend([
            "## Summary",
            "",
            f"This document contains {doc_data['total_images']} images that [describe the overall purpose/flow].",
            "",
            "[2-3 sentences about what the images collectively accomplish]"
        ])
        
        return "\n".join(template_lines)
    
    def run(self, target_file: str = None):
        """Run the image analysis process"""
        print("Image Analysis Tool")
        print("=" * 50)
        
        # Find markdown files
        if target_file:
            md_files = [Path(target_file)]
        else:
            md_files = self.find_markdown_files()
            print(f"Found {len(md_files)} markdown files")
        
        # Process each file
        results = []
        for file_path in md_files:
            result = self.process_document(file_path)
            if result:
                results.append(result)
                
                # Generate analysis template
                template = self.generate_analysis_template(result)
                
                # Save template
                template_path = self.base_dir / "media" / f"{result['doc_name']}-images.md"
                with open(template_path, 'w', encoding='utf-8') as f:
                    f.write(template)
                print(f"  Created template: {template_path.name}")
        
        # Summary report
        print("\n" + "=" * 50)
        print("SUMMARY")
        print("=" * 50)
        print(f"Documents processed: {len(results)}")
        print(f"Total images found: {sum(r['total_images'] for r in results)}")
        print(f"Images downloaded: {sum(r['downloaded'] for r in results)}")
        
        if self.download_errors:
            print(f"\nDownload errors: {len(self.download_errors)}")
            error_log = self.base_dir / "media" / "download-errors.json"
            with open(error_log, 'w') as f:
                json.dump(self.download_errors, f, indent=2)
            print(f"Error details saved to: {error_log}")
        
        # Save inventory
        inventory_path = self.base_dir / "media" / "image-inventory.json"
        with open(inventory_path, 'w') as f:
            json.dump(results, f, indent=2)
        print(f"\nComplete inventory saved to: {inventory_path}")

def main():
    """Main entry point"""
    import argparse
    
    parser = argparse.ArgumentParser(description='Analyze and download images from markdown documentation')
    parser.add_argument('file', nargs='?', help='Specific markdown file to analyze (optional)')
    parser.add_argument('--base-dir', default='.', help='Base directory of the project')
    
    args = parser.parse_args()
    
    analyzer = ImageAnalyzer(base_dir=args.base_dir)
    analyzer.run(target_file=args.file)

if __name__ == '__main__':
    main()