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
| **🎯 SOURCE OF TRUTH** | [app/](./app/) | **CURRENT** API docs, system specs, official documentation | 0 |
| **📚 Background Info** | [bloomfire/](./bloomfire/) | Historical guides, FAQs (⚠️ may be outdated) | 203 |
| **📝 Terminology** | [glossary/](./glossary/) | Term definitions (⚠️ verify current usage) | 0 |
| **📰 Historical Updates** | [whatsnew/](./whatsnew/) | Past announcements (⚠️ check current state in app/) | 129 |

## 🔍 How to Use This Content

### Finding What You Need

1. **Browse by topic**: Each directory has its own README with a complete table of contents
2. **Search for keywords**: Use your editor's search across all `article.md` files
3. **Check related content**: Similar topics are often in the same directory

### Understanding the Content

Each article includes:
- **Frontmatter metadata**: Original URL, title, and scrape date
- **Cleaned content**: Website navigation and boilerplate removed
- **Localized images**: All images downloaded to `images/` subdirectories

### Tips for Copywriters

📌 **ALWAYS start with app/** - This is the SOURCE OF TRUTH for current functionality
📌 **Use bloomfire/ for context** - Understand user perspectives, but verify facts in app/
📌 **Check whatsnew/ for history** - See how features evolved, but confirm current state in app/
📌 **Verify all information** - Content outside app/ may be outdated or incorrect

## 📋 Content Coverage

Based on processed articles:
- **🎯 Current Documentation (app/)**: 0 SOURCE OF TRUTH articles
- **📚 Historical Documentation (bloomfire/)**: 203 background articles (⚠️ may be outdated)
- **📰 Past Updates (whatsnew/)**: 129 historical announcements
- **📝 Terminology (glossary/)**: 0 term definitions

## 🚀 Need More Content?

If you need content that hasn't been processed yet:
1. Check if the CSV file exists in `data/`
2. Ask a processor to run: `./bin/process_csv_enhanced.sh data/[filename].csv`
3. Regenerate READMEs: `./bin/generate_content_readme.sh`

---
*Last updated: 2025-06-02 18:27:57*
*Remember to check `context/tone.md`, `context/vocabulary.md`, and `context/vibes.md` for writing guidelines!*
