#!/usr/bin/env python3
"""
Simple Image Analysis Tool for Documentation
Discovers and catalogs images from markdown files (without downloading)
"""

import os
import re
import json
from pathlib import Path
from datetime import datetime
from typing import List, Dict

class SimpleImageAnalyzer:
    def __init__(self, base_dir: str = "."):
        self.base_dir = Path(base_dir).absolute()
        self.media_dir = self.base_dir / "media" / "images"
        self.content_dir = self.base_dir / "content"
        
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
        # Remove query parameters from URL
        clean_url = url.split('?')[0]
        
        # Extract file extension from URL
        path_parts = clean_url.split('/')
        if path_parts:
            last_part = path_parts[-1]
            if '.' in last_part:
                ext = '.' + last_part.split('.')[-1]
            else:
                ext = '.png'
        else:
            ext = '.png'
        
        # Clean up source doc name
        doc_name = Path(source_doc).stem.replace(' ', '-').lower()
        
        # Create descriptive filename
        filename = f"{doc_name}-{image_num:02d}{ext}"
        
        return filename
    
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
        
        # Process each image
        processed_images = []
        for i, img in enumerate(images, 1):
            filename = self.generate_filename(doc_name, i, img['url'])
            local_path = self.media_dir / doc_name / filename
            
            img['local_path'] = str(local_path.relative_to(self.base_dir))
            img['filename'] = filename
            img['image_number'] = i
            
            processed_images.append(img)
        
        return {
            'source_document': str(relative_path),
            'doc_name': doc_name,
            'images': processed_images,
            'total_images': len(images)
        }
    
    def generate_analysis_template(self, doc_data: Dict) -> str:
        """Generate the analysis template for a document"""
        template_lines = [
            f"# {doc_data['doc_name'].replace('-', ' ').title()} - Image Analysis",
            "",
            f"Document: `{doc_data['source_document']}`",
            f"Analysis Date: {datetime.now().strftime('%B %Y')}",
            f"Total Images: {doc_data['total_images']}",
            "",
            "## Image Inventory",
            ""
        ]
        
        for img in doc_data['images']:
            template_lines.extend([
                f"### Image {img['image_number']}: [Brief Title]",
                f"**Original URL:** `{img['url']}`",
                f"**Local File:** `{img['local_path']}` (to be downloaded)",
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
            "[2-3 sentences about what the images collectively accomplish]",
            "",
            "## Download Instructions",
            "",
            "To download these images, use the following commands:",
            ""
        ])
        
        # Add curl commands for downloading
        for img in doc_data['images']:
            if img['url'].startswith(('http://', 'https://')):
                template_lines.extend([
                    f"# Image {img['image_number']}",
                    f"mkdir -p {os.path.dirname(img['local_path'])}",
                    f"curl -L \"{img['url']}\" -o \"{img['local_path']}\"",
                    ""
                ])
        
        return "\n".join(template_lines)
    
    def run(self, target_file: str = None):
        """Run the image analysis process"""
        print("Simple Image Analysis Tool")
        print("=" * 50)
        
        # Find markdown files
        if target_file:
            target_path = Path(target_file)
            if not target_path.is_absolute():
                target_path = self.base_dir / target_path
            md_files = [target_path]
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
        
        # Save inventory
        inventory_path = self.base_dir / "media" / "image-inventory.json"
        with open(inventory_path, 'w') as f:
            json.dump(results, f, indent=2)
        print(f"\nComplete inventory saved to: {inventory_path}")

def main():
    """Main entry point"""
    import argparse
    
    parser = argparse.ArgumentParser(description='Analyze images from markdown documentation')
    parser.add_argument('file', nargs='?', help='Specific markdown file to analyze (optional)')
    parser.add_argument('--base-dir', default='.', help='Base directory of the project')
    
    args = parser.parse_args()
    
    analyzer = SimpleImageAnalyzer(base_dir=args.base_dir)
    analyzer.run(target_file=args.file)

if __name__ == '__main__':
    main()