---
title: Leads & Events
description: Understanding your lead data structure and the complete audit trail
tags:
  - leads
  - events
  - data-model
---

# Leads & Events

## The Heart of Your Operation

Leads are the lifeblood of your business, and events are their complete medical history. Together, they form a comprehensive record of every piece of data that flows through LeadConduit - from initial submission through final delivery and beyond. Understanding this data model is key to building effective flows, troubleshooting issues, and optimizing performance.

📍 **You are here**: Deep diving into lead data and event tracking
📊 **What you'll master**: Lead structure, field types, and event analysis
🔍 **The outcome**: Complete visibility into your lead operations

## The Lead Object

### What Is a Lead?

A lead in LeadConduit is:
- A container for all submitted data
- Enhanced with appended information
- Tracked through every processing step
- Immutable once created
- Identified by a unique ID

Think of it as a smart folder that carries everything about a prospect through your system.

### Lead Anatomy

Every lead contains:

```yaml
Core Identity:
  id: "ABC123DEF456"
  timestamp: "2024-01-15T10:30:45.123Z"
  
Source Information:
  source.id: "src_789"
  source.name: "Facebook Campaign A"
  source.ip: "192.168.1.1"
  
Submitted Data:
  first_name: "John"
  last_name: "Doe"
  email: "john@example.com"
  phone_1: "5551234567"
  
Parsed Components:
  email.valid: true
  email.domain: "example.com"
  phone_1.valid: true
  phone_1.area: "555"
  
Appended Data:
  appended.phone_intel.carrier: "Verizon"
  appended.trustedform.cert_id: "xyz789"
  
Processing Results:
  outcome: "success"
  revenue: 45.00
  cost: 15.00
  margin: 30.00
```

### Lead Lifecycle

```
Created → Enhanced → Routed → Delivered → Updated
   ↓         ↓         ↓         ↓          ↓
Source    Add data  Business  Recipient  Feedback
submits            logic      accepts    received
```

## Lead Data Structure

### Field Categories

**System Fields** (Automatic):
```yaml
Always present:
  - id: Unique identifier
  - timestamp: Creation time
  - source.*: Source information
  - outcome: Processing result
```

**Standard Fields** (Common):
```yaml
Frequently used:
  - Contact: first_name, last_name, email, phone_1
  - Location: address_1, city, state, postal_code
  - Metadata: ip_address, user_agent, referrer
  - Consent: opted_in_at, xxTrustedFormCertUrl
```

**Custom Fields** (Your Business):
```yaml
Industry-specific:
  - Insurance: policy_type, current_carrier
  - Finance: loan_amount, credit_range
  - Education: degree_interest, start_date
  - Real Estate: property_type, price_range
```

**Appended Fields** (Enhancements):
```yaml
Added by integrations:
  - appended.{service}.{field}
  - appended.phone_validate.type: "mobile"
  - appended.identity.verified: true
  - appended.demographics.income: "$50k-75k"
```

### Data Types Deep Dive

**Text Fields**:
```yaml
Storage: UTF-8 strings
Max length: 65,535 characters
Examples:
  - first_name: "John"
  - comments: "Interested in solar panels for residential property"
  
Use for: Names, addresses, free text
```

**Email Type**:
```yaml
Automatic parsing provides:
  - email: "John.Doe@EXAMPLE.com"
  - email.valid: true
  - email.address: "john.doe@example.com" (normalized)
  - email.local: "john.doe"
  - email.domain: "example.com"
  - email.is_free: true
  - email.is_disposable: false
```

**Phone Type**:
```yaml
Automatic parsing provides:
  - phone_1: "(555) 123-4567"
  - phone_1.valid: true
  - phone_1.number: "5551234567" (normalized)
  - phone_1.area: "555"
  - phone_1.exchange: "123"
  - phone_1.line: "4567"
  - phone_1.type: "mobile" (if enhanced)
```

**Number Fields**:
```yaml
Storage: Decimal precision
Examples:
  - age: 35
  - income: 75000
  - loan_amount: 250000.00
  - interest_rate: 3.75
  
Operations: Comparisons, calculations
```

**Boolean Fields**:
```yaml
Values: true/false
Examples:
  - homeowner: true
  - currently_insured: false
  - military: false
  
Parsing: "yes"/"y"/"1" → true
```

**Date/Time Fields**:
```yaml
Format: ISO 8601
Examples:
  - opted_in_at: "2024-01-15T10:30:45Z"
  - birth_date: "1985-06-15"
  
Components:
  - birth_date.age: 38
  - opted_in_at.day: "Monday"
```

### Field Access Patterns

**Direct Access**:
```yaml
In rules: email.valid is true
In templates: {{lead.first_name}}
In mappings: phone_1 → primaryPhone
```

**Nested Access**:
```yaml
Type components: phone_1.area
Appended data: appended.service.result
Custom objects: address.components.city
```

**Computed Access**:
```yaml
Age from DOB: birth_date.age
Time since: {{minutes_since opted_in_at}}
Formatted: {{format phone_1 "(###) ###-####"}}
```

## Events: The Complete Story

### What Are Events?

Events are immutable records that capture:
- What happened
- When it happened
- Why it happened
- The complete lead state

