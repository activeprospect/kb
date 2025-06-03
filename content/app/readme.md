# LeadConduit Models Documentation

## Overview

This directory contains conceptual model documentation for LeadConduit's core components. These documents explain **what** each concept is, **why** it exists, and **how** it works from a business and operational perspective. They are written for users, not developers, focusing on practical understanding rather than technical implementation.

Each document follows a consistent pattern: explaining the problem the concept solves, breaking down how it works, showing real-world examples, and providing actionable guidance. Together, they form a complete picture of how LeadConduit processes leads from submission to delivery.

## Document Purpose

These models serve as:
- **Conceptual Reference**: Understanding what each component does and why
- **Relationship Guide**: How different concepts work together
- **Decision Framework**: When and how to use each feature
- **Troubleshooting Resource**: Common issues and solutions
- **Best Practices**: Proven patterns and recommendations

## The LeadConduit Taxonomy

### Data Foundation Layer

**Types** (`types.md`)
- **Role**: Data standardization and validation engine
- **Function**: Transforms messy input into clean, structured data
- **Key Insight**: Types parse and validate without blocking - they provide information, not gates
- **Example**: Phone "(555) 123-4567" → `{number: "5551234567", valid: true, area: "555"}`

**Fields** (`fields.json`)
- **Role**: Data model definition
- **Function**: Defines what data can be collected and how it's typed
- **Key Insight**: Standard fields ensure consistency across all leads
- **Example**: email, phone, state are standard; loan_amount is custom

**Templates** (`templates.md`)
- **Role**: Data access and transformation layer
- **Function**: Enables dynamic access to data values and their transformation
- **Key Insight**: Three modes - literal (static text), simple (preserves data types), and Handlebars (returns strings)
- **Example**: `{{email}}` preserves object, `{{phone.area}}` accesses components, `Hello {{name}}` formats strings

### Business Logic Layer

**Rules** (`rules.md`)
- **Role**: Universal decision engine used throughout LeadConduit
- **Function**: Evaluates conditions to make decisions at every level
- **Used In**:
  - Acceptance Criteria (source and flow level) - which leads to accept
  - Filter Steps - routing and flow control
  - Volume Caps - which leads count toward limits
  - Pricing Rules - conditional pricing tiers
  - Mappings - when to apply transformations
  - Enhancement Steps - when to call services
- **Key Insight**: Same rule engine everywhere, but pricing uses "last match wins"
- **Example**: "state equals CA AND phone.valid is true"

**Pricing** (`pricing.md`)
- **Role**: Financial control for costs and revenue
- **Function**: Calculates purchase price (cost) and sale price (revenue)
- **Used In**:
  - Source level - vendor-specific purchase pricing
  - Flow level - default purchase pricing
  - Recipient steps - buyer-specific sale pricing
- **Key Insight**: Four-layer precedence system with special "last match wins" rules
- **Example**: Base $10, Premium leads $20, California premium $25

**Volume Caps** (part of flows.md)
- **Role**: Inventory and spend control
- **Function**: Limits lead flow based on counts and rules
- **Used In**:
  - Source level - vendor-specific limits
  - Flow level - overall limits
  - Nested caps - hierarchical limits
- **Key Insight**: Rule-based caps allow conditional limits (e.g., state-specific caps)
- **Example**: 100 leads/day total, 50/day from California

**Mappings** (`mappings.md`)
- **Role**: Data transformation orchestrator
- **Function**: Reshapes data between systems
- **Used In**:
  - Source configuration - normalize vendor data on arrival
  - Recipient/Destination steps - format data for delivery
  - Enhancement responses - integrate appended data
- **Key Insight**: Combines property (where), value from templates (what), and rules (when)
- **Example**: Map vendor's "phone_1" to standard "phone" field

### Identity Layer

**Entities** (`entities.md`)
- **Role**: Identity provider for all actors
- **Function**: Represents companies, services, and systems in the LeadConduit ecosystem
- **Key Insight**: Entities define WHO, modules define HOW they communicate
- **Example**: "Acme Insurance" entity with webhook and email modules

