#!/usr/bin/env python3
import os
import re
from pathlib import Path

def extract_markdown_links(content):
    """Extract all relative markdown links from content"""
    # Pattern to match markdown links: [text](./file.md)
    pattern = r'\[([^\]]+)\]\((\./[^)]+\.md)\)'
    matches = re.findall(pattern, content)
    return [(text, link) for text, link in matches]

def check_missing_files():
    """Check which files referenced in index.md files don't exist"""
    guide_dir = Path('docs/v2/guide')
    missing_files = []
    
    # List of index files to check
    index_files = [
        'analytics/index.md',
        'best-practices/index.md',
        'compliance/index.md',
        'data-management/index.md',
        'flow-management/index.md',
        'getting-started/index.md',
        'integrations/index.md',
        'troubleshooting/index.md'
    ]
    
    for index_file in index_files:
        index_path = guide_dir / index_file
        if not index_path.exists():
            print(f"Warning: Index file not found: {index_path}")
            continue
            
        print(f"\nChecking {index_file}...")
        
        with open(index_path, 'r') as f:
            content = f.read()
        
        links = extract_markdown_links(content)
        section_dir = index_path.parent
        
        for link_text, link_path in links:
            # Convert relative path to absolute
            # Remove ./ from beginning
            relative_path = link_path[2:] if link_path.startswith('./') else link_path
            full_path = section_dir / relative_path
            
            if not full_path.exists():
                missing_files.append({
                    'index': index_file,
                    'link_text': link_text,
                    'link_path': link_path,
                    'expected_path': str(full_path.relative_to(Path('docs/v2/guide')))
                })
    
    return missing_files

def main():
    print("Checking for missing guide files...")
    print("=" * 60)
    
    missing = check_missing_files()
    
    if not missing:
        print("\n✅ All referenced files exist!")
    else:
        print(f"\n❌ Found {len(missing)} missing files:\n")
        
        # Group by index file
        by_index = {}
        for item in missing:
            index = item['index']
            if index not in by_index:
                by_index[index] = []
            by_index[index].append(item)
        
        # Print grouped results
        for index, items in by_index.items():
            print(f"\n{index}:")
            print("-" * 40)
            for item in items:
                print(f"  Missing: {item['expected_path']}")
                print(f"    Link text: '{item['link_text']}'")
                print(f"    Referenced as: {item['link_path']}")
                print()
        
        # Print summary
        print("\nSummary of missing files:")
        print("-" * 40)
        unique_files = set(item['expected_path'] for item in missing)
        for file in sorted(unique_files):
            print(f"  {file}")

if __name__ == "__main__":
    main()