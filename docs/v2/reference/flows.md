---
title: Flows
description: The intelligent orchestrators that process leads from arrival to delivery
tags:
  - flows-focused
  - reference
  - technical
  - core-concept
  - universal
---

# Flows

## Definition

Flows are the intelligent command centers that orchestrate every aspect of lead processing in LeadConduit. They define how leads move from arrival to delivery, applying business logic, enforcing quality standards, and managing the complete lifecycle of lead data. A flow is not just a pipeline - it's an automated decision engine that protects your business while streamlining operations.

## Technical Details

### Architecture

Flows operate as stateful processing engines that:
- Accept leads from multiple sources via HTTP endpoints
- Process leads through a series of configurable steps
- Apply business rules at key decision points
- Deliver leads to one or more destinations
- Generate comprehensive event streams for visibility

### Processing Pipeline

The flow processing pipeline consists of five distinct phases:

```
Lead Processing Pipeline
├── 1. Pre-Processing Phase
│   ├── Authentication validation
│   ├── Field mapping and normalization
│   ├── Type parsing and validation
│   └── Purchasing decision services
├── 2. Business Logic Phase
│   ├── Acceptance criteria evaluation
│   ├── Suppression list checking
│   ├── Pricing determination
│   └── Volume cap enforcement
├── 3. Step Processing Phase
│   ├── Sequential step execution
│   ├── Filter step routing
│   ├── Enhancement data appending
│   └── Recipient notifications
├── 4. Delivery Phase
│   ├── Destination field mapping
│   ├── Integration protocol handling
│   └── Response capture
└── 5. Completion Phase
    ├── Event stream finalization
    ├── Source response generation
    └── Analytics data capture
```

### Variable System

Flows maintain a rich variable context throughout processing:

**Variable Namespaces**

| Namespace | Description | Example Variables |
|-----------|-------------|-------------------|
| `lead.*` | Core lead data after parsing | `lead.email`, `lead.phone.number` |
| `source.*` | Information about the lead source | `source.name`, `source.ip_address` |
| `flow.*` | Flow-level metadata | `flow.name`, `flow.id` |
| `appended.*` | Data from enhancement services | `appended.trustedform.valid` |
| `destination.*` | Delivery-specific data | `destination.outcome` |

**Example Variable Structure:**
```
{
  lead: {
    email: "user@example.com",
    phone: {
      number: "5551234567",
      valid: true,
      area: "555"
    }
  },
  source: {
    name: "vendor-api",
    ip_address: "192.168.1.1"
  },
  appended: {
    trustedform: {
      valid: true,
      age_seconds: 120
    }
  }
}
```

### Step Types

**Flow Step Categories**

```
Flow Steps
├── Filter Steps (Traffic Controllers)
│   ├── Evaluate rules for routing decisions
│   ├── Can skip subsequent steps
│   ├── Can stop flow entirely
│   └── Enable branching logic
├── Enhancement Steps (Data Enrichers)
│   ├── Call external APIs
│   ├── Append data to lead
│   ├── Non-blocking with timeouts
│   └── Results in appended.* namespace
├── Recipient Steps (Internal Handlers)
│   ├── Email notifications
│   ├── Webhook calls
│   ├── Custom logging
│   └── CRM updates
└── Destination Steps (Delivery Points)
    ├── Deliver leads to buyers
    ├── Support multiple destinations
    ├── Track delivery independently
    └── Generate outcome events
```

## Configuration

### Basic Flow Settings

**📋 Flow Configuration Overview**

| Setting | Description | Example |
|---------|-------------|---------|
| **Name** | Display name for your flow | "Premium Insurance Leads" |
| **Description** | Purpose and details | "High-value leads with compliance verification" |
| **Timezone** | For scheduling and caps | America/New_York |
| **Hours of Operation** | When to accept leads | Mon-Fri: 8:00 AM - 8:00 PM |

### Source Configuration

**Configuring a Source - Step by Step:**

1. **Name your source**
   - Choose a descriptive identifier (e.g., "Facebook Lead Ads")
   - This becomes part of the submission URL

2. **Map incoming fields**
   - Tell the system how vendor fields match your schema:
   
   | Vendor Sends | Maps To Your |
   |--------------|--------------|
   | contact_phone | Phone 1 |
   | contact_email | Email |
   | first | First Name |
   | last | Last Name |

3. **Set acceptance rules**
   - Define what makes a valid lead from this source:
   - ✅ Phone 1 must be present
   - ✅ Email must be valid format
   - ✅ State must be CA, TX, or FL
   - ✅ TrustedForm URL must exist

4. **Configure pricing**
   - Set source-specific costs:
   
   | Condition | Price |
   |-----------|-------|
   | State = CA | $15.00 |
   | State = NY | $18.00 |
   | Default | $10.00 |

### Pre-Processing Gates

