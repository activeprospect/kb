---
title: Entities
description: The identity system that powers sources, recipients, and partner relationships
tags:
  - entities-focused
  - reference
  - technical
  - core-concept
  - advanced
---

# Entities

## What are Entities?

Entities are LeadConduit's identity system. They represent the "who" in every lead transaction - who sends you leads, who receives them, and what systems handle them along the way. While users primarily interact with sources and recipients in their flows, entities provide the underlying identity that makes these connections reusable and manageable.

## Why Entities Matter

Think about your lead ecosystem. You work with dozens of vendors, multiple CRM systems, various enhancement services, and partner companies. Without a unified identity system, you'd be configuring the same vendors over and over, managing credentials in multiple places, and losing track of who's who.

Entities solve this by providing:
- **Persistent Identity** - Configure once, use everywhere
- **Capability Declaration** - Know what each participant can do
- **Relationship Tracking** - Understand business connections

## How Sources and Recipients Work

When you add a source or recipient to your flow, you're actually using an entity's identity:

### Sources (Where Leads Come From)
When you configure "Facebook Lead Ads" as a source:
1. You're using Facebook's entity identity
2. The entity provides available integration modules
3. Your source configuration is specific to your flow
4. Changes to the Facebook entity affect all flows using it

### Recipients (Where Leads Go)
When you configure "Salesforce CRM" as a recipient:
1. You're using Salesforce's entity identity
2. The entity defines how to connect to Salesforce
3. Your credentials and mappings are flow-specific
4. The entity enables consistent naming across flows

## Entity Classifications

Every entity has two classifications that define its capabilities:

### Source Classifications
| Type | Description | Examples |
|------|-------------|----------|
| `seller` | Companies that sell leads | Lead generation companies, affiliates |
| `form` | Web forms and landing pages | Your website forms, partner forms |
| `other` | Other lead sources | Import tools, testing systems |
| `null` | Cannot send leads | CRM systems, analytics platforms |

### Recipient Classifications
| Type | Description | Examples |
|------|-------------|----------|
| `buyer` | Companies that buy leads | Your customers, lead buyers |
| `crm` | Customer management systems | Salesforce, HubSpot, custom CRMs |
| `analytics` | Tracking and scoring systems | Internal scoring APIs, analytics tools |
| `enhancement` | Data enrichment services | Phone validation, demographic append |
| `esp` | Email service providers | Mailchimp, SendGrid, email systems |
| `other` | Other recipients | Webhook endpoints, custom systems |
| `null` | Cannot receive leads | Form-only systems |

**Important:** Many entities have both classifications. A partner company might be both a `seller` (sending you leads) and a `buyer` (receiving leads from you).

## Types of Entities

### Standard Entities
Pre-built entities for well-known services:
- Available to all LeadConduit accounts
- Maintained by ActiveProspect
- Cannot be modified
- Examples: Major CRMs, known lead companies, popular services

### Custom Entities
Entities you create for your unique needs:
- Represent your specific partners or systems
- Fully configurable
- Only visible to your account
- Examples: Regional partners, proprietary systems, internal services

### Account Entities
Special entities representing LeadConduit accounts:
- Automatically created for each account
- Enable account-to-account lead sharing
- Support custom integrations
- The future of partner relationships

## The Power of Reverse Integration

Here's where entities become truly powerful. Traditional lead industry integration puts the burden on buyers:

**Traditional Model:**
```
Vendor publishes API specs
    ↓
Every buyer implements custom code
    ↓
Buyers maintain integrations forever
```

**LeadConduit's Entity Model:**
```
Vendor gets a LeadConduit account
    ↓
Custom integration attached to their entity
    ↓
All buyers automatically get the integration
```

### Real Example
A major lead vendor requires:
- Proprietary authentication
- Custom field names
- Special validation rules
- Unique error handling

Instead of every buyer coding this:
1. Vendor's account entity has their custom integration
2. Buyers simply select the vendor as a source
3. LeadConduit handles all the complexity
4. Integration updates benefit everyone

This is especially valuable because large vendors often have the market power to dictate technical requirements. LeadConduit flips this into a benefit - their requirements become their integration, available to all.

## Using Entities in Practice

### For Business Relationships

**Partner Company Example:**
```
ABC Insurance Partners
├── Entity Classification: seller + buyer
├── As a Source: Sends you home insurance leads
├── As a Recipient: Receives auto insurance leads
└── Single Identity: Track all interactions
```

### For Technical Services

**Internal Systems Example:**
```
Lead Scoring API
├── Entity Classification: analytics recipient  
├── Purpose: Score lead quality
├── Used in: Multiple flows
└── Benefit: Track all scoring requests
```

### Configuration Reuse

When you use an entity across flows:
- **Shared:** Entity identity, name, capabilities
- **Flow-Specific:** Credentials, field mappings, business rules

This means you can use "Salesforce CRM" in 10 flows, each with different configurations, while maintaining consistent identity.

## Module System

Modules define HOW entities communicate technically. Think of them as pre-built integration capabilities:

| Module Type | Purpose | Example |
|-------------|---------|---------|
| Default | Basic HTTP communication | `leadconduit-default.outbound` |
| Platform | Specific service integration | `leadconduit-salesforce.outbound` |
| Custom | Special formats or protocols | `leadconduit-custom.outbound.xml` |
| Account | LeadConduit-to-LeadConduit | `leadconduit-integration-leadconduit.outbound` |

When configuring a source or recipient, you select which module to use from the entity's available options.

## Best Practices

### Creating Entities

**Do:**
- Use clear, recognizable names
- Choose the most specific classification
- Include company or system name
- Plan for reuse across flows

**Don't:**
- Create duplicate entities
- Use generic names like "CRM"
- Add modules you won't use
- Include "test" in production names

### Managing Relationships

1. **Check for existing entities** before creating custom ones
2. **Use account entities** for B2B partnerships
3. **Document special configurations** in descriptions
4. **Leverage standard entities** when available

### Technical Services

When creating entities for internal services:
- Name them clearly (e.g., "Quality Scoring API")
- Use appropriate classification (`analytics` for scoring)
- Track usage across all flows
- Document the service purpose

## Common Patterns

### Multi-Purpose Partners
```
Partner serves multiple roles:
- Morning: Sends you insurance leads (source)
- Afternoon: Buys your finance leads (recipient)
- Same entity, different flow configurations
```

### Service Consolidation
```
Internal APIs as entities:
- Lead Scoring Service (analytics)
- Address Validation API (enhancement)
- Fraud Detection System (analytics)
- All tracked and managed consistently
```

### Vendor Integration
```
Complex vendor with custom requirements:
- Has LeadConduit account
- Custom integration attached
- All buyers benefit automatically
- No buyer-side development needed
```

## Technical Architecture

### Identity Persistence
- Entities have unique IDs that never change
- References maintained in all historical data
- Updates propagate to active flows
- Deletion prevented when in use

### Capability Declaration
- Module arrays define technical abilities
- Classifications determine business role
- Together they enable proper flow configuration

### Relationship Modeling
- Account entities can form connections
- Connection types: seller, buyer, both
- Enables trusted B2B lead sharing
- Simplifies partner management

## Related Concepts

- **[Flows](flows.md)** - Where entities are configured as sources and recipients
- **[Integrations](integrations.md)** - The modules that entities use to communicate
- **[Mappings](mappings.md)** - How data transforms between entity formats
- **[Events](events.md)** - Track all entity interactions

---

*Entities provide the identity foundation that makes LeadConduit powerful. They turn chaos into order by establishing clear identities, capabilities, and relationships for everyone in your lead ecosystem.*