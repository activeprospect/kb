---
title: Events  
description: The system's memory - capturing every moment in a lead's journey through your flow
tags:
  - events-focused
  - reference
  - technical
  - core-concept
  - audit-trail
---

# Events

## What are Events?

Events are LeadConduit's permanent record of everything that happens to every lead. They're immutable snapshots captured at each significant moment in a lead's journey - from initial submission through final delivery and beyond. Think of events as your flow's court reporter, documenting every decision, transformation, and outcome with perfect fidelity.

Each event tells a story: what happened, when it happened, why it happened, and what the lead looked like at that exact moment. Together, they form an unbreakable audit trail.

## Why Events Matter

In lead distribution, accountability is everything:
- Disputes require proof of what was sent and when
- Debugging needs to see exact data at each step
- Compliance demands audit trails
- Optimization requires understanding what actually happens

Without events, you're relying on memory and guesswork. With events, you have indisputable evidence of every single thing that happened to every single lead.

## The Anatomy of an Event

Every event captures four essential elements:

### 1. Event Type
What kind of thing happened:
```
source.submitted      - Lead arrived from source
filter.passed        - Lead passed filter criteria  
recipient.delivered  - Lead sent to buyer
feedback.returned    - Buyer reported conversion
```

### 2. Timestamp
Precisely when it happened:
```
2024-01-15T14:30:45.123Z - Millisecond precision
UTC timezone - Consistent globally
ISO 8601 format - Standard timestamp
```

### 3. Metadata
Context about what happened:
```
Outcome: success/failure/error
Reason: Why something failed
Duration: How long it took
Integration: What service was called
```

### 4. Lead Snapshot
The complete lead data at that moment:
```
All fields and values
Parsed type components
Appended enhancement data
Transformed values
```

## Event Types Deep Dive

### Source Events

Track lead submission and acceptance:

**source.submitted**
- Lead arrives at LeadConduit
- Contains raw submitted data
- Before any parsing or validation

**source.accepted**
- Lead passes initial validation
- After field parsing
- Source pricing applied

**source.rejected**
- Lead fails validation
- Includes rejection reason
- No further processing

### Filter Events

Document business logic decisions:

**filter.passed**
- Lead meets filter criteria
- Shows which rules evaluated
- Continues to next step

**filter.failed**
- Lead blocked by filter
- Details which rule failed
- May stop processing

### Enhancement Events

Track data enrichment:

**enhancement.success**
- Service returned data
- Shows appended fields
- Includes service response

**enhancement.failure**
- Service call failed
- Error details captured
- Lead continues without data

### Recipient Events

Record delivery attempts:

**recipient.delivered**
- Successful delivery
- Includes response data
- Revenue recorded

**recipient.failed**
- Delivery rejected
- Business reason (duplicate, etc.)
- No revenue

**recipient.error**
- Technical failure
- Timeout, auth error, etc.
- May trigger retry

### Feedback Events

Track post-delivery updates:

**feedback.received**
- Buyer sends status update
- Conversion, return, etc.
- Updates original lead

**feedback.processed**
- Feedback successfully applied
- Metrics updated
- Affects routing

## The Event Timeline

Every lead builds a chronological story:

```
10:00:00.100 - source.submitted (raw data arrives)
10:00:00.150 - source.accepted (validated and parsed)
10:00:00.200 - enhancement.success (phone verified)
10:00:00.250 - filter.passed (meets criteria)
10:00:00.300 - recipient.delivered (buyer accepted)
10:00:00.350 - flow.completed (all processing done)
... later ...
14:30:00.000 - feedback.received (buyer converted)
```

## Accessing Events

### In the UI

Events appear in:
- Lead details page
- Event timeline view
- Detailed event inspector
- Exportable reports

### Via API

Query events programmatically:
```
GET /flows/{id}/events?lead_id=ABC123
GET /flows/{id}/events?type=recipient.delivered
GET /flows/{id}/events?start=2024-01-15
```

### Via Exports

Export events for analysis:
- CSV format
- JSON format
- Filtered by criteria
- Scheduled delivery

## Event Data Structure

### Core Fields

Every event includes:
```json
{
  "id": "evt_ABC123",
  "type": "recipient.delivered",
  "timestamp": "2024-01-15T14:30:45.123Z",
  "lead_id": "lead_XYZ789",
  "flow_id": "flow_123",
  "entity_id": "buyer_abc"
}
```

### Type-Specific Fields

Additional fields per event type:

**Delivery events:**
```json
{
  "outcome": "success",
  "duration_ms": 245,
  "integration": "custom_json",
  "response_code": 200,
  "price": 25.00
}
```

