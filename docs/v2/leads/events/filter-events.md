---
title: Filter Events
description: Understanding how filter steps make routing decisions and control lead flow
tags:
  - events
  - filter
  - routing
  - flow-control
  - business-logic
---

# Filter Events

## The Traffic Controllers of Your Lead Flow

Filter events capture the decision points where leads are routed, stopped, or allowed to continue. They're the record of every "if this, then that" decision in your flow, providing visibility into why leads went where they did (or didn't).

📍 **You are here**: Learning how filter decisions are tracked
🚦 **What you'll understand**: Routing logic, filter outcomes, and flow control
🎯 **The outcome**: Smarter routing and better flow optimization

## Understanding Filter Events

### What Are Filter Events?

Filter events record when a filter step evaluates a lead:

```
Lead reaches filter step
    ↓
Rules evaluated
    ↓
filter.passed OR filter.failed
    ↓
Lead routed accordingly
```

Unlike source/recipient events that mark major milestones, filter events track the micro-decisions that shape a lead's path.

### Why Filter Events Matter

They answer critical questions:
- Why did this lead go to Buyer A instead of Buyer B?
- What stopped this lead from reaching any buyer?
- How many leads are failing quality checks?
- Which routing rules need adjustment?

## Filter.Passed Event

### When Filters Allow Progress

Lead meets filter criteria:

```json
{
  "event_type": "filter.passed",
  "timestamp": "2024-01-15T10:30:46.123Z",
  "lead_id": "lead_7K9mHpQR3x2B5N8j",
  "filter": {
    "step_id": "step_8N3mK5pL2Q9wR4xB",
    "name": "High Value Lead Filter",
    "position": 3
  },
  "outcome": "passed",
  "duration_ms": 12,
  "evaluation": {
    "rules_checked": 4,
    "all_passed": true,
    "details": [
      {
        "rule": "lead_score >= 80",
        "result": true,
        "actual_value": 85
      },
      {
        "rule": "state IN ('CA', 'TX', 'FL')",
        "result": true,
        "actual_value": "CA"
      }
    ]
  },
  "routing": {
    "next_step": "Premium Buyer Delivery",
    "path": "high-value"
  }
}
```

### Key Information in Passed Events

**What Passed**:
- Which rules evaluated to true
- Actual values that satisfied conditions
- Time taken to evaluate

**Where Next**:
- Next step in the flow
- Routing path taken
- Priority or exclusivity

## Filter.Failed Event

### When Filters Block Progress

Lead fails filter criteria:

```json
{
  "event_type": "filter.failed",
  "timestamp": "2024-01-15T10:30:46.456Z",
  "lead_id": "lead_9L2nM4kP5R8xQ3wB",
  "filter": {
    "step_id": "step_8N3mK5pL2Q9wR4xB",
    "name": "High Value Lead Filter",
    "position": 3
  },
  "outcome": "failed",
  "duration_ms": 8,
  "evaluation": {
    "rules_checked": 2,
    "first_failure": "lead_score >= 80",
    "details": [
      {
        "rule": "lead_score >= 80",
        "result": false,
        "actual_value": 65,
        "reason": "Score 65 is less than required 80"
      }
    ]
  },
  "routing": {
    "action": "continue",
    "next_step": "Standard Buyer Router",
    "path": "standard-value"
  }
}
```

### Failed Event Insights

**Why It Failed**:
- First rule that failed (short-circuit)
- Expected vs actual values
- Clear failure reason

**What Happens Next**:
- Continue to next step
- Stop processing
- Route to alternative path

## Types of Filter Steps

### Quality Filters

Ensure lead meets standards:

```yaml
Filter: Quality Gate
Purpose: Block low-quality leads

Common Rules:
  - Email is valid
  - Phone is valid
  - Not on suppression list
  - Age >= 18

Event Patterns:
  - High pass rate (>90%) = Good sources
  - Low pass rate (<70%) = Quality issues
```

### Routing Filters

Direct leads to right destination:

```yaml
Filter: State-Based Router
Purpose: Route by geography

Rules Example:
  - IF state IN ('CA', 'NV', 'AZ') → West Coast Buyer
  - IF state IN ('NY', 'NJ', 'CT') → East Coast Buyer
  - ELSE → National Buyer

Event Analysis:
  - See geographic distribution
  - Identify routing imbalances
  - Optimize buyer allocation
```

### Business Hours Filters

Time-based routing:

```yaml
Filter: Business Hours Check
Purpose: Route based on time

Rules:
  - IF hour >= 9 AND hour < 17 → Live Transfer
  - IF day IN ('Sat', 'Sun') → Email Only
  - ELSE → Voicemail System

Event Insights:
  - Volume by time of day
  - After-hours lead handling
  - Weekend patterns
```

### Value-Based Filters

Segment by lead quality/value:

```yaml
Filter: Lead Scoring Router
Purpose: Premium leads get special treatment

Tiers:
  - Score >= 90 → Exclusive buyer + Premium price
  - Score 70-89 → Standard buyers + Auction
  - Score < 70 → Budget buyers only

Value Tracking:
  - Average score by source
  - Revenue by tier
  - Conversion by score range
```

## Filter Event Patterns

### Sequential Filtering

Filters often work in sequence:

```yaml
Lead Journey:
1. Basic Validation Filter
   - Email/phone valid
   - Event: filter.passed
   
2. Duplicate Check Filter
   - Not seen in 30 days
   - Event: filter.passed
   
3. Geographic Filter
   - Service available in state
   - Event: filter.passed
   
4. Value Segmentation Filter
   - High value detected
   - Event: filter.passed
   
5. → Routed to Premium Buyer
```

### Parallel Filtering

Or split into multiple paths:

