# LeadConduit Entities 

## Overview

Entities are the foundation of identity in LeadConduit. They represent the "who" in every lead transaction - who sends leads, who receives them, and what systems are involved. Think of entities as the business cards of the LeadConduit ecosystem - they establish identity, capabilities, and relationships.

At their core, entities answer three fundamental questions:
1. **Who is this?** (Identity)
2. **What can they do?** (Capabilities)
3. **How do they relate to me?** (Relationships)

## Why Entities Exist

### The Identity Problem
In lead distribution, you need to track numerous participants:
- Companies selling leads
- Companies buying leads  
- Web forms collecting leads
- CRM systems receiving leads
- Analytics platforms tracking leads
- Enhancement services enriching leads

Without a unified identity system, this becomes chaos. Entities solve this by providing a consistent way to represent any participant in the lead ecosystem.

### The Capability Problem
Different systems have different capabilities:
- A web form can send leads but not receive them
- A CRM can receive leads but typically doesn't send them
- A partner company might both send and receive leads
- Each system supports different integration methods

Entities encode these capabilities through their type classifications and module associations.

### The Relationship Problem
Business relationships in lead distribution are complex:
- You might buy leads from Company A
- You might sell leads to Company B
- Company C might be both a buyer and seller
- Company D might be a subsidiary with special access

Entities model these relationships, especially through the account entity and connection system.

## Core Concepts

### Entity Classification

Every entity has two fundamental classifications that define its role:

**Source Classification** (Can this entity send leads?)
- `seller` - A company that sells leads
- `form` - A web form or landing page
- `other` - Any other type of lead source
- `null` - Cannot send leads

**Recipient Classification** (Can this entity receive leads?)
- `buyer` - A company that purchases leads
- `crm` - Customer Relationship Management system
- `analytics` - Analytics or tracking platform (including internal scoring services)
- `enhancement` - Data enrichment service
- `esp` - Email Service Provider
- `other` - Any other type of recipient
- `null` - Cannot receive leads

An entity can be both a source and recipient. For example, a partner company might be classified as both `source: "seller"` and `recipient: "buyer"`.

**Important Note**: Entities can represent both business relationships AND technical systems. For example, a company might create an entity called "Scoring Service" with `recipient: 'analytics'` to represent their internal scoring API. This allows them to track all requests to that service across multiple flows.

### Entity Types by Management

**Standard Entities**
- Pre-built by LeadConduit
- Represent well-known companies and services
- Available to all accounts
- Cannot be modified by users
- Examples: Major CRMs (Salesforce, HubSpot), known lead buyers, popular form services

**Custom Entities**
- Created by individual accounts
- Represent unique business relationships
- Fully configurable
- Only visible to the creating account
- Examples: Proprietary systems, regional partners, custom integrations

**Account Entities**
- Special entities representing LeadConduit account holders
- Enable account-to-account lead sharing
- Automatically created when an account is created
- Can form connections with other accounts
- Always have both source and recipient capabilities

**Pending Entities**
- Temporary entities created during the invitation process
- Convert to regular entities once invitation is accepted
- Used to pre-configure relationships before partners join

### The Module System

Modules are capability declarations that define HOW an entity can technically communicate. They're references to integration modules (not custom code) that specify the technical details of lead transmission. Think of modules as the "languages" an entity speaks.

**How Modules Work**:
- Each entity has a `module_ids` array listing its capabilities
- When using an entity in a flow, you select which module to use
- The module determines configuration options, data formats, and authentication

**Common Module Patterns**:
```
Default Modules (basic HTTP communication):
- leadconduit-default.inbound
- leadconduit-default.outbound

Platform Integration Modules:
- leadconduit-salesforce.outbound
- leadconduit-hubspot.outbound
- leadconduit-facebook.inbound

Custom Integration Modules (specific formats):
- leadconduit-custom.outbound.json
- leadconduit-custom.outbound.xml
- leadconduit-custom.outbound.soap

Account Modules (LeadConduit-to-LeadConduit):
- leadconduit-integration-leadconduit.outbound.to_buyer
```

The key insight: Modules are pre-built integration capabilities, not custom code. They enable technical communication without requiring programming.

### The Reverse Integration Pattern

One of LeadConduit's most powerful features is how it handles vendor-specific integrations through entities. This flips the traditional integration model on its head.

