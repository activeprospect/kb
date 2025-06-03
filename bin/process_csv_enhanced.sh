#!/bin/bash

set -e

# Enhanced CSV processor with article directories and image localization
# Usage: ./process_csv_enhanced.sh <csv_file>

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
CONTENT_DIR="$PROJECT_ROOT/content"

# Check if CSV file is provided
if [[ $# -lt 1 ]]; then
    echo "Usage: $0 <csv_file>"
    echo "Example: $0 data/bloomfire.csv"
    exit 1
fi

CSV_FILE="$1"

# Verify CSV file exists
if [[ ! -f "$CSV_FILE" ]]; then
    echo "Error: CSV file not found: $CSV_FILE"
    exit 1
fi

# Get output directory name from CSV filename (without path and extension)
CSV_BASENAME=$(basename "$CSV_FILE" .csv)
OUTPUT_DIR="$CONTENT_DIR/$CSV_BASENAME"

# Create output directory (never delete existing content!)
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

# Function to download image
download_image() {
    local url="$1"
    local output_dir="$2"
    local image_count="$3"
    
    # Skip empty URLs
    if [[ -z "$url" ]]; then
        echo ""
        return
    fi
    
    # Extract filename from URL
    local original_filename=$(basename "$url" | cut -d'?' -f1 | cut -d'#' -f1)
    local extension="${original_filename##*.}"
    
    # Default extension if none found
    if [[ "$extension" == "$original_filename" ]] || [[ -z "$extension" ]]; then
        extension="png"
    fi
    
    # Create numbered filename
    local filename="image-${image_count}.${extension}"
    
    # Ensure images directory exists
    mkdir -p "$output_dir/images"
    
    # Download image with error handling
    echo "  Downloading: $filename from $url" >&2
    if curl -sL --fail "$url" -o "$output_dir/images/$filename" 2>/dev/null; then
        echo "$filename"
    else
        echo "  Warning: Failed to download image from $url" >&2
        echo ""
    fi
}

# Function to extract video URL from screencast.com
extract_screencast_video_url() {
    local screencast_url="$1"
    
    # Fetch the page and extract the ContentUrl
    local video_url=$(curl -sL "$screencast_url" 2>/dev/null | \
        grep -o 'ContentUrl[^,]*' | head -1 | \
        sed 's/.*https/https/' | \
        sed 's/\\u0026/\&/g' | \
        sed 's/\\u0022//g' | \
        cut -d'"' -f1 | \
        sed 's/\\//g')
    
    if [[ -n "$video_url" ]] && [[ "$video_url" =~ ^https?:// ]]; then
        echo "$video_url"
    else
        echo ""
    fi
}

# Function to download video
download_video() {
    local url="$1"
    local output_dir="$2"
    local video_count="$3"
    
    # Skip empty URLs
    if [[ -z "$url" ]]; then
        echo ""
        return
    fi
    
    local actual_video_url="$url"
    
    # Handle screencast.com URLs specially
    if [[ "$url" =~ screencast\.com/.*/e ]]; then
        echo "  Extracting video URL from screencast page..." >&2
        actual_video_url=$(extract_screencast_video_url "$url")
        if [[ -z "$actual_video_url" ]]; then
            echo "  Warning: Failed to extract video URL from $url" >&2
            echo ""
            return
        fi
    fi
    
    # Extract filename from URL
    local original_filename=$(basename "$actual_video_url" | cut -d'?' -f1 | cut -d'#' -f1)
    local extension="${original_filename##*.}"
    
    # Default to mp4 if no extension or unrecognized
    if [[ -z "$extension" ]] || [[ ! "$extension" =~ ^(mp4|webm|mov|avi|mkv)$ ]]; then
        extension="mp4"
    fi
    
    # Create numbered filename
    local filename="video-${video_count}.${extension}"
    
    # Ensure images directory exists (videos go in the same directory)
    mkdir -p "$output_dir/images"
    
    # Download video with error handling
    echo "  Downloading video: $filename" >&2
    if curl -sL --fail "$actual_video_url" -o "$output_dir/images/$filename" 2>/dev/null; then
        echo "$filename"
    else
        echo "  Warning: Failed to download video from $actual_video_url" >&2
        echo ""
    fi
}

# Function to process videos in content
process_videos_in_content() {
    local content="$1"
    local article_dir="$2"
    local temp_file=$(mktemp)
    
    # Initialize video counter
    local video_count=0
    
    # Write content to temp file for processing
    echo "$content" > "$temp_file"
    local processed_content=""
    
    # Track if we're in a video block
    local in_video_block=false
    local video_url=""
    local video_title=""
    
    while IFS= read -r line; do
        # Check for screencast.com links in various formats
        if echo "$line" | grep -qE 'https://[^[:space:]]*screencast\.com/[^[:space:]]*/e' || \
           echo "$line" | grep -qE '\[[^]]+\]\(https://[^)]*screencast\.com/[^)]*/e\)'; then
            # Extract URL and optional title
            if echo "$line" | grep -qE '\[[^]]+\]\(https://[^)]*screencast\.com/[^)]*/e\)'; then
                video_title=$(echo "$line" | sed -E 's/.*\[([^]]+)\]\(https:\/\/[^)]*screencast\.com\/[^)]*/e\).*/\1/')
                video_url=$(echo "$line" | sed -E 's/.*\[([^]]+)\]\((https:\/\/[^)]*screencast\.com\/[^)]*/e)\).*/\2/')
            else
                video_url=$(echo "$line" | grep -o 'https://[^[:space:]]*screencast\.com/[^[:space:]]*/e')
                video_title="Video"
            fi
            
            ((video_count++))
            local filename=$(download_video "$video_url" "$article_dir" "$video_count")
            
            if [[ -n "$filename" ]]; then
                # Replace with local video reference
                line="[$video_title](images/$filename)"
            fi
            in_video_block=true
        elif [[ "$in_video_block" == true ]] && [[ "$line" =~ "Your browser cannot play this video" ]]; then
            # Skip this line - it's part of the video block
            continue
        elif [[ "$in_video_block" == true ]] && ([[ -z "$line" ]] || [[ ! "$line" =~ ^[[:space:]]*$ ]]); then
            # Check if we're still in video block content
            if [[ "$line" =~ (0:00|Player Settings|Closed Captions|Playback Speed|Acknowledgements|An annotation) ]]; then
                continue  # Skip video player UI text
            else
                in_video_block=false
            fi
        fi
        
        # Check for direct video URLs (mp4, webm, etc)
        if echo "$line" | grep -qE 'https?://[^[:space:]]+\.(mp4|webm|mov|avi|mkv)(\?[^[:space:]]*)?' ; then
            local full_url=$(echo "$line" | grep -oE 'https?://[^[:space:]]+\.(mp4|webm|mov|avi|mkv)(\?[^[:space:]]*)?')
            ((video_count++))
            local filename=$(download_video "$full_url" "$article_dir" "$video_count")
            
            if [[ -n "$filename" ]]; then
                # Replace URL with local path
                line="${line//$full_url/images/$filename}"
            fi
        fi
        
        processed_content="${processed_content}${line}
"
    done < "$temp_file"
    
    rm -f "$temp_file"
    # Remove trailing newline
    echo -n "$processed_content"
}

# Function to process images in content
process_images_in_content() {
    local content="$1"
    local article_dir="$2"
    local temp_file=$(mktemp)
    
    # Initialize image counter
    local image_count=0
    
    # Write content to temp file for processing
    echo "$content" > "$temp_file"
    
    # Process markdown image links: ![alt](url)
    while IFS= read -r line; do
        if echo "$line" | grep -qE '!\[[^]]*\]\([^)]+\)'; then
            # Extract the parts using sed
            local full_match=$(echo "$line" | grep -oE '!\[[^]]*\]\([^)]+\)' | head -1)
            local alt_text=$(echo "$full_match" | sed -E 's/!\[([^]]*)\]\([^)]+\)/\1/')
            local url=$(echo "$full_match" | sed -E 's/!\[[^]]*\]\(([^)]+)\)/\1/')
            
            # Skip if already a local path
            if [[ ! "$url" =~ ^https?:// ]]; then
                continue
            fi
            
            ((image_count++))
            
            # Download image
            local filename=$(download_image "$url" "$article_dir" "$image_count")
            
            if [[ -n "$filename" ]]; then
                # Replace URL with local path
                local new_link="![${alt_text}](images/${filename})"
                line="${line//$full_match/$new_link}"
            fi
        fi
        echo "$line"
    done < "$temp_file"
    
    rm -f "$temp_file"
}

# Function to extract and clean content
extract_clean_content() {
    local raw_content="$1"
    
    # Remove common boilerplate patterns
    echo "$raw_content" | sed -E '
        # Remove navigation elements
        /^Schedule a time \| Chili Piper$/d
        /^Loading$/d
        /^Nothing to show$/d
        /^0following0followers$/d
        
        # Remove tracking pixels and analytics
        /!\[\]\(https:\/\/bat\.bing\.com/d
        /Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA/d
        
        # Remove excessive blank lines
        /^[[:space:]]*$/N;/\n[[:space:]]*$/d
    '
}

# Function to check if content has changed
content_has_changed() {
    local new_content="$1"
    local existing_file="$2"
    
    # If file doesn't exist, content has changed
    if [[ ! -f "$existing_file" ]]; then
        return 0
    fi
    
    # Compare content
    local existing_content=$(<"$existing_file")
    if [[ "$new_content" != "$existing_content" ]]; then
        return 0
    fi
    
    return 1
}

# Function to find existing article with same content
find_existing_article() {
    local url="$1"
    local page_title="$2"
    local output_dir="$3"
    
    # First, try to find by URL (most reliable)
    if [[ -n "$url" ]]; then
        for dir in "$output_dir"/*/; do
            if [[ -f "$dir/article.md" ]]; then
                existing_url=$(grep -m1 "^URL: " "$dir/article.md" | sed 's/^URL: //')
                if [[ "$existing_url" == "$url" ]]; then
                    echo "$dir"
                    return 0
                fi
            fi
        done
    fi
    
    # If no match by URL, try by exact title
    if [[ -n "$page_title" ]]; then
        for dir in "$output_dir"/*/; do
            if [[ -f "$dir/article.md" ]]; then
                existing_title=$(grep -m1 "^Page Title: " "$dir/article.md" | sed 's/^Page Title: //')
                if [[ "$existing_title" == "$page_title" ]]; then
                    echo "$dir"
                    return 0
                fi
            fi
        done
    fi
    
    return 1
}

# Function to process a single document
process_document() {
    local doc_content="$1"
    local doc_num="$2"
    local output_dir="$3"
    
    # Remove quotes if the content is wrapped in quotes
    doc_content="${doc_content%\"}"
    doc_content="${doc_content#\"}"
    
    # Extract metadata
    local url=$(echo "$doc_content" | grep -m1 "^URL:" | sed 's/^URL: //')
    local page_title=$(echo "$doc_content" | grep -m1 "^Page Title:" | sed 's/^Page Title: //')
    local screenshot_url=$(echo "$doc_content" | grep -m1 "^Screenshot URL:" | sed 's/^Screenshot URL: //')
    local scraped_at=$(echo "$doc_content" | grep -m1 "^Scraped At:" | sed 's/^Scraped At: //')
    
    # Generate safe directory name
    if [[ -n "$page_title" ]]; then
        local safe_name=$(sanitize_filename "$page_title")
        
        # Handle empty or very short names
        if [[ -z "$safe_name" || ${#safe_name} -lt 3 ]]; then
            safe_name="document-$doc_num"
        fi
    else
        safe_name="document-$doc_num"
    fi
    
    # Check if this article already exists (by URL or title)
    local existing_dir=$(find_existing_article "$url" "$page_title" "$output_dir")
    
    if [[ -n "$existing_dir" ]]; then
        # Article already exists, update it if needed
        local article_dir="${existing_dir%/}"  # Remove trailing slash
        local article_file="$article_dir/article.md"
        local dir_name=$(basename "$article_dir")
        safe_name="$dir_name"  # Use existing directory name
    else
        # New article - handle potential name conflicts
        local final_name="$safe_name"
        local dup_counter=1
        while [ -d "${output_dir}/${final_name}" ]; do
            final_name="${safe_name}-${dup_counter}"
            dup_counter=$((dup_counter + 1))
        done
        
        local article_dir="$output_dir/${final_name}"
        local article_file="$article_dir/article.md"
        safe_name="$final_name"
    fi
    
    # Extract main content (everything after the second ---)
    local main_content=$(echo "$doc_content" | awk '/^---$/{count++; if(count==2) start=1; next} start')
    
    # Clean the content
    main_content=$(extract_clean_content "$main_content")
    
    # Process videos first (before images, as videos might contain image links)
    local processed_content=$(process_videos_in_content "$main_content" "$article_dir")
    
    # Then process images in the already video-processed content
    processed_content=$(process_images_in_content "$processed_content" "$article_dir")
    
    # Build the final article content
    local final_content="---
URL: $url
Page Title: $page_title
Screenshot URL: $screenshot_url
Scraped At: $scraped_at
---

$processed_content"
    
    # Check if content has changed
    if content_has_changed "$final_content" "$article_file"; then
        if [[ -n "$existing_dir" ]]; then
            echo "Updating: $safe_name"
        else
            echo "Processing: $safe_name"
        fi
        
        # Create article directory
        mkdir -p "$article_dir"
        
        # Download screenshot if available
        if [[ -n "$screenshot_url" ]] && [[ "$screenshot_url" != "null" ]]; then
            echo "  Downloading screenshot..." >&2
            download_image "$screenshot_url" "$article_dir" "screenshot" >/dev/null
        fi
        
        # Write the article file
        echo "$final_content" > "$article_file"
        
        echo "  Created: $article_file"
    else
        echo "Skipping unchanged: $safe_name"
    fi
}

# Main processing
echo "Processing $CSV_FILE..."
echo "Output directory: $OUTPUT_DIR"
echo ""

# Initialize counters
total_docs=0
processed_docs=0
skipped_docs=0

# Process the CSV file
# Use a temporary directory for splitting documents
TEMP_DIR=$(mktemp -d)
trap "rm -rf $TEMP_DIR" EXIT

# Split CSV into individual documents
# Handle both formats:
# 1. Multiple DOCUMENT entries (one per document)
# 2. Single DOCUMENT with documents separated by lone quote marks

# First, check which format we have
doc_count=$(grep -c '^DOCUMENT$' "$CSV_FILE")

if [[ $doc_count -gt 1 ]]; then
    # Format 1: Multiple DOCUMENT entries
    current_doc=""
    doc_num=0
    in_document=false

    while IFS= read -r line; do
        if [[ "$line" == "DOCUMENT" ]]; then
            # Save previous document if exists
            if [[ -n "$current_doc" ]] && [[ "$in_document" == true ]]; then
                echo "$current_doc" > "$TEMP_DIR/doc_${doc_num}.txt"
                ((doc_num++))
            fi
            # Start new document
            current_doc=""
            in_document=false
        elif [[ "$line" == "\"---" ]] && [[ "$in_document" == false ]]; then
            # Start of document content
            in_document=true
            current_doc="---"
        else
            # Add line to current document
            if [[ "$in_document" == true ]]; then
                current_doc="$current_doc
$line"
            fi
        fi
    done < "$CSV_FILE"

    # Save last document
    if [[ -n "$current_doc" ]] && [[ "$in_document" == true ]]; then
        echo "$current_doc" > "$TEMP_DIR/doc_${doc_num}.txt"
        ((doc_num++))
    fi
else
    # Format 2: Single DOCUMENT with quote-separated documents
    current_doc=""
    doc_num=0
    in_document=false
    skip_next=false

    while IFS= read -r line; do
        if [[ "$line" == "DOCUMENT" ]]; then
            continue  # Skip the DOCUMENT line
        elif [[ "$line" == "\"---" ]]; then
            # Save previous document if exists
            if [[ -n "$current_doc" ]] && [[ "$in_document" == true ]]; then
                # Remove trailing quote if present
                current_doc="${current_doc%\"}"
                echo "$current_doc" > "$TEMP_DIR/doc_${doc_num}.txt"
                ((doc_num++))
            fi
            # Start new document
            in_document=true
            current_doc="---"
        elif [[ "$line" == "\"" ]] && [[ "$in_document" == true ]]; then
            # End of current document
            # Remove trailing quote if present
            current_doc="${current_doc%\"}"
            echo "$current_doc" > "$TEMP_DIR/doc_${doc_num}.txt"
            ((doc_num++))
            current_doc=""
            in_document=false
        else
            # Add line to current document
            if [[ "$in_document" == true ]]; then
                if [[ -n "$current_doc" ]]; then
                    current_doc="$current_doc
$line"
                else
                    current_doc="$line"
                fi
            fi
        fi
    done < "$CSV_FILE"

    # Save last document if exists
    if [[ -n "$current_doc" ]] && [[ "$in_document" == true ]]; then
        current_doc="${current_doc%\"}"
        echo "$current_doc" > "$TEMP_DIR/doc_${doc_num}.txt"
        ((doc_num++))
    fi
fi

total_docs=$doc_num
echo "Found $total_docs documents to process"
echo ""

# Process each document
for ((i=0; i<doc_num; i++)); do
    if [[ -f "$TEMP_DIR/doc_${i}.txt" ]]; then
        doc_content=$(<"$TEMP_DIR/doc_${i}.txt")
        process_document "$doc_content" "$((i+1))" "$OUTPUT_DIR"
        ((processed_docs++))
    fi
done

echo ""
echo "Processing complete!"
echo "Total documents: $total_docs"
echo "Processed: $processed_docs"
echo "Output directory: $OUTPUT_DIR"