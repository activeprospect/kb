# LeadConduit Concept Normalization Guide

## Purpose

This guide establishes a framework for normalizing concepts across all LeadConduit content to align with the source of truth definitions in `content/app/`. When creating or updating documentation, use this guide to ensure consistent terminology and conceptual accuracy.

## Core Principle: App Models as Source of Truth

The `content/app/` directory contains the canonical definitions of all LeadConduit concepts. These models define:
- What each concept is
- How it functions in the system
- Its relationships to other concepts
- Its role in lead processing

**All content must align with these definitions.**

## Primary Concept Mapping

### Data Foundation Concepts

#### Types (`app/types.md`)
**Canonical Definition:** Data standardization and validation engine that transforms messy input into clean, structured data.

**Normalize these terms to "Types":**
- Data validation → Types (when referring to the parsing/validation system)
- Field validation → Types
- Data normalization → Types
- Format standardization → Types
- Input parsing → Types

**Key Distinctions:**
- Types validate but don't block (they set valid flags)
- Types are about data structure, not business logic
- Types produce parsed components (e.g., phone.area, email.domain)

#### Fields (`app/fields.json`)
**Canonical Definition:** Data model definition that defines what data can be collected and how it's typed.

**Normalize these terms to "Fields":**
- Data points → Fields
- Lead attributes → Fields  
- Lead properties → Fields
- Data elements → Fields
- Form fields → Fields (when referring to LeadConduit fields)

**Key Distinctions:**
- Standard fields (built-in) vs Custom fields (user-defined)
- Fields have types that determine their parsing behavior
- Fields get prefixed after parsing (lead.email, appended.demographic_score)

#### Templates (`app/templates.md`)
**Canonical Definition:** Data access and transformation layer enabling dynamic access to values.

**Normalize these terms to "Templates":**
- Variable substitution → Templates
- Dynamic values → Templates
- Merge tags → Templates
- Placeholders → Templates (when dynamic)
- Value interpolation → Templates

**Key Distinctions:**
- Three modes: literal (static), simple (preserves types), Handlebars (returns strings)
- Templates enable dynamic behavior throughout LeadConduit
- Used in mappings, rules, delivery configurations

### Business Logic Concepts

#### Rules (`app/rules.md`)
**Canonical Definition:** Universal decision engine used throughout LeadConduit for evaluating conditions.

**Normalize these terms to "Rules":**
- Conditions → Rules (when referring to logic evaluation)
- Criteria → Rules (when referring to the logic itself)
- Business logic → Rules
- Decision logic → Rules
- Conditional logic → Rules
- Filter criteria → Rules

**Usage Contexts (always "Rules"):**
- Acceptance Criteria uses Rules
- Volume Caps use Rules  
- Pricing uses Rules (with "last match wins")
- Filter Steps use Rules
- Mappings can use Rules

**Key Distinctions:**
- Rules are the engine, not the feature
- Same rule system everywhere
- Rules evaluate to true/false

#### Pricing (`app/pricing.md`)
**Canonical Definition:** Financial control system for costs (purchase) and revenue (sale).

**Normalize these terms to "Pricing":**
- Cost management → Pricing (purchase side)
- Revenue management → Pricing (sale side)
- Lead costs → Pricing
- Financial rules → Pricing rules
- Billing configuration → Pricing

**Key Distinctions:**
- Four-layer precedence system
- "Last match wins" for rule evaluation (unique to pricing)
- Purchase price (source) vs Sale price (recipient)

#### Mappings (`app/mappings.md`)
**Canonical Definition:** Data transformation orchestrator that reshapes data between systems.

**Normalize these terms to "Mappings":**
- Field transformation → Mappings
- Data transformation → Mappings
- Field assignment → Mappings
- Value assignment → Mappings
- Data reshaping → Mappings
- Field mapping → Mappings

**Usage Contexts:**
- Source Mappings (inbound normalization)
- Recipient/Destination Mappings (outbound formatting)
- Enhancement Response Mappings (appended data integration)

### Identity Concepts

#### Entities (`app/entities.md`)
**Canonical Definition:** Identity provider representing companies, services, and systems that participate in lead transactions.

**⚠️ CRITICAL UNDERSTANDING:** 
- Entities are the underlying identity system (WHO)
- Sources/Recipients are how entities appear in flows (ROLES)
- Partners are entities with business relationships
- The same entity can be both a source AND recipient

