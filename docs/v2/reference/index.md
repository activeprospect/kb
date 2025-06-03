---
title: Reference
description: Technical reference for LeadConduit's core concepts, showing how they work together to process leads from arrival to delivery
tags:
  - reference
  - technical
  - flows
  - universal
  - advanced
  - flows-focused
  - intermediate
  - conceptual
  - core-concept
---

# Reference

## Understanding Lead Processing Through Flows

At the heart of LeadConduit is the **[Flow](flows.md)** - but to truly understand flows, you need to see how leads journey through the system and how each concept plays its part in that journey.

Imagine a lead arriving from a vendor. In milliseconds, that raw data must be authenticated, parsed, validated, enhanced, and delivered to your systems. This isn't magic - it's the orchestrated interaction of twelve core concepts, each handling a specific aspect of the journey.


## The Lead's Journey: From Chaos to Order

### 1. Arrival: Sources and Authentication

When a lead first arrives at your flow, the system must verify it's coming from an authorized source:

**Sources** are the entry points where leads flow into LeadConduit. Each source - whether it's a vendor posting leads, a web form, or a partner system - has a unique identity with its own credentials and configuration. Importantly, sources are reusable: configure "Facebook Lead Ads" once, then use it across multiple flows. When you update a source's settings, the changes apply everywhere it's used. Behind the scenes, the platform's identity system (see [Entities](entities.md) for technical details) manages these persistent identities.

**[Integrations](integrations.md)** handle the technical connection. They validate API keys, accept specific data formats, and speak the right protocol. Whether it's a simple webhook or a complex API, integrations ensure secure, reliable data transfer from your sources.

### 2. Data Reception: Making Sense of Chaos  

Raw lead data arrives in countless formats. Three concepts transform this chaos into structure:

**[Fields](fields.md)** define your data model - what information you expect and require. Standard fields like `Email` and `Phone 1` provide consistency across all leads, while custom fields capture your specific business needs. Fields are your data contract with the world.

**[Types](types.md)** are the intelligent parsers that transform messy input into clean, structured data. When "(555) 123-4567" arrives, the phone type doesn't just validate - it extracts the area code, identifies if it's mobile, and normalizes the format. Types turn strings into intelligence.

**[Mappings](mappings.md)** bridge the gap between how vendors send data and how you need it. When Vendor A sends "primary_phone" and Vendor B sends "contact_number," mappings ensure both become your standard `Phone 1` field. They're the universal translators of lead data.

### 3. Business Logic: Decisions and Control

With clean data in hand, your [flow](flows.md) makes critical business decisions through four key mechanisms:

**Acceptance Criteria** determine which leads you'll accept. These are [rules](rules.md)-based gates that enforce your purchase agreements: "Only accept leads from approved states with valid contact information." If a lead fails acceptance criteria, it's rejected immediately with a clear reason.

**[Pricing](pricing.md)** calculates the financial dimension. What do you pay for this lead? What will you sell it for? With sophisticated tier support and "last match wins" logic, pricing ensures every lead's value is properly calculated based on quality, source, and business rules.

**Volume Caps** control your inventory and spend. These [rules](rules.md)-based limits prevent overselling and manage distribution: "Accept 100 leads per day total, with no more than 20 from California." Caps can be nested, time-based, and conditional.

**Filter Steps** make routing decisions throughout the flow. Using [rules](rules.md) evaluation, they determine: "Send high-value leads to Team A, standard leads to Team B, stop processing if consent is invalid." Filter steps are where flows become intelligent, not just sequential.

The **[Flow](flows.md)** orchestrates all these decisions, ensuring they happen in the right order with the right data. [Rules](rules.md) power the logic, while [Templates](templates.md) provide dynamic data access throughout.

### 4. Processing and Enhancement

As leads move through the flow, they're enriched with additional data:

