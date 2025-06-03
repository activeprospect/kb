# Understanding LeadConduit's Data Model: How Everything Connects

## Introduction: The Philosophy Behind the Design

LeadConduit isn't just a lead processing platform—it's an elegant system built on a foundation of reusable, composable building blocks. Understanding these patterns will transform how you think about configuring flows, troubleshooting issues, and optimizing your lead processing.

This document reveals the systematic design that makes LeadConduit powerful: how the same fundamental concepts appear everywhere, combine in predictable ways, and create emergent functionality that's greater than the sum of its parts.

## The Core Building Blocks: LeadConduit's DNA

### 1. **Entities: The Universal Identity System**

Everything in LeadConduit starts with the concept of an **Entity**. Whether it's a lead source, a CRM system, an enhancement service, or even your own company, they're all represented as entities.

**Why This Matters:**
- An entity can be both a source AND a recipient, depending on context
- The same Facebook entity can send you leads (source) and receive your audiences (recipient)  
- Partner relationships are just entities with special permissions
- Your account itself is an entity, which explains why you can send leads between your own flows

**The Pattern in Action:**
```
Entity "Salesforce CRM" can be:
├── A recipient step in Flow A (receiving new leads)
├── A source in Flow B (sending updated lead data)  
└── A feedback provider (sending conversion notifications)
```

This design eliminates duplication—configure an entity once, use it everywhere.

### 2. **Fields: The Data Structure Vocabulary**

Fields aren't just database columns—they're intelligent data containers with built-in knowledge about format, validation, and transformation.

