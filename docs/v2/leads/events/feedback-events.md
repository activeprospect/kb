---
title: Feedback Events
description: Track post-delivery outcomes including conversions, returns, and quality feedback
tags:
  - events
  - feedback
  - conversions
  - buyer-focused
  - analytics
  - quality-control
---

# Feedback Events

## Closing the Loop on Lead Quality

Feedback events complete the lead story. While delivery events tell you a lead reached the buyer, feedback events reveal what happened next - did they convert? Was it returned? This post-delivery intelligence drives optimization across your entire operation.

📍 **You are here**: Learning to track and use post-delivery feedback
📈 **What you'll master**: Conversion tracking, quality monitoring, and feedback loops
💡 **The outcome**: Data-driven quality improvements and stronger buyer relationships

## Understanding Feedback Events

### The Feedback Flow

Feedback arrives after delivery:

```
Lead delivered to buyer
    ↓
Time passes (minutes to days)
    ↓
Buyer processes lead
    ↓
feedback.received OR feedback.sent
    ↓
Quality and revenue updated
```

### Two Types of Feedback Events

**feedback.received**
- Buyer sends outcome data
- Automatic API updates
- Real-time quality signals

**feedback.sent**
- You update buyer outcomes
- Manual quality tracking
- Source performance data

## Feedback.Received Event

### Buyer-Initiated Feedback

When buyers report outcomes:

```json
{
  "event_type": "feedback.received",
  "timestamp": "2024-01-15T14:45:23.456Z",
  "lead_id": "lead_7K9mHpQR3x2B5N8j",
  "source": {
    "entity_id": "ent_5L2nK9mR3x8B4Q7p",
    "entity_name": "Premier Insurance Buyer",
    "type": "buyer_api"
  },
  "feedback": {
    "outcome": "converted",
    "reason": "Policy sold",
    "value": 450.00,
    "timestamp": "2024-01-15T14:42:00Z"
  },
  "original_delivery": {
    "timestamp": "2024-01-15T10:30:47Z",
    "price": 45.00,
    "time_to_feedback": "4h 14m 36s"
  },
  "impact": {
    "source_quality_score": "+5",
    "buyer_satisfaction": "positive",
    "revenue_recognized": true
  }
}
```

### Conversion Feedback

The best news you can get:

```yaml
Conversion Indicators:
  outcome: "converted"
  
Additional Data:
  - Sale amount
  - Product type
  - Agent assigned
  - Close time
  
What This Means:
  - Source delivered quality
  - Buyer made money
  - Pricing validated
  - Everyone wins
```

### Return Feedback

When leads don't work out:

```json
{
  "event_type": "feedback.received",
  "timestamp": "2024-01-15T11:30:00Z",
  "lead_id": "lead_8M1pL5nR2x6C3K9j",
  "feedback": {
    "outcome": "returned",
    "reason": "Invalid phone - disconnected",
    "credit_requested": true,
    "details": {
      "attempts": 3,
      "last_attempt": "2024-01-15T11:25:00Z",
      "specific_issue": "Number not in service"
    }
  },
  "resolution": {
    "credit_approved": true,
    "amount": 45.00,
    "source_notified": true
  }
}
```

### Quality Feedback

Detailed performance data:

```yaml
Quality Metrics Received:
  Contact Rate: 65%
  - Phone answered: Yes
  - Spoke to lead: Yes
  - Right party: No
  
Interest Level: Low
  - Product interest: 2/10
  - Buying timeline: None
  - Budget: Unclear
  
Lead Accuracy:
  - Name: Correct
  - Phone: Working but wrong person
  - Email: Bounced
  - Address: Incomplete
```

## Feedback.Sent Event

### Providing Feedback to Sources

When you update source quality:

```json
{
  "event_type": "feedback.sent",
  "timestamp": "2024-01-15T16:00:00Z",
  "lead_id": "lead_7K9mHpQR3x2B5N8j",
  "target": {
    "entity_id": "ent_3Q9wK5mN8B2xR7pL",
    "entity_name": "ABC Lead Gen",
    "type": "source"
  },
  "feedback": {
    "outcome": "quality_issue",
    "category": "data_accuracy",
    "details": {
      "issue": "Wrong phone numbers",
      "frequency": "15% of leads",
      "impact": "High return rate"
    }
  },
  "action_requested": "improve_validation"
}
```