Every significant action generates an event, creating an unbreakable audit trail.

### Event Types

**Source Events**:
```yaml
source.submitted:
  - Raw data received
  - Before parsing
  - Includes all submitted fields

source.accepted:
  - Passed initial validation
  - After parsing
  - Cost assigned

source.rejected:
  - Failed validation
  - Includes reason
  - No further processing
```

**Processing Events**:
```yaml
filter.passed/failed:
  - Rule evaluation results
  - Which rules triggered
  - Pass/fail reason

enhancement.success/failure:
  - Service called
  - Data returned
  - Errors if any

step.skipped:
  - Why step was skipped
  - Conditional logic result
```

**Delivery Events**:
```yaml
recipient.delivered:
  - Successful delivery
  - Response captured
  - Revenue recorded

recipient.failed:
  - Business rejection
  - Specific reason
  - No revenue

recipient.error:
  - Technical failure
  - Will retry
  - Error details
```

**Feedback Events**:
```yaml
feedback.received:
  - Post-delivery update
  - Status change
  - Quality metrics

feedback.processed:
  - Feedback applied
  - Lead updated
  - Metrics adjusted
```

### Event Structure

Every event contains:

```json
{
  "id": "evt_XYZ789",
  "type": "recipient.delivered",
  "timestamp": "2024-01-15T10:31:45.678Z",
  "lead_id": "lead_ABC123",
  "flow_id": "flow_123",
  "step_id": "step_456",
  "outcome": "success",
  "duration_ms": 245,
  "metadata": {
    "buyer_id": "buyer_789",
    "price": 45.00,
    "response_code": 200
  },
  "lead_snapshot": {
    // Complete lead data at this moment
  }
}
```

### Using Events

**For Debugging**:
```yaml
Problem: Lead rejected unexpectedly
Solution: Check events
- Find source.submitted (what arrived)
- Find filter.failed (which rule failed)
- See exact values that caused failure
```

**For Analytics**:
```yaml
Question: Why are California leads failing?
Analysis: Query events
- Filter: state = "CA" AND type = "recipient.failed"
- Group by: failure_reason
- Insight: 60% fail phone validation
```

**For Compliance**:
```yaml
Requirement: Prove consent for lead
Evidence: Event trail shows
- source.submitted: Contains TrustedForm URL
- enhancement.success: Certificate validated
- filter.passed: Age check confirmed fresh
```

## Working with Lead Data

### In Flows

Access lead data throughout processing:

**In Rules**:
```yaml
Simple: email.valid is true
Nested: appended.phone_check.type = "mobile"
Computed: {{age_from birth_date}} > 25
```

**In Templates**:
```yaml
Direct: {{lead.first_name}}
Formatted: {{format lead.phone_1 "+1##########"}}
Conditional: {{#if lead.state = "CA"}}California{{/if}}
```

**In Mappings**:
```yaml
Rename: email → contact_email
Combine: {{first_name}} {{last_name}} → full_name
Transform: {{uppercase state}} → state_code
```

### Data Quality

Ensure lead data integrity:

**Validation**:
- Types handle format validation
- Rules enforce business logic
- Enhancements verify accuracy

**Standardization**:
- Phones normalized to 10 digits
- Emails lowercased
- States converted to codes
- Dates in ISO format

**Enrichment**:
- Missing data appended
- Accuracy verified
- Additional context added
- Scores calculated

## Advanced Lead Concepts

### Lead Relationships

**Parent-Child Leads**:
```yaml
Parent Lead: Initial submission
Child Leads: 
  - Split by product interest
  - Different buyers per child
  - Linked by parent_id
```

**Lead Versions**:
```yaml
Version 1: Initial submission
Version 2: After enhancement
Version 3: After feedback
All versions preserved in events
```

### Lead State Management

**Immutable Core**:
- Submitted data never changes
- Events record all states
- Audit trail preserved

**Mutable Metadata**:
- Feedback can update status
- Tags can be added
- Notes can be appended

### Performance Considerations

**Data Size**:
- Average lead: 2-5 KB
- With enhancements: 5-20 KB
- With full events: 20-100 KB

**Query Optimization**:
- Index on common fields
- Partition by date
- Archive old data
- Cache frequently accessed

## Your Next Steps

### Essential Reading
1. **[Lead Events](/leads/lead-events)** - Deep dive into event tracking
2. **[Field Types](/leads/lead-data-field-types)** - Understanding data types
3. **[Event Analytics](/leads/event-analytics)** - Mining insights from events

### Practical Exercises
1. Submit a test lead and follow its events
2. Query events for specific patterns
3. Build a report from event data
4. Debug an issue using events

### Advanced Topics
- **[Lead Splitting](/help-guide/advanced/lead-splitting)** - One lead to many
- **[Event Streaming](/leads/firehose)** - Real-time event access
- **[Custom Fields](/help-guide/customization/custom-fields)** - Extend the data model

---

🔍 **Remember**: Every lead tells a story through its data and events. The better you understand this story, the better you can optimize your entire operation.

*Next: Dive deeper into [Lead Events](/leads/lead-events) to master the audit trail that makes LeadConduit transparent and powerful.*