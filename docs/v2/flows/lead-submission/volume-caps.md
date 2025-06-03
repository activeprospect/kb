---
title: Volume Caps
description: Control lead flow intelligently with flexible volume caps and distribution rules
tags:
  - volume-caps
  - capacity-management
  - flow-control
---

# Volume Caps

## Your Flow Control System

Volume caps are the traffic controllers of your lead operation. They ensure you never receive more leads than you can handle, prevent budget overruns, and maintain quality by controlling quantity. Like a smart valve system, caps can throttle flow based on multiple conditions - time, source, geography, or any criteria you define.

📍 **You are here**: Learning to control lead volume with precision
🚦 **What you'll master**: Cap types, strategies, and intelligent distribution
💡 **Key insight**: The right caps protect your business and improve lead quality

## Understanding Volume Caps

### What Are Volume Caps?

Volume caps are configurable limits that control how many leads you accept based on:
- Time period (hourly, daily, monthly)
- Source (per vendor limits)
- Criteria (state, product type, quality tier)
- Combinations (daily caps per state per source)

Think of them as smart quotas that automatically enforce your business rules.

### Why Caps Matter

**For Buyers**:
- Control spend precisely
- Match sales capacity
- Test new sources safely
- Maintain quality standards

**For Sellers**:
- Set realistic expectations
- Distribute fairly
- Prevent oversupply
- Manage buyer relationships

**Real Impact**: One insurance buyer reduced monthly spend by $45,000 while increasing conversion rate by 15% through intelligent capping.

## Types of Volume Caps

### Time-Based Caps

Control flow over time periods:

**Daily Caps**:
```yaml
Type: Daily
Limit: 500 leads
Reset: Midnight (account timezone)
Behavior: Reject when exceeded
```

**Monthly Caps**:
```yaml
Type: Monthly  
Limit: 10,000 leads
Reset: 1st of month
Behavior: Queue for next month
```

**Rolling Window Caps**:
```yaml
Type: Rolling
Window: 24 hours
Limit: 100 leads
Behavior: Reject oldest first
```

**Business Hours Caps**:
```yaml
Type: Hourly
Limit: 50 leads
Active: Mon-Fri 9am-5pm
Behavior: Queue outside hours
```

### Source-Based Caps

Control by lead origin:

**Per-Source Limits**:
```yaml
Source A: 100/day
Source B: 200/day
Source C: 50/day
Total: 300/day (combined)
```

**Source Quality Tiers**:
```yaml
Tier 1 Sources: 70% of daily volume
Tier 2 Sources: 20% of daily volume  
Tier 3 Sources: 10% of daily volume
```

### Criteria-Based Caps

Cap by lead characteristics:

**Geographic Caps**:
```yaml
California: 200/day
Texas: 150/day
Florida: 100/day
All others: 50/day combined
```

**Product Type Caps**:
```yaml
Auto Insurance: 300/day
Home Insurance: 200/day
Life Insurance: 100/day
```

**Quality-Based Caps**:
```yaml
Premium (score > 80): Unlimited
Standard (score 50-80): 500/day
Marginal (score < 50): 100/day
```

### Nested Caps

Combine multiple cap dimensions:

**Source + Geography**:
```yaml
Source A:
  California: 50/day
  Texas: 30/day
  Other: 20/day
  
Source B:
  California: 100/day
  Texas: 50/day
  Other: None
```

**Time + Quality**:
```yaml
Peak Hours (9am-5pm):
  Premium: 100/hour
  Standard: 50/hour
  
Off Hours:
  Premium: 20/hour
  Standard: 10/hour
```

## Implementing Cap Strategies

### Basic Protection

Start with simple caps:

**Test Mode**:
```yaml
# For new sources
Daily: 10 leads
Purpose: Quality verification
Duration: First week
Then: Increase if quality good
```

**Ramp-Up Strategy**:
```yaml
Week 1: 50/day
Week 2: 100/day
Week 3: 200/day
Week 4: Full volume
```

### Capacity Matching

Align caps with sales capacity:

**Sales Team Sizing**:
```yaml
Reps: 20
Leads per rep per day: 25
Total capacity: 500/day

Cap configuration:
- Total daily: 500
- Hourly: 50 (smooth distribution)
- Per source: Proportional to quality
```

**Shift-Based Caps**:
```yaml
Morning shift (8am-12pm): 200 leads
Afternoon shift (12pm-5pm): 200 leads
Evening shift (5pm-8pm): 100 leads
```

