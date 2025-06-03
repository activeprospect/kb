---
title: Recipient Events
description: Track delivery success, failures, and buyer responses throughout the lead journey
tags:
  - events
  - recipient
  - delivery
  - buyer-focused
  - analytics
---

# Recipient Events

## Where Leads Meet Revenue

Recipient events capture the critical moment when your leads reach buyers. They tell you not just if delivery succeeded, but why it failed, how fast it happened, and what the buyer's system responded. This data is gold for optimizing delivery rates and maximizing revenue.

📍 **You are here**: Understanding delivery outcomes and buyer responses
💰 **What you'll track**: Success rates, failure reasons, response times, and pricing
🎯 **The outcome**: Higher delivery rates and better buyer relationships

## Understanding Recipient Events

### The Delivery Journey

Each delivery attempt creates a detailed record:

```
Lead ready for delivery
    ↓
recipient.delivery_attempt
    ↓
Buyer endpoint called
    ↓
recipient.delivered OR recipient.failed
    ↓
(Optional) recipient.feedback later
```

### Key Event Types

**recipient.delivery_attempt**
- Marks the start of delivery
- Shows which buyer was selected
- Includes pricing decision

**recipient.delivered**
- Successful delivery confirmed
- Buyer accepted the lead
- Revenue recorded

**recipient.failed**
- Delivery unsuccessful
- Includes specific reason
- Guides troubleshooting

## Recipient.Delivered Event

### Success Confirmation

When delivery succeeds:

```json
{
  "event_type": "recipient.delivered",
  "timestamp": "2024-01-15T10:30:47.234Z",
  "lead_id": "lead_7K9mHpQR3x2B5N8j",
  "recipient": {
    "id": "rcp_5L2nK9mR3x8B4Q7p",
    "name": "Premier Insurance Buyer",
    "type": "buyer"
  },
  "outcome": "success",
  "duration_ms": 423,
  "delivery": {
    "method": "HTTP POST",
    "url": "https://api.buyer.com/leads",
    "price": 45.00,
    "margin": 32.50
  },
  "response": {
    "status_code": 200,
    "body": {
      "result": "accepted",
      "lead_id": "buyer-12345",
      "payout": 45.00,
      "message": "Lead accepted successfully"
    },
    "parsed": {
      "buyer_lead_id": "buyer-12345",
      "acceptance": true
    }
  },
  "metadata": {
    "attempt_number": 1,
    "integration": "generic_http",
    "buyer_tier": "premium"
  }
}
```

### Success Indicators

What makes a delivery successful:

**HTTP Level Success**:
- Status code 200-299
- Response received
- No timeouts

**Business Level Success**:
- Buyer confirmed acceptance
- Price agreed upon
- Lead ID provided

**Financial Success**:
- Revenue recorded
- Margin acceptable
- Payment terms clear

## Recipient.Failed Event

### Failure Details

When delivery fails:

```json
{
  "event_type": "recipient.failed",
  "timestamp": "2024-01-15T10:30:48.567Z",
  "lead_id": "lead_8M1pL5nR2x6C3K9j",
  "recipient": {
    "id": "rcp_5L2nK9mR3x8B4Q7p",
    "name": "Premier Insurance Buyer"
  },
  "outcome": "failed",
  "duration_ms": 30234,
  "failure": {
    "reason": "Timeout",
    "category": "technical",
    "details": "Connection timeout after 30 seconds",
    "retry_eligible": true
  },
  "delivery": {
    "method": "HTTP POST",
    "url": "https://api.buyer.com/leads",
    "attempted_price": 45.00
  },
  "metadata": {
    "attempt_number": 3,
    "total_attempts": 3,
    "first_attempt": "2024-01-15T10:30:17.123Z"
  }
}
```

### Failure Categories

Understanding why deliveries fail:

**Technical Failures**:
```yaml
Connection Refused:
  - Buyer endpoint down
  - Firewall blocking
  - Wrong URL

Timeout:
  - Slow buyer system
  - Network issues
  - Large payload

SSL/TLS Error:
  - Certificate expired
  - Protocol mismatch
  - Security rejection
```

**Business Failures**:
```yaml
Duplicate Lead:
  - Already purchased
  - In buyer's system
  - Too recent

Invalid Data:
  - Missing required fields
  - Format mismatch
  - Business rule violation

Cap Reached:
  - Daily limit hit
  - Budget exhausted
  - Category full
```

**Authentication Failures**:
```yaml
Invalid Credentials:
  - Wrong API key
  - Expired token
  - Permission denied

IP Not Whitelisted:
  - Security restriction
  - Geographic block
  - New IP address
```

## Delivery Attempt Events

### Pre-Delivery State

Before attempting delivery:

```json
{
  "event_type": "recipient.delivery_attempt",
  "timestamp": "2024-01-15T10:30:47.123Z",
  "lead_id": "lead_7K9mHpQR3x2B5N8j",
  "recipient": {
    "id": "rcp_5L2nK9mR3x8B4Q7p",
    "name": "Premier Insurance Buyer"
  },
  "delivery_plan": {
    "price": 45.00,
    "exclusive": true,
    "priority": 1,
    "timeout": 30000
  },
  "lead_snapshot": {
    "score": 85,
    "age_minutes": 2.5,
    "enhancements_complete": true
  }
}
```

### What Happens During Attempt

The delivery process:

1. **Lead Preparation**
   - Data mapped to buyer format
   - Templates resolved
   - Payload constructed

