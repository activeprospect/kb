---
title: Flow Steps
description: The processing stations where your leads are validated, enhanced, and delivered
tags:
  - flow-steps
  - processing
  - core-functionality
---

# Flow Steps

## The Assembly Line of Lead Processing

Flow steps are the individual processing stations in your lead pipeline. Each step performs a specific operation - validating data, checking conditions, enhancing with additional information, or delivering to recipients. Like stations on an assembly line, steps execute in sequence, transforming raw leads into qualified, enhanced, delivered outcomes.

📍 **You are here**: Learning the building blocks of lead processing
🔧 **What you'll master**: Step types, configuration, and optimization
⚡ **The power**: Transform simple flows into sophisticated operations

## Understanding Flow Steps

### What Is a Step?

A step is a discrete operation that:
- Receives a lead with its current data
- Performs one specific action
- Returns success, failure, or error
- Passes the lead to the next step (or stops it)

Think of steps as specialized workers, each expert at their specific task.

### The Step Processing Model

```
Lead enters step → Step executes → Outcome determined → Next action
        ↓               ↓                ↓                  ↓
   Current data    Validation       Success/Fail      Continue/Stop
                   Enhancement         Error           Retry/Skip
                    Delivery
```

### Step Outcomes

Every step results in one of three outcomes:

**Success** ✅
- Operation completed successfully
- Lead continues to next step
- Data may be modified/enhanced

**Failure** ❌
- Business logic rejection
- Lead may stop or continue
- Specific reason provided

**Error** ⚠️
- Technical problem occurred
- May trigger retry logic
- Different from business failure

## Types of Flow Steps

### Filter Steps
**Purpose**: Make routing decisions based on rules
**Speed**: Lightning fast (no external calls)
**Use cases**: Validation, routing, business logic

[Learn more →](/flows/flow-steps/filter-steps)

### Enhancement Steps  
**Purpose**: Add valuable data from external sources
**Speed**: Depends on service (100-1000ms typical)
**Use cases**: Data append, verification, scoring

[Learn more →](/flows/flow-steps/enhancement)

### Recipient Steps
**Purpose**: Deliver leads to buyers or systems
**Speed**: Depends on endpoint (200-2000ms typical)
**Use cases**: CRM delivery, buyer distribution, notifications

[Learn more →](/flows/flow-steps/recipient-steps)

### Integration Steps
**Purpose**: Custom processing with external services
**Speed**: Varies widely
**Use cases**: Custom scoring, proprietary data, special handling

[Learn more →](/flows/flow-steps/custom-integrations)

## Step Configuration Basics

### Common Settings

Every step type shares core configuration:

**Identity**:
```yaml
Name: "Check Duplicate Email"
Description: "Prevent duplicate submissions within 30 days"
Tags: ["validation", "email", "duplicates"]
```

**Behavior**:
```yaml
On Success: Continue to next step
On Failure: Stop processing
On Error: Retry 3 times, then fail
Timeout: 5000ms
```

**Conditions**:
```yaml
Execute When: lead.value > 50
Skip When: source.type = "test"
```

### Step Positioning

Where you place steps matters:

**Early Steps** (Left side):
- Data validation
- Duplicate checking  
- Basic filters
- Quick decisions

**Middle Steps**:
- Enhancement
- Scoring
- Complex routing
- Business logic

**Late Steps** (Right side):
- Final formatting
- Delivery
- Notifications
- Cleanup

### Step Dependencies

Steps can reference data from previous steps:

```yaml
Step 1: Phone Validation
Appends: phone.carrier, phone.type

Step 2: Carrier-Based Routing
Uses: appended.phone.carrier
Routes: Based on carrier preferences

Step 3: SMS Delivery
Uses: Previous routing decision
Formats: Based on carrier requirements
```

## Building Effective Step Sequences

### The Validation Pipeline

Start with data quality:

```
Email Valid? → Phone Valid? → No Duplicates? → Required Fields? → Continue
     ↓              ↓               ↓                 ↓
   Reject         Reject          Reject            Reject
```

**Why this order**:
1. Email/Phone = Most common failures
2. Duplicates = Expensive to allow through
3. Other fields = Less critical

### The Enhancement Pipeline

Add value intelligently:

```
Basic Enhancement → Conditional Enhancement → Premium Enhancement
        ↓                     ↓                      ↓
  Always needed        If score > 50          If buyer requires
  (Phone carrier)     (Demographics)         (Full profile)
```

**Cost optimization**:
- Only enhance what you'll use
- Conditional enhancement saves money
- Order by cost (cheap → expensive)

### The Delivery Pipeline

Maximize acceptance:

```
Format Data → Primary Delivery → Backup Delivery → Archive
      ↓              ↓                 ↓              ↓
  Map fields    Try buyer A       If failed      Always
                                  Try buyer B
```

**Reliability patterns**:
- Always have backup options
- Archive everything
- Track all attempts

## Step Logic and Control

### Conditional Execution

Control when steps run:

**Time-Based**:
```yaml
Execute When: 
  - Day of week: Monday-Friday
  - Hour: 9-17 (business hours)
  - Timezone: America/New_York
```

**Value-Based**:
```yaml
Execute When:
  - loan_amount > 50000
  - state IN ["CA", "TX", "FL"]
  - source.tier = "premium"
```

