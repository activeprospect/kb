#!/bin/bash

# Configuration
CONTENT_DIR="/Users/alex/Dev/kb/content/bloomfire-2"
OUTPUT_DIR="/Users/alex/Dev/kb/media/images"
MAPPING_FILE="$OUTPUT_DIR/image_mapping.csv"

# Create output directory
mkdir -p "$OUTPUT_DIR"

# Initialize CSV mapping file
echo "source_document,image_index,original_url,local_path,status" > "$MAPPING_FILE"

# Function to download a single image
download_image() {
    local url="$1"
    local output_path="$2"
    local doc_name="$3"
    local index="$4"
    
    echo "  Downloading image $index..."
    echo "    URL: $url"
    echo "    Target: $output_path"
    
    # Create directory if needed
    mkdir -p "$(dirname "$output_path")"
    
    # Try curl first
    if curl -L -s -o "$output_path" --connect-timeout 30 --max-time 60 "$url"; then
        if [ -s "$output_path" ]; then
            echo "    ✓ Success ($(ls -lh "$output_path" | awk '{print $5}'))"
            echo "\"$doc_name\",$index,\"$url\",\"$output_path\",\"success\"" >> "$MAPPING_FILE"
            return 0
        else
            rm -f "$output_path"
            echo "    ✗ Failed - empty file"
        fi
    else
        echo "    ✗ Failed - download error"
    fi
    
    echo "\"$doc_name\",$index,\"$url\",\"$output_path\",\"failed\"" >> "$MAPPING_FILE"
    return 1
}

# Process first file
echo "Processing: implementing trustedform on your unbounce page.md"
FILE1="$CONTENT_DIR/implementing trustedform on your unbounce page.md"

if [ -f "$FILE1" ]; then
    # Extract just the first few images for testing
    grep -Eo '!\[([^\]]*)\]\(https?://[^)]+\.(png|jpg|jpeg|gif|webp|svg)[^)]*\)' "$FILE1" | head -5 | while IFS= read -r line; do
        # Extract URL
        url=$(echo "$line" | sed -E 's/.*\((https?://[^)]+)\).*/\1/')
        
        # Clean URL (remove query parameters for extension detection)
        clean_url=$(echo "$url" | cut -d'?' -f1)
        ext="${clean_url##*.}"
        
        # Default to png if no extension found
        if [[ ! "$ext" =~ ^(png|jpg|jpeg|gif|webp|svg)$ ]]; then
            ext="png"
        fi
        
        # Generate output filename
        index=$((${index:-0} + 1))
        filename="unbounce-$(printf "%03d" $index).$ext"
        output_path="$OUTPUT_DIR/implementing-trustedform-unbounce/$filename"
        
        download_image "$url" "$output_path" "implementing trustedform on your unbounce page.md" "$index"
    done
else
    echo "File not found: $FILE1"
fi

echo -e "\nDownload summary:"
echo "Images attempted: $(grep -c '"' "$MAPPING_FILE")"
echo "Successful downloads: $(grep -c '"success"' "$MAPPING_FILE")"
echo "Failed downloads: $(grep -c '"failed"' "$MAPPING_FILE")"