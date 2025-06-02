#!/bin/bash

# Simple script to add consistent frontmatter to glossary files

GLOSSARY_DIR="/Users/alex/Dev/kb/content/glossary"

echo "Adding YAML frontmatter to glossary files..."

# Count files to process
total_files=$(find "$GLOSSARY_DIR" -maxdepth 1 -name "*.md" | wc -l)
processed=0

# Process each glossary file
for file in "$GLOSSARY_DIR"/*.md; do
    if [[ -f "$file" ]]; then
        filename=$(basename "$file")
        processed=$((processed + 1))
        echo "[$processed/$total_files] Processing: $filename"
        
        # Get the title from filename (remove .md and clean up)
        title=$(basename "$file" .md)
        
        # Create URL-friendly slug
        slug=$(echo "$title" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]/-/g' | sed 's/--*/-/g' | sed 's/^-\|-$//g')
        
        # Read current content
        current_content=$(cat "$file")
        
        # Create temp file with frontmatter + content
        temp_file="/tmp/glossary_temp_$$.md"
        
        cat > "$temp_file" << EOF
---
URL: https://community.activeprospect.com/glossary/$slug
Page Title: $title
Screenshot URL: 
Scraped At: 2025-05-30 00:00:00.000
---

$current_content
EOF
        
        # Replace original file
        mv "$temp_file" "$file"
        
        echo "  ✓ Added frontmatter to $filename"
    fi
done

echo ""
echo "Added frontmatter to $processed glossary files"