**🚦 Quality Control Gates**

Your flow's pre-processing gates protect you from bad leads:

```
When a lead arrives:
│
├─ Acceptance Criteria
│  ├─ Required fields present? → Continue or Reject
│  ├─ Valid formats? → Continue or Reject
│  └─ Business rules met? → Continue or Reject
│
├─ Suppression Lists
│  ├─ Duplicate check → Continue or Reject: "Duplicate"
│  ├─ DNC check → Continue or Reject: "DNC Listed"
│  └─ Customer check → Continue or Reject: "Existing Customer"
│
├─ Volume Caps
│  ├─ Daily limit reached? → Continue or Reject: "Cap Exceeded"
│  ├─ Source limit reached? → Continue or Reject: "Vendor Cap"
│  └─ Premium limit reached? → Continue or Reject: "Premium Cap"
│
└─ All Passed? → Continue to Steps
```

### Step Configuration

**Building Your Flow Logic**

**Filter Step Example:**
```
Step: "Route to California Team"
├── Type: Filter
├── Rule: state is equal to "CA" AND loan_amount > 25000
├── On Match: Continue to next steps
└── On No Match: Skip to step "National Team"
```

**Enhancement Step Example:**
```
Step: "Verify Phone Number"
├── Type: Enhancement
├── Integration: Phone Validation Service
├── Timeout: 3 seconds
└── Results Available In: appended.phone_validation.*
```

**Destination Step Example:**
```
Step: "Deliver to CRM"
├── Type: Destination
├── System: Salesforce
├── Field Mappings:
│   ├── phone_1 → Primary_Phone__c
│   ├── email → Email
│   └── loan_amount → Loan_Amount__c
└── Error Handling: Continue on failure
```

## Examples

### Basic Lead Buyer Flow

**Recipe: Simple Lead Purchase Flow**

*What it does:* Accepts leads from vendors, validates consent, and delivers to your CRM

*Ingredients:*
- 1 Source with field mappings
- Acceptance criteria for quality control
- 1 TrustedForm enhancement
- 1 Filter to check consent
- 1 CRM destination

*Step-by-Step:*

1. **Configure Source "Vendor A"**
   - Map their fields to yours
   - Require: phone, email, trustedform_url
   
2. **Add TrustedForm Enhancement**
   - Validates consent certificate
   - Stores results in appended.trustedform.*

3. **Add Filter: "Check Valid Consent"**
   - Rule: `appended.trustedform.valid is true`
   - On fail: Stop with "Invalid consent"

4. **Add Destination: "Salesforce CRM"**
   - Map your fields to Salesforce fields
   - Deliver only validated leads

### Multi-Buyer Distribution Flow

**Pattern: Waterfall Distribution**

Distribute leads to multiple buyers in priority order:

```
Lead Distribution Logic
│
├─ Premium Buyer (First Shot)
│  ├─ Filter: loan_amount > 50000
│  ├─ Destination: Premium Buyer API
│  └─ If Accepted → Stop (Sold)
│
├─ Standard Buyers (Second Tier)
│  ├─ Filter: loan_amount > 25000
│  ├─ Destination: Buyer Pool A
│  └─ Destination: Buyer Pool B (parallel)
│
└─ Backup Buyer (Final Option)
   └─ Destination: Backup Buyer System
```

### Compliance-First Flow

**🛡️ Compliance Verification Pattern**

Ensure every lead meets regulatory requirements:

| Step | Check | Action on Failure |
|------|-------|-------------------|
| 1. Pre-Processing | TrustedForm URL exists? | Reject: "Missing consent" |
| 2. Enhancement | Get TrustedForm certificate | - |
| 3. Filter | Certificate valid? | Stop: "Invalid consent" |
| 4. Filter | Certificate < 5 min old? | Stop: "Consent too old" |
| 5. Enhancement | DNC list check | - |
| 6. Filter | Not on DNC? | Stop: "DNC listed" |
| 7. Filter | Allowed state? | Stop: "Restricted state" |
| 8. Destination | Deliver to compliant CRM | Success! |

## Relationships

### How Flows Connect to Other Concepts

```
Flows orchestrate all other concepts:
│
├─ Sources & Recipients (via Entities)
│  └─ Each references a reusable identity
│
├─ Integrations
│  ├─ Inbound: How sources receive data
│  ├─ Outbound: How destinations deliver
│  └─ Enhancement: How steps enrich data
│
├─ Fields & Types
│  ├─ Fields: Define expected data
│  └─ Types: Parse and validate it
│
├─ Rules & Templates  
│  ├─ Rules: Power all decisions
│  └─ Templates: Enable dynamic values
│
├─ Mappings
│  ├─ Source: Normalize inbound data
│  └─ Destination: Format outbound data
│
└─ Events & Reporting
   ├─ Events: Capture everything
   └─ Reports: Provide insights
```

