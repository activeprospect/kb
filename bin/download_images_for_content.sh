#!/bin/bash

set -e

# Enhanced script to download images and screenshots from markdown files
# This script will:
# 1. Find all markdown files in a given directory
# 2. Parse image links from the markdown content
# 3. Parse screenshot URL from frontmatter
# 4. Download images to a local images/ directory (sibling to markdown files)
# 5. Download screenshots to images/screenshots/ directory
# 6. Update the markdown to reference local images and screenshots

# Check for required argument
if [[ $# -lt 1 ]]; then
    echo "Usage: $0 <content_directory> [--dry-run]"
    echo "Example: $0 content/bloomfire"
    echo "         $0 content/whatsnew --dry-run"
    exit 1
fi

CONTENT_DIR="$1"
DRY_RUN=false

# Check for dry-run flag
if [[ "${2:-}" == "--dry-run" ]]; then
    DRY_RUN=true
    echo "🔍 DRY RUN MODE - No files will be modified"
fi

# Verify directory exists
if [[ ! -d "$CONTENT_DIR" ]]; then
    echo "Error: Directory '$CONTENT_DIR' does not exist"
    exit 1
fi

# Function to download file
download_file() {
    local url="$1"
    local output_path="$2"
    
    # Skip if file already exists
    if [[ -f "$output_path" ]]; then
        return 0
    fi
    
    # Download with curl, following redirects
    if curl -sL "$url" -o "$output_path" --connect-timeout 10 --max-time 30 2>/dev/null; then
        # For images, verify the downloaded file is actually an image
        if [[ "$output_path" =~ \.(png|jpg|jpeg|gif|svg|webp)$ ]]; then
            if file "$output_path" | grep -qE "image|PNG|JPEG|GIF|SVG|WebP"; then
                return 0
            else
                rm -f "$output_path"
                return 1
            fi
        fi
        return 0
    else
        return 1
    fi
}

# Function to extract screenshot URL from frontmatter
extract_screenshot_url() {
    local content="$1"
    # Extract frontmatter (between --- markers)
    local frontmatter=$(echo "$content" | awk '/^---$/{p++} p==1{print} p==2{exit}')
    # Extract Screenshot URL line
    local screenshot_url=$(echo "$frontmatter" | grep "^Screenshot URL:" | sed 's/^Screenshot URL: //')
    echo "$screenshot_url"
}

# Function to process a single markdown file
process_markdown_file() {
    local md_file="$1"
    local file_dir=$(dirname "$md_file")
    local file_basename=$(basename "$md_file" .md)
    local images_dir="$file_dir/images"  # images directory as sibling to markdown file
    local screenshots_dir="$images_dir/screenshots"  # screenshots subdirectory
    local temp_file="${md_file}.tmp"
    local image_counter=1
    local images_found=0
    local images_downloaded=0
    local screenshot_downloaded=false
    
    echo "📄 Processing: $md_file"
    
    # Read file content
    local content=$(<"$md_file")
    local processed_content="$content"
    
    # Process screenshot from frontmatter
    local screenshot_url=$(extract_screenshot_url "$content")
    if [[ -n "$screenshot_url" ]] && [[ "$screenshot_url" =~ ^https?:// ]]; then
        echo "   📸 Found screenshot URL: $screenshot_url"
        
        if [[ "$DRY_RUN" == false ]]; then
            # Create screenshots directory if needed
            mkdir -p "$screenshots_dir"
            
            # Generate unique filename for screenshot based on the markdown filename
            local extension="${screenshot_url##*.}"
            extension="${extension%%\?*}"
            if [[ ! "$extension" =~ ^(png|jpg|jpeg|gif|webp)$ ]]; then
                extension="png"
            fi
            local screenshot_filename="${file_basename}-screenshot.${extension}"
            local screenshot_path="$screenshots_dir/$screenshot_filename"
            
            echo -n "   ⬇️  Downloading screenshot... "
            if download_file "$screenshot_url" "$screenshot_path"; then
                echo "✅"
                # Update the frontmatter with local screenshot path
                processed_content=$(echo "$processed_content" | sed "s|^Screenshot URL: .*|Screenshot URL: images/screenshots/$screenshot_filename|")
                screenshot_downloaded=true
            else
                echo "❌ Failed"
            fi
        fi
    fi
    
    # Find all image references using grep and process them
    while IFS= read -r image_line; do
        # Extract URL from the image markdown syntax
        # Handle format: ![alt text](url)
        if [[ "$image_line" =~ ^!\[([^\]]*)\]\((.+)\)$ ]]; then
            local alt_text="${BASH_REMATCH[1]}"
            local image_url="${BASH_REMATCH[2]}"
            
            # Skip if already a local path
            if [[ ! "$image_url" =~ ^https?:// ]]; then
                continue
            fi
            
            ((images_found++))
            
            if [[ "$DRY_RUN" == true ]]; then
                echo "   🔍 Found image: $image_url"
                continue
            fi
            
            # Create images directory if needed
            mkdir -p "$images_dir"
            
            # Generate filename
            local extension="${image_url##*.}"
            # Clean extension (remove query params)
            extension="${extension%%\?*}"
            # Default to png if no clear extension
            if [[ ! "$extension" =~ ^(png|jpg|jpeg|gif|svg|webp)$ ]]; then
                extension="png"
            fi
            local filename="image-${image_counter}.${extension}"
            local output_path="$images_dir/$filename"
            
            echo -n "   ⬇️  Downloading image $image_counter... "
            if download_file "$image_url" "$output_path"; then
                echo "✅"
                # Update the markdown content - escape special characters in URL for sed
                local escaped_url=$(printf '%s\n' "$image_url" | sed 's/[[\.*^$()+?{|]/\\&/g')
                local new_ref="![$alt_text](images/$filename)"
                processed_content=$(echo "$processed_content" | sed "s|!\[${alt_text}\](${escaped_url})|${new_ref}|g")
                ((image_counter++))
                ((images_downloaded++))
            else
                echo "❌ Failed"
            fi
        fi
    done < <(grep -o '!\[[^]]*\]([^)]*)' "$md_file" || true)
    
    # Update the markdown file if changes were made
    if [[ ("$images_downloaded" -gt 0 || "$screenshot_downloaded" == true) ]] && [[ "$DRY_RUN" == false ]]; then
        echo "$processed_content" > "$temp_file"
        mv "$temp_file" "$md_file"
        echo "   ✏️  Updated markdown with local references"
    fi
    
    echo "   📊 Found: $images_found images, Downloaded: $images_downloaded images"
    if [[ -n "$screenshot_url" ]]; then
        echo "   📸 Screenshot: $(if [[ "$screenshot_downloaded" == true ]]; then echo "Downloaded"; else echo "Not downloaded"; fi)"
    fi
    
    return 0
}

# Main processing
echo "🚀 Starting image and screenshot download process for: $CONTENT_DIR"
echo "============================================="

total_files=0
total_images=0
processed_files=0

# Find all markdown files
while IFS= read -r -d '' md_file; do
    ((total_files++))
    
    # Process the markdown file
    process_markdown_file "$md_file"
    processed_files=$((processed_files + 1))
    
    echo ""
done < <(find "$CONTENT_DIR" -name "*.md" -type f -print0)

# Summary
echo "============================================="
echo "✅ Processing complete!"
echo ""
echo "📊 Summary:"
echo "   Total markdown files found: $total_files"
echo "   Files processed: $processed_files"
echo ""

if [[ "$DRY_RUN" == true ]]; then
    echo "🔍 This was a dry run. To actually download images, run without --dry-run flag"
else
    # Count actual images and screenshots downloaded
    image_count=$(find "$CONTENT_DIR" -name "images" -type d -exec find {} -name "*.png" -o -name "*.jpg" -o -name "*.jpeg" -o -name "*.gif" -o -name "*.svg" -o -name "*.webp" \; 2>/dev/null | wc -l)
    screenshot_count=$(find "$CONTENT_DIR" -path "*/images/screenshots/*" -type f 2>/dev/null | wc -l)
    echo "   Total images downloaded: $image_count"
    echo "   Total screenshots downloaded: $screenshot_count"
fi