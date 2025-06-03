# LeadConduit Events - Complete Documentation

## Overview

Events are the heartbeat of LeadConduit - they're the detailed story of every lead's journey through your system. Think of events as a time-traveling camera that captures a complete snapshot of your lead at every critical moment, from initial submission through final delivery. For lead buyers, events are your audit trail, your vendor accountability system, and your troubleshooting lifeline all in one.

Every significant action in LeadConduit generates an event - when a vendor submits a lead, when you validate their data, when you check compliance, when you deliver to your CRM. Each event preserves not just what happened, but the complete state of the lead at that moment, creating an immutable record you can analyze, report on, and use to resolve disputes. This isn't just logging - it's complete operational visibility.

The power of events lies in their comprehensiveness. Unlike traditional logs that might tell you "lead rejected," LeadConduit events show you exactly what data arrived, how it was transformed, which specific rule failed, what the lead looked like at that moment, and how long each operation took. This level of detail transforms vendor management from guesswork into data-driven decision making.

## Why Events Exist

### The Vendor Accountability Problem
When you're buying thousands of leads from dozens of vendors, disputes are inevitable. "You rejected my lead incorrectly!" "That lead was valid!" "You're not counting our submissions properly!" Without detailed records, these disputes devolve into he-said-she-said arguments. Events solve this by creating an indisputable record of exactly what happened to every lead, with timestamps, data snapshots, and specific rejection reasons.

### The Troubleshooting Problem
When leads aren't flowing properly, you need answers fast. Is the vendor sending bad data? Is your acceptance criteria too strict? Is the CRM integration failing? Traditional systems make you piece together clues from multiple sources. Events solve this by providing a complete, searchable history of every lead's journey, making troubleshooting as simple as finding the lead and reading its story.

### The Performance Management Problem
Understanding which vendors provide quality leads, which integrations slow down processing, and where your bottlenecks exist requires comprehensive data. Events solve this by tracking detailed performance metrics for every operation - acceptance rates by source, processing times by step, success rates by destination. This transforms vendor management from reactive to proactive.

## Core Concepts

### Event Anatomy

Every event in LeadConduit contains several layers of information:

**Identity and Classification**
- `id` - A unique identifier for this specific event
- `type` - What kind of event this is (source, recipient, filter, etc.)
- `lead_id` - Which lead this event relates to
- `flow_id` - Which flow processed this lead
- `account_id` - Which account owns this data

**Timing and Performance**
- `timestamp` - Exactly when this event occurred
- `ms` - How long the operation took
- `wait_ms` - Time spent waiting (for external services)
- `overhead_ms` - Processing overhead time

**Outcome and Reasoning**
- `outcome` - What happened (success, failure, error, etc.)
- `reason` - Why it happened (for failures/errors)
- `message` - Additional context or error details

**The Complete Lead Snapshot**
- `vars` - The entire lead data structure at this moment
  - `lead.*` - All lead fields with parsed values
  - `source.*` - Source metadata
  - `flow.*` - Flow metadata
  - `appended.*` - Any enrichment data
  - Custom fields and namespaces

**Integration Details** (for delivery events)
- `delivery` - Complete request/response data
- `integration` - Which module handled this
- `entity_id` - Which buyer/recipient

### Event Types and Their Stories

**Source Events - The Full Journey Summary**
Generated after all processing completes, source events tell the complete story from the vendor's perspective:
- Did we accept or reject the lead?
- What was the final price? (stored as both `cost` and `purchase_price` - same value)
- Which destinations received it?
- How long did everything take?
- What's the total revenue? (sum of all successful recipient deliveries)

These are your primary events for vendor reporting and reconciliation.

**Pricing Fields on Source Events**:
- `cost` and `purchase_price`: What you paid the vendor (same value, two fields for legacy reasons)
- `recipient_revenue`: Total revenue from all successful deliveries

**Recipient Events - Every Outbound Request**
Despite the name, recipient events are generated for ALL outbound requests from LeadConduit, not just delivery to buyers. Think of "recipient" as "any system receiving a request from LeadConduit":

- **Lead Delivery**: Sending to buyer's CRM, dialer, or webhook
- **Data Enhancement**: Calling BriteVerify, phone validation, demographic append
- **Compliance Checks**: TrustedForm validation, suppression list queries
- **Internal Services**: Your own lookup APIs, scoring services, databases

Why this matters for outcomes:
- `success` - The external system accepted the request and returned valid data
- `failure` - The request was rejected due to bad data or business rules (fix the data before retrying)
- `error` - Technical problem like timeout or bad credentials (might work on retry)

The key insight: A "failure" means something about your data needs to change. An "error" means something about the connection needs to be fixed.

**Pricing Fields on Recipient Events** (for buyer deliveries):
- `revenue` or `sale_price`: What the buyer pays for this lead
- `purchase_price`: What you paid for the lead (for margin calculation)
- Only successful deliveries generate revenue

**Filter Events - The Decision Points**
Generated at each routing decision in your flow:
- Which rules were evaluated?
- Did the lead match the criteria?
- Should processing continue or stop?
- Where should the lead go next?

