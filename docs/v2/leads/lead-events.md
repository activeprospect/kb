---
title: Lead Events
description: Master the audit trail that provides complete visibility into every lead's journey
tags:
  - events
  - audit-trail
  - debugging
  - analytics
---

# Lead Events

## Your Lead's Permanent Record

Events are the flight recorder of your lead operation. They capture every single thing that happens to every single lead - creating an immutable, queryable, analyzable record that transforms troubleshooting from guesswork into science. If leads are the what, events are the when, why, and how.

📍 **You are here**: Understanding the event system that makes everything transparent
📚 **What you'll master**: Event types, analysis techniques, and debugging strategies
🔬 **The power**: Turn mysterious failures into obvious fixes

## Understanding Events

### The Event Philosophy

LeadConduit events follow key principles:

1. **Immutable** - Once created, never changed
2. **Complete** - Full context at moment of capture
3. **Ordered** - Chronological sequence preserved
4. **Detailed** - Enough information to reconstruct everything
5. **Queryable** - Built for analysis

### Event Anatomy

Every event captures:

```json
{
  "event_id": "evt_7K9mHpQR3x2B5N8jL4wZ",
  "type": "recipient.delivered",
  "timestamp": "2024-01-15T14:30:45.234Z",
  "lead_id": "lead_5T8nK3mP9Q2wR7xN",
  "flow_id": "flow_8B3nM5kL2Q9pR4wX",
  "entity_id": "ent_3Q9wK5mN8B2xR7pL",
  "step_id": "step_9N2mK5pQ3B8wR7xL",
  
  "outcome": "success",
  "duration_ms": 342,
  
  "metadata": {
    "integration": "custom_json",
    "http_status": 200,
    "buyer_response": {
      "status": "accepted",
      "id": "buyer-lead-12345",
      "price": 45.00
    }
  },
  
  "lead_snapshot": {
    "first_name": "John",
    "email": "john@example.com",
    "email.valid": true,
    "state": "CA",
    "appended.phone_score": 95,
    // ... complete lead data
  }
}
```

### The Event Timeline

Every lead builds a story:

```
10:30:45.123 - source.submitted
10:30:45.156 - source.accepted  
10:30:45.203 - enhancement.success (phone validation)
10:30:45.234 - filter.passed (quality check)
10:30:45.267 - enhancement.success (TrustedForm)
10:30:45.342 - recipient.delivered (Buyer A)
10:30:45.389 - flow.completed

... 3 hours later ...
13:30:00.000 - feedback.received (converted)
```

## Event Type Reference

### Source Events

Track lead entry:

**source.submitted**
```yaml
When: Lead arrives at source endpoint
Contains: 
  - Raw submitted data
  - HTTP headers
  - Source configuration
  - IP address
Use: See exactly what was sent
```

**source.accepted**
```yaml
When: Lead passes source validation
Contains:
  - Parsed/typed fields
  - Acceptance criteria results
  - Assigned cost
  - Field mapping results
Use: Verify parsing and initial acceptance
```

**source.rejected**
```yaml
When: Lead fails source validation
Contains:
  - Rejection reason
  - Failed validations
  - Specific field errors
Use: Help sources fix their data
```

### Filter Events

Track business logic:

**filter.passed**
```yaml
When: Lead passes filter rules
Contains:
  - Filter name and ID
  - Rules evaluated
  - Evaluation results
  - Time taken
Use: Verify routing logic
```

**filter.failed**
```yaml
When: Lead fails filter rules
Contains:
  - Filter name and ID
  - Failed rule(s)
  - Specific values that failed
  - Would-have destination
Use: Understand why leads are filtered
```

### Enhancement Events

Track data append:

**enhancement.success**
```yaml
When: Enhancement returns data
Contains:
  - Service called
  - Request sent
  - Response received
  - Appended fields
  - Cost incurred
Use: Verify enhancement working correctly
```

**enhancement.failure**
```yaml
When: Enhancement fails
Contains:
  - Service attempted
  - Error type
  - Error message
  - Retry attempts
Use: Debug integration issues
```