**Entity Taxonomy:**

1. **By Classification:**
   - **Source Types:** seller, form, other, null
   - **Recipient Types:** buyer, crm, analytics, enhancement, esp, other, null
   - Many entities have BOTH classifications (e.g., seller + buyer)

2. **By Management:**
   - **Standard Entities:** Pre-built, available to all
   - **Custom Entities:** User-created, account-specific
   - **Account Entities:** Other LeadConduit accounts
   - **Pending Entities:** Temporary during invitations

**For user-facing content:**
- Use "Source" when configuring where leads come FROM
- Use "Recipient" when configuring where leads go TO
- Use "Partner" for business relationships (especially account entities)
- Use "Entity" only when explaining the identity system itself

**Key Examples:**
- "ABC Marketing" (entity) can be:
  - A Source (when sending you leads)
  - A Recipient (when receiving your leads)
  - A Partner (the business relationship)
- "Internal Scoring API" (entity) is:
  - A Recipient (analytics type)
  - Used across multiple flows
  - Represents a technical service, not a company

**When to mention entities:**
- Advanced configuration guides
- Partner relationship explanations
- Integration architecture discussions
- Never in basic "how to" content

#### Integrations (`app/integrations.md`)
**Canonical Definition:** Technical connection enabler handling communication between systems.

**Normalize these terms to "Integrations":**
- Connectors → Integrations
- API connections → Integrations
- System connections → Integrations
- Third-party connections → Integrations
- External services → Integrations (when referring to the connection)

**Key Structure:**
- **Integration Package** = The overall integration (e.g., "Salesforce Integration")
- **Module** = Specific action within that integration (e.g., "Create Lead", "Update Contact")
- **Module ID** = Unique identifier for each action (e.g., `salesforce.create_lead`)

**Examples:**
- Salesforce Integration (package) contains:
  - Create Lead module (`salesforce.create_lead`)
  - Create Contact module (`salesforce.create_contact`)
  - Update Lead module (`salesforce.update_lead`)
- Email Integration (package) contains:
  - Send Email module (`email.send`)
  - Send Alert module (`email.alert`)

**In user-facing content:**
- "Select the Salesforce integration and choose 'Create Lead' as the action"
- "Configure the Email integration to send alerts"
- NOT: "Configure the salesforce.create_lead module"

**Module IDs in documentation:**
- Only show module IDs in technical/API documentation
- In UI documentation, refer to the action names users see
- Entities store arrays of module IDs they support, but users select by action name

### Orchestration Concepts

#### Flows (`app/flows.md`)
**Canonical Definition:** The conductor that orchestrates lead processing from arrival to delivery.

**Normalize these terms to "Flows":**
- Workflow → Flow (always)
- Pipeline → Flow
- Lead process → Flow
- Processing pipeline → Flow
- Lead workflow → Flow

**Key Components:**
- Sources (entry points with configurations)
- Pre-Processing Gates (acceptance, suppression, purchasing decisions)
- Flow Steps (filters, enhancements, recipients, destinations)

### Analytics Concepts

#### Events (`app/events.md`)
**Canonical Definition:** Complete audit trail recording snapshots of every significant action.

**Normalize these terms to "Events":**
- Lead history → Events
- Audit trail → Events
- Processing history → Events
- Lead activity → Events
- Transaction records → Events (but avoid "transaction")

**Key Event Types:**
- Source Events (summarize journey)
- Recipient Events (each delivery attempt)
- Filter Events (routing decisions)

#### Reporting (`app/reporting.md`)
**Canonical Definition:** Business intelligence engine transforming events into insights.

**Normalize these terms to "Reporting":**
- Analytics → Reporting (for aggregated data)
- Business intelligence → Reporting
- Performance metrics → Reporting
- Lead analytics → Reporting
- Dashboard metrics → Reporting

#### Exports (`app/exports.md`)
**Canonical Definition:** Bulk data extraction tool for row-level data access.

**Normalize these terms to "Exports":**
- Data extraction → Exports
- Bulk download → Exports
- Data dump → Exports (avoid this term)
- Lead extraction → Exports
- Report download → Exports (when row-level)

## Secondary Concept Normalization

### Source and Recipient Roles