These events show your business logic in action.

**Feedback Events - The Quality Loop**
Generated when recipients report back on lead quality:
- `feedback-received` - When buyers report conversion/quality
- `feedback-sent` - When you relay feedback to vendors

These events close the quality loop between buyers and sellers.

**Retry Events - The Persistence Record**
Generated when failed deliveries are retried:
- Why did the original delivery fail?
- When was it retried?
- Did the retry succeed?

These events show your system's resilience and recovery.

### Outcomes - What Actually Happened

Events use outcomes to categorize results in business terms:

**Success Outcomes**
- `success` - Everything worked as intended
- Lead accepted, delivery completed, rules matched

**Failure Outcomes**
- `failure` - Business rule prevented processing
- Lead rejected, caps exceeded, duplicate found
- Always includes a specific reason

**Error Outcomes**
- `error` - Technical problem occurred
- Integration timeout, API error, malformed data
- Includes error details for troubleshooting

**Skip Outcomes**
- `skip` - Step bypassed by design
- Rules didn't match, caps already hit
- Normal flow control, not a problem

**Special Filter Outcomes**
- `continue` - Keep processing
- `stop` - Halt the flow here

### The Lead Snapshot - Your Time Machine

The `vars` object in each event is your time machine. It shows exactly what the lead looked like at that moment:

```javascript
{
  "lead": {
    "id": "56789",
    "first_name": "John",
    "last_name": "Smith",
    "phone": {
      "number": "5125551234",
      "valid": true,
      "area": "512"
    },
    "email": "john.smith@example.com",
    "state": "TX"
  },
  "source": {
    "name": "Premium Insurance Leads",
    "ip_address": "192.168.1.1",
    "price": 25.00
  },
  "appended": {
    "trustedform": {
      "valid": true,
      "age_seconds": 45,
      "cert_id": "abc123"
    }
  }
}
```

This snapshot captures everything - parsed fields, validation results, enrichment data, metadata - frozen at this point in processing.

## How Events Tell the Lead's Story

Let's follow a typical lead through its event trail:

### 1. The Submission Story

When vendor "Premium Insurance Leads" submits a lead, after all processing completes, a source event captures the full journey:

```
Event Type: source
Outcome: success
Timestamp: 2024-01-15 10:30:45
Processing Time: 1,234ms

The Story: 
- Vendor submitted valid lead data
- All required fields present and valid
- TrustedForm certificate verified (45 seconds old)
- Not a duplicate (checked last 30 days)
- Daily cap had room (145/200)
- Price: $25.00
- Delivered to 2 destinations
```

### 2. The Enhancement Story

When LeadConduit calls TrustedForm to validate consent:

```
Event Type: recipient (Yes, even for enhancement services!)
Service: TrustedForm validation
Outcome: success
Timestamp: 2024-01-15 10:30:44
Processing Time: 567ms

The Story:
- Outbound request to TrustedForm API
- Certificate URL validated
- Consent text captured
- Certificate age verified (45 seconds old)
- Domain matched whitelist
- Consent data appended to appended.trustedform namespace
```

### 3. The Delivery Story

When delivering to your CRM:

```
Event Type: recipient (Salesforce)
Outcome: success  
Timestamp: 2024-01-15 10:30:45
Processing Time: 234ms

The Story:
- Lead transformed to match Salesforce schema
- Posted to Web-to-Lead endpoint
- Received success response
- Assigned to Texas sales team
- Ready for immediate dialing
```

### 4. The Rejection Story

When a lead fails your criteria:

```
Event Type: source
Outcome: failure
Reason: "Outside service area"
Timestamp: 2024-01-15 10:31:00

The Story:
- Vendor submitted lead from Montana
- All fields valid and parsed correctly
- Failed acceptance criteria: state not in [TX,CA,FL]
- No charge to buyer
- Clear feedback to vendor
```

## Using Events for Vendor Management

### Vendor Performance Tracking

Events enable sophisticated vendor analysis:

**Acceptance Rate Monitoring**
```
For each source, track:
- Total submissions (all source events)
- Accepted leads (outcome = success)
- Rejection reasons (outcome = failure, group by reason)
- Acceptance trend over time
```

**Quality Metrics**
```
Identify problem vendors by:
- High duplicate rate
- Missing required fields
- Invalid data formats
- Old TrustedForm certificates
- Consistent rejection patterns
```

**Delivery Performance**
```
Track vendor value through:
- CRM acceptance rate
- Sales conversion feedback
- Cost per converted lead
- Geographic distribution
```

### Resolving Vendor Disputes

When vendors challenge rejections, events provide proof:

1. **Find the Lead**: Search events by timestamp and source
2. **Review the Source Event**: See overall outcome and reason
3. **Trace the Journey**: Follow all related events
4. **Identify the Issue**: Find specific rule or validation failure
5. **Share Evidence**: Export events showing exact data and decisions