**Integrations** (`integrations.md`)
- **Role**: Technical connection enabler
- **Function**: Handles the actual communication between LeadConduit and external systems
- **Key Insight**: Packages contain modules that implement specific integration patterns
- **Example**: Salesforce package with create_lead and update_lead modules

### Orchestration Layer

**Flows** (`flows.md`)
- **Role**: The conductor that orchestrates everything
- **Function**: Defines how leads move through the system from arrival to delivery
- **Key Insight**: Flows embody your entire lead processing business logic without code
- **Example**: Multi-buyer flow with quality gates and routing logic

**Flow Components**:

**Sources** (entry points)
- Where leads enter the flow
- Each has unique credentials and configuration
- Can have source-specific mappings, pricing, caps, and criteria

**Pre-Processing Gates** (business control layer)
- **Acceptance Criteria**: Rules that determine if lead should be processed
- **Suppression Lists**: Check for duplicates, DNC, existing customers
- **Purchasing Decisions**: TrustedForm and other validation services
- Applied before any steps execute

**Flow Steps** (sequential processing)
- **Filter Steps**: Make routing decisions using rules
  - Can continue, skip to specific step, or stop flow
  - Control flow logic without code
- **Enhancement Steps**: Call external services to append data
  - Add demographics, validate phone/email, score quality
  - Data available in `appended` namespace for subsequent steps
- **Recipient Steps**: Internal notifications and processing
  - Email alerts, webhooks, logging
  - Generate recipient events for all outbound requests
- **Destination Steps**: Deliver leads to buyers
  - Apply outbound mappings
  - Track delivery success/failure
  - Generate revenue on successful delivery

### Analytics & Data Access Layer

**Events** (`events.md`)
- **Role**: Complete audit trail and analytics foundation
- **Function**: Records snapshots of every significant action during processing
- **Key Insight**: Events tell the complete story of each lead's journey
- **Example**: Source events summarize the journey, recipient events record each delivery

**Reporting** (`reporting.md`)
- **Role**: Business intelligence engine
- **Function**: Transforms events into aggregated insights and metrics
- **Components**:
  - Columns: Metrics to calculate (counts, revenue, ratios)
  - Rules: Filter which events to analyze
  - Group By: Segment data by any dimension
  - Time Range: Period to analyze
- **Key Insight**: Reports answer business questions with aggregated data
- **Example**: Vendor performance scorecard with acceptance rates and ROI

**Exports** (`exports.md`)
- **Role**: Bulk data extraction tool
- **Function**: Provides row-level access to leads and events for external analysis
- **Components**:
  - Time Range: Export window
  - Filter Rules: Which records to include
  - Fields: Specific data to export
  - Recipients: Where to deliver
- **Key Insight**: Exports complement reports with detailed data access
- **Example**: Monthly reconciliation with complete transaction details

## How They Work Together in Lead Processing

### 1. Lead Arrival
- **Entity** (source) submits data
- **Integration** (inbound module) receives it
- **Fields** define expected data structure

### 2. Data Normalization
- **Mappings** rename vendor fields to standard names
- **Types** parse and validate each field
- **Templates** may transform values

### 3. Pre-Processing Business Logic
- **Rules** in acceptance criteria determine if lead qualifies (source and flow level)
- **Pricing** calculates purchase cost using its rule layers (source service → source rules → flow service → flow rules)
- **Volume Caps** check limits using rules to determine which leads count
- **Templates** provide dynamic values for all rule evaluations

### 4. Lead Processing
- **Flow** orchestrates the journey through configured steps
- **Rules** in filters control routing
- **Integrations** call external services for enhancement
- **Mappings** transform data for each destination

### 5. Lead Delivery
- **Entities** (destinations) receive the lead
- **Integrations** (outbound modules) handle delivery
- **Mappings** reshape data to match requirements
- **Pricing** records the revenue

### 6. Visibility & Analytics
- **Events** capture every action with full data snapshots
- **Reporting** transforms events into business intelligence
- **Exports** provide detailed data for external analysis
- Together enable troubleshooting, vendor management, and compliance

## Key Relationships

### Data Foundation Relationships

**Types ↔ Fields**
Fields reference types to define how data is parsed and validated. Every field has a type that determines its behavior.

