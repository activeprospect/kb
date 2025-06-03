# Concepts 

Understanding how LeadConduit's concepts work together is crucial for effective platform usage. This guide maps the relationships between all twelve core concepts.

## Conceptual Layers

LeadConduit's architecture consists of four primary layers, each building on the previous:

### 1. Data Foundation Layer
These concepts handle how data enters, gets validated, and becomes accessible:
- **[Fields](fields.md)** - Define what data can be collected
- **[Types](types.md)** - Parse and validate that data
- **[Templates](templates.md)** - Make data dynamically accessible

### 2. Business Logic Layer
These concepts control decision-making and data transformation:
- **[Rules](rules.md)** - Universal decision engine
- **[Pricing](pricing.md)** - Financial calculations
- **[Mappings](mappings.md)** - Data transformation

### 3. Identity & Integration Layer
These concepts manage who participates and how they connect:
- **[Entities](entities.md)** - Identity system
- **[Integrations](integrations.md)** - Technical connections
- **[Flows](flows.md)** - Orchestration engine

### 4. Analytics & Data Access Layer
These concepts provide visibility and analysis:
- **[Events](events.md)** - Complete audit trail
- **[Reporting](reporting.md)** - Business intelligence
- **[Exports](exports.md)** - Bulk data access

## Key Relationships

### Fields ↔ Types
[Fields](fields.md) reference [types](types.md) to define how data is parsed and validated. Every field has a type that determines its behavior.

### Types ↔ Templates
[Templates](templates.md) access the parsed data that [types](types.md) create. Simple variable mode preserves the typed data, enabling type-aware operations.

### Rules → Templates
[Rules](rules.md) depend on [templates](templates.md) for dynamic value access. Templates provide the data that rules evaluate.

### Rules Usage Pattern
The [rule](rules.md) engine is used throughout LeadConduit:
- **Acceptance Criteria**: Rules gateway at source and flow level
- **Volume Caps**: Rules determine which leads count toward limits  
- **Pricing**: Rules with "last match wins" for tier selection
- **Filter Steps**: Rules control flow routing and termination
- **Mappings**: Rules control when transformations apply

### Pricing Dependencies
[Pricing](pricing.md) uses [rules](rules.md) for conditional tiers and is applied at:
- Source level (purchase price)
- Recipient level (sale price)
- Four-layer precedence: source service → source rules → flow service → flow rules

### Mappings → Templates + Rules
[Mappings](mappings.md) orchestrate both:
- [Templates](templates.md) provide the values to map
- [Rules](rules.md) determine when mappings apply
- Used at source (inbound) and recipient/destination (outbound)

### Flow Steps Dependencies
Within [flows](flows.md), different step types have specific dependencies:
- **Filter Steps** → [Rules](rules.md) determine routing logic
- **Enhancement Steps** → [Integrations](integrations.md) to call services
- **Recipient Steps** → [Integrations](integrations.md) for delivery, [Mappings](mappings.md) for format
- **Destination Steps** → [Entities](entities.md) define who, [Integrations](integrations.md) define how

### Entities ↔ Integrations
[Entities](entities.md) declare which [integration](integrations.md) modules they support. The integration modules define the technical implementation.

### Events → Reporting → Exports
- [Events](events.md) are the raw data source
- [Reporting](reporting.md) aggregates events into metrics
- [Exports](exports.md) extract event details for external use

### Flows ↔ Everything
[Flows](flows.md) are the orchestration layer that brings all concepts together:
- Use [entities](entities.md) for sources and destinations
- Apply [types](types.md) through [field](fields.md) definitions
- Evaluate [rules](rules.md) for decisions
- Use [templates](templates.md) for dynamic behavior
- Apply [mappings](mappings.md) for data transformation
- Generate [events](events.md) for visibility

## Data Flow Through Concepts

### 1. Lead Arrival
- [Entity](entities.md) (source) submits data
- [Integration](integrations.md) (inbound module) receives it
- [Fields](fields.md) define expected data structure

### 2. Data Normalization
- [Mappings](mappings.md) rename vendor fields to standard names
- [Types](types.md) parse and validate each field
- [Templates](templates.md) may transform values

### 3. Pre-Processing Business Logic
- [Rules](rules.md) in acceptance criteria determine if lead qualifies
- [Pricing](pricing.md) calculates purchase cost using rule layers
- Volume Caps check limits using [rules](rules.md)
- [Templates](templates.md) provide dynamic values for all evaluations

### 4. Lead Processing
- [Flow](flows.md) orchestrates the journey through configured steps
- [Rules](rules.md) in filters control routing
- [Integrations](integrations.md) call external services for enhancement
- [Mappings](mappings.md) transform data for each destination

### 5. Lead Delivery
- [Entities](entities.md) (destinations) receive the lead
- [Integrations](integrations.md) (outbound modules) handle delivery
- [Mappings](mappings.md) reshape data to match requirements
- [Pricing](pricing.md) records the revenue

### 6. Visibility & Analytics
- [Events](events.md) capture every action with full data snapshots
- [Reporting](reporting.md) transforms events into business intelligence
- [Exports](exports.md) provide detailed data for external analysis

## Concept Dependencies Matrix

| Concept | Depends On | Used By |
|---------|------------|---------|
| [Fields](fields.md) | [Types](types.md) | [Templates](templates.md), [Mappings](mappings.md) |
| [Types](types.md) | None | [Fields](fields.md), [Templates](templates.md) |
| [Templates](templates.md) | [Types](types.md), [Fields](fields.md) | [Rules](rules.md), [Mappings](mappings.md) |
| [Rules](rules.md) | [Templates](templates.md) | [Pricing](pricing.md), [Flows](flows.md), [Mappings](mappings.md) |
| [Pricing](pricing.md) | [Rules](rules.md), [Templates](templates.md) | [Flows](flows.md) |
| [Mappings](mappings.md) | [Templates](templates.md), [Rules](rules.md) | [Flows](flows.md) |
| [Entities](entities.md) | [Integrations](integrations.md) | [Flows](flows.md) |
| [Integrations](integrations.md) | None | [Entities](entities.md), [Flows](flows.md) |
| [Flows](flows.md) | All other concepts | None |
| [Events](events.md) | [Flows](flows.md) | [Reporting](reporting.md), [Exports](exports.md) |
| [Reporting](reporting.md) | [Events](events.md) | None |
| [Exports](exports.md) | [Events](events.md) | None |

## Important Concept Interactions

### Data Availability Timeline
- Raw data arrives without prefixes
- After parsing: standard fields get `lead.` prefix
- Custom fields never have prefixes
- Appended data gets namespace of the service
- TrustedForm Decisions only available in pre-processing

### Outcome Types Across Concepts
- `success` - Business logic passed
- `failure` - Business logic failed (fixable)
- `error` - Technical problem (retry might work)

### Special Behaviors
- [Pricing](pricing.md) rules use "last match wins" (different from other rules)
- [Types](types.md) validate but don't block (set `valid` flag)
- [Templates](templates.md) have three modes based on content
- [Events](events.md) capture complete snapshots, not just changes

---

*Understanding these relationships is key to mastering LeadConduit. Start with [Flows](flows.md) and explore outward based on your needs.*