**User-Facing Understanding:** Sources and Recipients are configurations in flows that represent how entities participate. Each has a reusable identity that can be used across multiple flows.

**Key Concept - Reusable Identity:**
- Each source/recipient has a unique identity that persists across your account
- The same "Salesforce CRM" recipient can be used in all your flows
- The same "Facebook Lead Ads" source can feed multiple flows
- Changes to a source/recipient (like credentials) apply everywhere it's used
- This reusability enables consistent configuration and centralized management

**When to use Source:**
- A configuration that sends leads INTO LeadConduit
- The "from" in lead flow
- Has its own identity, credentials, and settings
- Can be reused across multiple flows
- Examples: "Facebook Lead Ads", "Partner API", "Web Form"

**When to use Recipient:**
- A configuration that receives leads FROM LeadConduit  
- The "to" in lead flow
- Has its own identity and configuration
- Can receive leads from multiple flows
- Examples: "Salesforce CRM", "Email Alert", "Buyer Webhook"

**When to use Partner:**
- Discussing business relationships
- Account-to-account connections
- When the same identity functions as both source AND recipient
- Example: "Our partner ABC Corp sends us insurance leads and receives auto leads"

**The Partner Concept:**
- Partners are entities with established business relationships
- They often have both source and recipient capabilities
- The same partner identity can be a source in one flow and recipient in another
- In UI: "Connect with Partners" or "Partner Management"
- Emphasizes the business relationship over technical roles

**Never use:**
- Destination (LeadsBridge terminology)
- Client (ambiguous)
- Vendor (use Source or Partner)
- Entity (except in advanced docs explaining the architecture)

**Example Usage:**
- Basic: "Add Facebook as a source to receive leads"
- Intermediate: "Configure your partner ABC Corp as both a source and recipient"
- Advanced only: "The ABC Corp entity can act as both source and recipient in your flows"

### Step Types

**Normalize step references:**
- Filtering step → Filter Step
- Enhancement service → Enhancement Step
- Delivery step → Recipient or Destination Step
- Integration step → Enhancement, Recipient, or Destination Step (be specific)

### Status Terms

**Always use exactly:**
- Success (not "successful" or "passed")
- Failure (not "failed" or "rejected") 
- Error (not "errored" or "system error")
- Skip (not "skipped" or "bypassed")

### Data Namespaces

**Use precise namespace references:**
- `lead.` prefix for standard parsed fields
- No prefix for custom fields
- `appended.` prefix for enhancement data
- Service-specific prefixes for enhancement data (e.g., `trustedform.`)

## Tagging Alignment

When applying tags from `content/tags.md`, ensure they align with normalized concepts:

### Model-Specific Tags
Use the `-focused` tags when the content primarily explains the model itself:
- `types-focused` → Content about how Types work
- `fields-focused` → Content about field definitions
- `rules-focused` → Content about rule evaluation
- `mappings-focused` → Content about mapping configuration

### Feature Area Tags
Use feature tags when discussing where concepts are applied:
- `flows` → Flow orchestration topics
- `data-management` → Types, Fields, Templates usage
- `business-logic` → Rules, Pricing, Caps usage
- `integrations` → Entities and Integrations usage
- `analytics` → Events, Reporting, Exports usage

## Entity, Integration, and Module Relationships

### The Architecture (for content creators)
1. **Entities** declare which module IDs they support (identity + capabilities)
2. **Integration Packages** group related modules (e.g., all Salesforce actions)
3. **Modules** are specific actions with unique IDs (e.g., `salesforce.create_lead`)
4. **Users** see this as selecting an integration and choosing an action

### How to Write About It

**Basic user content:**
- "Add Salesforce as a recipient and select 'Create Lead' as the action"
- "Configure the integration to update existing contacts"
- Focus on what users see: integration names and action descriptions

**Intermediate content:**
- "The Salesforce integration offers multiple actions including creating leads, updating contacts, and checking for duplicates"
- "Each action has different configuration options"
- Explain capabilities without technical IDs

**Advanced/API content only:**
- "The entity supports these modules: `salesforce.create_lead`, `salesforce.update_contact`"
- "Configure the module ID in your API request"
- Only when users need the actual technical identifiers

### Common Patterns