### Feedback Types to Sources

What to communicate:

**Performance Updates**:
```yaml
Positive:
  - Conversion rates
  - Contact quality
  - Data accuracy
  - Buyer satisfaction

Negative:
  - Return reasons
  - Quality issues
  - Missing data
  - Compliance problems
```

**Specific Issues**:
```yaml
Data Problems:
  - Invalid phones (specify percentage)
  - Bounced emails (with examples)
  - Wrong geography (state mismatches)
  - Age discrepancies

Process Issues:
  - Duplicate rate too high
  - Consent not clear
  - Delay in delivery
  - Form technical problems
```

## Using Feedback Events

### Conversion Rate Analysis

Track real outcomes:

```yaml
30-Day Conversion Analysis:
  
Total Delivered: 10,000 leads
Feedback Received: 8,500 (85%)

Outcomes:
  Converted: 850 (10%)
  Contacted: 2,550 (30%) 
  No Contact: 3,400 (40%)
  Returned: 1,700 (20%)

By Source:
  Source A: 15% conversion
  Source B: 8% conversion
  Source C: 5% conversion
```

### Return Rate Management

Identify problem patterns:

```yaml
Return Analysis This Week:
  
Total Returns: 340
Return Rate: 3.4%

Top Return Reasons:
  1. Disconnected phone: 35%
  2. Wrong person: 25%
  3. No interest: 20%
  4. Already purchased: 15%
  5. Other: 5%

Action Items:
  - Phone validation for all sources
  - Better duplicate checking
  - Clearer interest qualification
```

### Quality Score Calculation

Build source rankings:

```yaml
Source Quality Score:
  
Components:
  - Delivery rate: 25%
  - Contact rate: 25%
  - Conversion rate: 30%
  - Return rate: 20%

Source A Score: 88/100
  - 95% delivery ✓
  - 75% contact ✓
  - 15% conversion ✓
  - 2% returns ✓

Source B Score: 72/100
  - 92% delivery ✓
  - 60% contact ⚠️
  - 8% conversion ⚠️
  - 5% returns ⚠️
```

### Feedback Loop Automation

Act on feedback automatically:

```yaml
Automated Actions:

High Returns from Source:
  → Reduce volume cap
  → Increase validation
  → Notify account manager
  
Low Contact Rate:
  → Check phone validation
  → Review acceptance criteria
  → Pause if under 50%
  
High Conversion:
  → Increase volume cap
  → Premium pricing tier
  → Request more leads
```

## Advanced Feedback Patterns

### Time-to-Feedback Analysis

How quickly feedback arrives:

```yaml
Feedback Timing:
  
Within 1 hour: 15%
  - Usually contact result
  - Quick disqualifications
  
1-24 hours: 45%
  - Initial contact attempts
  - Basic qualification
  
1-7 days: 30%
  - Sales cycle progress
  - Detailed outcomes
  
7-30 days: 10%
  - Final conversions
  - Long sales cycles
```

### Feedback by Buyer Type

Different buyers, different patterns:

```yaml
Live Transfer Buyers:
  - Feedback: Within minutes
  - Focus: Contact rate
  - Key metric: Transfer success
  
Lead Buyers:
  - Feedback: 24-48 hours
  - Focus: Contact + interest
  - Key metric: Qualification rate
  
Data Buyers:
  - Feedback: 7-30 days
  - Focus: Conversion
  - Key metric: ROI
```

### Seasonal Feedback Patterns

When quality varies:

```yaml
Insurance Vertical:
  
Q4 (Oct-Dec):
  - Higher contact rates
  - Faster feedback
  - More conversions
  
Q1 (Jan-Mar):
  - New year interest
  - Quality improves
  - Returns decrease
  
Summer (Jun-Aug):
  - Lower contact
  - Delayed feedback
  - Vacation impacts
```

## Feedback Integration

### With Source Management

Adjust source relationships:

