#!/usr/bin/env python3
"""
Enhanced Image Analysis Tool with Auto-Tagging
Discovers images and suggests relevant tags based on content/tags.md
"""

import os
import re
import json
from pathlib import Path
from datetime import datetime
from typing import List, Dict, Set, Tuple

class TaggedImageAnalyzer:
    def __init__(self, base_dir: str = "."):
        self.base_dir = Path(base_dir).absolute()
        self.media_dir = self.base_dir / "media" / "images"
        self.content_dir = self.base_dir / "content"
        self.tags = self.load_tags()
        
    def load_tags(self) -> Dict[str, List[Dict]]:
        """Load and parse tags from content/tags.md"""
        tags_file = self.content_dir / "tags.md"
        if not tags_file.exists():
            print(f"Warning: {tags_file} not found")
            return {}
        
        with open(tags_file, 'r', encoding='utf-8') as f:
            content = f.read()
        
        # Parse tags by category
        tags_by_category = {}
        current_category = None
        current_tag = None
        
        lines = content.split('\n')
        for line in lines:
            # Category header (### Category Tags)
            if line.startswith('### ') and 'Tags' in line:
                current_category = line.strip('# ').replace(' Tags', '').lower().replace(' ', '-')
                tags_by_category[current_category] = []
            
            # Tag definition (#### `tag-name`)
            elif line.startswith('#### `') and '`' in line:
                tag_match = re.search(r'`([^`]+)`', line)
                if tag_match:
                    current_tag = {
                        'name': tag_match.group(1),
                        'description': '',
                        'category': current_category
                    }
                    if current_category:
                        tags_by_category[current_category].append(current_tag)
            
            # Tag description (following lines)
            elif current_tag and line.strip() and not line.startswith('#'):
                current_tag['description'] += line.strip() + ' '
        
        return tags_by_category
    
    def suggest_tags_for_content(self, doc_content: str, doc_name: str, image_context: str) -> List[str]:
        """Suggest relevant tags based on document content and image context"""
        suggested_tags = []
        content_lower = (doc_content + ' ' + image_context).lower()
        
        # Analyze content for tag relevance
        tag_keywords = {
            # User roles
            'buyer-focused': ['buyer', 'vendor', 'purchase', 'quality', 'compliance', 'roi'],
            'seller-focused': ['seller', 'source', 'monetiz', 'distribut', 'acceptance'],
            'developer-focused': ['api', 'code', 'webhook', 'integration', 'json', 'xml'],
            'admin-focused': ['admin', 'user management', 'security', 'account', 'permission'],
            
            # Experience levels
            'beginner': ['getting started', 'basic', 'introduction', 'first', 'simple'],
            'intermediate': ['standard', 'common', 'typical', 'configure'],
            'advanced': ['complex', 'optimize', 'advanced', 'sophisticated', 'power user'],
            
            # Content types
            'how-to': ['how to', 'step by step', 'configure', 'set up', 'create'],
            'conceptual': ['what is', 'understanding', 'concept', 'overview'],
            'reference': ['field', 'operator', 'specification', 'api', 'table'],
            'troubleshooting': ['error', 'issue', 'problem', 'fix', 'resolve'],
            'best-practices': ['best practice', 'recommend', 'optimize', 'proven'],
            
            # Feature areas
            'flows': ['flow', 'workflow', 'orchestration'],
            'data-management': ['field', 'type', 'data', 'transform', 'template'],
            'business-logic': ['rule', 'criteria', 'cap', 'pricing', 'logic'],
            'integrations': ['integration', 'connect', 'entity', 'external'],
            'analytics': ['report', 'event', 'metric', 'analysis', 'export'],
            'compliance': ['consent', 'suppress', 'complian', 'regulatory'],
            
            # Model concepts
            'pricing-focused': ['pricing', 'price', 'cost', 'revenue', 'financial'],
            'rules-focused': ['rule', 'operator', 'condition', 'logic'],
            'fields-focused': ['field', 'custom field', 'standard field'],
            'events-focused': ['event', 'event type', 'event data'],
            
            # Use cases
            'vendor-management': ['vendor', 'source', 'partner', 'relationship'],
            'quality-control': ['quality', 'validation', 'filter', 'verify'],
            'distribution': ['deliver', 'route', 'send', 'destination'],
            'financial-management': ['price', 'cost', 'revenue', 'billing', 'payment'],
        }
        
        # Check for keyword matches
        for tag, keywords in tag_keywords.items():
            if any(keyword in content_lower for keyword in keywords):
                suggested_tags.append(tag)
        
        # Specific document name patterns
        if 'pricing' in doc_name.lower():
            suggested_tags.extend(['pricing-focused', 'financial-management', 'business-logic'])
        elif 'field' in doc_name.lower():
            suggested_tags.extend(['fields-focused', 'data-management'])
        elif 'rule' in doc_name.lower():
            suggested_tags.extend(['rules-focused', 'business-logic'])
        
        # Remove duplicates and limit to most relevant
        seen = set()
        unique_tags = []
        for tag in suggested_tags:
            if tag not in seen:
                seen.add(tag)
                unique_tags.append(tag)
        
        return unique_tags[:7]  # Return top 7 most relevant tags
    
    def find_markdown_files(self, directory: Path = None) -> List[Path]:
        """Find all markdown files in the content directory"""
        if directory is None:
            directory = self.content_dir
            
        md_files = []
        for file_path in directory.rglob("*.md"):
            md_files.append(file_path)
        return sorted(md_files)
    
    def extract_images_from_markdown(self, file_path: Path) -> Tuple[List[Dict], str]:
        """Extract all images from a markdown file and return full content"""
        images = []
        
        try:
            with open(file_path, 'r', encoding='utf-8') as f:
                content = f.read()
                lines = content.split('\n')
        except Exception as e:
            print(f"Error reading {file_path}: {e}")
            return images, ""
        
        # Pattern for markdown images: ![alt text](url)
        md_pattern = r'!\[([^\]]*)\]\(([^)]+)\)'
        # Pattern for HTML images: <img src="url" ...>
        html_pattern = r'<img\s+[^>]*src\s*=\s*["\']([^"\']+)["\']'
        
        for i, line in enumerate(lines):
            # Find markdown images
            for match in re.finditer(md_pattern, line):
                alt_text = match.group(1)
                url = match.group(2)
                
                # Get context
                context_lines = []
                for j in range(max(0, i-2), min(len(lines), i+3)):
                    if lines[j].strip():
                        context_lines.append(lines[j].strip())
                
                images.append({
                    'url': url,
                    'alt_text': alt_text,
                    'line_number': i + 1,
                    'context': ' '.join(context_lines),
                    'type': 'markdown'
                })
            
            # Find HTML images
            for match in re.finditer(html_pattern, line):
                url = match.group(1)
                images.append({
                    'url': url,
                    'alt_text': '',
                    'line_number': i + 1,
                    'context': line.strip(),
                    'type': 'html'
                })
        
        return images, content
    
    def generate_filename(self, source_doc: str, image_num: int, url: str) -> str:
        """Generate a descriptive filename for the downloaded image"""
        # Remove query parameters from URL
        clean_url = url.split('?')[0]
        
        # Extract file extension
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
        
        # Extract images and content
        images, doc_content = self.extract_images_from_markdown(file_path)
        
        if not images:
            print(f"  No images found")
            return None
        
        print(f"  Found {len(images)} images")
        
        # Process each image
        processed_images = []
        for i, img in enumerate(images, 1):
            filename = self.generate_filename(doc_name, i, img['url'])
            local_path = self.media_dir / doc_name / filename
            
            # Suggest tags for this image based on context
            suggested_tags = self.suggest_tags_for_content(
                doc_content, 
                doc_name, 
                img['context']
            )
            
            img['local_path'] = str(local_path.relative_to(self.base_dir))
            img['filename'] = filename
            img['image_number'] = i
            img['suggested_tags'] = suggested_tags
            
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
            # Format suggested tags
            tag_string = ' '.join([f'#{tag}' for tag in img['suggested_tags'][:5]])
            
            template_lines.extend([
                f"### Image {img['image_number']}: [Brief Title]",
                f"**Original URL:** `{img['url']}`",
                f"**Local File:** `{img['local_path']}` (to be downloaded)",
                f"**Source Document:** `{doc_data['source_document']}`",
                f"**Line Number:** {img['line_number']}",
                f"**Context:** [One sentence describing where/why it appears]",
                "",
                f"**Auto-suggested Tags:** {tag_string}",
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
                f"**Concepts:** {tag_string} [Review and adjust as needed]",
                "",
                "**Context from Document:**",
                f"> {img['context'][:200]}...",
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
            "## Tag Analysis",
            "",
            "Most common suggested tags across all images:",
        ])
        
        # Count tag frequency
        all_tags = []
        for img in doc_data['images']:
            all_tags.extend(img['suggested_tags'])
        
        from collections import Counter
        tag_counts = Counter(all_tags)
        
        for tag, count in tag_counts.most_common(10):
            template_lines.append(f"- `{tag}` ({count} occurrences)")
        
        template_lines.extend([
            "",
            "## Download Instructions",
            "",
            "To download these images, use the following commands:",
            ""
        ])
        
        # Add download commands
        for img in doc_data['images']:
            if img['url'].startswith(('http://', 'https://')):
                template_lines.extend([
                    f"# Image {img['image_number']}",
                    f"mkdir -p \"{os.path.dirname(img['local_path'])}\"",
                    f"curl -L \"{img['url']}\" -o \"{img['local_path']}\"",
                    ""
                ])
        
        return "\n".join(template_lines)
    
    def run(self, target_file: str = None):
        """Run the image analysis process"""
        print("Enhanced Image Analysis Tool with Auto-Tagging")
        print("=" * 50)
        
        # Show loaded tags
        print(f"\nLoaded {sum(len(tags) for tags in self.tags.values())} tags from {len(self.tags)} categories")
        
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
                template_path = self.base_dir / "media" / f"{result['doc_name']}-images-tagged.md"
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
        inventory_path = self.base_dir / "media" / "image-inventory-tagged.json"
        with open(inventory_path, 'w') as f:
            json.dump(results, f, indent=2)
        print(f"\nComplete inventory saved to: {inventory_path}")

def main():
    """Main entry point"""
    import argparse
    
    parser = argparse.ArgumentParser(description='Analyze images with auto-tagging')
    parser.add_argument('file', nargs='?', help='Specific markdown file to analyze (optional)')
    parser.add_argument('--base-dir', default='.', help='Base directory of the project')
    
    args = parser.parse_args()
    
    analyzer = TaggedImageAnalyzer(base_dir=args.base_dir)
    analyzer.run(target_file=args.file)

if __name__ == '__main__':
    main()