**The Hidden Power:**
- Each field type (phone, email, state) "knows" how to validate and normalize itself
- Custom fields inherit this intelligence through their type designation
- Field types determine available operators in rules (you can't do math on a phone number)

**Discovery Insight:** When you wonder "why can't I use this operator on this field?"—the field's type is the answer. The system is protecting you from nonsensical operations.

### 3. **Rules: The Universal Decision Engine**

Rules appear everywhere in LeadConduit, but they're always the same basic pattern: compare values using operators, then make decisions.

**Where Rules Live:**
- **Acceptance Criteria**: "Should this lead enter the flow?"
- **Step Criteria**: "Should this step run for this lead?"  
- **Filter Steps**: "Should this lead continue processing?"
- **Mappings**: "Should this value be mapped?"
- **Pricing**: "Does this lead qualify for this price?"
- **Feedback**: "Should feedback be processed?"

**The Pattern:** Every rule has three parts:
1. **Left-hand value** (what you're testing) - supports templates
2. **Operator** (how you're testing it) - varies by data type
3. **Right-hand value** (what you're testing against) - supports templates

**Rule Sets** combine multiple rules with AND/OR logic and can nest infinitely deep.

### 4. **Templates: The Dynamic Value System**

Templates are LeadConduit's way of making static configurations dynamic. They appear in rules, mappings, integrations—anywhere you need values that change based on lead data.

**Template Examples:**
- `lead.first_name` - Simple field reference
- `lead.state == 'CA' ? 'Pacific' : 'Other'` - Conditional logic
- `submission.timestamp.format('YYYY-MM-DD')` - Function calls
- `recipient.name + " - " + lead.email` - String building

**Why This Is Powerful:** The same template system works everywhere. Learn it once, use it everywhere.

## How Building Blocks Combine: The Composition Patterns

### **Flows: Orchestrated Processing Pipelines**

A Flow is essentially a collection of reusable components working together:

```
Flow Structure:
├── Fields (what data to capture)
├── Acceptance Criteria (rules for entry)
├── Sources (entities + integrations + local config)
├── Steps (filters and recipients with local config)
├── Pricing (rules-based value assignment)
└── Destinations (backup delivery when steps fail)
```

**The Inheritance Hierarchy:**
1. **Flow-level configuration** sets defaults
2. **Source-level configuration** overrides for specific sources
3. **Step-level configuration** overrides for specific operations

This hierarchy explains why you can set pricing at the flow level (applies to all leads) but override it on specific sources (custom rates for premium partners).

### **Sources: Entities with Context**

A Source isn't just an entity—it's an entity configured for a specific role in a specific flow:

```
Source = Entity + Integration + Flow-Specific Configuration
Where Configuration includes:
├── Acceptance Criteria (source-specific lead requirements)
├── Pricing (source-specific rates)
├── Caps (source-specific volume limits)
├── Feedback (how to send conversion data back)
└── Authentication (source-specific credentials)
```

**The Insight:** The same entity can be configured differently in different flows. Your Facebook source might have different acceptance criteria in your auto leads flow vs. your insurance leads flow.

### **Steps: Contextual Operations**

Every step follows the same pattern:

```
Step = Type + Entity + Integration + Rules + Configuration
Where:
├── Type (filter or recipient)
├── Entity (who you're working with)
├── Integration (how to communicate)
├── Rules (when to execute)
└── Configuration (mappings, pricing, feedback)
```

**Filter Steps** use rules to stop processing.
**Recipient Steps** use rules to determine when to deliver.

## Cross-Cutting Concerns: Patterns That Appear Everywhere

### **1. Rules-Based Configuration**

Almost every feature in LeadConduit supports conditional behavior through rules:

- **Acceptance Criteria**: Rules determine lead acceptance
- **Step Criteria**: Rules determine step execution  
- **Mappings**: Rules determine value assignment
- **Pricing**: Rules determine cost/revenue
- **Feedback**: Rules determine feedback processing

**User Benefit:** Master rules once, and you've unlocked conditional behavior throughout the entire platform.

### **2. Template-Driven Flexibility**

Templates provide dynamic values everywhere:

- **Rule values**: Compare lead data against computed values
- **Mapping values**: Set properties to computed values
- **Integration parameters**: Pass dynamic values to external systems
- **Feedback reasons**: Provide dynamic explanations

**User Benefit:** The same template syntax works in every context. Complex logic can be reused across different features.

### **3. Three-Tier Configuration Inheritance**

The pattern Flow → Source → Step appears in multiple features:

- **Pricing**: Flow pricing → Source pricing → Step pricing
- **Caps**: Flow caps → Source caps → Step caps  
- **Acceptance Criteria**: Flow criteria → Source criteria (both must pass)

**User Benefit:** Configure once at the appropriate level, let inheritance handle the rest.

## Real-World Application: How Understanding Patterns Improves Your Work

### **Configuration Efficiency**

**Before Understanding Patterns:**
"I need to set up pricing for each recipient step individually."

**After Understanding Patterns:**
"I'll set standard pricing at the flow level, override only for premium sources at the source level, and use step-level pricing only for special delivery requirements."

### **Troubleshooting Power**

**Before Understanding Patterns:**
"A lead was rejected, but I'm not sure why."

**After Understanding Patterns:**
"I'll check rule evaluation in this order: flow acceptance criteria first, then source acceptance criteria, then step criteria. The rejection happened at the first failing rule."

### **Mental Model Building**

**Before Understanding Patterns:**
"Features seem disconnected and I have to learn each one separately."

**After Understanding Patterns:**
"I can predict how new features work because they follow the same patterns: entities provide identity, rules provide logic, templates provide flexibility, and inheritance provides hierarchy."

## Advanced Pattern Recognition

### **The Event-Driven Architecture**

Every action in LeadConduit creates events that follow the same pattern:

```
Event Structure:
├── Type (source, recipient, filter, feedback)
├── Outcome (success, failure, error, skip)
├── Variables (all data available at that moment)
├── Appended Data (what was learned from external systems)
└── Metadata (timing, technical details)
```

**The Insight:** Events aren't just logs—they're complete snapshots of lead state at specific processing moments. This enables powerful reporting and feedback loops.

### **The Integration Architecture**

All integrations follow the same pattern:

```
Integration = Module + Mappings + Credentials
Where:
├── Module (the code that does the work)
├── Mappings (how to transform data)
└── Credentials (how to authenticate)
```

**Standard vs. Custom Integrations** both use this pattern—custom integrations just use generic modules (Form POST, JSON POST, etc.) instead of service-specific ones.

### **The Feedback Loop Pattern**

Feedback creates a circular data flow:

```
Lead Processing → Events → Feedback → Rule Evaluation → Actions
```

Understanding this pattern explains why feedback configurations use the same rule/template system as everything else—they're part of the same unified architecture.

## Best Practices Emerging from Pattern Understanding

### **1. Design for Reuse**

- Create entities at the most general level possible
- Use flow-level configuration for common settings
- Reserve source/step-level overrides for true exceptions
- Write rules that can be reused across different contexts

### **2. Leverage Inheritance**

- Set pricing at the flow level unless sources truly need different rates
- Use acceptance criteria strategically—flow-level for universal requirements, source-level for source-specific needs
- Remember that more specific configurations override more general ones

### **3. Template for Flexibility**

- Use templates instead of static values when you need dynamic behavior
- Learn the template functions once—they work everywhere
- Combine simple templates to create complex logic

### **4. Think in Terms of State**

- Each event captures complete lead state at that moment
- Rules and mappings can reference any part of that state
- Understanding what data is available when helps you write better rules

## Troubleshooting with Pattern Knowledge

### **When Leads Are Rejected:**
1. Check flow acceptance criteria first
2. Then source acceptance criteria  
3. Then step criteria (if lead made it that far)
4. Rules are evaluated in order—find the first failure

### **When Mappings Don't Work:**
1. Check if the mapping's rule set passes
2. Verify the template syntax in the value
3. Confirm the data being referenced exists at that processing moment
4. Remember that mappings are processed in order

### **When Pricing Seems Wrong:**
1. Flow pricing is evaluated first
2. Source pricing overrides flow pricing
3. Step pricing overrides both
4. External pricing services override everything
5. The last matching rule in each level wins

## Conclusion: The Elegance of Systematic Design

LeadConduit's power comes from its systematic reuse of fundamental patterns. The same concepts—entities, rules, templates, inheritance—appear everywhere, creating a platform that's both powerful and learnable.

Understanding these patterns transforms you from someone who configures features individually to someone who thinks systematically about lead processing. You'll:

- Configure faster by leveraging inheritance and reuse
- Troubleshoot more effectively by understanding evaluation order
- Design better flows by thinking in terms of composable components
- Predict how new features work by recognizing familiar patterns

The beauty of LeadConduit isn't in any single feature—it's in how all features follow the same underlying principles, creating a coherent, learnable, and powerful system for managing your lead processing operations.

**Remember:** Every complex feature in LeadConduit is built from the same simple building blocks. Master the patterns, and you've mastered the platform.