### Budget Control

Manage spend through caps:

**Daily Budget Caps**:
```yaml
Budget: $1,000/day
Average CPL: $20
Daily cap: 50 leads

With variable pricing:
- Premium leads ($30): 20/day
- Standard leads ($20): 30/day
- Economy leads ($10): 50/day
```

**Monthly Budget Distribution**:
```yaml
Month budget: $30,000
Business days: 22
Daily budget: $1,364
Daily cap: Calculate based on actual CPL
```

### Quality Preservation

Use caps to maintain quality:

**Source Diversity**:
```yaml
No single source > 30% of daily volume
Ensures: Multiple lead sources
Prevents: Over-reliance
```

**Time Distribution**:
```yaml
Hourly cap: Daily cap / 10
Ensures: Steady flow
Prevents: Batch processing issues
```

**Quality Thresholds**:
```yaml
If daily acceptance rate < 70%:
  Reduce cap by 50%
  Alert operations team
  Review source quality
```

## Advanced Cap Techniques

### Dynamic Caps

Adjust caps based on performance:

**Conversion-Based**:
```yaml
If yesterday's conversion > 10%:
  Increase cap by 20%
Else if conversion < 5%:
  Decrease cap by 20%
Else:
  Maintain current cap
```

**Capacity-Based**:
```yaml
Check CRM every hour:
If unworked leads > 100:
  Pause all sources
Else if unworked < 20:
  Increase hourly cap by 50%
```

**Quality-Based**:
```yaml
Track 7-day contact rate:
If contact rate > 60%:
  Source cap = 150% of base
Else if contact rate < 40%:
  Source cap = 50% of base
```

### Cap Groups

Share caps across multiple entities:

**Partner Networks**:
```yaml
Group: "Network A Partners"
Members: [Source1, Source2, Source3]
Shared cap: 500/day
Distribution: First-come-first-served
```

**Geographic Pools**:
```yaml
Group: "West Coast"
States: [CA, OR, WA]
Combined cap: 1000/day
Individual state caps still apply
```

### Overflow Handling

What happens when caps are hit:

**Queue for Later**:
```yaml
Cap exceeded behavior: Queue
Queue limit: 1000 leads
Queue duration: 24 hours
Process when: Cap resets
```

**Redirect to Alternate**:
```yaml
Primary flow cap: 500/day
Overflow to: Secondary flow
Secondary criteria: May be less strict
Secondary pricing: May be lower
```

**Smart Rejection**:
```yaml
Soft reject: "Cap temporarily reached, retry in 1 hour"
Hard reject: "Monthly cap reached, retry next month"
Alternative: "Accept ping, compete in auction"
```

## Monitoring and Alerts

### Cap Utilization Tracking

Monitor how caps are used:

**Key Metrics**:
- Current count vs cap
- Utilization percentage
- Time to cap (velocity)
- Historical patterns

**Visual Indicators**:
```
Daily Cap: [████████░░] 80% (400/500)
Hourly Cap: [██████████] 100% (50/50) 🚫
CA Cap: [███░░░░░░░] 30% (60/200)
```

### Alert Configuration

Proactive notifications:

**Approaching Cap**:
```yaml
Alert when: 80% of cap reached
Message: "Daily cap 80% utilized (400/500)"
Action: Review and potentially increase
```

**Cap Reached**:
```yaml
Alert when: Cap reached
Message: "Daily cap reached, leads being rejected"
Include: Current stats and recommendations
```

**Unusual Patterns**:
```yaml
Alert when: Cap hit before noon (usually 3pm)
Message: "Unusual volume spike detected"
Action: Investigate source volumes
```

### Reporting on Caps

Analyze cap effectiveness:

**Daily Report**:
```
Date: 2024-01-15
Total Cap: 500
Utilized: 487 (97.4%)
Rejected for cap: 28
By Source:
  Source A: 150/150 (capped at 2:30pm)
  Source B: 187/200 
  Source C: 150/150 (capped at 4:45pm)
```

**Optimization Opportunities**:
```
Sources hitting caps early: Increase quality criteria
Sources never hitting caps: Investigate quality
Overall under-utilization: Increase caps or add sources
Consistent cap hits: Consider capacity expansion
```

## Common Cap Patterns

### For Lead Buyers

**Conservative Testing**:
```yaml
New source first month:
- Week 1: 10/day
- Week 2: 25/day
- Week 3: 50/day
- Week 4: 100/day
- Month 2+: Based on performance
```

