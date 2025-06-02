#!/bin/bash

# Clean frontmatter and junk from glossary files
# Removes YAML frontmatter and common boilerplate content

set -e

GLOSSARY_DIR="/Users/alex/Dev/kb/content/glossary"

echo "Cleaning frontmatter and boilerplate from glossary files..."

file_count=0
cleaned_count=0

for file in "$GLOSSARY_DIR"/*.md; do
    if [[ -f "$file" ]]; then
        ((file_count++))
        filename=$(basename "$file")
        
        # Create temp file for cleaned content
        temp_file=$(mktemp)
        
        # Skip frontmatter (lines between --- markers) and extract clean content
        awk '
        BEGIN { 
            in_frontmatter = 0
            frontmatter_done = 0
            content_started = 0
        }
        
        # Detect start of frontmatter
        /^---$/ && NR == 1 {
            in_frontmatter = 1
            next
        }
        
        # Detect end of frontmatter
        /^---$/ && in_frontmatter && !frontmatter_done {
            in_frontmatter = 0
            frontmatter_done = 1
            next
        }
        
        # Skip frontmatter lines
        in_frontmatter {
            next
        }
        
        # Start processing content after frontmatter
        frontmatter_done && !content_started {
            content_started = 1
        }
        
        # Output content lines, skipping common boilerplate patterns
        content_started {
            # Skip empty lines at the start
            if (!content_started_output && /^$/) {
                next
            }
            
            # Skip checkbox/filter sections
            if (/^- #### Product/ || /^- #### Topic/ || /^- #### Type/ || /^- #### Industry/) {
                skip_section = 1
                next
            }
            
            # Skip checkbox lines
            if (/^  - \[ \]/) {
                next
            }
            
            # Reset skip section on new content
            if (!/^  - \[ \]/ && !/^- ####/ && skip_section) {
                skip_section = 0
            }
            
            # Skip if in checkbox section
            if (skip_section) {
                next
            }
            
            # Mark that we have output content
            if (!content_started_output && !/^$/) {
                content_started_output = 1
            }
            
            # Output the line
            print
        }
        ' "$file" > "$temp_file"
        
        # Check if we actually cleaned anything
        if ! diff -q "$file" "$temp_file" > /dev/null 2>&1; then
            # Replace original with cleaned version
            mv "$temp_file" "$file"
            ((cleaned_count++))
            echo "Cleaned: $filename"
        else
            # No changes needed
            rm "$temp_file"
        fi
    fi
done

echo ""
echo "Cleanup complete!"
echo "Files processed: $file_count"
echo "Files cleaned: $cleaned_count"
echo "Files unchanged: $((file_count - cleaned_count))"