**[Integrations](integrations.md)** connect to external services for enhancement - TrustedForm for consent verification, data append services for demographics, phone validation for connectivity. Each integration adds value to the raw lead, with results available in the `appended` namespace for subsequent steps.

**Enhancement Steps** call these integrations at the right moment in your flow. They're non-blocking - if an enhancement fails, the lead continues processing with whatever data is available. This ensures business continuity while maximizing data quality.

### 5. Delivery: Reaching Recipients

When it's time to deliver leads, the same concepts work in reverse:

**[Mappings](mappings.md)** transform your clean data into whatever format each recipient expects. Your standardized `Phone 1` field might need to become "contact_number" for your CRM or "primary_phone" for your dialer.

**Recipients** are where your leads go - your CRM, dialer, email system, or partner buyers. Like sources, each recipient has a persistent identity that can be reused across all your flows. Configure your "Salesforce CRM" recipient once with its credentials and field mappings, then use it wherever you need to deliver leads. Any updates to the recipient apply everywhere it's used, ensuring consistency across your lead operations. The platform's identity system (see [Entities](entities.md) for technical architecture) manages these reusable identities behind the scenes.

**[Integrations](integrations.md)** handle the technical delivery, managing protocols, authentication, and error handling for each recipient system.

### 6. Visibility: The Complete Story

Throughout this journey, two concepts provide total visibility:

**[Events](events.md)** capture snapshots at every significant moment. Not just logs - complete state captures showing exactly what happened, when, and why. Events are your audit trail, troubleshooting tool, and optimization guide rolled into one.

**[Reporting](reporting.md)** transforms those raw events into business intelligence. How many leads from each source? What's your acceptance rate? Where are leads failing? Reports answer the questions that drive your business.

**[Exports](exports.md)** provide the raw data when you need to dig deeper, reconcile with vendors, or feed external analytics systems.

## Using This Reference

Each concept page in this reference provides:

- **Definition** - What it is and why it exists
- **Technical Details** - How it works under the hood
- **Configuration** - All options and settings
- **Examples** - Real-world usage patterns
- **Relationships** - How it connects to other concepts
- **Best Practices** - Proven approaches

### Where to Start

- **New to LeadConduit?** Start with [Flows](flows.md) to understand the foundation
- **Setting up data collection?** Begin with [Fields](fields.md) and [Types](types.md)
- **Configuring business logic?** Focus on [Rules](rules.md) and [Pricing](pricing.md)
- **Connecting systems?** Explore [Integrations](integrations.md) and configuration guides
- **Need visibility?** Dive into [Events](events.md) and [Reporting](reporting.md)

## Additional Resources

- **[Complete Glossary](complete-glossary.md)** - Comprehensive terminology reference
- **[Concept Relationships](concepts-overview.md)** - Detailed mapping of how concepts interact
- **[Flow Lifecycle](lifecycle.md)** - Step-by-step journey through lead processing
- **[Quick Navigation](navigation.md)** - Find what you need by task or role

## The Power of the Platform

What makes LeadConduit powerful isn't any single concept - it's how they work together. A lead's journey from source to recipient touches every concept, each adding its unique value:

- **Sources** and **Recipients** define your business relationships
- **[Integrations](integrations.md)** ensure secure, reliable connections
- **[Fields](fields.md)**, **[Types](types.md)**, and **[Mappings](mappings.md)** transform chaos into structure  
- **[Rules](rules.md)**, **[Templates](templates.md)**, and **[Pricing](pricing.md)** apply sophisticated business logic
- **[Flows](flows.md)** orchestrate the entire process
- **[Events](events.md)**, **[Reporting](reporting.md)**, and **[Exports](exports.md)** provide complete visibility

Together, they create a platform where business logic becomes configuration, not code. Where lead processing becomes predictable, not chaotic. Where every decision is tracked, every outcome is visible, and every lead is handled according to your exact specifications.

---

*Remember: In LeadConduit, everything happens in the context of a [flow](flows.md). Understanding flows means understanding how all these concepts come together to process your leads.*