**Traditional Lead Industry Model:**
- Buyer publishes submission specifications
- Every seller must implement the buyer's API
- Sellers do custom development for each buyer
- Technical burden is on the seller

**LeadConduit's Entity-Based Model:**
- Major vendors have custom integration modules
- These modules are associated with the vendor's entity
- Buyers simply select the vendor's entity as a source
- LeadConduit handles all the technical complexity

**Real-World Example:**
A major lead vendor requires:
- Proprietary authentication scheme
- Custom data format with specific field names
- Special validation rules
- Unique error handling

Instead of every buyer implementing this vendor's requirements:
1. The vendor gets a LeadConduit account (creating an account entity)
2. Their custom integration module is associated with their account entity
3. Any buyer can now receive leads from them by adding that entity as a source
4. The buyer selects the vendor's entity, and LeadConduit automatically uses the correct integration

This approach is particularly valuable because:
- Large vendors often have the market power to dictate technical requirements
- They want to make it easy for buyers to work with them
- Buyers don't need technical resources to integrate with complex vendors
- Integration happens once, benefits everyone

**The Shift to Account Entities:**
LeadConduit is moving away from standard entities in favor of requiring all participants to have accounts. This means:
- Every major vendor will have their own account entity
- Custom integrations are attached to these account entities
- Better accountability and relationship tracking
- More flexibility for vendors to manage their own integration requirements

### Field Suffixes

Field suffixes are a namespacing mechanism that prevents data collision. When multiple entities contribute custom fields, suffixes ensure uniqueness.

Example scenario:
- Entity A adds a field called "score"
- Entity B also wants a field called "score"
- With suffixes: `score.enta` and `score.entb`
- No collision, both can coexist

Rules:
- 3-5 alphanumeric characters
- Lowercase only
- Must be unique across all entities
- Optional but recommended for entities with custom fields

### Connection System

For account entities (representing other LeadConduit accounts), the connection system tracks business relationships:

**Connection Types**
- `seller`: They sell leads to you
- `buyer`: They buy leads from you
- `both`: Bidirectional relationship
- `null`: No active connection

Connections enable:
- Simplified account-to-account lead sharing
- Relationship visibility in the UI
- Access control for lead flow
- Business relationship tracking

## Entity Lifecycle

### Creation
When an entity is created, it establishes:
1. **Identity**: Name, description, logo, website
2. **Classification**: What type of source/recipient
3. **Capabilities**: Which modules it supports
4. **Ownership**: Which account owns it (for custom entities)

### Usage
Entities are used in flows by:
1. **Adding as a source**: Defines where leads come from
2. **Adding as a recipient**: Defines where leads go
3. **Configuring integration**: Using the entity's supported modules
4. **Applying business rules**: Based on the entity relationship

### Updates
When entities are updated:
1. Changes propagate to all flows using the entity
2. Historical data maintains the entity reference
3. Active flows automatically use new entity metadata
4. No disruption to lead processing

### Deprecation
Instead of deletion, entities can be deprecated:
1. Marked with a deprecation flag
2. Can reference a replacement entity
3. Existing usage continues to work
4. New usage is discouraged or prevented

## Special Entity Behaviors

### Enhancement Recipients
Enhancement services (data append, verification, etc.) are special:
- They receive lead data for processing
- They don't consume leads like buyers do
- They're excluded from certain account relationship tracking
- They typically return enriched data back to the flow

### Account Entity Auto-Creation
When a LeadConduit account is created:
1. An entity is automatically created with the same ID
2. It's marked as both source and recipient
3. It gets standard B2B communication modules
4. It represents that account in the entity ecosystem

### Module Inheritance
Entities inherit certain behaviors from their modules:
- Authentication requirements
- Configuration options
- Data format expectations
- Integration-specific features

## Business Implications

### For Lead Buyers
Entities representing buyers:
- Track which companies purchase your leads
- Enable consistent delivery configuration
- Maintain delivery history
- Support buyer-specific customization

More importantly for buyers receiving leads:
- **No custom development needed** for complex vendors
- **Automatic integration** with major lead sources
- **Reduced technical burden** - just select the vendor's entity
- **Faster onboarding** with new lead sources
- **Consistent experience** across all vendors

