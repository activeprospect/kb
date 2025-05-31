# Content Metadata System Guide

## Overview

The content metadata system analyzes all 912 documentation files and automatically tags them with structured metadata to help document builders identify the most relevant source materials for their tasks.

## Metadata Structure

Each content file includes the following metadata:

```json
{
    "path": "relative/path/to/file.md",
    "directory": "bloomfire|whatsnew|glossary",
    "filename": "filename.md",
    "title": "Extracted title from content",
    "article_type": "article type classification",
    "product_area": "leadconduit|trustedform|platform", 
    "audience": "target audience",
    "tags": ["relevant", "content", "tags"],
    "priority": "medium"
}
```

## Article Types

The system identifies these article types based on content patterns:

- **how-to-guide** (551 files): Step-by-step instructions and tutorials
- **definition** (191 files): Glossary entries and concept explanations  
- **feature-announcement** (131 files): New product capabilities and releases
- **article** (32 files): General informational content
- **introduction** (5 files): High-level product overviews
- **case-study** (2 files): Customer success stories

## Product Areas

Content is categorized by ActiveProspect product:

- **platform** (428 files): General platform and cross-product content
- **leadconduit** (285 files): LeadConduit-specific documentation
- **trustedform** (199 files): TrustedForm-specific documentation

## Target Audiences

Content is tagged for primary audiences:

- **developers** (346 files): Technical implementation, APIs, SDKs
- **marketing-teams** (228 files): Lead generation, campaign management
- **business-users** (179 files): General product usage and concepts
- **compliance-teams** (159 files): TCPA, FCC, legal requirements

## Content Tags

Available tags for filtering content:

- `lead-management`: Flow configuration, sources, recipients
- `trustedform`: Consent certification, verification
- `compliance`: TCPA, FCC, legal requirements
- `data-integration`: Batch delivery, APIs, webhooks
- `technical`: Developer-focused content
- `lead-quality`: Validation, filtering, optimization
- `configuration`: Setup and settings
- `real-time`: Ping/post, instant processing
- `security`: Privacy, protection, data safety

## Usage for Document Builders

### Finding Relevant Content

1. **By Topic**: Filter by tags to find content matching your documentation topic
2. **By Audience**: Match your target audience to find appropriately scoped content
3. **By Product**: Focus on specific product areas (LeadConduit vs TrustedForm)
4. **By Type**: Choose article types that match your documentation style

### Examples

**Building a LeadConduit integration guide for developers:**
```bash
# Find technical LeadConduit content
jq '.files[] | select(.product_area == "leadconduit" and .audience == "developers" and (.tags[] | contains("technical")))' content_metadata.json
```

**Creating compliance documentation:**
```bash
# Find compliance-focused content across all products
jq '.files[] | select(.audience == "compliance-teams" or (.tags[] | contains("compliance")))' content_metadata.json
```

**Writing a TrustedForm how-to guide:**
```bash
# Find TrustedForm tutorials and guides
jq '.files[] | select(.product_area == "trustedform" and .article_type == "how-to-guide")' content_metadata.json
```

## File Location

The complete metadata is stored in: `/Users/alex/Dev/kb/data/content_metadata.json`

## Updating Metadata

To regenerate metadata after content changes:

```bash
/Users/alex/Dev/kb/bin/tag_content.sh
```

This will analyze all content files and update the metadata JSON file.