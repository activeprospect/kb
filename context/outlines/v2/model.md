# LeadConduit Model Reference Manual - Proposed Structure

## Quick Navigation

### Common Tasks Quick Reference
- **Validating lead submissions** → [Acceptance Criteria](#912-acceptance-criteria), [Type Validation](#14-validation-patterns), [Rules Engine](#44-rules-throughout-leadconduit)
- **Rejecting duplicate leads** → [Suppression Lists - Duplicate Checking](#913-suppression-list-management), [Compliance Patterns](#154-compliance-patterns)
- **Rejecting leads on internal DNC list** → [Suppression Lists - DNC](#913-suppression-list-management), [Data Privacy](#144-data-privacy)
- **Ensuring consent to call (TCPA compliance)** → [TrustedForm Decisions](#914-trustedform-decisions-and-purchasing-services), [Compliance Patterns](#154-compliance-patterns)
- **Setting lead purchase price** → [Purchase Pricing](#61-pricing-architecture), [Source Pricing Configuration](#62-pricing-rule-patterns)
- **Setting lead sale price** → [Sale Pricing](#61-pricing-architecture), [Recipient Pricing](#104-destination-steps)
- **Connecting to your CRM** → [Entities](#71-entity-types), [Integrations](#82-integration-patterns), [Destination Steps](#104-destination-steps)

## System Overview Diagram

```
┌─────────────────────────────────────────────────────────────────────┐
│                         LEADCONDUIT SYSTEM                          │
├─────────────────────────────────────────────────────────────────────┤
│                                                                     │
│  DATA FOUNDATION          BUSINESS LOGIC         ORCHESTRATION      │
│  ┌─────────────┐         ┌─────────────┐       ┌─────────────┐    │
│  │Types (1)    │────────▶│Rules (4)    │──────▶│Flows (9)    │    │
│  │Fields (2)   │         │Mappings (5) │       │Steps (10)   │    │
│  │Templates (3)│         │Pricing (6)  │       └─────────────┘    │
│  └─────────────┘         └─────────────┘                           │
│         │                       │                      │            │
│         └───────────────────────┴──────────────────────┘            │
│                                │                                    │
│  IDENTITY & INTEGRATION        │         ANALYTICS & VISIBILITY     │
│  ┌─────────────┐              │         ┌─────────────┐           │
│  │Entities (7) │              │         │Events (11)  │           │
│  │Integrations │              │         │Reports (12) │           │
│  │    (8)      │              │         │Exports (13) │           │
│  └─────────────┘              │         └─────────────┘           │
│                               │                                    │
│                     SYSTEM BEHAVIORS (14-15)                       │
└─────────────────────────────────────────────────────────────────────┘

Section numbers in parentheses indicate where each component is documented.
```

## Part I: Data Foundation

### 1. Type System Reference
*Complete guide to data parsing, validation, and normalization*

#### 1.1 Type System Architecture
**Summary**: How the type system works internally - parsing pipeline, validation process, normalization rules, and the critical principle that types inform but don't block.

#### 1.2 Type Catalog
**Summary**: Detailed reference for each type including parsing rules, validation criteria, normalized output format, component access, and common edge cases.

#### 1.3 Type Selection Guide
**Summary**: How to choose the right type for your data, understanding type precedence, custom vs standard types, and the impact of type selection on downstream processing.

#### 1.4 Validation Patterns
**Summary**: Using type validation results in business logic, understanding the `valid` flag, accessing validation details, and building quality gates based on type output.

**Related Topics**: Rules Engine Reference (4), Flow Components (9.1), Quality Control Patterns (15.1)  
**See Examples**: Section 15.1

### 2. Field Model Reference
*Understanding the data model and field definitions*

#### 2.1 Standard Fields Catalog
**Summary**: Complete reference of all standard fields including purpose, type assignment, common uses, and best practices for each standard field.

#### 2.2 Field Naming Conventions
**Summary**: Rules for field names, reserved prefixes (lead., appended., etc.), naming patterns for custom fields, and avoiding conflicts with system fields.

#### 2.3 Field Lifecycle
**Summary**: How fields come into existence, when they get the lead. prefix, how custom fields work, field availability throughout processing, and field persistence.

#### 2.4 Field Design Patterns
**Summary**: Best practices for field selection, when to use standard vs custom fields, field reuse strategies, and maintaining field consistency across flows.

### 3. Template Engine Reference
*Dynamic value access and transformation*

#### 3.1 Template Modes Deep Dive
**Summary**: Comprehensive explanation of the three modes (literal, simple variable, Handlebars), mode detection rules, when each mode applies, and their different behaviors.

#### 3.2 Template Syntax Guide
**Summary**: Complete syntax reference including variable access, nested properties, array indexing, Handlebars helpers, and escaping rules.

#### 3.3 Template Context
**Summary**: What data is available in templates at each processing stage, understanding variable scope, accessing metadata vs lead data, and namespace availability.

#### 3.4 Template Cookbook
**Summary**: Common template patterns, data transformation recipes, formatting techniques, conditional content, and advanced Handlebars usage.

## Part II: Business Logic Engine

### 4. Rules Engine Reference
*The universal decision-making system*

#### 4.1 Rule Evaluation Model
**Summary**: How rules are evaluated, operator precedence, null handling, type coercion, and the critical difference between general rules (first match) and pricing rules (last match).

#### 4.2 Operator Reference
**Summary**: Complete catalog of all operators with detailed behavior, edge cases, type compatibility, and examples for each operator.

#### 4.3 Rule Composition Patterns
**Summary**: Building complex logic with AND/OR, nested rule sets, rule organization strategies, and performance considerations for rule evaluation.

#### 4.4 Rules Throughout LeadConduit
**Summary**: How the same rule engine powers different features - acceptance criteria, filter steps, volume caps, pricing tiers, and conditional mappings.

**Related Topics**: Acceptance Criteria (9.1.2), Filter Steps (10.1), Volume Caps (9.1.5), Pricing Architecture (6.1), Mapping Components (5.1)  
**See Examples**: Sections 15.1, 15.2, 15.3

### 5. Mapping System Reference
*Data transformation and reshaping*

#### 5.1 Mapping Components
**Summary**: Understanding the three parts of mappings - property (target), value (source via template), and optional rules (conditions), and how they work together.

#### 5.2 Mapping Execution
**Summary**: When mappings run, execution order, handling conflicts, null value behavior, and the relationship between mappings and types.

#### 5.3 Mapping Strategies
**Summary**: Inbound normalization patterns, outbound formatting techniques, conditional mapping logic, and handling complex data structures.

#### 5.4 Integration-Specific Mappings
**Summary**: How mappings work with different integration types, handling nested objects, array mappings, and special mapping requirements for various platforms.

### 6. Pricing Model Reference
*Financial control and calculation system*

#### 6.1 Pricing Architecture
**Summary**: The four-layer precedence system, purchase vs sale pricing, how pricing rules differ from other rules (last match wins), and price calculation timing.

**Related Topics**: Rule Evaluation Model (4.1), Rules Throughout LeadConduit (4.4), Financial Tracking (6.4)  
**See Examples**: Section 15.3

#### 6.2 Pricing Rule Patterns
**Summary**: Building tiered pricing, geographic pricing variations, quality-based pricing, time-based pricing, and complex pricing matrices.

#### 6.3 Pricing Services
**Summary**: When to use services vs rules, integrating external pricing APIs, dynamic pricing strategies, and handling pricing failures.

#### 6.4 Financial Tracking
**Summary**: How pricing connects to events, tracking margins, understanding credits and returns, and financial reconciliation patterns.

## Part III: Identity and Integration

### 7. Entity Model Reference
*Business identity and relationships*

#### 7.1 Entity Types
**Summary**: Standard entities, custom entities, account entities, entity hierarchies, and the relationship between entities and actual businesses.

#### 7.2 Entity Capabilities
**Summary**: How entities declare their capabilities through modules, entity credentials, entity-specific configuration, and entity state management.

#### 7.3 Entity Management
**Summary**: Creating and configuring entities, entity naming conventions, managing entity relationships, and entity lifecycle.

#### 7.4 Entity Selection
**Summary**: Choosing the right entity type, when to use standard vs custom entities, entity reuse strategies, and maintaining entity consistency.

### 8. Integration Architecture Reference
*Technical connectivity framework*

#### 8.1 Integration Model
**Summary**: How packages provide modules, modules implement capabilities, the relationship between entities and integrations, and integration versioning.

#### 8.2 Integration Patterns
**Summary**: Webhook integrations, API integrations, email integrations, file-based integrations, and choosing the right pattern.

#### 8.3 Integration Configuration
**Summary**: Credential management, endpoint configuration, retry settings, timeout handling, and integration-specific options.

#### 8.4 Custom Integration Development
**Summary**: When custom integrations are needed, the integration development model, testing integrations, and deployment patterns.

## Part IV: Orchestration Layer

### 9. Flow Architecture Reference
*The complete processing pipeline*

#### 9.1 Flow Components Detailed
**Summary**: Deep dive into sources, pre-processing gates (acceptance criteria, suppression, purchasing decisions), and the step execution pipeline.

##### 9.1.1 Source Configuration
**Summary**: Source endpoints, authentication, field mappings, source-specific settings, and managing multiple sources per flow.

##### 9.1.2 Acceptance Criteria
**Summary**: Flow-level vs source-level criteria, rule precedence, common rejection patterns, vendor feedback, and acceptance criteria optimization.

**Related Topics**: Rules Engine (4.1, 4.4), Validation Patterns (1.4)  
**See Examples**: Section 15.1

##### 9.1.3 Suppression List Management
**Summary**: Duplicate checking, DNC lists, existing customer suppression, custom suppression lists, lookback periods, and matching strategies.

**Related Topics**: Compliance Patterns (15.4), Data Privacy (14.4)  
**See Examples**: Section 15.4

##### 9.1.4 TrustedForm Decisions and Purchasing Services
**Summary**: TrustedForm Decisions vs TrustedForm Insights, purchasing decision timing, data availability in pre-processing, cost optimization strategies, and integration patterns.

**Related Topics**: Data Availability Timeline (14.2), Compliance Patterns (15.4), Enhancement Steps (10.2)  
**See Examples**: Section 15.4

##### 9.1.5 Volume Caps and Limits
**Summary**: Cap types (daily, weekly, monthly), nested caps, conditional caps, timezone handling, cap evaluation order, and inventory management strategies.

**Related Topics**: Rules Engine (4.4), Distribution Patterns (15.2)  
**See Examples**: Section 15.2

#### 9.2 Flow Execution Model
**Summary**: How leads move through flows, parallel vs sequential processing, step dependencies, error handling, and flow termination.

#### 9.3 Flow Design Patterns
**Summary**: Linear flows, branching flows, waterfalls, ping trees, hub-and-spoke, and other proven architectural patterns.

#### 9.4 Flow Optimization
**Summary**: Performance considerations, minimizing external calls, optimal step ordering, caching strategies, and scaling flows.

### 10. Step Type Reference
*Detailed guide to each step type*

#### 10.1 Filter Steps
**Summary**: Complete reference including rule evaluation, routing options (continue, skip, stop), performance impact, and advanced filtering patterns.

#### 10.2 Enhancement Steps
**Summary**: How enhancement works, the appended namespace, handling enhancement failures, cascade patterns, and data persistence.

**Related Topics**: Data Namespaces (14.1), TrustedForm Integration (9.1.4), Integration Configuration (8.3)  
**See Examples**: Section 15.1

#### 10.3 Recipient Steps
**Summary**: Internal delivery mechanisms, recipient vs destination distinction, recipient event generation, and notification patterns.

#### 10.4 Destination Steps
**Summary**: External delivery, mapping application, outcome tracking, retry behavior, and revenue recognition.

## Part V: Analytics and Visibility

### 11. Event Model Reference
*Complete audit trail system*

#### 11.1 Event Types Catalog
**Summary**: Detailed reference for each event type - source, recipient, filter, feedback, error - including data captured and use cases.

#### 11.2 Event Data Structure
**Summary**: The vars namespace, standard event properties, event metadata, understanding event snapshots vs deltas, and data retention.

#### 11.3 Event Analysis Patterns
**Summary**: Tracing lead journeys, debugging failures, dispute resolution, performance analysis, and compliance auditing with events.

#### 11.4 Event Access Methods
**Summary**: UI event viewer, Events API, event exports, real-time event streams, and choosing the right access method.

### 12. Reporting Engine Reference
*Business intelligence and metrics*

#### 12.1 Report Components Deep Dive
**Summary**: Understanding columns (metrics), rules (filters), group by (dimensions), time ranges, and how they combine to answer business questions.

#### 12.2 Metric Catalog
**Summary**: Complete reference of available columns, calculated metrics, metric relationships, and custom metric creation.

#### 12.3 Report Design Patterns
**Summary**: Vendor scorecards, financial summaries, operational dashboards, compliance reports, and other proven report templates.

#### 12.4 Report Performance
**Summary**: Query optimization, time range considerations, grouping strategies, and managing large-scale reporting.

### 13. Export System Reference
*Bulk data extraction*

#### 13.1 Export Configuration
**Summary**: Time ranges, filter rules, field selection, delivery options, and scheduling exports for different use cases.

#### 13.2 Export Formats
**Summary**: CSV structure, field ordering, data types in exports, handling special characters, and format customization.

#### 13.3 Export Integration Patterns
**Summary**: Automated reconciliation, data warehouse loading, partner data sharing, compliance extracts, and backup strategies.

#### 13.4 Export vs Reporting
**Summary**: When to use exports vs reports, combining both for complete analysis, performance considerations, and data governance.

## Part VI: System Behaviors and Patterns

### 14. Data Flow Reference
*How data moves through the system*

#### 14.1 Data Namespaces
**Summary**: Understanding lead., appended., source., flow., and custom namespaces, when each appears, and namespace precedence.

#### 14.2 Data Availability Timeline
**Summary**: What data is available at each processing stage, from raw input through final delivery, including special cases like TrustedForm Decisions.

**Related Topics**: TrustedForm Decisions (9.1.4), Data Namespaces (14.1), Enhancement Steps (10.2)  
**See Examples**: Section 15.4

#### 14.3 Data Persistence
**Summary**: What data is stored where, retention policies, data archival, and accessing historical data.

#### 14.4 Data Privacy
**Summary**: PII handling, data masking in events, retention policies, and data deletion capabilities.

### 15. Processing Patterns Reference
*Common implementation patterns*

#### 15.1 Quality Control Patterns
**Summary**: Multi-tier acceptance criteria, progressive enhancement, quality scoring, and feedback loops for continuous improvement.

#### 15.2 Distribution Patterns
**Summary**: Exclusive vs shared distribution, geographic routing, time-based routing, capacity management, and fairness algorithms.

#### 15.3 Financial Patterns
**Summary**: Margin optimization, dynamic pricing, credit management, reconciliation workflows, and profitability analysis.

#### 15.4 Compliance Patterns
**Summary**: Consent verification workflows, suppression list management, audit trail maintenance, and regulatory reporting.

**Related Topics**: TrustedForm Integration (9.1.4), Suppression Lists (9.1.3), Event Analysis (11.3), Data Privacy (14.4)  
**See Examples**: Quality Control Patterns (15.1)

## Appendices

### A. Glossary
Complete terminology reference with precise definitions

### B. Quick Reference Cards
One-page summaries of key concepts for quick lookup

### C. Decision Trees
Visual guides for common decisions:
- Which type should I use for this data?
- When to use rules vs pricing services?
- Should I use enhancement or purchasing decision?
- Filter step vs acceptance criteria?
- Reports vs exports for my use case?

### D. Troubleshooting Guide
Common issues and their solutions organized by symptom

### E. Best Practices Checklist
Comprehensive checklist for flow design, data modeling, and system configuration

### F. Migration Guide
Moving from other systems or upgrading LeadConduit versions

### G. Alphabetical Index
Quick lookup for common terms and concepts:
- **Acceptance Criteria** → 9.1.2, 4.4, 15.1
- **Appended Namespace** → 10.2, 14.1
- **Credits and Returns** → 6.4, 15.3
- **Custom Fields** → 2.2, 2.3
- **Data Retention** → 11.2, 13.1, 14.3
- **DNC Lists** → 9.1.3, 15.4
- **Duplicate Checking** → 9.1.3, 15.4
- **Enhancement Steps** → 10.2, 14.1
- **Export Configuration** → 13.1, 13.4
- **Feedback Events** → 11.1, 6.4
- **Filter Steps** → 10.1, 4.4
- **Flow Components** → 9.1
- **Margin Tracking** → 6.4, 15.3
- **Mappings** → 5.1-5.4
- **Namespaces** → 14.1, 14.2
- **Pricing Layers** → 6.1, 4.1
- **Purchasing Decisions** → 9.1.4, 14.2
- **Recipient vs Destination** → 10.3, 10.4
- **Reporting Metrics** → 12.1, 12.2
- **Return Feedback** → 6.4, 15.3
- **Rule Evaluation** → 4.1, 4.4
- **Source Configuration** → 9.1.1
- **Suppression Lists** → 9.1.3, 15.4
- **Template Modes** → 3.1, 3.2
- **TrustedForm Decisions** → 9.1.4, 14.2
- **TrustedForm Insights** → 10.2, 9.1.4
- **Type Validation** → 1.4, 15.1
- **Volume Caps** → 9.1.5, 4.4