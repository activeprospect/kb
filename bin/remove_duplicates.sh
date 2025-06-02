#!/bin/bash

# Remove duplicate files in content/glossary/
# Files with -1, -2, -3, etc. suffixes are likely duplicates of the base file

set -e

GLOSSARY_DIR="/Users/alex/Dev/kb/content/glossary"

echo "Analyzing duplicate files in $GLOSSARY_DIR..."

# Find all files with numbered suffixes
numbered_files=$(find "$GLOSSARY_DIR" -name "*-[0-9]*.md" | sort)

# Count total duplicates
total_duplicates=$(echo "$numbered_files" | wc -l)
echo "Found $total_duplicates files with numbered suffixes (potential duplicates)"

duplicates_with_base=0
orphans=0

echo ""
echo "Analyzing duplicates..."

# Check each numbered file
echo "$numbered_files" | while read -r file; do
    if [[ -n "$file" ]]; then
        filename=$(basename "$file")
        # Extract base name by removing -N.md pattern
        base_name=$(echo "$filename" | sed 's/-[0-9][0-9]*\.md$//')
        
        # Check if base file exists
        base_file="$GLOSSARY_DIR/$base_name.md"
        
        if [[ -f "$base_file" ]]; then
            echo "DUPLICATE: $filename -> base: $base_name.md"
        else
            echo "ORPHAN: $filename (no base file found)"
        fi
    fi
done

echo ""
echo "To remove duplicates where base file exists, run: $0 --remove"

# If --remove flag is provided, actually remove the duplicates
if [[ "$1" == "--remove" ]]; then
    echo ""
    echo "REMOVING DUPLICATES..."
    
    removed_count=0
    kept_orphans=0
    
    echo "$numbered_files" | while read -r file; do
        if [[ -n "$file" ]]; then
            filename=$(basename "$file")
            base_name=$(echo "$filename" | sed 's/-[0-9][0-9]*\.md$//')
            base_file="$GLOSSARY_DIR/$base_name.md"
            
            if [[ -f "$base_file" ]]; then
                echo "Removing: $filename"
                rm "$file"
                removed_count=$((removed_count + 1))
            else
                echo "Keeping orphan: $filename (no base file)"
                kept_orphans=$((kept_orphans + 1))
            fi
        fi
    done
    
    echo ""
    echo "Duplicate removal complete!"
    echo "Remaining files: $(find "$GLOSSARY_DIR" -name "*.md" | wc -l)"
fi