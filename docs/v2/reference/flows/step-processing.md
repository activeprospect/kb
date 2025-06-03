---
title: Step Processing Phase
description: The workflow engine where accepted leads flow through your configured steps for routing, enhancement, and processing
tags:
  - flows
  - reference
  - technical
  - flow-steps
---

# Step Processing Phase

## Overview

Once a lead passes all business logic gates, it enters the step processing phase - your flow's assembly line. This is where you customize exactly what happens to each lead through a sequence of configured steps that filter, enhance, route, and deliver.

Think of steps as workers on an assembly line, each with a specific job:
- Some inspect and route (Filter Steps)
- Some add value (Enhancement Steps)  
- Some notify teams (Recipient Steps)
- Some deliver the final product (Destination Steps)

## Step Types

### Filter Steps: The Traffic Controllers

Filter steps evaluate [rules](../rules.md) to make routing decisions. They're the switchboards that direct leads down different paths.

**Capabilities:**
- Evaluate any rule condition
- Continue to next step on match
- Skip to specific step on no match
- Stop flow entirely (success or failure)

**Common Patterns:**

```
High-Value Router:
├── Rule: loan_amount > 100000
├── On Match: Continue to premium processing
└── On No Match: Skip to standard processing

State-Based Routing:
├── Rule: state is in ["CA", "NV", "AZ"]  
├── On Match: Continue to West Coast team
└── On No Match: Skip to National team

Quality Gate:
├── Rule: appended.phone_verify.valid is true
├── On Match: Continue processing
└── On No Match: Stop - "Invalid phone"
```

**Configuration Options:**
- **Continue** - Proceed to next step
- **Skip to [step]** - Jump to named step
- **Stop Success** - End flow, mark successful
- **Stop Failure** - End flow, mark failed

### Enhancement Steps: The Value Adders

Enhancement steps call external [integrations](../integrations.md) to append data to your lead.

**How They Work:**
1. Call integration with lead data
2. Receive additional information
3. Append results to `appended.*` namespace
4. Data immediately available to subsequent steps