**Previous Outcome-Based**:
```yaml
Execute When:
  - previous_step.outcome = "success"
  - enhancement.score > 70
  - any_delivery.success = false
```

### Branching Logic

Create alternate paths:

**Success/Failure Branches**:
```
Phone Validation
├─ Success → Enhancement → Delivery
└─ Failure → Email-Only Delivery
```

**Multi-Path Routing**:
```
Lead Scoring
├─ Score > 80 → Premium Buyer
├─ Score 50-80 → Standard Buyers
└─ Score < 50 → Remediation
```

### Error Handling

Configure retry strategies:

**Simple Retry**:
```yaml
On Error:
  Retry: 3 times
  Delay: 1 second exponential backoff
  Final: Mark as error
```

**Smart Retry**:
```yaml
On Error:
  If: Timeout → Retry with longer timeout
  If: 429 Error → Retry after rate limit reset
  If: 500 Error → Retry with backoff
  If: 400 Error → Don't retry (bad data)
```

## Step Performance

### Speed Optimization

Make flows fast:

**Parallel Processing** (When Possible):
```
Instead of:
Enhancement A → Enhancement B → Enhancement C (1500ms total)

Configure:
Enhancement A ┐
Enhancement B ├→ Continue (500ms total)
Enhancement C ┘
```

**Early Termination**:
```
Cheap Filter → Expensive Enhancement → Delivery
      ↓
   80% filtered
   (Save enhancement costs)
```

**Caching**:
- Cache enhancement results
- Reuse for similar leads
- Set appropriate TTL

### Resource Management

Control costs and load:

**Rate Limiting**:
```yaml
Step: Premium Enhancement
Rate Limit: 100 per minute
Queue: Up to 1000 leads
Overflow: Skip enhancement
```

**Cost Controls**:
```yaml
Daily Budget: $100
Cost Per Call: $0.10
Daily Limit: 1000 calls
When Exceeded: Use cached data
```

## Common Step Patterns

### Data Quality Pipeline
```
1. Email Validation (Filter)
2. Phone Validation (Filter)
3. Address Standardization (Enhancement)
4. Duplicate Check (Filter)
5. Required Fields Check (Filter)
```

### Lead Scoring Pipeline
```
1. Basic Scoring (Filter)
2. Demographic Append (Enhancement)
3. Advanced Scoring (Filter)
4. Score-Based Routing (Filter)
```

### Multi-Buyer Distribution
```
1. Premium Buyer (Recipient)
2. If Rejected → Standard Buyer A (Recipient)
3. If Rejected → Standard Buyer B (Recipient)
4. If Rejected → Bulk Buyers (Recipient)
```

### Compliance Pipeline
```
1. TrustedForm Check (Enhancement)
2. Consent Validation (Filter)
3. Suppression Check (Filter)
4. State Compliance (Filter)
```

## Step Monitoring

### Key Metrics

Track step health:

**Performance Metrics**:
- Execution time (avg, p95, p99)
- Success rate
- Error rate
- Timeout frequency

**Business Metrics**:
- Filter pass rate
- Enhancement hit rate
- Delivery acceptance rate
- Cost per step

### Debugging Steps

Use events to troubleshoot:

**What to Check**:
1. Input data to step
2. Step configuration
3. Execution duration
4. Output/appended data
5. Error messages

**Common Issues**:
- Timeout too short
- Wrong field references
- Missing authentication
- Rate limits hit

## Best Practices

### Design Principles

1. **Single Responsibility**
   - Each step does ONE thing
   - Clear, descriptive names
   - Easy to understand

2. **Fail Fast**
   - Cheap filters first
   - Quick validations early
   - Save expensive ops for qualified leads

3. **Be Resilient**
   - Handle errors gracefully
   - Always have fallbacks
   - Monitor everything

4. **Optimize for Cost**
   - Skip unnecessary enhancements
   - Cache when possible
   - Use conditions wisely

### Maintenance

**Regular Reviews**:
- Check step performance weekly
- Review error rates
- Optimize slow steps
- Remove unused steps

**Documentation**:
- Document why each step exists
- Note any special configuration
- Track dependencies
- Record cost implications

## Your Next Steps

### Essential Reading
1. **[Filter Steps](/flows/flow-steps/filter-steps)** - Master routing and validation
2. **[Enhancement Steps](/flows/flow-steps/enhancement)** - Add valuable data
3. **[Recipient Steps](/flows/flow-steps/recipient-steps)** - Perfect your delivery

### Quick Wins
1. Review your step execution times
2. Check error rates by step
3. Optimize one slow step
4. Add one helpful filter

### Advanced Topics
- **[Parallel Processing](/help-guide/advanced/parallel-steps)** - Speed up flows
- **[Custom Steps](/help-guide/development/custom-steps)** - Build your own
- **[Step Analytics](/help-guide/analytics/step-performance)** - Deep performance analysis

---

🎯 **Remember**: Great flows aren't about having many steps - they're about having the right steps in the right order. Start simple, measure everything, optimize based on data.

*Ready to dive deeper? Start with [Filter Steps](/flows/flow-steps/filter-steps) - the fastest way to improve lead quality.*