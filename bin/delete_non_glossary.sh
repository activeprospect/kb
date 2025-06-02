#!/bin/bash

# Script to delete all files except those with actual glossary URLs

GLOSSARY_DIR="/Users/alex/Dev/kb/content/glossary"
NOT_DIR="$GLOSSARY_DIR/not"

# Known actual glossary URLs from the source data
GLOSSARY_URLS=(
    "https://community.activeprospect.com/series/4051250/posts/4883927-trustedform-glossary"
    "https://community.activeprospect.com/series/4051250/posts/4054502-activeprospect-product-glossary"
    "https://community.activeprospect.com/series/4051250/posts/5070198-leadsbridge-glossary"
    "https://community.activeprospect.com/series/4881972/posts/4883927-trustedform-glossary"
)

echo "Looking for files with actual glossary URLs..."

KEEP_FILES=()
DELETE_COUNT=0

# Check main glossary directory
for file in "$GLOSSARY_DIR"/*.md; do
    if [[ -f "$file" ]]; then
        filename=$(basename "$file")
        
        # Extract URL from frontmatter if it exists
        url=$(awk '/^---$/,/^---$/ {if(/^URL:/) {sub(/^URL: */, ""); print; exit}}' "$file" 2>/dev/null)
        
        # Check if this is one of the actual glossary URLs
        is_glossary=false
        for glossary_url in "${GLOSSARY_URLS[@]}"; do
            if [[ "$url" == "$glossary_url" ]]; then
                is_glossary=true
                break
            fi
        done
        
        if [[ "$is_glossary" == true ]]; then
            KEEP_FILES+=("$filename")
            echo "KEEP: $filename"
        else
            echo "DELETE: $filename (URL: $url)"
            rm "$file"
            DELETE_COUNT=$((DELETE_COUNT + 1))
        fi
    fi
done

echo ""
echo "Deleting entire not/ directory (none have actual glossary URLs)..."

# Remove the entire not/ directory since none of those are actual glossary terms
if [[ -d "$NOT_DIR" ]]; then
    not_count=$(find "$NOT_DIR" -name "*.md" | wc -l)
    rm -rf "$NOT_DIR"
    DELETE_COUNT=$((DELETE_COUNT + not_count))
    echo "Deleted not/ directory with $not_count files"
fi

echo ""
echo "Summary:"
echo "Files kept: ${#KEEP_FILES[@]}"
echo "Files deleted: $DELETE_COUNT"

# Final verification
remaining=$(find "$GLOSSARY_DIR" -maxdepth 1 -name "*.md" | wc -l)
echo "Remaining glossary files: $remaining"

if [[ ${#KEEP_FILES[@]} -gt 0 ]]; then
    echo ""
    echo "Kept files:"
    for file in "${KEEP_FILES[@]}"; do
        echo "  - $file"
    done
fi