```yaml
After Enhancement:
         Lead
           |
    ┌──────┴──────┐
    |             |
Insurance     Home Services
Filter        Filter
    |             |
 (passed)      (failed)
    |             |
Insurance     Continue
Buyers        Flow
```

## Using Filter Events

### Flow Optimization

Identify bottlenecks:

```yaml
Filter Performance Analysis:
  
Quality Gate:
  - Pass rate: 92%
  - Avg time: 8ms
  - Status: Healthy ✓

Geographic Filter:
  - Pass rate: 45%
  - Avg time: 5ms
  - Status: Review needed ⚠️
  
Value Filter:
  - Pass rate: 73%
  - Avg time: 15ms
  - Status: Normal ✓

Action: Why are 55% failing geography?
```

### Rule Effectiveness

Measure rule impact:

```yaml
Rule Analysis for "High Value Filter":

"lead_score >= 80"
  - Tested: 10,000 times
  - Passed: 3,500 (35%)
  - Failed: 6,500 (65%)
  
"income > 75000"
  - Tested: 3,500 times
  - Passed: 2,800 (80%)
  - Failed: 700 (20%)

Insight: Score is primary filter
Recommendation: Adjust threshold?
```

### Routing Distribution

Balance lead flow:

```yaml
Router Event Summary (Today):

Premium Path:
  - Attempts: 1,000
  - Passed: 350 (35%)
  - Revenue: $17,500

Standard Path:
  - Attempts: 650
  - Passed: 500 (77%)
  - Revenue: $15,000

Budget Path:
  - Attempts: 150
  - Passed: 150 (100%)
  - Revenue: $3,000

Observation: Maybe too strict for premium?
```

## Advanced Filter Analysis

### Filter Cascade Analysis

Track through multiple filters:

```yaml
Lead Funnel via Events:
  
Started: 10,000 leads
  ↓
After Quality Filter: 9,200 (92%)
  ↓
After Duplicate Filter: 8,500 (92% of previous)
  ↓
After Geographic Filter: 6,800 (80% of previous)
  ↓
After Value Filter: 5,000 (74% of previous)
  ↓
Final Delivery: 4,750 (95% of previous)

Biggest Drop: Geographic filter
Action: Review geographic criteria
```

### Time-Based Patterns

When filters behave differently:

```yaml
Filter Performance by Hour:

Business Hours (9 AM - 5 PM):
  - Quality pass rate: 94%
  - Value pass rate: 78%
  
Evening (5 PM - 9 PM):
  - Quality pass rate: 88%
  - Value pass rate: 71%
  
Late Night (9 PM - 9 AM):
  - Quality pass rate: 76%
  - Value pass rate: 58%

Insight: Quality drops after hours
```

### Source-Specific Patterns

How sources perform against filters:

```yaml
By Source Analysis:

Source A:
  - Quality: 98% pass
  - Geographic: 89% pass
  - Value: 82% pass
  - Overall: 71% reach delivery

Source B:
  - Quality: 84% pass
  - Geographic: 92% pass
  - Value: 43% pass
  - Overall: 33% reach delivery

Action: Source B needs quality discussion
```

## Filter Event Best Practices

### Design Principles

1. **Order Matters**
   - Cheap filters first (basic validation)
   - Expensive filters last (enhancement-based)
   - Most likely to fail first

2. **Clear Names**
   - "California Leads Only" not "Filter 1"
   - "High Value Router" not "Step 3"
   - Names appear in events

3. **Measurable Rules**
   - Use specific thresholds
   - Avoid vague conditions
   - Track actual vs expected

### Monitoring Strategy

What to watch:

```yaml
Daily Monitoring:
  - Pass rates by filter
  - Processing times
  - Error rates
  - Volume changes

Weekly Analysis:
  - Rule effectiveness
  - Routing balance
  - Source patterns
  - Revenue impact

Monthly Review:
  - Filter optimization
  - Rule adjustments
  - Flow restructuring
```

### Common Issues

**"Too many leads failing"**
- Review filter criteria
- Check source quality
- Analyze fail reasons
- Consider rule relaxation

**"Uneven routing distribution"**
- Check filter logic
- Review actual values
- Balance thresholds
- Add randomization

**"Slow filter processing"**
- Complex rules?
- Too many conditions?
- Enhancement delays?
- Consider simplification

## Technical Details

### Event Data Structure

What's captured:

```yaml
Core Fields:
  - event_type: "filter.passed" or "filter.failed"
  - timestamp: When evaluated
  - duration_ms: Processing time
  - lead_id: Which lead
  - filter: Step details

Evaluation Details:
  - Rules checked
  - Results for each
  - Actual values
  - Failure reasons

Routing Outcome:
  - Next step
  - Path taken
  - Special flags
```

### Performance Considerations

Keep filters fast:

```yaml
Fast Operations (< 10ms):
  - Simple comparisons
  - Field existence checks
  - List membership
  - Basic math

Slower Operations (10-50ms):
  - Regex matching
  - Complex calculations
  - Multiple conditions
  - Nested logic

Avoid in Filters:
  - External API calls
  - Database lookups
  - Heavy computation
```

## Your Next Steps

### Essential Reading
1. **[Feedback Events](/leads/events/feedback-events)** - Post-delivery tracking
2. **[Filter Steps Guide](/flows/flow-steps/filter-steps)** - Configuration details
3. **[Rules Reference](/reference/rules)** - Rule syntax mastery

### Common Tasks
- Analyze filter performance
- Optimize routing logic
- Debug failed filters
- Balance lead distribution

---

🚦 **Remember**: Filter events are your flow's decision history. They show not just what happened, but why. Use them to understand your routing logic, optimize performance, and ensure leads reach their ideal destination.

*Next: Learn about [Feedback Events](/leads/events/feedback-events) for conversion tracking.*