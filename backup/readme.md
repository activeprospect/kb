# Content Directory Guide for Copywriters

## 📚 Overview

This directory contains the source content that serves as the foundation for all LeadConduit documentation. As a copywriter, this is your primary research and reference library.

## 🎯 Important for All Copywriters

**Before creating any documentation, you MUST:**

1. **Start with `content/app/`** - This is the AUTHORITATIVE source for LeadConduit concepts
2. **Review this directory thoroughly** to understand what content already exists
3. **Search for relevant existing content** before writing new material
4. **Reuse and remix existing content** wherever possible
5. **Only create new content** when gaps exist in the current knowledge base

## 📁 Content Structure

```
content/
├── readme.md              # This file - copywriter guide
├── app/                   # ⭐ AUTHORITATIVE APPLICATION MODEL AND CONCEPTS
│   ├── context/          # System outlines and tags
│   │   ├── outline-model.md   # Data model structure
│   │   ├── outline-root.md    # System architecture
│   │   └── tags.md           # Content tagging system
│   └── model/            # ⭐ CORE LEADCONDUIT CONCEPTS
│       ├── entities.md       # Core entities and relationships
│       ├── events.md         # Event system documentation
│       ├── exports.md        # Export functionality
│       ├── fields.json       # Field definitions
│       ├── flows.md          # Flow concepts and architecture
│       ├── integrations.md   # Integration patterns
│       ├── mappings.md       # Data mapping concepts
│       ├── pricing.md        # Pricing model
│       ├── reporting.md      # Reporting system
│       ├── rules.md          # Rules engine
│       ├── templates.md      # Template system
│       └── types.md          # Data types
├── bloomfire/            # Legacy public documentation (188 files - may be outdated)
│   └── *.md              # Individual documentation articles
├── glossary/             # Legacy terminology definitions (may be outdated)
│   └── activeprospect/   # Product-specific terms
├── whatsnew/             # Historical release notes (208 files)
│   └── *.md              # Individual release announcements
├── leadconduit-content-taxonomy.md
├── leadconduit-product-overview.md
└── understanding-leadconduit-data-model.md
```

## ⚠️ CRITICAL: Content Authority Hierarchy

### 1. **PRIMARY SOURCE: `app/` Directory** ⭐
The `app/` directory contains the **AUTHORITATIVE** and **CURRENT** LeadConduit concepts:
- **Always check here first** for accurate system behavior
- **This supersedes** any conflicting information in other directories
- **Contains the truth** about how LeadConduit actually works

### 2. **SECONDARY SOURCES: Legacy Content** 
- `bloomfire/` - Historical documentation (may be outdated)
- `whatsnew/` - Release history (useful for feature evolution)
- `glossary/` - Legacy terminology (verify against app/model/)

**⚠️ WARNING:** Bloomfire, whatsnew, and glossary directories likely contain outdated information. Always verify against the app/ directory.

## 🔍 How to Use This Content

### 1. **ALWAYS Start with `app/` Directory** ⭐
```bash
# First, explore the authoritative model
ls content/app/model/

# Read core concepts in order:
1. entities.md     # Understand the core objects
2. flows.md        # Understand the flow system
3. events.md       # Understand the event model
4. fields.json     # Understand field definitions
5. rules.md        # Understand the rules engine
```

### 2. **Then Check Overview Files**
- `leadconduit-product-overview.md` - High-level product understanding
- `understanding-leadconduit-data-model.md` - Technical architecture
- `leadconduit-content-taxonomy.md` - Content organization principles

### 3. **Search Legacy Content (WITH CAUTION)**
The `bloomfire/` directory contains 188 historical documentation files. **⚠️ Verify all information against app/model/**

**Pro tip:** When searching legacy content, always cross-reference:
```bash
# Search in app/model first
grep -r "your topic" content/app/model/

# Then search legacy content
grep -r "your topic" content/bloomfire/
```

### 4. **Check Release History for Context**
The `whatsnew/` directory shows feature evolution over time. Useful for understanding why things work the way they do.

### 5. **Verify Terminology**
When using glossary terms, **always verify against app/model/** for current usage.

## 📝 Content Reuse Guidelines

### DO:
- ✅ Copy relevant sections from existing content
- ✅ Combine multiple sources to create comprehensive guides
- ✅ Update outdated information based on newer release notes
- ✅ Maintain consistent terminology from the glossary
- ✅ Preserve helpful examples and use cases

### DON'T:
- ❌ Rewrite content that already explains something well
- ❌ Change established terminology or product names
- ❌ Ignore existing explanations in favor of new ones
- ❌ Create duplicate content without good reason

## 🎯 Research Workflow

1. **Identify your topic** from the outline in `context/outlines/v2/outline.md`
2. **START with app/model/** for authoritative information:
   - Read relevant files in `content/app/model/`
   - This is your source of truth
3. **Search legacy content** for additional context:
   - Check file names for relevant topics
   - Use grep to search content
   - Review bloomfire for how-to guides (verify accuracy)
   - Check whatsnew for feature history
4. **Compile relevant content** prioritizing app/model information
5. **Identify gaps** where new content is needed
6. **Create new content** only for identified gaps
7. **Maintain consistency** with app/model concepts and terminology

## 💡 Tips for Effective Content Mining

### Quick Searches:
```bash
# ALWAYS start with the authoritative source
grep -r "feature name" content/app/model/

# Then search legacy content
grep -r "feature name" content/

# Find files with specific topics
find content/ -name "*integration*" -type f

# Search for feature history
grep -r "2024" content/whatsnew/
```

### Understanding File Structure:
- **app/model/**: Authoritative system documentation (TRUST THIS)
- **app/context/**: System architecture and outlines
- **Bloomfire files**: Historical how-to guides (VERIFY ACCURACY)
- **Whatsnew files**: Feature evolution history
- **Glossary files**: Legacy terminology (VERIFY AGAINST app/model)

### Content Priority Order:
1. **app/model/** - This is the truth ⭐
2. **Overview files** - Good for context
3. **Recent whatsnew** - Shows current features
4. **Bloomfire** - Useful how-tos (but verify)
5. **Old whatsnew/glossary** - Historical reference only

## 🚀 Remember

Your goal is to **create accurate documentation** based on how LeadConduit actually works today. The `app/` directory is your north star.

**⚠️ CRITICAL:** If you find conflicting information between `app/model/` and other sources, **app/model/ is correct**. The legacy content may be outdated or incorrect.

### Final Checklist:
- [ ] Did you check `app/model/` first?
- [ ] Did you verify legacy content against `app/model/`?
- [ ] Are you using current terminology from `app/model/`?
- [ ] Have you prioritized accuracy over reusing outdated content?

---

*Need help? Check the `llm/copywriter/brain.md` file for insights from other copywriters, but remember: **app/model/ is the authoritative source**.*