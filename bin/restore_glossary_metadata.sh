#!/bin/bash

# Script to restore YAML frontmatter to glossary files

GLOSSARY_DIR="/Users/alex/Dev/kb/content/glossary"
CSV_FILE="/Users/alex/Dev/kb/data/bloomfire.csv"
TEMP_DIR="/tmp/restore_metadata"

# Create temp directory
mkdir -p "$TEMP_DIR"

echo "Restoring YAML frontmatter to glossary files..."

# Count files to process
total_files=$(find "$GLOSSARY_DIR" -maxdepth 1 -name "*.md" | wc -l)
processed=0

# Process each remaining glossary file
for file in "$GLOSSARY_DIR"/*.md; do
    if [[ -f "$file" ]]; then
        filename=$(basename "$file")
        processed=$((processed + 1))
        echo "[$processed/$total_files] Processing: $filename"
        
        # Create filename pattern for search (remove .md and escape special chars)
        search_name=$(basename "$file" .md)
        # Escape special characters for grep
        escaped_name=$(echo "$search_name" | sed 's/[[\.*^$()+?{|]/\\&/g')
        
        # Try to find the original frontmatter in CSV
        # Look for the filename in the CSV and extract the frontmatter
        frontmatter=""
        
        # Extract the document block containing this filename
        if grep -q "$escaped_name" "$CSV_FILE" 2>/dev/null; then
            # Extract the full document block for this file
            awk -v filename="$search_name" '
            BEGIN { in_doc = 0; found = 0 }
            /^DOCUMENT$/ { in_doc = 1; doc_content = ""; next }
            /^"---$/ && in_doc { 
                doc_content = doc_content $0 "\n"
                next 
            }
            in_doc && /^[^"]*---$/ {
                doc_content = doc_content $0 "\n"
                # Check if this document contains our filename
                if (index(doc_content, filename) > 0) {
                    found = 1
                    print doc_content
                    exit
                }
                in_doc = 0
                doc_content = ""
                next
            }
            in_doc { doc_content = doc_content $0 "\n" }
            ' "$CSV_FILE" > "$TEMP_DIR/frontmatter_$processed.txt"
            
            # Extract just the frontmatter part
            if [[ -s "$TEMP_DIR/frontmatter_$processed.txt" ]]; then
                # Remove the quotes and extract the frontmatter
                sed 's/^"//; s/"$//' "$TEMP_DIR/frontmatter_$processed.txt" | \
                awk '/^---$/,/^---$/ {print}' > "$TEMP_DIR/clean_frontmatter_$processed.txt"
                
                if [[ -s "$TEMP_DIR/clean_frontmatter_$processed.txt" ]]; then
                    frontmatter=$(cat "$TEMP_DIR/clean_frontmatter_$processed.txt")
                fi
            fi
        fi
        
        # If we couldn't find original frontmatter, create a generic one
        if [[ -z "$frontmatter" ]]; then
            echo "  Warning: Could not find original frontmatter for $filename, creating generic one"
            frontmatter="---
URL: https://community.activeprospect.com/glossary/$(echo "$search_name" | tr ' ' '-' | tr '[:upper:]' '[:lower:]')
Page Title: $search_name
Screenshot URL: 
Scraped At: 2025-05-30 00:00:00.000
---"
        fi
        
        # Read current file content
        current_content=$(cat "$file")
        
        # Write frontmatter + current content to temp file
        echo "$frontmatter" > "$TEMP_DIR/new_$processed.md"
        echo "" >> "$TEMP_DIR/new_$processed.md"
        echo "$current_content" >> "$TEMP_DIR/new_$processed.md"
        
        # Replace original file
        mv "$TEMP_DIR/new_$processed.md" "$file"
        
        echo "  ✓ Restored frontmatter for $filename"
    fi
done

# Cleanup
rm -rf "$TEMP_DIR"

echo ""
echo "Restored frontmatter for $processed files in $GLOSSARY_DIR"