#!/bin/bash

# Script to categorize glossary files and move non-glossary terms to glossary/not/

GLOSSARY_DIR="/Users/alex/Dev/kb/content/glossary"
NOT_DIR="$GLOSSARY_DIR/not"

# Ensure not/ directory exists
mkdir -p "$NOT_DIR"

# Files to move (non-glossary content types)
TO_MOVE=()

echo "Analyzing glossary files..."

# Iterate through all .md files in glossary directory (excluding subdirectories)
for file in "$GLOSSARY_DIR"/*.md; do
    if [[ -f "$file" ]]; then
        filename=$(basename "$file")
        
        # Read first few lines to analyze content type
        content=$(head -20 "$file" | tr '[:upper:]' '[:lower:]')
        
        # Patterns that indicate non-glossary content
        is_case_study=false
        is_company_page=false
        is_marketing_page=false
        is_archive_page=false
        is_error_page=false
        is_demo_page=false
        is_form_page=false
        
        # Check for case study patterns
        if [[ "$content" =~ (case\ study|dramatically\ boosts|conversion\ rate|roi\ with|download\ the\ case\ study) ]]; then
            is_case_study=true
        fi
        
        # Check for company/about us patterns
        if [[ "$content" =~ (our\ product\ suite|our\ history|our\ team|about\ us|activeprospect|ceo|cfo|cto|founder|employees|customers\ internationally|core\ values|join\ a\ team) ]]; then
            is_company_page=true
        fi
        
        # Check for marketing/demo patterns
        if [[ "$content" =~ (get\ a\ demo|download|first\ name|last\ name|email\ address|phone\ number|company\ name|this\ field\ is\ hidden) ]]; then
            is_marketing_page=true
        fi
        
        # Check for archive patterns
        if [[ "$content" =~ (archive|compliance\ archives) ]]; then
            is_archive_page=true
        fi
        
        # Check for error pages
        if [[ "$content" =~ (this\ site\ can\'t\ be\ reached|err_socket_not_connected|temporarily\ down|moved\ permanently) ]]; then
            is_error_page=true
        fi
        
        # Check for demo/form pages
        if [[ "$content" =~ (utm_campaign|utm_medium|utm_source|δ) ]]; then
            is_form_page=true
        fi
        
        # Determine if file should be moved
        should_move=false
        reason=""
        
        if [[ "$is_case_study" == true ]]; then
            should_move=true
            reason="case study"
        elif [[ "$is_company_page" == true ]]; then
            should_move=true
            reason="company page"
        elif [[ "$is_marketing_page" == true ]]; then
            should_move=true
            reason="marketing/demo page"
        elif [[ "$is_archive_page" == true ]]; then
            should_move=true
            reason="archive page"
        elif [[ "$is_error_page" == true ]]; then
            should_move=true
            reason="error page"
        elif [[ "$is_form_page" == true ]]; then
            should_move=true
            reason="form page"
        fi
        
        # Additional filename-based checks
        if [[ "$filename" =~ ^(about\ us|get\ a\ demo|compliance\ archives|4legalleads|batch\ file\ delivery\ integration) ]]; then
            should_move=true
            if [[ "$reason" == "" ]]; then
                reason="filename pattern"
            fi
        fi
        
        if [[ "$should_move" == true ]]; then
            TO_MOVE+=("$filename:$reason")
            echo "MOVE: $filename ($reason)"
        else
            echo "KEEP: $filename"
        fi
    fi
done

echo ""
echo "Summary:"
echo "Files to move: ${#TO_MOVE[@]}"

# Move the files
if [[ ${#TO_MOVE[@]} -gt 0 ]]; then
    echo ""
    echo "Moving files to glossary/not/..."
    
    for item in "${TO_MOVE[@]}"; do
        filename="${item%%:*}"
        reason="${item##*:}"
        
        if [[ -f "$GLOSSARY_DIR/$filename" ]]; then
            mv "$GLOSSARY_DIR/$filename" "$NOT_DIR/$filename"
            echo "Moved: $filename ($reason)"
        fi
    done
    
    echo ""
    echo "Moved ${#TO_MOVE[@]} files to $NOT_DIR"
else
    echo "No files to move."
fi

# Count remaining files
remaining=$(find "$GLOSSARY_DIR" -maxdepth 1 -name "*.md" | wc -l)
moved=$(find "$NOT_DIR" -name "*.md" | wc -l)

echo ""
echo "Final counts:"
echo "  Remaining glossary files: $remaining"
echo "  Moved to not/: $moved"