#!/bin/bash

# Script to check URL fields and delete files that don't point to glossary

GLOSSARY_DIR="/Users/alex/Dev/kb/content/glossary"
NOT_DIR="$GLOSSARY_DIR/not"

echo "Checking URL fields in glossary files..."

# Arrays to track files
KEEP_FILES=()
DELETE_FILES=()

# Check main glossary directory
for file in "$GLOSSARY_DIR"/*.md; do
    if [[ -f "$file" ]]; then
        filename=$(basename "$file")
        
        # Extract URL from frontmatter
        url=$(awk '/^---$/,/^---$/ {if(/^URL:/) {sub(/^URL: */, ""); print; exit}}' "$file")
        
        # Check if URL contains 'glossary'
        if [[ "$url" =~ glossary ]]; then
            KEEP_FILES+=("$filename")
            echo "KEEP: $filename (URL: $url)"
        else
            DELETE_FILES+=("$filename")
            echo "DELETE: $filename (URL: $url)"
        fi
    fi
done

# Check not/ directory
echo ""
echo "Checking files in not/ directory..."

for file in "$NOT_DIR"/*.md; do
    if [[ -f "$file" ]]; then
        filename=$(basename "$file")
        
        # Extract URL from frontmatter
        url=$(awk '/^---$/,/^---$/ {if(/^URL:/) {sub(/^URL: */, ""); print; exit}}' "$file")
        
        # Check if URL contains 'glossary'
        if [[ "$url" =~ glossary ]]; then
            KEEP_FILES+=("not/$filename")
            echo "KEEP: not/$filename (URL: $url)"
        else
            DELETE_FILES+=("not/$filename")
            echo "DELETE: not/$filename (URL: $url)"
        fi
    fi
done

echo ""
echo "Summary:"
echo "Files to keep: ${#KEEP_FILES[@]}"
echo "Files to delete: ${#DELETE_FILES[@]}"

# Confirm deletion
read -p "Delete ${#DELETE_FILES[@]} files that don't have glossary URLs? (y/N): " confirm

if [[ "$confirm" =~ ^[Yy]$ ]]; then
    echo ""
    echo "Deleting files..."
    
    deleted_count=0
    
    # Delete files from main directory
    for file in "$GLOSSARY_DIR"/*.md; do
        if [[ -f "$file" ]]; then
            filename=$(basename "$file")
            
            # Check if this file should be deleted
            for delete_file in "${DELETE_FILES[@]}"; do
                if [[ "$delete_file" == "$filename" ]]; then
                    rm "$file"
                    echo "Deleted: $filename"
                    deleted_count=$((deleted_count + 1))
                    break
                fi
            done
        fi
    done
    
    # Delete files from not/ directory
    for file in "$NOT_DIR"/*.md; do
        if [[ -f "$file" ]]; then
            filename="not/$(basename "$file")"
            
            # Check if this file should be deleted
            for delete_file in "${DELETE_FILES[@]}"; do
                if [[ "$delete_file" == "$filename" ]]; then
                    rm "$file"
                    echo "Deleted: $filename"
                    deleted_count=$((deleted_count + 1))
                    break
                fi
            done
        fi
    done
    
    echo ""
    echo "Deleted $deleted_count files"
    
    # Final counts
    remaining_main=$(find "$GLOSSARY_DIR" -maxdepth 1 -name "*.md" | wc -l)
    remaining_not=$(find "$NOT_DIR" -name "*.md" 2>/dev/null | wc -l)
    
    echo "Remaining files:"
    echo "  Main glossary: $remaining_main"
    echo "  Not directory: $remaining_not"
    echo "  Total: $((remaining_main + remaining_not))"
    
else
    echo "Deletion cancelled."
fi