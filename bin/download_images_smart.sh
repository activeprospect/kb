#!/bin/bash

set -e

# Smart image downloader with deduplication and descriptive naming
# This script will:
# 1. Find all markdown files in a given directory
# 2. Parse image links from the markdown content and screenshot URLs from frontmatter
# 3. Download images to article-specific subdirectories to avoid conflicts
# 4. Use content-based hashing for deduplication
# 5. Generate descriptive filenames based on alt text or context
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

# Global hash tracking for deduplication
declare -A IMAGE_HASHES

# Function to generate descriptive filename from alt text or URL
generate_descriptive_filename() {
    local alt_text="$1"
    local url="$2"
    local counter="$3"
    local extension="$4"
    
    local base_name=""
    
    # Try to use alt text first
    if [[ -n "$alt_text" ]] && [[ "$alt_text" != "image" ]] && [[ "$alt_text" != "Image" ]]; then
        # Clean alt text to make it filename-safe
        base_name=$(echo "$alt_text" | tr '[:upper:]' '[:lower:]' | \
                    sed 's/[^a-z0-9 ]//g' | \
                    sed 's/ \+/-/g' | \
                    sed 's/^-\+\|-\+$//g' | \
                    cut -c1-50 | \
                    sed 's/-*$//')
    fi
    
    # If no good alt text, try to extract something from URL
    if [[ -z "$base_name" ]] || [[ "$base_name" == "image" ]]; then
        # Try to get filename from URL
        local url_filename=$(basename "$url" | cut -d'?' -f1 | cut -d'.' -f1)
        if [[ -n "$url_filename" ]] && [[ "$url_filename" != "original" ]] && [[ "$url_filename" != "image" ]]; then
            base_name=$(echo "$url_filename" | tr '[:upper:]' '[:lower:]' | \
                       sed 's/[^a-z0-9]/-/g' | \
                       cut -c1-30)
        fi
    fi
    
    # If still no good name, use generic with counter
    if [[ -z "$base_name" ]]; then
        base_name="image-${counter}"
    fi
    
    echo "${base_name}.${extension}"
}

# Function to calculate file hash
calculate_hash() {
    local file="$1"
    if command -v md5sum >/dev/null 2>&1; then
        md5sum "$file" | cut -d' ' -f1
    elif command -v md5 >/dev/null 2>&1; then
        md5 -q "$file"
    else
        # Fallback to file size if no hash command available
        stat -f%z "$file" 2>/dev/null || stat -c%s "$file" 2>/dev/null || echo "0"
    fi
}