```yaml
Source Performance Actions:

Excellent (>12% conversion):
  - Increase caps
  - Premium pricing
  - Priority processing
  - Long-term contract
  
Good (8-12% conversion):
  - Maintain current
  - Gradual increases
  - Standard pricing
  
Poor (<5% conversion):
  - Reduce caps
  - Require improvements
  - Enhanced validation
  - Probation period
```

### With Pricing Strategy

Value-based pricing:

```yaml
Dynamic Pricing Based on Feedback:

High Conversion Sources:
  - Pay 20% premium
  - Exclusive options
  - Volume bonuses
  
Average Sources:
  - Market pricing
  - Performance incentives
  - Quality bonuses
  
Low Quality:
  - Reduced pricing
  - Quality penalties
  - Improvement required
```

### With Buyer Relations

Strengthen partnerships:

```yaml
Buyer Feedback Actions:

Consistent Feedback:
  - Thank you notes
  - Priority support
  - First access to new sources
  
Quality Issues:
  - Proactive communication
  - Credit processing
  - Quality improvement plans
  
No Feedback:
  - Follow-up requests
  - API integration help
  - Feedback incentives
```

## Best Practices

### Feedback Collection

1. **Make It Easy**
   - Simple API endpoints
   - Clear documentation
   - Multiple methods
   - Batch options

2. **Incentivize Sharing**
   - Credits for feedback
   - Priority access
   - Better pricing
   - Quality bonuses

3. **Act on Data**
   - Visible improvements
   - Source coaching
   - Process updates
   - Communication

### Feedback Analysis

Regular review cycles:

```yaml
Daily:
  - Return rates
  - Major issues
  - Credit requests
  
Weekly:
  - Conversion trends
  - Source performance
  - Quality patterns
  
Monthly:
  - Full analysis
  - Score updates
  - Relationship reviews
  - Strategy adjustment
```

### Communication Strategy

How to share feedback:

```yaml
With Sources:
  - Regular reports
  - Specific examples
  - Improvement suggestions
  - Success celebration
  
With Buyers:
  - Thank for feedback
  - Show improvements
  - Request specifics
  - Build partnership
  
Internal Teams:
  - Quality dashboards
  - Action items
  - Trend alerts
  - Win tracking
```

## Common Challenges

### Limited Feedback

When buyers don't share:

```yaml
Solutions:
  - API integration assistance
  - Manual feedback forms
  - Incentive programs
  - Regular follow-ups
  
Workarounds:
  - Sample calling
  - Mystery shopping
  - Return tracking
  - Delivery monitoring
```

### Delayed Feedback

Long sales cycles:

```yaml
Strategies:
  - Interim milestones
  - Contact confirmation
  - Progress indicators
  - Partial feedback
  
Expectations:
  - Set realistic timelines
  - Track by vertical
  - Seasonal adjustments
  - Patience required
```

### Conflicting Feedback

When stories don't match:

```yaml
Investigation:
  - Check original data
  - Review delivery details
  - Contact both parties
  - Find truth
  
Resolution:
  - Document findings
  - Fair decisions
  - Process improvements
  - Prevent recurrence
```

## Your Next Steps

### Essential Actions
1. **Enable Feedback** - Set up API endpoints
2. **Track Metrics** - Build feedback dashboards
3. **Close Loops** - Act on feedback data
4. **Communicate** - Share insights regularly

### Advanced Topics
- **[Feedback API](/api/feedback)** - Technical implementation
- **[Quality Scoring](/guide/analytics/quality-scoring)** - Build algorithms
- **[Source Management](/guide/flow-management/source-optimization)** - Use feedback

### Related Events
- **[Source Events](/leads/events/source-events)** - Start of journey
- **[Recipient Events](/leads/events/recipient-events)** - Delivery details
- **[Event Analysis](/guide/leads/event-analysis)** - Deep insights

---

🔄 **Remember**: Feedback events close the quality loop. They transform one-way lead delivery into a two-way conversation about quality, creating accountability and driving continuous improvement throughout your ecosystem.

*Next: Explore [Advanced Event Analysis](/leads/events/advanced-patterns) for complex scenarios.*