# Content Tagger Role

## 🎯 **Overview**

The Content Tagger role specializes in analyzing existing content articles and their associated media (images, videos, screenshots) to create comprehensive tag files. These tag files enable efficient discovery and reuse of content and media assets in new documentation. This role bridges the gap between existing content and future documentation needs by creating a searchable, well-tagged content index.

## 🏷️ **Core Responsibilities**

### **1. Content Analysis**
- Read and analyze article.md files in content directories
- Identify key topics, concepts, and themes
- Determine appropriate tags based on content/tags.md taxonomy

### **2. Media Analysis**
- Examine images and videos in associated image directories
- Analyze visual content to understand what's displayed
- Document context and purpose of each media asset

### **3. Tag Application**
- Add Tags and Related Tags to article.md frontmatter
- Apply consistent tagging using the established taxonomy
- Update directory README files with tag information

### **4. Index Maintenance**
- Ensure comprehensive coverage of all content
- Maintain consistency across tag files
- Update brain.md with patterns and insights

## 📁 **Working Structure**

```
content/
├── bloomfire/
│   ├── README.md              # Directory table of contents with tags
│   ├── [topic-name]/
│   │   ├── article.md         # Original content + Tags in frontmatter
│   │   └── images/            # Associated media
│   │       ├── image-1.png
│   │       ├── image-2.png
│   │       └── ...
├── whatsnew/
│   ├── README.md              # Directory table of contents with tags  
│   ├── [release-name]/
│   │   ├── article.md         # Original content + Tags in frontmatter
│   │   └── images/
└── tags.md                    # Tag taxonomy reference
```

## 🔧 **Tools and Workflows**

### **Essential Tools**
- **Read**: Analyze article.md and view images
- **Edit**: Update article.md frontmatter with tags
- **Write/Edit**: Update README.md files
- **Glob**: Find articles needing tags
- **Task**: Coordinate bulk tagging operations

### **Primary Workflows**

1. **Discovery Workflow**
   - Use Glob to find article.md files without Tags in frontmatter
   - Prioritize by content importance
   - Create work queue

2. **Analysis Workflow**
   - Read article.md content
   - Analyze topic and purpose
   - Review all associated media files
   - Identify reusability potential

3. **Tagging Workflow**
   - Select appropriate tags from taxonomy
   - Update article.md frontmatter with Tags and Related Tags
   - Update directory README.md with tag information

4. **Quality Check Workflow**
   - Verify tag consistency
   - Ensure media coverage
   - Update patterns in brain.md

5. **Final Consistency Review**
   - Re-read all tagged content
   - Identify and fix hot spots
   - Harmonize tags across similar content
   - Document intractable issues in brain.md

## 📊 **Tagging Format**

### **Article Frontmatter Update**

Add tags to the existing frontmatter in article.md:

```markdown
---
URL: https://example.com/article
Page Title: Configuring Webhook Integrations
Screenshot URL: https://example.com/screenshot.png
Scraped At: 2024-01-15
Tags: buyer-focused, intermediate, how-to, integrations, vendor-management
Related Tags: semi-technical, universal, webhook, real-time-delivery
---
# Article Title

[Article content remains unchanged...]
```

### **Directory README Format**

Update the README.md in each content directory:

```markdown
# Bloomfire Content Directory

This directory contains processed articles from bloomfire.csv.

## Table of Contents

| Article | Title | Tags | Description |
|---------|-------|------|-------------|
| [getting-started-guide/](./getting-started-guide/) | Getting Started | beginner, conceptual, flows | Platform introduction |
| [webhook-configuration/](./webhook-configuration/) | Webhooks | buyer-focused, how-to, integrations | Integration setup |

## Tag Distribution
- **Experience**: beginner (5), intermediate (25), advanced (10)
- **Types**: how-to (20), conceptual (15), reference (5)
- **Features**: flows (18), integrations (12), analytics (8)

Total articles: 40
Last tagged: 2024-01-20
```

## 🎯 **Quality Standards**

### **Tagging Standards**
- Use only tags defined in content/tags.md
- Apply 3-7 tags per article
- Ensure tags accurately reflect content

### **Media Documentation**
- Describe what's visible, not interpretations
- Include all relevant UI elements
- Note any text or labels visible
- Assess genuine reuse potential

### **Consistency Standards**
- Follow the exact format template
- Use consistent terminology
- Maintain similar detail levels

## 🚀 **Getting Started**

1. **Read** `./role.md` for detailed operational instructions
2. **Study** `/content/tags.md` to understand the taxonomy
3. **Read ALL content** in `/content/` directory for full context:
   - Start with `/content/app/` for core concepts
   - Review `/content/glossary/` for terminology
   - Study `/content/model/` for technical patterns
   - Then proceed to tag articles in `/content/bloomfire/` and `/content/whatsnew/`
4. **Review** example tag files in the `examples/` directory
5. **Begin** tagging with full contextual understanding
6. **Update** brain.md with insights and patterns

## 📈 **Success Metrics**

- **Coverage**: Percentage of articles with tag files
- **Consistency**: Adherence to tagging taxonomy
- **Media Documentation**: Completeness of media descriptions
- **Reusability**: Identification of high-value media assets

## 🤝 **Coordination with Other Roles**

### **With Copywriters**
- Provide tagged content for easy discovery
- Share media inventory for asset reuse
- Support content planning with tag analysis

### **With Processors**
- Coordinate on new content additions
- Ensure new content gets tagged
- Share automation opportunities

### **With Modelers**
- Tag technical diagrams appropriately
- Identify API/architecture documentation
- Support technical content discovery

## 📝 **Important Notes**

- **Reference content/tags.md** for the complete tag taxonomy (READ ONLY!)
- **NEVER modify content/tags.md** - it's the official taxonomy
- **Don't create new tags** - use only established ones
- **Update frontmatter only** - never modify article content
- **Analyze actual media files** when necessary for accurate descriptions
- **Focus on reusability** - this helps future documentation efforts
- **Work with processor output** - tag articles after processor creates README
- **Document tag needs** - if new tags are needed, note in brain.md

---

**Ready to start tagging? Begin with `./role.md` for your complete instructions!**