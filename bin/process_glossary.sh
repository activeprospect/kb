#!/bin/bash

set -e

# Script to parse glossary.csv and generate markdown documents
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
DATA_DIR="$PROJECT_ROOT/data"
CONTENT_DIR="$PROJECT_ROOT/content"

# Create glossary directory
echo "Creating glossary content directory..."
mkdir -p "$CONTENT_DIR/glossary"

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

# Function to process the glossary CSV file
process_glossary_csv() {
    local csv_file="$1"
    local output_dir="$2"
    
    echo "Processing $csv_file..."
    
    # Remove any existing temp files
    rm -f "$output_dir"/temp_*.md
    
    # First pass: split into temporary files based on document boundaries
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
    
    # Second pass: rename files based on page titles or URLs
    local counter=1
    
    for temp_file in "$output_dir"/temp_*.md; do
        if [[ -f "$temp_file" ]]; then
            # Extract page title first
            local page_title=$(grep "^Page Title:" "$temp_file" | head -1 | sed 's/^Page Title: //')
            
            # If no page title, try to extract from URL
            if [[ -z "$page_title" ]]; then
                local url=$(grep "^URL:" "$temp_file" | head -1 | sed 's/^URL: //')
                if [[ -n "$url" ]]; then
                    # Extract the last part of the URL as a title
                    page_title=$(echo "$url" | sed 's|.*/||' | sed 's/-/ /g' | sed 's/\/$//') 
                fi
            fi
            
            if [[ -n "$page_title" ]]; then
                local safe_name=$(sanitize_filename "$page_title")
                
                # Handle empty or very short names
                if [[ -z "$safe_name" || ${#safe_name} -lt 3 ]]; then
                    safe_name="glossary-entry-$counter"
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
                echo "Created: ${final_name}.md"
            else
                # Fallback if no title found
                mv "$temp_file" "$output_dir/glossary-entry-${counter}.md"
                echo "Created: glossary-entry-${counter}.md (no title found)"
            fi
            ((counter++))
        fi
    done
    
    # Count generated files
    local count=$(ls -1 "$output_dir"/*.md 2>/dev/null | wc -l)
    echo "Generated $count glossary documents in $output_dir"
}

# Process glossary.csv
if [[ -f "$DATA_DIR/glossary.csv" ]]; then
    echo "Found glossary.csv, processing..."
    process_glossary_csv "$DATA_DIR/glossary.csv" "$CONTENT_DIR/glossary"
else
    echo "Error: $DATA_DIR/glossary.csv not found"
    exit 1
fi

echo "Glossary processing complete!"