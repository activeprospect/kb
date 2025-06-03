#!/bin/bash

# Configuration
CONTENT_DIR="/Users/alex/Dev/kb/content/bloomfire-2"
OUTPUT_DIR="/Users/alex/Dev/kb/media/images"
MAPPING_FILE="$OUTPUT_DIR/image_mapping.json"

# Initialize JSON mapping file
echo "[" > "$MAPPING_FILE"
first_entry=true

# Function to download images from a markdown file
download_file_images() {
    local md_file="$1"
    local doc_name=$(basename "$md_file" .md)
    local clean_name=$(echo "$doc_name" | sed 's/[^a-zA-Z0-9-]/-/g' | sed 's/--*/-/g' | sed 's/^-//;s/-$//')
    local doc_dir="$OUTPUT_DIR/$clean_name"
    
    echo -e "\n=== Processing: $doc_name ==="
    mkdir -p "$doc_dir"
    
    # Extract all image URLs
    local urls=$(grep -o 'https://content[0-9]\.bloomfire\.com[^)]*\.\(png\|jpg\|jpeg\|gif\|webp\|svg\)[^)]*' "$md_file" 2>/dev/null || true)
    
    if [ -z "$urls" ]; then
        echo "No images found in this file"
        return
    fi
    
    local count=$(echo "$urls" | wc -l | tr -d ' ')
    echo "Found $count images"
    
    local index=1
    while IFS= read -r url; do
        if [ -z "$url" ]; then
            continue
        fi
        
        # Generate filename
        local filename="${clean_name}-$(printf "%03d" $index).png"
        local filepath="$doc_dir/$filename"
        
        echo -n "  Image $index/$count: "
        
        # Download the image
        if curl -L -s -o "$filepath" --connect-timeout 30 --max-time 60 "$url"; then
            if [ -s "$filepath" ]; then
                local size=$(ls -lh "$filepath" | awk '{print $5}')
                echo "✓ Downloaded ($size)"
                
                # Add to JSON mapping
                if [ "$first_entry" = true ]; then
                    first_entry=false
                else
                    echo "," >> "$MAPPING_FILE"
                fi
                
                cat >> "$MAPPING_FILE" << EOF
  {
    "source_document": "$md_file",
    "image_index": $index,
    "original_url": "$url",
    "local_path": "$filepath",
    "filename": "$filename",
    "status": "success"
  }
EOF
            else
                echo "✗ Failed (empty file)"
                rm -f "$filepath"
            fi
        else
            echo "✗ Failed (download error)"
        fi
        
        ((index++))
    done <<< "$urls"
}

# Process each key file
echo "Starting comprehensive image download..."

# File 1: Unbounce
if [ -f "$CONTENT_DIR/implementing trustedform on your unbounce page.md" ]; then
    download_file_images "$CONTENT_DIR/implementing trustedform on your unbounce page.md"
fi

# File 2: Advanced options
if [ -f "$CONTENT_DIR/advanced options when implementing the trustedform.md" ]; then
    download_file_images "$CONTENT_DIR/advanced options when implementing the trustedform.md"
fi

# File 3: Bridge guide
if [ -f "$CONTENT_DIR/step by step guide on how to create a bridge.md" ]; then
    download_file_images "$CONTENT_DIR/step by step guide on how to create a bridge.md"
fi

# File 4: Consent language manager
if [ -f "$CONTENT_DIR/trustedform consent language manager.md" ]; then
    download_file_images "$CONTENT_DIR/trustedform consent language manager.md"
fi

# Close JSON array
echo -e "\n]" >> "$MAPPING_FILE"

# Summary
echo -e "\n=== Download Complete ==="
echo "Total images downloaded: $(find "$OUTPUT_DIR" -name "*.png" -o -name "*.jpg" | wc -l | tr -d ' ')"
echo "Mapping file: $MAPPING_FILE"

# Show directory structure
echo -e "\nCreated directories:"
find "$OUTPUT_DIR" -type d -name "*trustedform*" -o -name "*bridge*" | sort