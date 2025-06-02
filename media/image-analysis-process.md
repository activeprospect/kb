# Image Analysis Process for Documentation

## Overview

This document outlines the systematic process for analyzing images in documentation to create descriptions, alt text, and concept tags. This process improves accessibility, searchability, and content understanding.

## Prerequisites

- Access to documentation markdown files
- Ability to view images (either via URLs or local files)
- Reference to `/context/tags.md` for standardized concept tagging

## Process Steps

### 1. Document Selection and Image Discovery

```bash
# Example: Analyzing a specific document
File: /content/bloomfire/lead-pricing.md
```

1. **Read the document** to understand overall context
2. **Identify all images** by looking for:
   - Markdown image syntax: `![alt text](image_url)`
   - HTML image tags: `<img src="...">`
   - Embedded media links

### 2. Contextual Analysis

For each image found:

1. **Note the surrounding text** (paragraph before and after)
2. **Identify the section heading** the image appears under
3. **Understand the narrative flow** - what is being explained?

### 3. Image Analysis

For each image, create the following components:

#### A. Basic Metadata
```markdown
### Image [Number]: [Brief Title]
**URL:** [Original URL]
**Context:** [One sentence describing where/why it appears]
```

#### B. Description
Write a 1-2 sentence description of what the image shows, focusing on:
- The main interface or diagram elements
- The user action being demonstrated
- The business concept being illustrated

#### C. Alt Text
Create concise alt text (under 125 characters) that:
- Describes the image for screen readers
- Focuses on the most important visual information
- Uses proper terminology from `/context/tone-and-vocabulary.md`

#### D. Key Elements
List 4-6 specific visual elements visible in the image:
- UI components (buttons, fields, tabs)
- Data shown (values, options, examples)
- Visual indicators (arrows, highlights, selections)
- Structural elements (sections, panels, navigation)

#### E. Concept Tags
Select 3-5 tags from `/context/tags.md` that best represent:
- The feature being shown
- The user task being performed
- The technical concept
- The business value

Format: `#tag-name` (use hyphens, lowercase)

### 4. Pattern Recognition

After analyzing all images in a document:

1. **Identify the narrative arc** - Do images follow a tutorial sequence?
2. **Note any missing visuals** - Are there steps without images that need them?
3. **Find redundancies** - Are similar concepts shown multiple times?
4. **Assess quality** - Are images clear and properly sized?

### 5. Output Format

Create a structured markdown file in `/media/[document-name]-images.md`:

```markdown
# [Document Title] - Image Analysis

Document: `[relative path to source document]`
Analysis Date: [Month Year]

## Image Inventory

[For each image, use the template from step 3]

---

## Summary

This document contains [N] images that [describe the overall purpose/flow].

[2-3 sentences about what the images collectively accomplish]
```

### 6. Quality Checklist

Before finalizing, verify:

- [ ] All images in the document are catalogued
- [ ] Alt text is under 125 characters
- [ ] Descriptions use official terminology from `/context/tone-and-vocabulary.md`
- [ ] Tags match entries in `/context/tags.md`
- [ ] Context accurately represents the surrounding text
- [ ] Key elements are specific and observable

### 7. Maintenance Notes

When documents are updated:
1. Check if new images were added
2. Verify existing image URLs still work
3. Update context if surrounding text changed
4. Add new concept tags as needed

## Example Analysis Entry

```markdown
### Image 3: Pricing Configuration Toggle
**URL:** `https://content2.bloomfire.com/.../original.png`
**Context:** Shows the mutual exclusivity between rule-based pricing and source-submitted pricing

**Description:** Interface showing the toggle between accepting vendor-provided prices or using custom rule-based pricing, highlighting that only one method can be active at a time.

**Alt Text:** "Pricing configuration toggle showing options for vendor-provided price versus rule-based pricing"

**Key Elements:**
- Radio button selection
- "Use vendor provided price" option
- "Use rule based prices" option
- Mutual exclusivity indicator

**Concepts:** #pricing-options #vendor-pricing #rule-based-pricing #configuration-toggle
```

## Benefits

This systematic approach provides:
1. **Accessibility** - Screen reader users can understand visual content
2. **Searchability** - Images become findable through concept tags
3. **Context** - Future documentation writers understand image purpose
4. **Consistency** - Standardized descriptions across all docs
5. **Maintenance** - Easy to identify outdated or missing images

## Next Steps

1. Apply this process to high-traffic documentation first
2. Create a backlog of documents needing image analysis
3. Consider automating parts of the process (URL extraction, template generation)
4. Regular audits to ensure image URLs remain valid