**Filter events:**
```json
{
  "outcome": "failure",
  "reason": "State not in approved list",
  "rule_set": "geographic_filter",
  "rules_evaluated": 3
}
```

### The Lead Snapshot

Complete lead state at event time:
```json
{
  "lead": {
    "id": "lead_XYZ789",
    "email": "john@example.com",
    "email.valid": true,
    "email.domain": "example.com",
    "state": "TX",
    "source.name": "Web Form A",
    "appended.phone_check.carrier": "Verizon"
  }
}
```

## Event Patterns

### Success Path
```
source.submitted → accepted → enhancements → filters → delivery → feedback
```

### Rejection Path
```
source.submitted → rejected (reason: "Missing required field: email")
```

### Retry Path
```
recipient.error → retry.scheduled → retry.attempted → recipient.delivered
```

### Multi-Buyer Path
```
source.submitted → buyer1.delivered → buyer2.delivered → buyer3.failed
```

## Using Events for Debugging

### Trace Processing Issues

Follow the data transformation:
```
1. Check source.submitted - What arrived?
2. Check source.accepted - How was it parsed?
3. Check enhancement events - What was added?
4. Check filter events - What rules applied?
5. Check recipient events - What was sent?
```

### Identify Bottlenecks

Look at timestamp differences:
```
Parsing: accepted - submitted time
Enhancement: enhancement - previous event
Delivery: delivered - previous event
Total: final - submitted time
```

### Verify Data Quality

Compare field values across events:
```
Before enhancement: phone = "5551234567"
After enhancement: phone.valid = true, phone.carrier = "AT&T"
At delivery: mapped to "formatted_phone": "(555) 123-4567"
```

## Events for Compliance

### Audit Requirements

Events provide:
- Who submitted what when
- Consent verification timeline
- Data transformation history
- Delivery confirmation

### Retention Policies

- Events retained per account settings
- Typically 30-90 days minimum
- Extended retention available
- Immutable once created

### Privacy Compliance

- PII masking in event data
- Configurable field visibility
- Audit log access controls
- Export restrictions

## Event-Driven Workflows

### Real-time Monitoring

Watch for specific events:
- High-value lead delivery
- Repeated failures
- Unusual patterns
- Quality issues

### Alerting

Trigger alerts on events:
- Delivery failures spike
- Enhancement service down
- Negative margin leads
- Source quality drops

### Integration

Send events to external systems:
- Stream to data warehouse
- Push to monitoring tools
- Feed analytics platforms
- Sync with CRM

## Best Practices

### Event Analysis

1. **Start with outcomes** - Work backward from results
2. **Compare patterns** - Successful vs failed leads
3. **Check timestamps** - Identify slow steps
4. **Verify data** - Ensure accuracy at each stage

### Debugging

1. **Get the lead ID** - Everything starts here
2. **View full timeline** - See complete picture
3. **Check each transition** - What changed?
4. **Correlate with logs** - Additional context

### Monitoring

1. **Define normal** - Baseline metrics
2. **Watch for anomalies** - Unusual patterns
3. **Set up alerts** - Proactive notification
4. **Regular reviews** - Spot trends

## Common Event Scenarios

### Duplicate Detection
```
source.submitted → source.rejected
reason: "Duplicate: Previously submitted 2024-01-10"
```

### Enhancement Timeout
```
enhancement.error
reason: "Service timeout after 5000ms"
integration: "phone_validator"
```

### Buyer Daily Cap
```
recipient.failed  
reason: "Daily cap reached (100/100)"
buyer: "Premier Leads LLC"
```

### Feedback Update
```
feedback.received
type: "conversion"
value: "sold"
days_to_convert: 3
```

## Technical Considerations

### Event Generation

- Automatic for all flow actions
- No configuration needed
- Cannot be disabled
- Happens synchronously

### Performance Impact

- Minimal overhead (<1ms)
- Asynchronous storage
- No flow blocking
- Optimized queries

### Data Consistency

- Events are immutable
- Timestamps are precise
- Order is guaranteed
- No data loss

## Related Concepts

- **[Flows](flows.md)** - Generate events during processing
- **[Reporting](reporting.md)** - Aggregates event data
- **[Exports](exports.md)** - Extract event data
- **[Entities](entities.md)** - Referenced in events

---

*Events are the unblinking eye of LeadConduit, recording every moment with perfect clarity. They transform your lead flow from a black box into a glass pipeline where every drop of data can be traced, verified, and optimized.*