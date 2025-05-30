#!/bin/bash

set -e

# Script to parse CSV files and generate markdown documents
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
DATA_DIR="$PROJECT_ROOT/data"
CONTENT_DIR="$PROJECT_ROOT/content"

# Remove and recreate content directory
echo "Removing and recreating content directory..."
rm -rf "$CONTENT_DIR"
mkdir -p "$CONTENT_DIR/bloomfire"
mkdir -p "$CONTENT_DIR/whatsnew"

# Function to sanitize filename
sanitize_filename() {
    local title="$1"
    local max_length=50
    
    # Convert to lowercase, replace spaces with hyphens, remove special chars
    echo "$title" | tr '[:upper:]' '[:lower:]' | \
                   sed 's/[^a-z0-9 ]//g' | \
                   sed 's/ \+/-/g' | \
                   sed 's/^-\+\|-\+$//g' | \
                   cut -c1-${max_length} | \
                   sed 's/-*$//'
}

# Function to process a CSV file
process_csv() {
    local csv_file="$1"
    local output_dir="$2"
    
    echo "Processing $csv_file..."
    
    # First pass: split into temporary files and extract titles
    tail -n +2 "$csv_file" | awk -v outdir="$output_dir" '
         BEGIN { 
             doc_num = 1
             content = ""
         }
         /^"---$/ {
             # Start of new document (quoted YAML frontmatter)
             if (content != "") {
                 # Save previous document to temp file
                 tempfile = outdir "/temp_" doc_num ".md"
                 print content > tempfile
                 close(tempfile)
                 doc_num++
             }
             # Start new document, remove leading quote
             content = "---\n"
             next
         }
         {
             # Add line to current document
             content = content $0 "\n"
         }
         END {
             # Save last document
             if (content != "") {
                 tempfile = outdir "/temp_" doc_num ".md"
                 # Remove trailing quote if present
                 gsub(/"\n$/, "\n", content)
                 print content > tempfile
                 close(tempfile)
             }
         }'
    
    # Second pass: rename files based on page titles
    local counter=1
    
    for temp_file in "$output_dir"/temp_*.md; do
        if [[ -f "$temp_file" ]]; then
            # Extract page title
            local page_title=$(grep "^Page Title:" "$temp_file" | head -1 | sed 's/^Page Title: //')
            
            if [[ -n "$page_title" ]]; then
                local safe_name=$(sanitize_filename "$page_title")
                
                # Handle empty or very short names
                if [[ -z "$safe_name" || ${#safe_name} -lt 3 ]]; then
                    safe_name="document-$counter"
                fi
                
                # Handle duplicates by checking if file exists
                local final_name="$safe_name"
                local dup_counter=1
                while [[ -f "$output_dir/${final_name}.md" ]]; do
                    final_name="${safe_name}-${dup_counter}"
                    ((dup_counter++))
                done
                
                # Move to final filename
                mv "$temp_file" "$output_dir/${final_name}.md"
            else
                # Fallback if no title found
                mv "$temp_file" "$output_dir/document-${counter}.md"
            fi
            ((counter++))
        fi
    done
    
    # Count generated files
    local count=$(ls -1 "$output_dir"/*.md 2>/dev/null | wc -l)
    echo "Generated $count documents in $output_dir"
}

# Process bloomfire.csv
if [[ -f "$DATA_DIR/bloomfire.csv" ]]; then
    process_csv "$DATA_DIR/bloomfire.csv" "$CONTENT_DIR/bloomfire"
else
    echo "Warning: $DATA_DIR/bloomfire.csv not found"
fi

# Process whatsnew.csv
if [[ -f "$DATA_DIR/whatsnew.csv" ]]; then
    process_csv "$DATA_DIR/whatsnew.csv" "$CONTENT_DIR/whatsnew"
else
    echo "Warning: $DATA_DIR/whatsnew.csv not found"
fi

echo "Content generation complete!"