**Sales Capacity Matching**:
```yaml
Inside Sales Team: 300/day
Field Sales Team: 100/day
Web Leads: 250/day to inside
Phone Verified: 150/day to field
```

**Budget Protection**:
```yaml
Monthly budget: $50,000
Failsafe daily cap: $2,000 worth
Source caps: Proportional to ROI
Quality override: Premium leads exempt
```

### For Lead Sellers

**Fair Distribution**:
```yaml
Total buyer capacity: 1000/day
Distribution:
  Buyer A (exclusive): 40%
  Buyer B (semi-exclusive): 30%
  Buyers C,D,E (shared): 30% split
```

**Time Zone Management**:
```yaml
East Coast buyers: 500 leads 8am-5pm EST
West Coast buyers: 500 leads 8am-5pm PST
Overlap hours: Proportional distribution
```

**Quality Tiers**:
```yaml
Premium buyers: First 200 leads/day
Standard buyers: Next 500 leads/day
Overflow buyers: Remaining volume
```

## Troubleshooting Caps

### Common Issues

**"Good leads being rejected"**

*Cause*: Caps too restrictive
*Solution*:
1. Review cap utilization patterns
2. Identify peak times
3. Increase caps or redistribute
4. Consider queuing vs rejecting

**"Budget overruns despite caps"**

*Cause*: Caps not aligned with pricing
*Solution*:
1. Calculate true capacity: Budget / Average CPL
2. Set caps slightly below calculation
3. Account for price variations
4. Monitor daily spend

**"Uneven lead distribution"**

*Cause*: First-come-first-served exhaustion
*Solution*:
1. Implement hourly caps
2. Use percentage-based distribution
3. Reserve capacity for quality sources
4. Stagger source processing

### Best Practices

**Design Principles**:

1. **Start Conservative**
   - Easier to increase than decrease
   - Test quality before volume
   - Protect budget and capacity

2. **Layer Your Caps**
   - Total daily cap (failsafe)
   - Source caps (distribution)
   - Criteria caps (quality)
   - Hourly caps (flow control)

3. **Monitor and Adjust**
   - Daily utilization review
   - Weekly pattern analysis
   - Monthly optimization
   - Quarterly strategic review

4. **Communicate Clearly**
   - Inform sources of caps
   - Provide clear rejection messages
   - Share utilization data
   - Set realistic expectations

## Cap Configuration Examples

### E-commerce Lead Buyer
```yaml
Total Daily: 1,000 leads
Business Hours: 700 (70%)
After Hours: 300 (30%)

By Source:
  Organic Search: 300/day
  Paid Search: 400/day
  Social Media: 200/day
  Affiliates: 100/day

By Product Interest:
  High-ticket items: No cap
  Medium-ticket: 600/day
  Low-ticket: 400/day

Geographic:
  Major metros: 60% of volume
  Secondary markets: 30%
  Rural: 10%
```

### Insurance Lead Network
```yaml
Input capacity: 10,000/day
Output distribution:
  Exclusive buyers: 2,000/day
  Semi-exclusive: 3,000/day
  Shared pool: 5,000/day

Quality tiers:
  Verified premium: First 1,000
  Standard verified: Next 4,000
  Basic: Remaining 5,000

Time distribution:
  Peak (9am-5pm): 70%
  Off-peak: 30%
  
Overflow handling:
  Queue up to: 2,000
  Then redirect to: Batch buyers
```

## Your Next Steps

### Essential Reading
1. **[Pricing](/flows/lead-submission/pricing)** - Caps and costs work together
2. **[Submission Response](/flows/lead-submission/submission-response)** - Communicate cap status
3. **[Reporting](/reporting)** - Analyze cap utilization

### Quick Wins
1. Review current cap utilization
2. Identify sources hitting caps
3. Check rejection patterns
4. Optimize one cap today

### Advanced Topics
- **[Dynamic Caps](/help-guide/advanced/dynamic-caps)** - Performance-based adjustments
- **[Cap Strategies](/help-guide/patterns/cap-strategies)** - Industry-specific approaches
- **[Capacity Planning](/help-guide/optimization/capacity-planning)** - Right-size your operation

---

🎯 **Remember**: Caps aren't about limiting success - they're about controlling growth. Smart caps protect your business while ensuring steady, quality lead flow.

*Next: [Pricing](/flows/lead-submission/pricing) - Track the financial side of every lead automatically.*