2. **Connection Established**
   - DNS lookup
   - SSL handshake
   - Authentication

3. **Data Transmitted**
   - Request sent
   - Response awaited
   - Timeout monitoring

4. **Response Processing**
   - Status evaluated
   - Body parsed
   - Success determined

## Using Recipient Events

### Delivery Rate Analysis

Monitor buyer performance:

```yaml
Key Metrics:
  Overall Delivery Rate: 94.5%
  
By Buyer:
  Premier Insurance: 97.2%
  Standard Insurance: 93.1%
  Budget Insurance: 89.4%
  
By Time:
  Business Hours: 96.1%
  After Hours: 91.2%
  Weekends: 88.7%
```

### Failure Pattern Recognition

Spot systematic issues:

```yaml
Timeout Patterns:
  - Buyer A: Timeouts spike at 2 PM daily
  - Action: Increase timeout during peak

Duplicate Patterns:
  - 40% of failures are duplicates
  - Action: Implement better deduping

Authentication Patterns:
  - API key expires monthly
  - Action: Set renewal reminder
```

### Response Time Optimization

Track delivery speed:

```yaml
Response Time Analysis:
  Average: 1.2 seconds
  
  Fast (< 500ms): 45%
  Normal (500ms-2s): 40%
  Slow (2s-5s): 12%
  Very Slow (> 5s): 3%
  
Optimization:
  - Route time-sensitive leads to fast buyers
  - Increase timeout for slow buyers
  - Consider parallel delivery
```

## Advanced Event Analysis

### Buyer Scoring

Rate buyers based on events:

```yaml
Buyer Score Factors:
  Delivery Rate: 40%
  Response Time: 20%
  Price Paid: 25%
  Feedback Rate: 15%
  
Premier Insurance Score: 92/100
  - 97% delivery rate
  - 0.8s average response
  - $45 average price
  - 85% feedback rate
```

### Revenue Attribution

Track money through events:

```yaml
Daily Revenue Analysis:
  Total Attempts: 10,000
  Successful Deliveries: 9,450
  
  Revenue Generated: $425,250
  Average Price: $45.00
  
  By Buyer:
    Premier: $212,625 (50%)
    Standard: $127,575 (30%)
    Budget: $85,050 (20%)
```

### Retry Strategy Optimization

Learn from failure patterns:

```yaml
Retry Success Analysis:
  
First Attempt: 90% success
Second Attempt: 7% additional success
Third Attempt: 2% additional success

Optimal Strategy:
  - Retry timeouts: Yes (high success)
  - Retry auth failures: No (never succeed)
  - Retry duplicates: No (waste of time)
```

## Monitoring & Alerts

### Real-Time Monitoring

Watch delivery health:

```yaml
Dashboard Metrics:
  - Current delivery rate
  - Active deliveries
  - Recent failures
  - Response times
  
Alert Thresholds:
  - Delivery rate < 90%
  - Response time > 5s
  - Consecutive failures > 5
  - Buyer offline > 10 min
```

### Failure Investigation

Debug delivery issues:

```yaml
Investigation Steps:
  1. Find failed event
  2. Check failure category
  3. Review full request/response
  4. Identify pattern
  5. Test solution
  
Common Fixes:
  - Update credentials
  - Adjust timeout
  - Fix field mapping
  - Whitelist new IP
```

## Best Practices

### Event-Driven Optimization

1. **Monitor Continuously**
   - Real-time delivery rates
   - Failure reason distribution
   - Response time trends
   - Revenue tracking

2. **Act on Patterns**
   - Don't ignore repeated failures
   - Investigate delivery drops
   - Optimize slow buyers
   - Reward reliable buyers

3. **Maintain Relationships**
   - Share delivery metrics with buyers
   - Work together on improvements
   - Set realistic expectations
   - Celebrate successes

### Troubleshooting Guide

**"Sudden delivery failures"**
- Check buyer status page
- Verify credentials haven't changed
- Look for network issues
- Review recent changes

**"Slow response times"**
- Analyze by time of day
- Check payload size
- Review buyer capacity
- Consider caching

**"High duplicate rate"**
- Extend deduplication window
- Sync suppression lists
- Improve source quality
- Add pre-delivery check

## Event Storage & Access

### Retention

How long events are kept:

```yaml
Standard Retention:
  - All events: 30 days
  - Extended available
  
Access Methods:
  - UI: Lead details page
  - API: Events endpoint
  - Exports: Bulk download
  - Firehose: Real-time stream
```

### Using Events for Compliance

Document delivery attempts:

```yaml
Compliance Records:
  - Timestamp of delivery
  - Buyer confirmation
  - Price agreement
  - Consent verification
  
Audit Trail:
  - Every attempt recorded
  - Success/failure documented
  - Changes tracked
  - Immutable history
```

## Your Next Steps

### Essential Reading
1. **[Feedback Events](/leads/events/feedback-events)** - Post-delivery outcomes
2. **[Delivery Configuration](/flows/flow-steps/delivery)** - Optimize setup
3. **[Response Parsing](/reference/integrations#response-parsing)** - Handle responses

### Common Tasks
- Monitor delivery rates
- Debug failed deliveries
- Optimize buyer performance
- Track revenue by recipient

---

💰 **Remember**: Recipient events are where preparation meets profit. Every successful delivery is revenue realized, every failure is an opportunity to improve. Monitor closely, optimize constantly, and watch your delivery rates soar.

*Next: Learn about [Filter Events](/leads/events/filter-events) for routing decisions.*