### For Lead Sellers  
Entities representing sellers:
- Identify lead sources clearly
- Enable source-specific validation
- Track source quality metrics
- Support seller-specific pricing

For major vendors with custom requirements:
- **Control their integration** specifications
- **Implement once** for all buyers on LeadConduit
- **Reduce buyer friction** by eliminating technical barriers
- **Maintain standards** while being easy to work with
- **Scale distribution** without buyer-by-buyer integrations

### For Integrations
Entities representing systems:
- Standardize integration configuration
- Enable reuse across flows
- Maintain consistent behavior
- Simplify credential management

**Key distinction**: While entities enable configuration reuse across flows, each flow must still be independently configured to connect to the service. The entity provides:
- **Identity tracking** - Know which flows use the service
- **Usage analytics** - Track requests across all flows
- **Consistent naming** - Same entity name in all flows
- **Classification** - Properly categorize the service type

For example, a "Scoring Service" entity:
- Represents your internal lead scoring API
- Used in multiple flows for consistency
- Each flow independently configures the API endpoint and credentials
- Allows tracking all scoring requests across your account

The reverse integration pattern means:
- **Vendors define requirements** instead of conforming to each buyer
- **LeadConduit implements** the vendor's specifications
- **Buyers benefit** without doing any integration work
- **Market power** translates to technical convenience

### For Partner Relationships
Account entities enable:
- Direct account-to-account lead sharing
- Trusted business relationships
- Simplified technical integration
- Relationship visibility
- Custom integration attachment

## Common Patterns

### Multi-Role Entities
Many entities serve multiple roles:
```
Partner Company ABC
├── As a seller: Sends leads to you
├── As a buyer: Receives leads from you
└── As an account: Has their own LeadConduit instance
```

### Technical Service Entities
Entities often represent internal technical services:
```
Internal Services
├── Scoring Service (analytics recipient)
├── Data Validation API (enhancement recipient)
├── Lead Router (other recipient)
└── Internal CRM (crm recipient)
```

Each service entity:
- Has consistent naming across flows
- Enables tracking of all requests
- Requires independent configuration per flow
- Groups related technical integrations

### Integration Patterns
Entities often follow integration patterns:
```
CRM Integration Pattern:
├── Standard CRM Entity (e.g., Salesforce)
├── Multiple flows use the same entity
├── Each flow configures differently
└── All share core CRM capabilities
```

## Best Practices

### Naming Conventions
- Use clear, recognizable names
- Include company/system name
- Avoid generic names like "CRM" or "Buyer"
- Consider future growth (avoid "Test" or "Temp")

### Classification Selection
- Choose the most specific type available
- Use "other" only when no specific type fits
- Consider primary business relationship
- Don't force-fit wrong classifications

### Module Selection
- Only include actually supported modules
- Don't add modules "just in case"
- Consider authentication requirements
- Match modules to business needs

### Relationship Management
- Use standard entities when available
- Create custom entities for unique relationships
- Leverage account entities for B2B partnerships
- Document special configurations in description

## Common Misconceptions

### "Entities are just labels"
Reality: Entities carry configuration, capabilities, and relationship data. They're active participants in lead flow, not passive labels.

### "I need a new entity for each flow"
Reality: Entities should be reused across flows. Create once, use many times.

### "Standard entities can't be customized"
Reality: While you can't change standard entities, you can configure their usage differently in each flow.

### "Account entities are complicated"
Reality: Account entities simplify B2B relationships by handling the complex authentication and routing automatically.

## Key Takeaways

1. **Entities are Identity**: They establish who participates in lead transactions
2. **Classification Drives Behavior**: Source and recipient types determine capabilities
3. **Modules Define Integration**: The technical "how" of lead movement
4. **Reverse Integration is Powerful**: Vendors define specs, LeadConduit implements, buyers benefit automatically
5. **Account Entities are the Future**: Moving away from standard entities to account-based participation
6. **Relationships Matter**: Especially for account-to-account lead sharing
7. **Reuse is Key**: Create entities once, use across multiple flows
8. **Custom Integrations Attach to Entities**: Major vendors get their own integration modules
9. **Dual Purpose**: Entities can represent both business relationships AND technical services
10. **Buyer Friction Eliminated**: Complex vendor integrations become simple entity selections