**enhancement.error**
```yaml
When: Technical error occurs
Contains:
  - Service details
  - HTTP status
  - Timeout info
  - Circuit breaker state
Use: Monitor service health
```

### Recipient Events

Track delivery:

**recipient.delivered**
```yaml
When: Successful delivery
Contains:
  - Recipient details
  - Mapped payload
  - HTTP request/response
  - Buyer's lead ID
  - Revenue amount
Use: Prove delivery, track revenue
```

**recipient.failed**
```yaml
When: Buyer rejects lead
Contains:
  - Rejection reason
  - Buyer's response
  - Business logic failure
  - No revenue
Use: Understand buyer rejections
```

**recipient.error**
```yaml
When: Technical delivery failure
Contains:
  - Error type
  - HTTP status
  - Retry attempts
  - Timeout details
Use: Debug delivery problems
```

### Feedback Events

Track post-delivery:

**feedback.received**
```yaml
When: Buyer sends status update
Contains:
  - Feedback type
  - Status change
  - Quality metrics
  - Original lead reference
Use: Track lead outcomes
```

**feedback.processed**
```yaml
When: Feedback applied to lead
Contains:
  - Updates applied
  - Metrics changed
  - Routing impact
Use: Verify feedback handling
```

### System Events

Track flow operations:

**flow.completed**
```yaml
When: All processing complete
Contains:
  - Total duration
  - Steps executed
  - Final outcome
  - Total cost/revenue
Use: Measure flow performance
```

**retry.attempted**
```yaml
When: Retry occurs
Contains:
  - Original failure
  - Retry count
  - Retry result
  - Time elapsed
Use: Monitor retry effectiveness
```

## Using Events for Debugging

### The Debugging Workflow

When something goes wrong:

1. **Get the Lead ID**
   - From user report
   - From error alert
   - From failed delivery

2. **View Event Timeline**
   - See all events chronologically
   - Identify where things went wrong
   - Understand the sequence

3. **Drill Into Problem Event**
   - Check lead snapshot
   - Review metadata
   - Understand context

4. **Trace Root Cause**
   - Work backwards
   - Check prior events
   - Find origin of issue

### Common Debugging Scenarios

**"Why was this lead rejected?"**

```yaml
Find: source.rejected or recipient.failed
Look for: rejection_reason field
Example: "Invalid phone format: expected 10 digits, got 9"
Solution: Fix source's phone formatting
```

**"Where's the missing data?"**

```yaml
Check: enhancement.* events
Look for: 
  - enhancement.failure (service down?)
  - enhancement.error (timeout?)
  - Missing enhancement event (skipped?)
Solution: Based on specific failure
```

**"Why didn't buyer receive lead?"**

```yaml
Trace: recipient.* events
Possibilities:
  - No recipient event (filtered before delivery)
  - recipient.error (technical issue)
  - recipient.failed (buyer rejected)
Action: Address specific issue found
```

**"Data looks wrong"**

```yaml
Compare: Events at each step
- source.submitted (what arrived)
- source.accepted (how parsed)
- enhancement.success (what added)
- recipient.delivered (what sent)
Find: Where data changed incorrectly
```

### Advanced Debugging

**Time-based Issues**:
```yaml
Problem: Leads fail at certain times
Analysis: 
  - Group events by hour
  - Look for patterns
  - Check business hours filters
  - Verify timezone handling
```

**Intermittent Failures**:
```yaml
Problem: Random delivery failures
Analysis:
  - Filter for recipient.error
  - Group by error type
  - Check for timeout patterns
  - Monitor service health
```

**Data Quality Patterns**:
```yaml
Problem: High rejection rate
Analysis:
  - Group rejections by reason
  - Trace back to sources
  - Identify common issues
  - Create targeted fixes
```

## Event Analytics

### Performance Analysis

Use events to measure:

**Step Duration**:
```sql
SELECT 
  step_name,
  AVG(duration_ms) as avg_duration,
  MAX(duration_ms) as max_duration,
  COUNT(*) as executions
FROM events
WHERE timestamp > NOW() - INTERVAL '24 hours'
GROUP BY step_name
ORDER BY avg_duration DESC
```