# Function to download file with deduplication
download_with_dedup() {
    local url="$1"
    local output_path="$2"
    local temp_file="${output_path}.tmp"
    
    # Skip if file already exists
    if [[ -f "$output_path" ]]; then
        return 0
    fi
    
    # Download to temp file first
    if curl -sL "$url" -o "$temp_file" --connect-timeout 10 --max-time 30 2>/dev/null; then
        # For images, verify the downloaded file is actually an image
        if [[ "$output_path" =~ \.(png|jpg|jpeg|gif|svg|webp)$ ]]; then
            if ! file "$temp_file" | grep -qE "image|PNG|JPEG|GIF|SVG|WebP"; then
                rm -f "$temp_file"
                return 1
            fi
        fi
        
        # Calculate hash
        local file_hash=$(calculate_hash "$temp_file")
        
        # Check if we've seen this file before
        if [[ -n "${IMAGE_HASHES[$file_hash]:-}" ]]; then
            # File already exists elsewhere, create symlink instead
            local existing_file="${IMAGE_HASHES[$file_hash]}"
            rm -f "$temp_file"
            
            # Create relative symlink
            local rel_path=$(realpath --relative-to="$(dirname "$output_path")" "$existing_file")
            ln -sf "$rel_path" "$output_path"
            echo "linked:$existing_file"
            return 0
        else
            # New file, move it and record hash
            mv "$temp_file" "$output_path"
            IMAGE_HASHES[$file_hash]="$output_path"
            echo "new"
            return 0
        fi
    else
        rm -f "$temp_file"
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
    # Create article-specific directory for images
    local article_images_dir="$file_dir/${file_basename}-images"
    local temp_file="${md_file}.tmp"
    local image_counter=1
    local images_found=0
    local images_downloaded=0
    local images_linked=0
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
            # Create article images directory if needed
            mkdir -p "$article_images_dir"
            
            # Generate filename for screenshot
            local extension="${screenshot_url##*.}"
            extension="${extension%%\?*}"
            if [[ ! "$extension" =~ ^(png|jpg|jpeg|gif|webp)$ ]]; then
                extension="png"
            fi
            local screenshot_filename="screenshot.${extension}"
            local screenshot_path="$article_images_dir/$screenshot_filename"
            
            echo -n "   ⬇️  Downloading screenshot... "
            local result=$(download_with_dedup "$screenshot_url" "$screenshot_path")
            if [[ -n "$result" ]]; then
                if [[ "$result" == "linked:"* ]]; then
                    echo "✅ (linked to existing)"
                else
                    echo "✅"
                fi
                # Update the frontmatter with local screenshot path
                processed_content=$(echo "$processed_content" | sed "s|^Screenshot URL: .*|Screenshot URL: ${file_basename}-images/$screenshot_filename|")
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
                echo "   🔍 Found image: $image_url (alt: '$alt_text')"
                continue
            fi
            
            # Create article images directory if needed
            mkdir -p "$article_images_dir"
            
            # Generate descriptive filename
            local extension="${image_url##*.}"
            extension="${extension%%\?*}"
            if [[ ! "$extension" =~ ^(png|jpg|jpeg|gif|svg|webp)$ ]]; then
                extension="png"
            fi
            local filename=$(generate_descriptive_filename "$alt_text" "$image_url" "$image_counter" "$extension")
            local output_path="$article_images_dir/$filename"
            
            echo -n "   ⬇️  Downloading image $image_counter ('$alt_text')... "
            local result=$(download_with_dedup "$image_url" "$output_path")
            if [[ -n "$result" ]]; then
                if [[ "$result" == "linked:"* ]]; then
                    echo "✅ (linked to existing)"
                    ((images_linked++))
                else
                    echo "✅ -> $filename"
                    ((images_downloaded++))
                fi
                # Update the markdown content - escape special characters in URL for sed
                local escaped_url=$(printf '%s\n' "$image_url" | sed 's/[[\.*^$()+?{|]/\\&/g')
                local new_ref="![$alt_text](${file_basename}-images/$filename)"
                processed_content=$(echo "$processed_content" | sed "s|!\[${alt_text}\](${escaped_url})|${new_ref}|g")
                ((image_counter++))
            else
                echo "❌ Failed"
            fi
        fi
    done < <(grep -o '!\[[^]]*\]([^)]*)' "$md_file" || true)
    
    # Update the markdown file if changes were made
    if [[ ("$images_downloaded" -gt 0 || "$images_linked" -gt 0 || "$screenshot_downloaded" == true) ]] && [[ "$DRY_RUN" == false ]]; then
        echo "$processed_content" > "$temp_file"
        mv "$temp_file" "$md_file"
        echo "   ✏️  Updated markdown with local references"
    fi
    
    echo "   📊 Found: $images_found images, Downloaded: $images_downloaded, Linked: $images_linked"
    if [[ -n "$screenshot_url" ]]; then
        echo "   📸 Screenshot: $(if [[ "$screenshot_downloaded" == true ]]; then echo "Downloaded"; else echo "Not downloaded"; fi)"
    fi
    
    return 0
}

# Main processing
echo "🚀 Starting smart image download process for: $CONTENT_DIR"
echo "============================================="

total_files=0
total_downloaded=0
total_linked=0
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
    # Count actual files
    total_image_files=$(find "$CONTENT_DIR" -path "*-images/*" -type f ! -type l 2>/dev/null | wc -l)
    total_symlinks=$(find "$CONTENT_DIR" -path "*-images/*" -type l 2>/dev/null | wc -l)
    echo "   Total unique image files: $total_image_files"
    echo "   Total symlinks (deduped): $total_symlinks"
    echo ""
    echo "   Deduplication saved: $total_symlinks duplicate downloads"
fi