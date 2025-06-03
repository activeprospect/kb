# Index.md Template for Section Overviews

This template helps copywriters create consistent, high-quality index.md files for each documentation section.

## Basic Structure

```markdown
---
layout: page
title: [Section Name]
permalink: /[SectionPath]/
---

# [Section Name]

[One-sentence description of what this section covers and who it's for]

## In This Section

- **[Topic 1]** - [Brief description of what users will learn]
- **[Topic 2]** - [Brief description of what users will learn]
- **[Topic 3]** - [Brief description of what users will learn]
[Continue for all topics in the section]

## Overview

[2-3 paragraphs explaining:]
- What this section covers in detail
- Why these topics matter to users
- How the topics connect to each other
- What problems this section helps solve

## Prerequisites

[Optional - include if users need prior knowledge]
- Understanding of [concept]
- Completion of [other section]
- Access to [specific features]

## What You'll Learn

By the end of this section, you'll be able to:
- [Specific outcome 1]
- [Specific outcome 2]
- [Specific outcome 3]
- [Additional outcomes as needed]

## How to Use This Section

[Guidance on the best way to approach the content]
- Recommended reading order
- Which topics are essential vs optional
- Tips for different user types (beginners vs advanced)

---

*Navigate to specific topics using the links above, or return to the [main User Guide]({{ site.baseurl }}/).*
```

## Example: Getting Started Section

```markdown
---
layout: page
title: Getting Started
permalink: /getting-started/
---

# Getting Started

Your complete guide to setting up LeadConduit and processing your first leads successfully.

## In This Section

- **[Account Setup](./account-setup)** - Configure your account, users, and basic settings
- **[Understanding the Interface](./interface-overview)** - Navigate LeadConduit's dashboard and key features
- **[Your First Flow](./first-flow)** - Build a simple lead processing flow step-by-step
- **[Testing Your Setup](./testing-setup)** - Validate your configuration before going live
- **[Going Live](./going-live)** - Launch your lead processing with confidence

## Overview

The Getting Started section is designed for new LeadConduit users who need clear, practical guidance to begin processing leads effectively. Whether you're a lead buyer setting up vendor management or a lead seller configuring distribution, these guides provide the foundational knowledge you need.

We'll walk you through initial setup, help you understand LeadConduit's core concepts through hands-on examples, and ensure you're confident before processing real leads. Each topic builds on the previous one, creating a smooth learning path from account creation to live lead processing.

## Prerequisites

- A LeadConduit account (trial or paid)
- Basic understanding of lead generation concepts
- Access to at least one lead source for testing

## What You'll Learn

By the end of this section, you'll be able to:
- Configure your LeadConduit account with proper users and permissions
- Navigate the interface confidently and find key features
- Build a functional lead flow that validates and delivers leads
- Test your setup thoroughly before processing real leads
- Launch your lead processing with proper monitoring in place

## How to Use This Section

Start with Account Setup and work through each topic in order. Each guide builds on concepts from the previous one. Budget about 2-3 hours to complete all topics with hands-on practice.

If you're in a hurry, focus on Account Setup and Your First Flow to get operational quickly, then return to other topics as needed.

---

*Navigate to specific topics using the links above, or return to the [main User Guide]({{ site.baseurl }}/).*
```

## Key Guidelines

1. **Length:** 500-800 words total
2. **Tone:** Welcoming and informative (per context/tone.md)
3. **Vocabulary:** Use correct terminology (per context/vocabulary.md)
4. **Purpose:** Orient users to the section's content and value
5. **Structure:** Follow the template sections in order

## Common Mistakes to Avoid

- Don't just list the topics - explain their value
- Don't assume knowledge - be explicit about prerequisites
- Don't make it too technical - save details for individual topics
- Don't forget to connect topics to user goals and problems
- Don't use inconsistent terminology or informal tone

## Remember

The index.md is often the first page users see in a section. It should:
- Build confidence that they're in the right place
- Create excitement about what they'll learn
- Provide clear navigation and learning path
- Set expectations for time and complexity