**Success Rates**:
```sql
SELECT
  type,
  outcome,
  COUNT(*) as count,
  COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (PARTITION BY type) as percentage
FROM events
WHERE type LIKE 'recipient.%'
GROUP BY type, outcome
```

### Quality Metrics

Track lead quality:

**Rejection Analysis**:
```yaml
Question: Why are leads being rejected?
Query: All filter.failed events
Group by: rejection_reason
Result: 
  - 40%: Invalid phone
  - 30%: Duplicate
  - 20%: Outside service area
  - 10%: Other
```

**Enhancement Value**:
```yaml
Question: Is phone validation worth it?
Compare: 
  - Delivery rate without validation: 60%
  - Delivery rate with validation: 85%
  - Cost: $0.01 per lead
  - Value: 25% more accepted = $X revenue
```

### Business Intelligence

Extract insights:

**Source Performance**:
```yaml
For each source:
  - Total leads (source.submitted)
  - Acceptance rate (accepted/submitted)
  - Enhancement costs (sum of enhancement costs)
  - Delivery rate (delivered/accepted)
  - Revenue (sum of delivery revenue)
  - Profit (revenue - all costs)
```

**Buyer Behavior**:
```yaml
For each buyer:
  - Acceptance rate by time of day
  - Rejection reasons distribution
  - Average response time
  - Revenue per lead
  - Feedback quality
```

## Event Best Practices

### Retention Strategy

Balance storage vs access:

```yaml
Hot Storage (0-30 days):
  - Full event details
  - Instant access
  - All queries supported

Warm Storage (31-90 days):
  - Compressed events
  - Slower queries
  - Most details retained

Cold Storage (91+ days):
  - Archived events
  - Restore on demand
  - Compliance only
```

### Query Optimization

Make analysis fast:

**Use Indexes**:
- Lead ID (for debugging)
- Timestamp (for time analysis)
- Event type (for filtering)
- Outcome (for success/failure)

**Limit Scope**:
- Always include time range
- Filter by event type when possible
- Use sampling for large analyses

### Privacy Considerations

Protect sensitive data:

**PII Masking**:
- SSN: Show only last 4
- Full name: First letter + asterisks
- Email: Partial masking
- Phone: Area code only

**Access Control**:
- Role-based permissions
- Audit log access
- Time-limited queries
- Purpose documentation

## Event-Driven Workflows

### Real-time Monitoring

React to events as they happen:

**Quality Alerts**:
```yaml
If: rejection_rate > 30% in last hour
Then: Alert operations team
Include: Top rejection reasons
```

**Performance Alerts**:
```yaml
If: avg(duration_ms) > 2000 for any step
Then: Alert technical team
Include: Affected step details
```

### Automated Responses

Let events trigger actions:

**Source Management**:
```yaml
If: Source rejection rate > 50%
Then: 
  - Reduce source volume cap
  - Notify source of issues
  - Provide specific examples
```

**Buyer Optimization**:
```yaml
If: Buyer acceptance < 70%
Then:
  - Review rejection reasons
  - Adjust pre-filters
  - Update field mappings
```

## Your Next Steps

### Essential Skills
1. **[Event Querying](/leads/lead-events/querying)** - Master event searches
2. **[Event Patterns](/leads/lead-events/patterns)** - Common sequences
3. **[Debugging Guide](/leads/lead-events/debugging)** - Systematic troubleshooting

### Practice Exercises
1. Debug a rejected lead using events
2. Calculate step performance from events
3. Find patterns in delivery failures
4. Build a custom event report

### Advanced Topics
- **[Event Streaming](/leads/firehose)** - Real-time event access
- **[Custom Events](/help-guide/advanced/custom-events)** - Add your own
- **[Event Analytics](/help-guide/analytics/event-mining)** - Deep analysis

---

🔍 **Remember**: Events are your x-ray vision into lead processing. When something goes wrong, events show you exactly what happened. When you want to optimize, events provide the data. Master events, and nothing in your lead flow will be a mystery.

*Next: Learn about [Lead Data & Field Types](/leads/lead-data-field-types) to understand the structure of data captured in events.*