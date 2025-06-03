#!/bin/bash

set -e

# Script to parse bloomfire-2.csv and generate markdown documents
# Following updated processor guidelines - NEVER delete content directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
DATA_DIR="$PROJECT_ROOT/data"
CONTENT_DIR="$PROJECT_ROOT/content"

# Source file
CSV_FILE="$DATA_DIR/bloomfire-2.csv"
SOURCE_NAME="$(basename "$CSV_FILE" .csv)"
OUTPUT_DIR="$CONTENT_DIR/$SOURCE_NAME"

# Check if source file exists
if [[ ! -f "$CSV_FILE" ]]; then
    echo "Error: $CSV_FILE not found"
    exit 1
fi

# Create output directory (preserving existing content)
echo "Creating output directory: $OUTPUT_DIR"
mkdir -p "$OUTPUT_DIR"

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

# Function to clean content - remove boilerplate and tracking
clean_content() {
    local content="$1"
    
    # Remove common tracking/analytics patterns
    echo "$content" | sed -E \
        -e '/\(function\(\w,\w,\w,\w,\w,\w\)/,/\}\)\(/d' \
        -e '/window\.dataLayer = window\.dataLayer/d' \
        -e '/Google Tag Manager/d' \
        -e '/gtag\(/d' \
        -e '/analytics\./d' \
        -e '/_gaq\./d' \
        -e '/ga\(/d' \
        -e '/fbq\(/d' \
        -e '/Facebook Pixel/d' \
        -e '/<!-- (Google|Facebook|Analytics)/,/-->/d' \
        -e '/Type something$/d'
}

echo "Processing $CSV_FILE..."

# Process the CSV file
# Skip the header line and process documents
tail -n +2 "$CSV_FILE" | awk -v outdir="$OUTPUT_DIR" '
BEGIN { 
    doc_num = 1
    content = ""
    in_doc = 0
}
/^"---$/ {
    # Start of new document
    if (in_doc == 0) {
        in_doc = 1
        content = "---\n"
    }
    next
}
/^---/ && in_doc == 1 {
    # End of frontmatter, start of content
    content = content "---\n"
    next
}
in_doc == 1 && /^"$/ {
    # End of document
    if (content != "") {
        # Save document to temp file
        tempfile = outdir "/temp_" doc_num ".md"
        # Remove any trailing quotes
        gsub(/"$/, "", content)
        print content > tempfile
        close(tempfile)
        doc_num++
    }
    content = ""
    in_doc = 0
    next
}
in_doc == 1 {
    # Add line to current document
    content = content $0 "\n"
}
END {
    # Save last document if exists
    if (content != "" && in_doc == 1) {
        tempfile = outdir "/temp_" doc_num ".md"
        gsub(/"$/, "", content)
        print content > tempfile
        close(tempfile)
    }
}'

# Second pass: rename files based on page titles and clean content
echo "Renaming files and cleaning content..."
counter=1
used_names=()

for temp_file in "$OUTPUT_DIR"/temp_*.md; do
    if [[ -f "$temp_file" ]]; then
        # Read the file content
        file_content=$(<"$temp_file")
        
        # Extract page title from frontmatter
        page_title=$(echo "$file_content" | grep "^Page Title:" | head -1 | sed 's/^Page Title: //')
        
        if [[ -n "$page_title" ]]; then
            safe_name=$(sanitize_filename "$page_title")
            
            # Handle empty or very short names
            if [[ -z "$safe_name" || ${#safe_name} -lt 3 ]]; then
                safe_name="document-$counter"
            fi
            
            # Handle duplicates
            final_name="$safe_name"
            dup_counter=1
            while [[ -f "$OUTPUT_DIR/${final_name}.md" ]]; do
                final_name="${safe_name}-${dup_counter}"
                ((dup_counter++))
            done
        else
            # Fallback if no title found
            final_name="document-${counter}"
        fi
        
        # Clean the content before saving
        cleaned_content=$(clean_content "$file_content")
        
        # Write cleaned content to final file
        echo "$cleaned_content" > "$OUTPUT_DIR/${final_name}.md"
        
        # Remove temp file
        rm "$temp_file"
        
        ((counter++))
    fi
done

# Count generated files
count=$(ls -1 "$OUTPUT_DIR"/*.md 2>/dev/null | wc -l)
echo "Generated $count documents in $OUTPUT_DIR"

# Show sample of generated files
echo -e "\nSample of generated files:"
ls -la "$OUTPUT_DIR" | head -10

echo -e "\nProcessing complete!"