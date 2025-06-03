#!/bin/bash

set -e

# Script to generate README.md files for content directories
# Usage: ./generate_content_readme.sh [directory]
# If no directory specified, generates for all content directories

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
CONTENT_DIR="$PROJECT_ROOT/content"

# Function to extract title from article.md frontmatter
get_article_title() {
    local article_file="$1"
    if [[ -f "$article_file" ]]; then
        # Extract Page Title from frontmatter
        grep "^Page Title:" "$article_file" | sed 's/Page Title: //' | head -1
    else
        echo "No title found"
    fi
}

# Function to generate description based on title
generate_description() {
    local title="$1"
    local dir_name="$2"
    
    # Simple heuristic-based descriptions
    case "$title" in
        *"TrustedForm"*"Overview"*) echo "Introduction to TrustedForm features and capabilities" ;;
        *"Getting Started"*) echo "Initial setup and configuration guide" ;;
        *"Implementation"*|*"Implementing"*) echo "Step-by-step implementation instructions" ;;
        *"Troubleshooting"*) echo "Common issues and their solutions" ;;
        *"API"*) echo "API documentation and integration details" ;;
        *"LeadConduit"*"Flow"*) echo "Flow configuration and management" ;;
        *"Facebook"*) echo "Facebook integration guide and tips" ;;
        *"Report"*) echo "Reporting features and analytics" ;;
        *"Feedback"*) echo "Feedback system configuration" ;;
        *"Guide"*) echo "Comprehensive guide and best practices" ;;
        *"How to"*) echo "Step-by-step instructions" ;;
        *"FAQ"*|*"faq"*) echo "Frequently asked questions" ;;
        *) echo "Knowledge base article" ;;
    esac
}