**Key Characteristics:**
- Non-blocking (timeouts don't stop flow)
- Results in `appended.{service_name}.*`
- Failed enhancements don't fail leads
- Can run expensive operations safely

**Common Enhancements:**

| Service | Appends | Available As |
|---------|---------|--------------|
| **TrustedForm Insights** | Full consent data | `appended.trustedform.*` |
| **Phone Intelligence** | Carrier, line type | `appended.phone_intel.*` |
| **Demographic Append** | Age, income, etc. | `appended.demographics.*` |
| **Business Lookup** | Company details | `appended.business.*` |

**Using Enhancement Data:**
```
After phone validation:
- appended.phone_intel.carrier = "Verizon"
- appended.phone_intel.line_type = "mobile"
- appended.phone_intel.prepaid = false

In next filter step:
- Rule: appended.phone_intel.line_type equals "mobile"
- Route mobile phones differently
```

### Recipient Steps: The Internal Handlers

Recipient steps handle internal notifications and data routing within your organization.

**Use Cases:**
- Email alerts to sales managers
- Webhook calls to internal systems
- Slack/Teams notifications
- Internal API updates
- Logging and monitoring

**Key Differences from Destinations:**
- Don't represent lead delivery to buyers
- Usually for internal use
- Don't affect lead acceptance
- Can't reject leads

**Common Patterns:**

```
Manager Alert:
├── Type: Email
├── When: High-value lead arrives
├── To: sales-manager@company.com
└── Include: Lead details + score

System Update:
├── Type: Webhook  
├── When: Every lead
├── To: Internal tracking API
└── Purpose: Update dashboards

Quality Alert:
├── Type: Slack
├── When: Low quality score
├── To: #lead-quality channel
└── Message: Review needed
```

### Destination Steps: The Delivery Points

Destination steps deliver leads to their final recipients - your CRM, dialer, or buyer's system.

**How They Differ:**
- Represent actual lead delivery
- Track success/failure per destination
- Can have multiple per flow
- Generate delivery events

**Delivery Patterns:**

**Single Destination:**
```
CRM Delivery:
├── System: Salesforce
├── Mapping: Standard fields
├── On Success: Lead ID returned
└── On Failure: Retry logic
```

**Multi-Destination (Waterfall):**
```
Premium Buyer:
├── Attempt delivery
├── If rejected → Continue
Standard Buyer A:
├── Attempt delivery  
├── If rejected → Continue
Standard Buyer B:
├── Final attempt
```

**Parallel Delivery:**
```
All destinations receive:
├── CRM System
├── Dialer Platform
├── Email System
└── Analytics Platform
```

## Step Execution Flow

### Sequential Processing

Steps execute in order unless routing changes the flow:

1. Step 1 executes
2. If continue → Step 2
3. If skip → Jump to named step
4. If stop → End processing

### Branching Logic

Filter steps enable complex branching:

```
Lead Flow:
├── Filter: Premium Check
│   ├── Yes → Premium Enhancement → Premium Buyer
│   └── No → Standard Check
│       ├── Yes → Standard Enhancement → Standard Buyers  
│       └── No → Basic Buyer
```

### Error Handling

Each step type handles errors differently:

| Step Type | Error Behavior |
|-----------|----------------|
| **Filter** | Error = No Match (continue/skip) |
| **Enhancement** | Error = No Data (continue anyway) |
| **Recipient** | Error = Logged (continue anyway) |
| **Destination** | Error = Failed Delivery (tracked) |

## Working with Step Data

### Variable Access

All steps can access:
- Original lead data: `lead.*`
- Source info: `source.*`
- Enhancement data: `appended.*`
- Flow metadata: `flow.*`

### Data Flow Between Steps

Data accumulates as leads progress:

```
Start: Basic lead data
  ↓
After Enhancement 1: + appended.service1.*
  ↓
After Enhancement 2: + appended.service2.*
  ↓
After Filter: Routing decision made
  ↓
At Destination: All accumulated data available
```

### Conditional Logic

Steps can use all available data:

```
Filter Step Rule Examples:
- lead.state equals "CA"
- appended.credit_score.value > 650
- appended.trustedform.age_seconds < 300
- lead.email.domain not equals "test.com"
```

## Best Practices

### Step Ordering

1. **Cheap filters first** - Simple rules before API calls
2. **Required enhancements early** - Data needed for decisions
3. **Optional enhancements later** - Nice-to-have data
4. **Destinations last** - After all processing

### Performance Optimization

- Set reasonable timeouts (3-5 seconds)
- Run enhancements in parallel when possible
- Filter before expensive operations
- Cache enhancement results when applicable

### Error Resilience

- Don't require enhancement success
- Have fallback routing for errors
- Log failures for monitoring
- Test timeout scenarios

### Clear Naming

Name steps descriptively:
- ✅ "Route CA Leads to West Coast"
- ✅ "Enhance with Phone Validation"
- ❌ "Filter 1"
- ❌ "Step 3"

## Common Step Patterns

### The Quality Ladder
```
1. Basic Quality Check (Filter)
2. If passed → Phone Validation (Enhancement)
3. If valid → Premium Buyer (Destination)
4. If invalid → Standard Buyer (Destination)
```

### The Enhancement Pipeline
```
1. TrustedForm Validation
2. Phone Intelligence  
3. Email Verification
4. Demographic Append
5. Lead Scoring
6. Deliver Enriched Lead
```

### The Distribution Network
```
1. Filter: Exclusive Buyer Check
2. If yes → Exclusive Buyer Only
3. If no → All Buyers Parallel:
   - Buyer A
   - Buyer B  
   - Buyer C
```

## Technical Notes

### Step Processing Performance
- Steps execute sequentially (not parallel)
- Each step typically: 50-3000ms
- Enhancements are the slowest
- Filters are near-instant
- Total time depends on step count

### Data Persistence
- All step results are persisted
- Available in events for analysis
- Enhancement data retained
- Full audit trail maintained

---

*The step processing phase is where your flow becomes truly yours. Through the thoughtful arrangement of filters, enhancements, and deliveries, you create a unique lead processing pipeline that matches your exact business needs.*