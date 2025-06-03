---
title: Flows
description: Your lead processing command center - from first contact to final delivery
tags:
  - flows-focused
  - reference
  - technical
  - core-concept
  - universal
---

# Flows

## What is a Flow?

Think of a flow as your automated lead processing assembly line. When a lead arrives from any source - a web form, a partner, an API - your flow decides what happens to it. Should you accept it? How much is it worth? Where should it go? A flow answers all these questions automatically, every time, in milliseconds.

## Why Flows Matter

Without flows, you'd be manually reviewing every lead, checking if phone numbers are valid, verifying consent was captured, calculating prices, and copying data between systems. Flows do all of this automatically based on rules you configure. They're not just moving data - they're making intelligent decisions about every lead that enters your business.

## How Flows Work

Every lead takes the same journey through your flow, passing through five phases. Some leads make it all the way through to delivery. Others get rejected along the way for specific reasons. Here's what happens:

### [1. Pre-Processing: The Entry Gate](flows/pre-processing.md)
Your lead arrives and gets authenticated, cleaned up, and enriched with verification data. Think of this as the security checkpoint - making sure the lead is legitimate and properly formatted before entering your system.

### [2. Business Logic: The Decision Center](flows/business-logic.md)  
This is where your business rules kick in. Is this lead acceptable? Have you seen it before? What's it worth? Have you hit your daily limit? Your configured rules make these decisions instantly.

### [3. Step Processing: The Assembly Line](flows/step-processing.md)
Accepted leads move through your custom workflow. Maybe you verify the phone number, check credit, add demographic data, or route to different teams. Each step adds value or makes routing decisions.

### [4. Delivery: The Distribution Hub](flows/delivery.md)
Time to send your processed lead to its destination - your CRM, dialer, email system, or buyer. Each destination gets the lead in exactly the format it needs.

### [5. Completion: The Wrap-Up](flows/completion.md)
Everything that happened gets recorded, the original source gets a response, and you have a complete audit trail of the lead's journey.

## Flow Configuration

A flow consists of three major configuration areas that work together:

### [Fields](fields.md): Your Data Model
Before you can process leads, you need to define what data you're working with. Fields specify what information your flow expects - standard fields like Email and Phone 1, plus any custom fields specific to your business. Each field has a [type](types.md) that determines how it's validated and parsed.

### [Sources](entities.md): Your Entry Points  
Sources are where leads enter your flow. Each source represents a specific vendor, form, or system sending you leads. You'll configure:
- How their field names map to your field names
- What credentials they use to authenticate
- Any source-specific acceptance criteria or pricing
- Which flow(s) this source feeds into

### [Steps](flows/step-processing.md): Your Processing Logic
Steps define what happens to leads after they pass your business logic gates. Common step types include:
- **Filter Steps** - Make routing decisions based on [rules](rules.md)
- **Enhancement Steps** - Call [integrations](integrations.md) to append data
- **Recipient Steps** - Send notifications or update internal systems  
- **Destination Steps** - Deliver leads to final [recipients](entities.md)

## Key Concepts in Action

### Variables: Your Data Access System
Throughout processing, flows maintain variables that give you access to all lead data:

| Namespace | Contains | Example |
|-----------|----------|---------|
| `lead.*` | Core lead fields after parsing | `lead.email`, `lead.phone.number` |
| `source.*` | Information about who sent the lead | `source.name`, `source.ip_address` |
| `appended.*` | Data from enhancement steps | `appended.trustedform.valid` |

These variables power [templates](templates.md) for dynamic values and [rules](rules.md) for decisions.

### Business Logic Gates
Before leads enter your custom steps, they must pass through gates powered by [rules](rules.md):

1. **Acceptance Criteria** - Do you want this lead?
2. **Suppression Lists** - Have you seen it before?  
3. **[Pricing](pricing.md)** - What's it worth?
4. **Volume Caps** - Are you within limits?

### The Power of Composability

What makes flows powerful is how concepts work together:
- [Mappings](mappings.md) transform data between different formats
- [Rules](rules.md) make decisions throughout the journey
- [Templates](templates.md) provide dynamic access to any value
- [Events](events.md) capture everything for analysis
- [Reporting](reporting.md) turns those events into insights

## Common Flow Patterns

### The Quality-First Flow
Validate everything before accepting:
1. Check all required fields exist
2. Verify phone/email formats
3. Validate consent documentation
4. Check suppression lists
5. Only then accept and process

### The Multi-Buyer Flow  
Distribute to multiple recipients:
1. Premium buyers get first shot
2. If they pass, try secondary buyers
3. Use filters to prevent overselling
4. Track acceptance per buyer

### The Compliance Flow
Meet regulatory requirements:
1. Verify consent certificates
2. Check against DNC lists
3. Filter restricted states
4. Document everything

## Technical Architecture

### Processing Guarantees
- **Atomic Processing** - Each lead completes or fails as a unit
- **Event Sourcing** - Complete history of every decision
- **Stateless Execution** - Each lead processes independently

### Performance Characteristics  
- **Typical Processing** - 200-500ms per lead
- **Horizontal Scaling** - Flows scale with volume
- **Real-time Execution** - No queuing or delays

### Integration Points
- **Inbound** - HTTP/HTTPS endpoints per source
- **Outbound** - REST, SOAP, or webhook per recipient
- **Enhancement** - Parallel API calls with timeouts

## Related Concepts

- **[Entities](entities.md)** - The identity system behind sources and recipients
- **[Integrations](integrations.md)** - How flows connect to external systems
- **[Events](events.md)** - The audit trail of every lead's journey
- **[Reporting](reporting.md)** - Analytics built from flow events
- **[Exports](exports.md)** - Bulk access to flow data

---

*Flows are where all LeadConduit concepts come together. Master flows, and you've mastered the platform.*
