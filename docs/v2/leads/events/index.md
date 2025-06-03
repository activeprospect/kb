---
title: Lead Events
description: The complete audit trail of every lead's journey through your system
tags:
  - events
  - analytics
  - audit-trail
  - monitoring
  - events-focused
---

# Lead Events

## Every Lead Tells a Story

Events are the heartbeat of LeadConduit - they capture every significant moment in a lead's journey from submission to conversion. Think of them as a detailed travel log that shows not just where a lead went, but when, why, and what happened at each stop.

📍 **You are here**: Understanding the event system that powers visibility
📊 **What you'll discover**: How to read, analyze, and act on event data
🎯 **The outcome**: Complete operational transparency and optimization

## The Event Model

### What Events Capture

Every event records:
- **When**: Precise timestamp
- **What**: Specific action type
- **Who**: Which entity was involved
- **Where**: Which step in the flow
- **Why**: Outcome and reasons
- **How**: Duration and details

### Event Categories

Events fall into major categories:

```yaml
Journey Events:
  - Source events (submission/acceptance/rejection)
  - Filter events (routing decisions)
  - Recipient events (delivery attempts)
  - Feedback events (post-delivery outcomes)

System Events:
  - Enhancement events (data append)
  - Error events (technical issues)
  - Flow events (completion tracking)
```

## Event Types Deep Dive

### 📥 [Source Events](./source-events)
*The beginning of every lead story*

Track how leads enter your system:
- **source.submitted** - Raw lead received
- **source.accepted** - Passed validation
- **source.rejected** - Failed criteria

Key insights: Acceptance rates, rejection reasons, source quality

### 📤 [Recipient Events](./recipient-events)
*Where leads meet revenue*

Monitor delivery to buyers:
- **recipient.delivery_attempt** - Starting delivery
- **recipient.delivered** - Success confirmed
- **recipient.failed** - Delivery unsuccessful

Key insights: Delivery rates, buyer performance, failure patterns

### 🚦 [Filter Events](./filter-events)
*The routing decisions*

See how leads flow through logic:
- **filter.passed** - Criteria met
- **filter.failed** - Criteria not met

Key insights: Routing effectiveness, bottlenecks, flow optimization

### 🔄 [Feedback Events](./feedback-events)
*Closing the quality loop*

Track post-delivery outcomes:
- **feedback.received** - Buyer reported outcome
- **feedback.sent** - Quality update to source

Key insights: Conversion rates, quality scores, ROI tracking

### 🔧 [System Events](./system-events)
*Technical and operational events*

Monitor system operations:
- **enhancement.success** - Data appended
- **enhancement.failed** - Enhancement error
- **flow.completed** - Full journey done
- **error.occurred** - Technical issue

Key insights: Performance monitoring, error tracking, optimization opportunities

## Reading Event Timelines

### A Successful Lead Journey

```
10:30:45.123 → source.submitted
10:30:45.234 → source.accepted
10:30:45.345 → filter.passed (Quality Check)
10:30:45.456 → enhancement.success (Phone Validation)
10:30:45.567 → filter.passed (High Value Router)
10:30:45.678 → recipient.delivery_attempt
10:30:46.123 → recipient.delivered
14:45:23.456 → feedback.received (Converted!)
```

**What this tells you**: Fast processing (under 1 second), quality lead, successful delivery, and ultimate conversion.

### A Problematic Journey

```
10:30:45.123 → source.submitted
10:30:45.234 → source.accepted
10:30:45.345 → filter.failed (Invalid Phone)
10:30:45.456 → filter.passed (Backup Router)
10:30:45.567 → recipient.delivery_attempt
10:30:75.567 → recipient.failed (Timeout)
10:31:15.678 → recipient.delivery_attempt (Retry)
10:31:16.123 → recipient.delivered
11:45:00.000 → feedback.received (Returned - Bad Phone)
```

**What this tells you**: Phone validation issue led to timeout, retry succeeded but lead was ultimately returned.

## Event Analysis Patterns

### Acceptance Rate Tracking

Monitor source quality:

