#!/bin/bash

# Create output directories
OUTPUT_DIR="/Users/alex/Dev/kb/media/images"
MAPPING_FILE="$OUTPUT_DIR/image_mapping.csv"

# Initialize CSV mapping file
echo "source_document,image_index,original_url,local_path,description" > "$MAPPING_FILE"

# Function to clean filename
clean_filename() {
    echo "$1" | sed 's/[^a-zA-Z0-9-]/-/g' | sed 's/--*/-/g' | sed 's/^-//;s/-$//'
}

# Function to process a markdown file
process_file() {
    local md_file="$1"
    local file_basename=$(basename "$md_file" .md)
    local clean_name=$(clean_filename "$file_basename")
    local doc_dir="$OUTPUT_DIR/$clean_name"
    
    echo "Processing: $md_file"
    mkdir -p "$doc_dir"
    
    # Extract all image URLs from the file
    local index=1
    grep -Eo '!\[([^\]]*)\]\(https?://[^)]+\.(png|jpg|jpeg|gif|webp|svg)[^)]*\)' "$md_file" | while read -r line; do
        # Extract URL from the markdown syntax
        url=$(echo "$line" | sed -E 's/.*\((https?://[^)]+)\).*/\1/')
        
        # Get file extension
        ext=$(echo "$url" | grep -o '\.[^.?]*' | tail -1)
        if [ -z "$ext" ]; then
            ext=".png"
        fi
        
        # Generate filename
        filename="${clean_name}-$(printf "%03d" $index)${ext}"
        filepath="$doc_dir/$filename"
        
        echo "  Downloading image $index: $filename"
        
        # Download with wget
        if wget -q --timeout=30 --tries=2 -O "$filepath" "$url" 2>/dev/null; then
            echo "    ✓ Success"
            # Add to mapping
            echo "\"$md_file\",$index,\"$url\",\"$filepath\",\"Image $index from $file_basename\"" >> "$MAPPING_FILE"
        else
            echo "    ✗ Failed"
            rm -f "$filepath"
        fi
        
        ((index++))
    done
}

# Main execution
CONTENT_DIR="/Users/alex/Dev/kb/content/bloomfire-2"

# Process key files
echo "Starting image download process..."

# File 1
if [ -f "$CONTENT_DIR/implementing trustedform on your unbounce page.md" ]; then
    process_file "$CONTENT_DIR/implementing trustedform on your unbounce page.md"
fi

# File 2  
if [ -f "$CONTENT_DIR/advanced options when implementing the trustedform.md" ]; then
    process_file "$CONTENT_DIR/advanced options when implementing the trustedform.md"
fi

# File 3
if [ -f "$CONTENT_DIR/step by step guide on how to create a bridge.md" ]; then
    process_file "$CONTENT_DIR/step by step guide on how to create a bridge.md"
fi

# File 4
if [ -f "$CONTENT_DIR/trustedform consent language manager.md" ]; then
    process_file "$CONTENT_DIR/trustedform consent language manager.md"
fi

echo "Download process completed!"
echo "Mapping saved to: $MAPPING_FILE"