# Function to generate README for a content directory
generate_readme() {
    local content_subdir="$1"
    local dir_path="$CONTENT_DIR/$content_subdir"
    local readme_path="$dir_path/README.md"
    
    if [[ ! -d "$dir_path" ]]; then
        echo "Directory not found: $dir_path"
        return 1
    fi
    
    echo "Generating README for: $content_subdir"
    
    # Start README content
    cat > "$readme_path" << EOF
# $(echo ${content_subdir} | awk '{print toupper(substr($0,1,1)) substr($0,2)}') Content Directory

This directory contains processed articles from ${content_subdir}.csv.

## Table of Contents

| Article | Title | Description |
|---------|-------|-------------|
EOF
    
    # Process each subdirectory
    local count=0
    for article_dir in "$dir_path"/*/; do
        if [[ -d "$article_dir" ]]; then
            local dir_name=$(basename "$article_dir")
            local article_file="$article_dir/article.md"
            
            if [[ -f "$article_file" ]]; then
                local title=$(get_article_title "$article_file")
                local description=$(generate_description "$title" "$dir_name")
                
                # Add table row
                echo "| [${dir_name}/](./${dir_name}/) | $title | $description |" >> "$readme_path"
                ((count++))
            fi
        fi
    done
    
    # Add footer
    cat >> "$readme_path" << EOF

Total articles: $count
Last processed: $(date '+%Y-%m-%d %H:%M:%S')
EOF
    
    echo "Created: $readme_path (${count} articles)"
}

# Function to generate main content README
generate_main_readme() {
    local readme_path="$CONTENT_DIR/README.md"
    
    echo "Generating main content README..."
    
    # Count articles in each directory for the summary
    local count_bloomfire=0
    local count_whatsnew=0
    local count_app=0
    local count_glossary=0
    
    if [[ -d "$CONTENT_DIR/bloomfire" ]] && ls "$CONTENT_DIR/bloomfire"/*/article.md >/dev/null 2>&1; then
        count_bloomfire=$(find "$CONTENT_DIR/bloomfire" -name "article.md" -type f | wc -l | tr -d ' ')
    fi
    if [[ -d "$CONTENT_DIR/whatsnew" ]] && ls "$CONTENT_DIR/whatsnew"/*/article.md >/dev/null 2>&1; then
        count_whatsnew=$(find "$CONTENT_DIR/whatsnew" -name "article.md" -type f | wc -l | tr -d ' ')
    fi
    if [[ -d "$CONTENT_DIR/app" ]] && ls "$CONTENT_DIR/app"/*/article.md >/dev/null 2>&1; then
        count_app=$(find "$CONTENT_DIR/app" -name "article.md" -type f | wc -l | tr -d ' ')
    fi
    if [[ -d "$CONTENT_DIR/glossary" ]] && ls "$CONTENT_DIR/glossary"/*/article.md >/dev/null 2>&1; then
        count_glossary=$(find "$CONTENT_DIR/glossary" -name "article.md" -type f | wc -l | tr -d ' ')
    fi
    
    cat > "$readme_path" << 'EOF'
# 📚 Content Library for Documentation Writing

Welcome, Copywriter! This directory contains all the source material you need to create amazing LeadConduit documentation.

> ⚠️ **CRITICAL: Source of Truth**
> 
> The `app/` directory contains the **ONLY** authoritative, up-to-date documentation.
> 
> All other directories (`bloomfire/`, `whatsnew/`, `glossary/`) contain historical or background information that **MAY BE OUTDATED OR INCORRECT**.
> 
> **ALWAYS verify information against `app/` before using it in documentation!**

## 🎯 Quick Navigation

Looking for specific content? Here's what's available:

### 🎯 SOURCE OF TRUTH: Technical Documentation (`app/`)
**⚠️ THIS IS THE AUTHORITATIVE SOURCE** - Always verify information here!
- Current system specifications and behavior
- Accurate API documentation
- Up-to-date configuration details
- Official feature documentation

### 📖 Knowledge Base Articles (`bloomfire/`)
Historical documentation and user guides. **⚠️ May contain outdated information!**
- Legacy how-to guides and tutorials
- Common user questions and historical solutions
- Good for understanding user perspectives
- **Always verify against `app/` for accuracy**

### 📰 Release Notes & Updates (`whatsnew/`)
Historical product announcements. **⚠️ Check current state in `app/`!**
- Past feature announcements
- Historical change logs
- Useful for understanding feature evolution
- **Not necessarily current - verify in `app/`**

### 📝 Glossary Terms (`glossary/`)
Terminology reference. **⚠️ Verify current usage!**
- Historical term definitions
- May not reflect current product vocabulary
- Cross-reference with `app/` documentation

## 📊 Available Content

| Content Type | Location | What's Inside | Articles Available |
|--------------|----------|---------------|-------------------|
EOF
    
    # Add information about each directory
    for dir in "$CONTENT_DIR"/*/; do
        if [[ -d "$dir" ]]; then
            dirname=$(basename "$dir")
            case "$dirname" in
                "app")
                    type="🎯 SOURCE OF TRUTH"
                    inside="**CURRENT** API docs, system specs, official documentation"
                    ;;
                "bloomfire")
                    type="📚 Background Info"
                    inside="Historical guides, FAQs (⚠️ may be outdated)"
                    ;;
                "glossary")
                    type="📝 Terminology"
                    inside="Term definitions (⚠️ verify current usage)"
                    ;;
                "whatsnew")
                    type="📰 Historical Updates"
                    inside="Past announcements (⚠️ check current state in app/)"
                    ;;
                *)
                    type="Other Content"
                    inside="Additional resources"
                    ;;
            esac
            
            # Count articles (directories with article.md files)
            count=0
            if ls "$dir"/*/article.md >/dev/null 2>&1; then
                count=$(find "$dir" -name "article.md" -type f | wc -l | tr -d ' ')
            fi
            
            echo "| **${type}** | [${dirname}/](./${dirname}/) | ${inside} | ${count} |" >> "$readme_path"
        fi
    done
    
    # Add footer with copywriter-focused information
    cat >> "$readme_path" << EOF

## 🔍 How to Use This Content

### Finding What You Need

1. **Browse by topic**: Each directory has its own README with a complete table of contents
2. **Search for keywords**: Use your editor's search across all \`article.md\` files
3. **Check related content**: Similar topics are often in the same directory

### Understanding the Content

Each article includes:
- **Frontmatter metadata**: Original URL, title, and scrape date
- **Cleaned content**: Website navigation and boilerplate removed
- **Localized images**: All images downloaded to \`images/\` subdirectories

### Tips for Copywriters

📌 **ALWAYS start with app/** - This is the SOURCE OF TRUTH for current functionality
📌 **Use bloomfire/ for context** - Understand user perspectives, but verify facts in app/
📌 **Check whatsnew/ for history** - See how features evolved, but confirm current state in app/
📌 **Verify all information** - Content outside app/ may be outdated or incorrect

## 📋 Content Coverage

Based on processed articles:
- **🎯 Current Documentation (app/)**: $count_app SOURCE OF TRUTH articles
- **📚 Historical Documentation (bloomfire/)**: $count_bloomfire background articles (⚠️ may be outdated)
- **📰 Past Updates (whatsnew/)**: $count_whatsnew historical announcements
- **📝 Terminology (glossary/)**: $count_glossary term definitions

## 🚀 Need More Content?

If you need content that hasn't been processed yet:
1. Check if the CSV file exists in \`data/\`
2. Ask a processor to run: \`./bin/process_csv_enhanced.sh data/[filename].csv\`
3. Regenerate READMEs: \`./bin/generate_content_readme.sh\`

---
*Last updated: $(date '+%Y-%m-%d %H:%M:%S')*
*Remember to check \`context/tone.md\`, \`context/vocabulary.md\`, and \`context/vibes.md\` for writing guidelines!*
EOF
    
    echo "Created: $readme_path"
}

# Main execution
if [[ $# -eq 0 ]]; then
    # No arguments - process all content directories and main README
    echo "Generating README files for all content directories..."
    
    # First generate the main content README
    generate_main_readme
    
    # Then process each subdirectory
    for dir in "$CONTENT_DIR"/*/; do
        if [[ -d "$dir" ]]; then
            dirname=$(basename "$dir")
            # Skip if it's not a data directory (has subdirectories with article.md files)
            if ls "$dir"/*/article.md >/dev/null 2>&1; then
                generate_readme "$dirname"
            else
                echo "Skipping $dirname - no article subdirectories found"
            fi
        fi
    done
else
    # Process specific directory
    generate_readme "$1"
fi

echo "README generation complete!"