```yaml
Source A Today:
  source.submitted: 1,000
  source.accepted: 920
  source.rejected: 80
  
Acceptance Rate: 92%
Rejection Reasons:
  - Invalid email: 30
  - Duplicate: 25
  - Under age: 25
```

### Delivery Performance

Track buyer reliability:

```yaml
Buyer X This Week:
  Attempts: 5,000
  Delivered: 4,750
  Failed: 250
  
Success Rate: 95%
Failure Breakdown:
  - Timeout: 150
  - Auth error: 50
  - Duplicate: 50
```

### Flow Efficiency

Measure processing speed:

```yaml
Average Times:
  Submission → Acceptance: 120ms
  Acceptance → Enhancement: 80ms
  Enhancement → Delivery: 200ms
  Total: 400ms
  
Bottlenecks:
  - Enhancement step (if slow API)
  - Delivery retries (if buyer issues)
```

## Using Events Effectively

### Real-Time Monitoring

Watch operations live:
- Current flow status
- Recent failures
- Processing speeds
- Volume tracking

### Historical Analysis

Learn from patterns:
- Peak hours
- Quality trends
- Buyer preferences
- Seasonal variations

### Debugging

Solve problems quickly:
- Find exact failure point
- See actual vs expected
- Track retry attempts
- Verify fixes

### Optimization

Improve continuously:
- Identify bottlenecks
- Reduce failures
- Speed processing
- Increase conversions

## Event Access Methods

### In the UI

**Lead Detail View**:
- Click any lead
- Select Events tab
- See complete timeline
- Filter by type

**Flow Monitoring**:
- Real-time event stream
- Aggregated metrics
- Alert indicators

### Via API

```yaml
GET /events
  - By lead ID
  - By time range
  - By event type
  - With pagination
```

### Through Exports

- Bulk event data
- Custom date ranges
- All event types
- CSV/JSON formats

### Real-Time Streaming

- Firehose delivery
- Instant updates
- External systems
- Analytics platforms

## Best Practices

### Event Monitoring

1. **Set Up Dashboards**
   - Key event metrics
   - Real-time alerts
   - Trend tracking
   - Anomaly detection

2. **Regular Reviews**
   - Daily: Failures and errors
   - Weekly: Patterns and trends
   - Monthly: Deep analysis

3. **Act on Insights**
   - Fix issues quickly
   - Optimize flows
   - Coach sources
   - Improve quality

### Event Retention

Standard retention: 30 days

**Extend retention for**:
- Compliance needs
- Seasonal analysis
- Long sales cycles
- Historical research

**Archive via**:
- Regular exports
- Firehose streaming
- API extraction
- Automated backups

## Common Questions

### "Why so many events?"
Each event captures a decision or action. This granularity enables:
- Precise debugging
- Detailed analytics
- Complete audit trails
- Optimization insights

### "Which events matter most?"
Focus on:
- **Failures** (red events) - Problems to fix
- **Conversions** (feedback) - Success metrics
- **Rejections** (source) - Quality indicators
- **Timeouts** (recipient) - Performance issues

### "How do I reduce noise?"
- Filter by event type
- Focus on anomalies
- Set up smart alerts
- Use aggregated views

## Your Event Journey

### Start Here
1. **[Source Events](./source-events)** - Where leads begin
2. **[Recipient Events](./recipient-events)** - Where revenue happens
3. **[Filter Events](./filter-events)** - How routing works
4. **[Feedback Events](./feedback-events)** - Quality tracking

### Go Deeper
- **[System Events](./system-events)** - Technical operations
- **[Event Analysis Guide](/guide/leads/event-analysis)** - Advanced techniques
- **[Events API](/api/events)** - Programmatic access

### Take Action
- Set up event monitoring
- Create quality dashboards
- Build feedback loops
- Optimize continuously

---

📊 **Remember**: Events are not just logs - they're the insights that drive optimization. Every event tells part of your lead's story. String them together, and you have the complete narrative of your business operations.

*Ready to dive deeper? Start with [Source Events](./source-events) to understand how leads enter your system.*