**Enhancement Integrations:**
- "Select TrueCallerID as an enhancement to verify phone numbers"
- The integration (TrueCallerID) has one main action (verify)
- Don't mention module IDs unless documenting the API

**CRM Integrations:**
- "Choose Salesforce as your recipient and select whether to create new leads or update existing records"
- Multiple actions (modules) within one integration package
- Users pick by action name, not module ID

**Multi-directional Partners:**
- "ABC Corp can send you leads (as a source) and receive leads (as a recipient)"
- Same entity, different modules for inbound vs outbound
- Focus on the business relationship, not the technical modules

## Partner vs Source vs Recipient Usage Guide

### Basic User Tasks
**Setting up lead collection:**
- "Add a new source to receive leads from your web form"
- "Configure Facebook Lead Ads as a source"
- NOT: "Add a new entity" or "Configure a partner"

**Setting up lead delivery:**
- "Add Salesforce as a recipient for your qualified leads"
- "Configure email notifications using the Email recipient"
- NOT: "Add Salesforce entity" or "Set up a partner"

### Business Relationships
**Discussing two-way relationships:**
- "Connect with ABC Insurance as a partner - they'll send you home insurance leads while you send them auto insurance leads"
- "Your partners can act as both sources (sending you leads) and recipients (receiving leads from you)"
- NOT: "Configure the ABC Insurance entity in both directions"

**Partner onboarding:**
- "Invite partners to connect with your LeadConduit account"
- "Manage your partner relationships in the Connections area"
- NOT: "Create entities for your business relationships"

### Advanced Configurations
**Only when explaining architecture:**
- "Behind the scenes, each partner is represented by an entity that can fulfill multiple roles"
- "The entity system allows the same business (like ABC Corp) to be configured as both a source and recipient"
- Reserve entity discussion for technical deep-dives

## Common Misconceptions to Correct

### "Validation" Ambiguity
- Type validation → Parsing and format checking (doesn't block)
- Acceptance criteria → Business rule validation (does block)
- Always clarify which type of validation

### "Criteria" Confusion
- Acceptance Criteria → A feature using Rules
- Filter criteria → Rules in a Filter Step
- The criteria → Rules (the actual logic)

### "Integration" Overuse
- Integration package → The software component
- Integration (verb) → Use "connect" or "integrate with"
- Third-party integration → Be specific about Enhancement vs Delivery

### "Entity" Exposure
- Never use "Entity" in basic user documentation
- Use "Source" or "Recipient" based on context
- Reserve "Entity" for advanced technical guides only
- When explaining relationships, focus on Sources and Recipients as primary concepts

### "Real-time" Precision
- Real-time processing → Synchronous flow execution
- Real-time delivery → Immediate forwarding (sub-second)
- Real-time feedback → Synchronous response to source

## Validation Checklist

Before publishing content, verify:

1. **Flow terminology:** No "workflow" or "pipeline"
2. **Source/Recipient focus:** These are the user-facing concepts (not Entities)
3. **Rule consistency:** Rules as the engine, not "criteria" or "conditions"
4. **Type understanding:** Validation without blocking
5. **Event accuracy:** Snapshots of journey points
6. **Mapping precision:** Transformation, not just "configuration"
7. **Entity avoidance:** Only use in advanced technical documentation

## Quick Reference

| If you're writing about... | Use this concept... | From this model... |
|---------------------------|--------------------|--------------------|
| How data gets cleaned | Types | types.md |
| What data is collected | Fields | fields.json |
| Dynamic values | Templates | templates.md |
| Decision logic | Rules | rules.md |
| Cost/revenue | Pricing | pricing.md |
| Data transformation | Mappings | mappings.md |
| Who sends leads | Sources | entities.md* |
| Who receives leads | Recipients | entities.md* |
| How to connect | Integrations | integrations.md |
| The overall process | Flows | flows.md |
| What happened | Events | events.md |
| Aggregated insights | Reporting | reporting.md |
| Detailed data access | Exports | exports.md |

*Note: While Sources and Recipients are architecturally defined in entities.md, treat them as primary user-facing concepts in documentation.

## Remember

- The `content/app/` models are the single source of truth
- When in doubt, check the model definition
- Consistency builds user confidence
- Clear concepts reduce support burden
- Precise terminology enables precise thinking

Use this guide alongside `tone.md` for voice and style, ensuring both conceptual accuracy and delightful delivery.