Example dispute resolution:
```
Vendor: "You rejected lead ID 12345 incorrectly"
You: Check source event, see reason "Invalid phone"
You: Check vars.lead.phone.valid = false
You: Check raw data shows "555-555-5555" (clearly fake)
You: Share event showing their invalid submission
Result: Dispute resolved with data
```

### Optimizing Vendor Relationships

Events help improve vendor quality:

**Common Issues by Vendor**
```
Vendor A Top Rejections:
1. "Missing trustedform_url" - 45%
2. "Duplicate lead" - 30%  
3. "Invalid email" - 15%
Action: Train on TrustedForm implementation
```

**Performance Trends**
```
Vendor B Timeline:
- Week 1: 20% acceptance
- Week 2: 35% acceptance (after field mapping fixes)
- Week 3: 75% acceptance (after TrustedForm added)
- Week 4: 85% acceptance (after duplicate check added)
```

## Event Search and Analysis

### Finding Specific Events

LeadConduit provides powerful event search:

**By Lead Identifiers**
- Lead ID: Find all events for one lead
- Reference: Search by vendor's ID
- Phone/Email: Find all leads from a person

**By Time Range**
- Today's submissions
- Last hour's failures
- Yesterday's deliveries
- Last week's performance

**By Outcome**
- All rejections
- All errors
- All successful deliveries
- All skipped steps

**By Participant**
- All events from Vendor X
- All deliveries to Salesforce
- All TrustedForm validations

### Advanced Analysis

**Rule-Based Searches**
Find complex patterns:
- "Failed leads from California with valid phone"
- "Successful deliveries that took over 5 seconds"
- "Duplicates from specific vendors"
- "Errors during business hours"

**Bulk Operations**
- Export events for spreadsheet analysis
- Generate vendor report cards
- Track acceptance rates over time
- Analyze processing performance

## Event Retention and Compliance

### Data Retention

Events are retained for 90 days by default:
- Sufficient for dispute resolution
- Covers monthly reconciliation cycles
- Enables trend analysis
- Balances storage costs

### Compliance Benefits

Events support compliance requirements:
- **TCPA Compliance**: Prove consent verification
- **Data Privacy**: Track data handling
- **Audit Trails**: Complete processing records
- **Dispute Documentation**: Defensible decisions

### Performance Considerations

Events track detailed timing:
- `ms`: Total operation time
- `wait_ms`: External service wait time
- `overhead_ms`: System processing time

Use this data to:
- Identify slow integrations
- Optimize processing order
- Set appropriate timeouts
- Plan capacity needs

## Common Event Patterns

### The Perfect Lead Pattern
```
1. Source Event: success (vendor accepted)
2. Filter Events: continue (routing logic)
3. Recipient Event: success (TrustedForm valid)
4. Recipient Event: success (CRM delivery)
5. Recipient Event: success (dialer delivery)
Total Time: <2 seconds
```

### The Quality Rejection Pattern
```
1. Filter Event: continue (basic validation)
2. Recipient Event: success (phone validation)
3. Source Event: failure "Disconnected phone"
Total Time: <1 second
Benefit: No bad numbers in your dialer
```

### The Compliance Protection Pattern
```
1. Recipient Event: success (TrustedForm check)
2. Recipient Event: failure (DNC list match)
3. Source Event: failure "DNC listed"
Total Time: <1 second
Benefit: TCPA compliance maintained
```

### The System Resilience Pattern
```
1. Recipient Event: error (CRM timeout)
2. Retry Event: success (delivered on retry)
3. Source Event: success (lead accepted)
Total Time: 5 seconds (including retry)
Benefit: No lost leads due to temporary issues
```

## Troubleshooting with Events

### Common Investigation Flows

**"Why was this lead rejected?"**
1. Find source event by lead ID
2. Check outcome and reason
3. Review vars for field values
4. Trace through filter events
5. Identify specific failure point

**"Why didn't my CRM receive this?"**
1. Find source event - was lead accepted?
2. Find recipient event for CRM
3. Check delivery details
4. Review any error messages
5. Verify field mappings

**"Is this vendor sending duplicates?"**
1. Search events by vendor and date range
2. Filter for failure reason "Duplicate"
3. Group by lead phone/email
4. Calculate duplicate rate
5. Share findings with vendor

**"How fast is processing?"**
1. Query events by time range
2. Examine ms values
3. Identify slowest operations
4. Optimize flow order
5. Monitor improvement

## Key Takeaways

- Events are complete snapshots of your lead at every critical moment, not just simple logs
- Every significant action generates an event - submission, validation, delivery, feedback
- The vars object preserves the exact state of all data at that point in time
- Source events summarize the complete journey from the vendor's perspective
- Recipient events document every delivery attempt and outcome
- Events enable vendor accountability with indisputable records of what happened and why
- Powerful search capabilities let you find patterns, track performance, and resolve disputes
- 90-day retention provides ample time for reconciliation and analysis
- Timing data helps optimize flow performance and identify bottlenecks
- Events transform vendor management from reactive firefighting to proactive optimization
- Compliance requirements are automatically documented through event trails
- Troubleshooting becomes straightforward - just follow the event trail to see exactly what happened