**Types ↔ Templates**
Templates access the parsed data that types create. Simple variable mode preserves the typed data, enabling type-aware operations.

### Business Logic Dependencies

**Rules → Templates**
Rules depend on templates for dynamic value access. Templates provide the data that rules evaluate.

**Rules Usage Pattern**
The rule engine is used throughout LeadConduit:
- **Acceptance Criteria**: Rules gateway at source and flow level
- **Volume Caps**: Rules determine which leads count toward limits  
- **Pricing**: Rules with "last match wins" for tier selection
- **Filter Steps**: Rules control flow routing and termination
- **Mappings**: Rules control when transformations apply

**Pricing Dependencies**
- Uses rules for conditional tiers
- Applied at source level (purchase) and recipient level (sale)
- Four-layer precedence: source service → source rules → flow service → flow rules

**Mappings → Templates + Rules**
Mappings orchestrate both:
- Templates provide the values to map
- Rules determine when mappings apply
- Used at source (inbound) and recipient/destination (outbound)

### Orchestration Relationships

**Flow Steps Dependencies**
- **Filter Steps** → Rules determine routing logic
- **Enhancement Steps** → Integrations to call services, populate appended namespace
- **Recipient Steps** → Integrations for internal delivery, Mappings for data format
- **Destination Steps** → Entities define who, Integrations define how, Mappings transform data

**Entities ↔ Integrations**
Entities declare which integration modules they support. The integration modules define the technical implementation.

### Analytics Relationships

**Events → Reporting → Exports**
- Events are the raw data source
- Reporting aggregates events into metrics
- Exports extract event details for external use

**Reporting + Exports Synergy**
- Use Reporting for quick insights and trends
- Use Exports for deep analysis and reconciliation
- Both draw from the same event data

### Flows ↔ Everything
Flows are the orchestration layer that brings all concepts together:
- Use entities for sources and destinations
- Apply types through field definitions
- Evaluate rules for decisions
- Use templates for dynamic behavior
- Apply mappings for data transformation
- Generate events for visibility

## Reading Guide

For understanding lead processing:
1. Start with **flows.md** - the big picture
2. Read **types.md** - understand data standardization
3. Study **rules.md** - learn decision logic
4. Review **entities.md** and **integrations.md** - understand connections
5. Examine **events.md** - see how to troubleshoot

For building flows:
1. **entities.md** - who you're working with
2. **fields.json** - what data you need
3. **mappings.md** - how to transform data
4. **rules.md** - how to make decisions
5. **pricing.md** - how to manage costs/revenue

For troubleshooting:
1. **events.md** - find what happened
2. **types.md** - understand data parsing
3. **rules.md** - debug decision logic
4. **flows.md** - trace the journey

For analytics and reporting:
1. **events.md** - understand the data source
2. **reporting.md** - create business insights
3. **exports.md** - extract detailed data
4. **pricing.md** - analyze costs and revenue

## Important Concepts

### Data Availability Timeline
- Raw data arrives without prefixes
- After parsing: standard fields get `lead.` prefix
- Custom fields never have prefixes
- Appended data gets namespace of the service
- TrustedForm Decisions only available in pre-processing

### Outcome Types
- `success` - Business logic passed
- `failure` - Business logic failed (fixable)
- `error` - Technical problem (retry might work)

### Special Behaviors
- Pricing rules use "last match wins" (different from other rules)
- Types validate but don't block (set `valid` flag)
- Templates have three modes based on content
- Events capture complete snapshots, not just changes

## File Descriptions

- **entities.md** - Identity and business relationships in LeadConduit
- **events.md** - Audit trail and lead journey visibility
- **exports.md** - Bulk data extraction for external analysis
- **fields.json** - Standard field definitions with types
- **flows.md** - Complete lead processing orchestration
- **integrations.md** - Technical connections to external systems
- **mappings.md** - Data transformation between systems
- **pricing.md** - Cost and revenue management
- **reporting.md** - Business intelligence and analytics
- **rules.md** - Decision logic throughout the system
- **templates.md** - Dynamic values and transformations
- **types.md** - Data parsing and normalization

Each document is self-contained but cross-references related concepts. Together, they provide a complete conceptual model of LeadConduit's lead processing capabilities.