## Best Practices

### Design Principles

**✅ Do This:**
- Start simple, add complexity gradually
- Put cheapest validations first
- Filter early to reduce processing
- Set reasonable timeouts
- Plan for integration failures

**❌ Avoid This:**
- Running expensive enhancements before filtering
- Over-strict acceptance criteria
- Complex regex when simple rules work
- Ignoring error scenarios
- Changing rules without notifying vendors

### Performance Optimization

**Step Ordering for Efficiency:**

| Order | Step Type | Why |
|-------|-----------|-----|
| 1st | Simple field checks | Instant, no cost |
| 2nd | Suppression lists | Fast lookups |
| 3rd | Basic filters | Quick rule evaluation |
| 4th | External validations | API calls = slower |
| 5th | Expensive enhancements | Only for good leads |
| Last | Delivery | Only validated leads |

### Testing Strategy

**🧪 Testing Checklist**

- [ ] Create test source with known data
- [ ] Verify each field mapping works
- [ ] Test acceptance criteria edge cases
- [ ] Confirm pricing calculations
- [ ] Test each filter step logic
- [ ] Verify enhancement data appears
- [ ] Check destination field mappings
- [ ] Test error scenarios
- [ ] Review complete event stream
- [ ] Validate analytics accuracy

## Troubleshooting Guide

### Common Issues and Solutions

**"Vendor says leads are being rejected unfairly"**

| Check | How | Solution |
|-------|-----|----------|
| Rejection reasons | Pull source events | Share specific examples |
| Field mappings | Review source config | Fix mapping mismatches |
| Required fields | Check acceptance criteria | Verify against agreement |
| Data formats | Test with sample data | Add format flexibility |

**"Leads aren't reaching my CRM"**

| Check | How | Solution |
|-------|-----|----------|
| Authentication | Test destination credentials | Update API keys |
| Field mappings | Review destination config | Fix field mismatches |
| Delivery events | Search for errors | Address specific failures |
| API limits | Check rate limits | Implement throttling |

**"Duplicate leads getting through"**

| Check | How | Solution |
|-------|-----|----------|
| Lookback window | Review suppression config | Extend to 30+ days |
| Match fields | Check dedup criteria | Use phone + email |
| Field formats | Test normalization | Ensure consistent format |
| List updates | Verify list freshness | Check update frequency |

### Using Events for Diagnostics

**Finding Why a Lead Failed:**

1. **Get the timestamp** when vendor submitted
2. **Search events** by source and time range
3. **Find the source event** with failure outcome
4. **Review the chain:**
   - What fields were received?
   - How were they parsed?
   - Which rule failed?
   - What was the exact reason?
5. **Share findings** with specific examples

## Advanced Configurations

### Dynamic Pricing

**Layered Pricing Strategy:**

```
Price Determination (First Match Wins)
│
├─ 1. Source Pricing Service
│     External API for this vendor
│
├─ 2. Source Pricing Rules
│     CA leads from Vendor A: $15
│     Default from Vendor A: $10
│
├─ 3. Flow Pricing Service
│     Market-based pricing API
│
├─ 4. Flow Pricing Rules
│     Premium states: $18
│     Standard states: $12
│
└─ 5. Flow Default Price: $8
```

### Nested Volume Caps

**Sophisticated Inventory Management:**

```
Monthly Cap: 10,000 leads
├─ Daily Cap: 500 leads
│   ├─ CA Daily: 100 leads
│   ├─ TX Daily: 150 leads
│   └─ Other Daily: 250 leads
└─ Premium Daily Cap: 50 leads
    └─ Where: credit_score > 700
```

### A/B Testing Pattern

**Testing New Processes:**

| Step | A Path (50%) | B Path (50%) |
|------|--------------|--------------|
| 1. Random Split | Continue | Skip to B |
| 2. Original Enhancement | Yes | - |
| 3. Original CRM | Yes | - |
| 4. Label "B" | - | Yes |
| 5. New Enhancement | - | Yes |
| 6. New CRM | - | Yes |
| 7. Track Metrics | Both paths | Both paths |

## Key Takeaways

**For Lead Buyers:**
- Flows automate your entire lead buying operation
- Pre-processing gates protect you from bad leads before you pay
- Sources give each vendor their own endpoint and rules
- Events provide complete transparency for vendor management

**For Lead Sellers:**
- Flows ensure consistent lead quality for all buyers
- Multi-destination support enables broad distribution
- Sophisticated routing maximizes acceptance rates
- Real-time feedback helps improve lead quality

**For Technical Teams:**
- Flows are configuration, not code
- Variable namespaces prevent conflicts
- Events enable debugging and analytics
- Integration flexibility supports any system

---

*Flows are the heart of LeadConduit, bringing together all concepts to create powerful, automated lead processing systems. Master flows, and you master the platform.*