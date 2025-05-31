#!/bin/bash

# Content Metadata Tagging System - Improved Version
# Uses content-based patterns with multiple article types and quality filtering

set -e

CONTENT_DIR="/Users/alex/Dev/kb/content"
OUTPUT_FILE="/Users/alex/Dev/kb/data/content_metadata.json"

# Initialize JSON output
echo '{"files": [' > "$OUTPUT_FILE"
first_file=true

# Function to analyze file content and suggest tags
analyze_content() {
    local file_path="$1"
    local relative_path="${file_path#$CONTENT_DIR/}"
    local directory=$(dirname "$relative_path")
    local filename=$(basename "$relative_path")
    
    # Read file content (skip frontmatter)
    local content=$(tail -n +7 "$file_path" 2>/dev/null | head -100 | tr '\n' ' ')
    local title=$(grep -m1 "^# " "$file_path" 2>/dev/null | sed 's/^# //' | tr -d '"' || echo "")
    
    # Content quality filtering - skip broken/low-quality content
    if echo "$content" | grep -qi "this site can't be reached\|err_socket_not_connected\|404\|page not found\|temporarily down"; then
        return 0  # Skip this file
    fi
    
    # Skip files with minimal content (less than 50 characters after frontmatter)
    if [[ ${#content} -lt 50 ]]; then
        return 0  # Skip this file
    fi
    
    # Initialize arrays for multiple article types and tags
    local article_types=()
    local content_tags=()
    local audience=""
    local product_area=""
    
    # Article Type Detection - Multiple types allowed, content-pattern based
    # Definition/Glossary content
    if echo "$content" | grep -qi "definition\|what is\|meaning\|refers to\|^.*is.*\|stands for"; then
        article_types+=("definition")
    fi
    
    # How-to guides and tutorials
    if echo "$content" | grep -qi "how to\|step.*step\|instructions\|tutorial\|guide\|click.*button\|select.*from\|add.*to\|create.*new\|configure\|setup"; then
        article_types+=("how-to-guide")
    fi
    
    # Feature announcements and release notes
    if echo "$content" | grep -qi "new.*feature\|announce\|release.*note\|introduce\|today.*release\|now.*available\|latest.*update\|enhancement\|improvement"; then
        article_types+=("feature-announcement")
    fi
    
    # Reference documentation
    if echo "$content" | grep -qi "reference\|documentation\|specification\|api.*doc\|parameters\|options\|configuration.*reference"; then
        article_types+=("reference")
    fi
    
    # Case studies and success stories
    if echo "$content" | grep -qi "case study\|success.*story\|customer.*story\|dramatically.*improve\|boost.*conversion\|increase.*efficiency\|roi\|results"; then
        article_types+=("case-study")
    fi
    
    # Introduction/Overview content
    if echo "$content" | grep -qi "introduction\|overview\|101\|basics\|getting.*started\|what.*does.*do\|beginner"; then
        article_types+=("introduction")
    fi
    
    # Troubleshooting content
    if echo "$content" | grep -qi "troubleshoot\|problem\|error\|issue\|fix\|can't.*login\|doesn't.*work\|not.*working"; then
        article_types+=("troubleshooting")
    fi
    
    # If no specific type detected, use general article
    if [[ ${#article_types[@]} -eq 0 ]]; then
        article_types+=("article")
    fi
    
    # Content Tags Detection - Based on official LeadConduit API concepts
    echo "$content" | grep -qi "flow\|flows" && content_tags+=("flows")
    echo "$content" | grep -qi "field\|fields\|lead.*data\|data.*field" && content_tags+=("fields")
    echo "$content" | grep -qi "event\|events\|lead.*event\|step.*event" && content_tags+=("events")
    echo "$content" | grep -qi "rule\|rules\|filter\|filters\|acceptance.*criteria" && content_tags+=("rules")
    echo "$content" | grep -qi "lead\|leads" && content_tags+=("leads")
    echo "$content" | grep -qi "credential\|credentials\|authentication\|auth" && content_tags+=("credentials")
    echo "$content" | grep -qi "report\|reports\|analytics\|dashboard\|metrics\|statistics" && content_tags+=("reports")
    echo "$content" | grep -qi "variable\|variables\|mapping\|mappings" && content_tags+=("variables")
    echo "$content" | grep -qi "cap\|caps\|limit\|limits\|volume" && content_tags+=("caps-and-limits")
    echo "$content" | grep -qi "submission\|submit\|posting\|lead.*submission" && content_tags+=("lead-submission")
    
    # Lead Flow Direction Tags
    echo "$content" | grep -qi "source\|sources" && content_tags+=("sources")
    echo "$content" | grep -qi "destination\|destinations\|recipient\|recipients" && content_tags+=("recipients")
    
    # Business Relationship Tags
    echo "$content" | grep -qi "seller\|sellers\|vendor\|vendors" && content_tags+=("sellers")
    echo "$content" | grep -qi "buyer\|buyers" && content_tags+=("buyers")
    echo "$content" | grep -qi "partner\|partners" && content_tags+=("partners")
    echo "$content" | grep -qi "form\|forms\|web.*form" && content_tags+=("forms")
    echo "$content" | grep -qi "crm\|salesforce\|hubspot\|email.*service" && content_tags+=("crm")
    
    # Service Integration Tags
    echo "$content" | grep -qi "integration\|integrations\|connect\|connecting\|api.*key\|webhook\|credential" && content_tags+=("integrations")
    echo "$content" | grep -qi "add.*on\|addon\|marketplace\|trustedform\|suppressionlist\|briteverify" && content_tags+=("add-ons")
    
    # Entity Management Tags
    echo "$content" | grep -qi "standard.*entit\|built.*in.*entit\|directory" && content_tags+=("standard-entities")
    echo "$content" | grep -qi "account.*entit\|leadconduit.*account" && content_tags+=("account-entities")
    echo "$content" | grep -qi "custom.*entit\|create.*entit" && content_tags+=("custom-entities")
    
    # Non-API concept tags
    echo "$content" | grep -qi "trustedform\|certificate\|cert.*url\|consent\|verify\|certify" && content_tags+=("trustedform")
    echo "$content" | grep -qi "tcpa\|fcc\|compliance\|consent\|opt.*in\|do.*not.*call\|regulation\|legal" && content_tags+=("compliance")
    echo "$content" | grep -qi "batch\|delivery\|file.*export\|integration\|webhook\|api" && content_tags+=("data-integration")
    echo "$content" | grep -qi "quality\|validation\|verification\|scoring\|enhance.*lead" && content_tags+=("lead-quality")
    echo "$content" | grep -qi "configuration\|config\|setup\|settings\|customize" && content_tags+=("configuration")
    echo "$content" | grep -qi "real.*time\|ping.*post\|instant\|live\|immediate" && content_tags+=("real-time")
    echo "$content" | grep -qi "suppressionlist\|suppression.*list\|blacklist\|filter.*out\|exclude" && content_tags+=("suppressionlist")
    echo "$content" | grep -qi "pricing\|cost\|billing\|payment\|subscription" && content_tags+=("pricing")
    
    # Authentication tag - only for content primarily about authentication
    if echo "$content" | grep -qi "authentication" && (echo "$title" | grep -qi "authentication\|login\|sign.*in\|access" || echo "$content" | grep -qi "authenticate.*user\|login.*process\|access.*control\|authentication.*method"); then
        content_tags+=("authentication")
    fi
    
    # Product Area Detection - More nuanced
    if echo "$content" | grep -qi "leadconduit" && echo "$content" | grep -qi "trustedform"; then
        product_area="integrated"
    elif echo "$content" | grep -qi "leadconduit"; then
        product_area="leadconduit"
    elif echo "$content" | grep -qi "trustedform"; then
        product_area="trustedform"
    else
        product_area="platform"
    fi
    
    # Audience Detection - Multiple audiences possible
    local audiences=()
    echo "$content" | grep -qi "api\|sdk\|developer\|technical\|code\|integration\|javascript\|webhook" && audiences+=("developers")
    echo "$content" | grep -qi "compliance\|tcpa\|fcc\|legal\|regulation\|consent" && audiences+=("compliance-teams")
    echo "$content" | grep -qi "marketing\|campaign\|lead.*generation\|advertising\|conversion" && audiences+=("marketing-teams")
    echo "$content" | grep -qi "sales\|crm\|lead.*management\|prospect" && audiences+=("sales-teams")
    
    # Default to business users if no specific audience detected
    if [[ ${#audiences[@]} -eq 0 ]]; then
        audiences+=("business-users")
    fi
    
    # Use primary audience (first detected)
    audience="${audiences[0]}"
    
    # Determine priority based on content characteristics
    local priority="medium"
    if echo "$content" | grep -qi "getting.*started\|introduction\|basic\|overview"; then
        priority="high"
    elif echo "$content" | grep -qi "advanced\|complex\|troubleshoot\|error"; then
        priority="low"
    fi
    
    # Create JSON entry
    if [[ $first_file == false ]]; then
        echo "," >> "$OUTPUT_FILE"
    fi
    first_file=false
    
    # Convert arrays to JSON format
    local article_types_json=""
    for i in "${!article_types[@]}"; do
        if [[ $i -gt 0 ]]; then
            article_types_json+=", "
        fi
        article_types_json+="\"${article_types[$i]}\""
    done
    
    local content_tags_json=""
    for i in "${!content_tags[@]}"; do
        if [[ $i -gt 0 ]]; then
            content_tags_json+=", "
        fi
        content_tags_json+="\"${content_tags[$i]}\""
    done
    
    local audiences_json=""
    for i in "${!audiences[@]}"; do
        if [[ $i -gt 0 ]]; then
            audiences_json+=", "
        fi
        audiences_json+="\"${audiences[$i]}\""
    done
    
    echo "    {" >> "$OUTPUT_FILE"
    echo "        \"path\": \"$relative_path\"," >> "$OUTPUT_FILE"
    echo "        \"directory\": \"$directory\"," >> "$OUTPUT_FILE"
    echo "        \"filename\": \"$filename\"," >> "$OUTPUT_FILE"
    echo "        \"title\": \"$title\"," >> "$OUTPUT_FILE"
    echo "        \"article_types\": [$article_types_json]," >> "$OUTPUT_FILE"
    echo "        \"product_area\": \"$product_area\"," >> "$OUTPUT_FILE"
    echo "        \"primary_audience\": \"$audience\"," >> "$OUTPUT_FILE"
    echo "        \"all_audiences\": [$audiences_json]," >> "$OUTPUT_FILE"
    echo "        \"content_tags\": [$content_tags_json]," >> "$OUTPUT_FILE"
    echo "        \"priority\": \"$priority\"" >> "$OUTPUT_FILE"
    echo "    }" >> "$OUTPUT_FILE"
}

echo "Analyzing content files with improved tagging logic..."

# Create temporary file list
temp_file=$(mktemp)
find "$CONTENT_DIR" -name "*.md" -type f > "$temp_file"

# Process each file
processed_count=0
skipped_count=0
while IFS= read -r file; do
    if analyze_content "$file"; then
        ((processed_count++))
    else
        ((skipped_count++))
    fi
done < "$temp_file"

# Clean up temp file
rm "$temp_file"

# Close JSON
echo '' >> "$OUTPUT_FILE"
echo ']}' >> "$OUTPUT_FILE"

echo "Metadata analysis complete: $OUTPUT_FILE"
echo "Files processed: $processed_count"
echo "Files skipped (low quality): $skipped_count"
echo "Total files found: $(find "$CONTENT_DIR" -name "*.md" | wc -l)"