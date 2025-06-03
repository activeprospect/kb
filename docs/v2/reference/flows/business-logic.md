---
title: Business Logic Phase
description: Where your configured rules determine lead fate through acceptance criteria, suppression lists, pricing, and caps
tags:
  - flows
  - reference
  - technical
  - business-logic
  - rules-focused
---

# Business Logic Phase

## Overview

The business logic phase is where your flow makes critical go/no-go decisions about each lead. This is your automated purchasing department, evaluating every lead against your business rules to determine:

- Should you accept this lead?
- Have you seen it before?
- What's it worth?
- Are you within limits?

Only leads that pass all gates continue to processing. Failed leads are rejected immediately with specific reasons.

## The Four Gates

Every lead must pass through four sequential gates:

### 1. Acceptance Criteria

Your first line of defense - rules that enforce your business requirements.

**What They Do:**
- Validate lead quality meets standards
- Enforce geographic restrictions  
- Require specific fields or values
- Check purchasing decision results

**Configuration Hierarchy:**
1. **Flow-level criteria** - Apply to ALL sources
2. **Source-level criteria** - Override for specific sources

**Example Rules:**
```
Flow Level:
- email is present
- phone_1.valid is true
- state is in ["CA", "TX", "FL"]

Source Level (Premium Vendor):
- loan_amount is greater than 50000
- credit_score is greater than 650
```

**Using Purchasing Decision Data:**
```
- trustedform_decisions.valid is true
- trustedform_decisions.age_seconds is less than 300
- phone_verification.connected is true
```

**Rejection Behavior:**
- First failed rule stops evaluation
- Specific rejection reason returned
- Source receives detailed feedback
- Lead marked as rejected in events

### 2. Suppression Lists

Prevent duplicate purchases and compliance violations.

**Types of Suppression:**

| List Type | Purpose | Configuration |
|-----------|---------|---------------|
| **Duplicate** | Prevent re-buying same lead | Fields to match, lookback period |
| **DNC** | Compliance with Do Not Call | Phone number lists |
| **Customer** | Don't buy existing customers | Email/phone matching |
| **Custom** | Business-specific exclusions | Any field combination |

**How Matching Works:**
1. Extract comparison values from lead
2. Check against historical data
3. Match = immediate rejection
4. No match = continue processing

**Configuration Example:**
```
Duplicate Check:
- Match on: email + phone_1
- Lookback: 30 days
- Result: "Duplicate lead - seen 5 days ago"

DNC Check:
- Match on: phone_1, phone_2, phone_3
- List: National DNC + State DNC
- Result: "Phone on DNC list"
```

**Advanced Features:**
- Partial matching (e.g., phone without area code)
- Multiple list priorities
- Time-based exclusions
- Pattern matching

### 3. Pricing Determination  

Calculate what this lead is worth using a sophisticated layered system.

**The Four Layers (First Match Wins):**

1. **Source Pricing Service**
   - External API for this source
   - Dynamic, real-time pricing
   - Based on lead quality/demand

2. **Source Pricing Rules**
   - Configured rules for this source
   - "Last match wins" evaluation
   - Source-specific adjustments

3. **Flow Pricing Service**
   - External API for flow default
   - Fallback dynamic pricing
   - Market-based rates

4. **Flow Pricing Rules**
   - Default rule-based pricing
   - Safety net pricing
   - Always configured

**Example Pricing Stack:**
```
1. Check: Premium Vendor API
   - Returns: $25 for high-quality lead
   - Result: Use $25

2. If no response, check: Source Rules
   - Rule: state = "CA" → $20
   - Rule: state = "TX" → $15  
   - Default: $10

3. If no match, check: Flow API
   - Market pricing service

4. If failed, use: Flow Rules
   - Default: $8
```

**Special Behavior:**
- Pricing uses "last match wins" (opposite of other rules)
- Multiple matching rules? Last one sets price
- Supports complex conditional pricing
- Price of $0 is valid (free leads)

### 4. Volume Caps

Control inventory and spending through sophisticated limits.

**Cap Types:**

| Type | Purpose | Example |
|------|---------|---------|
| **Simple** | Basic limit | 100 leads per day |
| **Conditional** | Rule-based limit | 50 CA leads per day |
| **Nested** | Hierarchical limits | 1000/month → 50/day |
| **Percentage** | Proportional limits | 20% from each source |

**Evaluation Logic:**
1. Check parent caps first
2. Then evaluate child caps
3. Most specific matching cap wins
4. First exceeded cap triggers rejection

**Advanced Configuration:**
```
Monthly Strategic Cap (Parent)
├── Daily Operational Cap
│   ├── Premium Daily (credit > 700)
│   ├── State Caps
│   │   ├── CA Daily: 25
│   │   ├── TX Daily: 30
│   │   └── Other Daily: 45
│   └── Source Caps
│       ├── Vendor A: 40%
│       └── Vendor B: 60%
└── Weekend Caps (different limits)
```

**Time Considerations:**
- Timezone-aware (configure per cap)
- Flexible periods (hour/day/week/month)
- Rolling windows supported
- Automatic reset at period end

## Evaluation Order Matters

The sequence is critical for efficiency and cost:

1. **Acceptance Criteria** - Reject bad quality immediately
2. **Suppression Lists** - Don't pay for duplicates
3. **Pricing** - Know the cost before checking limits
4. **Volume Caps** - Manage inventory with known prices

This order ensures you:
- Don't price leads you'll reject
- Don't cap leads you won't accept
- Get clear rejection reasons
- Optimize processing speed

## Decision Outcomes

After business logic evaluation:

### Accepted Leads
- All gates passed successfully
- Price is set and recorded
- Lead continues to [Step Processing](step-processing.md)
- Source tracking updated

### Rejected Leads  
- Failed at specific gate
- Rejection reason recorded
- Source receives immediate feedback
- No further processing
- Events capture full decision trail

**Common Rejection Reasons:**
- "Missing required field: email"
- "State not serviced: NY"  
- "Duplicate lead - seen 14 days ago"
- "Daily cap exceeded: CA leads"
- "Invalid consent certificate"

## Using Business Logic Data

Data from this phase is available throughout the flow:

**In Events:**
- Acceptance outcome and reasons
- Suppression check results
- Final price determination
- Cap status at time of lead

**In Reporting:**
- Acceptance rates by source
- Rejection reason analysis
- Price distribution
- Cap fill rates

**For Sources:**
- Real-time acceptance feedback
- Specific rejection reasons
- Helps improve quality

## Best Practices

### Acceptance Criteria
- Start permissive, tighten over time
- Use flow-level for universal rules
- Source-level for vendor-specific needs
- Always provide clear rejection reasons

### Suppression Lists
- 30+ day lookback for duplicates
- Combine email + phone for matching
- Regular DNC list updates
- Monitor suppression rates

### Pricing Strategy
- Use rules for stable pricing
- Services for dynamic markets
- Source-specific when negotiated
- Always have fallback pricing

### Volume Management
- Set conservative initial caps
- Use nested caps for complex distribution
- Monitor fill rates daily
- Adjust based on quality metrics

## Performance Notes

Business logic is highly optimized:
- Rules evaluate in microseconds
- Suppression uses indexed lookups
- Pricing caches when possible
- Caps use atomic counters

Total phase time: typically 10-50ms

---

*The business logic phase is where your flow's intelligence shines. Well-configured gates ensure you only pay for leads that meet your exact requirements while providing clear feedback to improve quality over time.*