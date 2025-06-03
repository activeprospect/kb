# The LeadConduit Flow Lifecycle

This guide traces the complete journey of a lead through LeadConduit, showing exactly how each concept participates in the processing lifecycle.

## Overview

The [flow](flows.md) lifecycle consists of five major phases:
1. **Configuration** - Setting up your flow
2. **Lead Arrival** - Receiving and authenticating
3. **Processing** - Validating and enhancing
4. **Delivery** - Sending to destinations
5. **Analysis** - Tracking and optimizing

## Phase 1: Flow Configuration

Before any lead can be processed, the [flow](flows.md) must be configured with all necessary components.

### Define Your Data Model
- Choose standard [fields](fields.md) for common data (email, phone, name)
- Create custom [fields](fields.md) for business-specific data
- Each field references a [type](types.md) for parsing behavior

### Configure Sources
- Create source [entities](entities.md) for each vendor
- Select appropriate [integration](integrations.md) modules
- Define [mappings](mappings.md) to normalize vendor fields
- Set source-specific acceptance [rules](rules.md)
- Configure source [pricing](pricing.md) tiers

### Establish Business Logic
- Define flow-level acceptance criteria using [rules](rules.md)
- Set up volume caps with conditional [rules](rules.md)
- Configure [pricing](pricing.md) tiers and conditions
- Create suppression lists for duplicates/DNC

### Design Processing Steps
- Add filter steps with routing [rules](rules.md)
- Configure enhancement [integrations](integrations.md)
- Set up recipient/destination [entities](entities.md)
- Define outbound [mappings](mappings.md)

## Phase 2: Lead Arrival

When a vendor submits a lead, the arrival phase begins.

### HTTP Request Reception
```
POST /flows/[flow-id]/sources/[source-name].in
Content-Type: application/json
Authorization: Bearer [api-key]

{
  "fname": "Sarah",
  "lname": "Chen",
  "email_addr": "sarah@example.com",
  "phone1": "(555) 123-4567"
}
```

### Authentication
- [Integration](integrations.md) validates the API key
- Failed auth returns 401 immediately
- No [events](events.md) generated for auth failures

### Source Configuration Loading
The system loads:
- Field [mappings](mappings.md) (phone1 → phone)
- Default values via [templates](templates.md)
- Source-specific [rules](rules.md)
- [Pricing](pricing.md) configuration

### Variable Initialization
Create the data structure that accumulates throughout processing:
```javascript
{
  lead: {},        // Parsed lead data
  source: {},      // Source metadata
  flow: {},        // Flow metadata
  appended: {},    // Enhancement data
  destination: {}  // Delivery-specific data
}
```

## Phase 3: Lead Processing

The core processing phase transforms and validates the lead.

### Data Normalization
1. **Field Mapping**: Apply source [mappings](mappings.md)
   - `email_addr` → `email`
   - `phone1` → `phone`
   - `fname` + `lname` → `name`

2. **Type Parsing**: Each [type](types.md) processes its fields
   - Phone: "(555) 123-4567" → `{valid: true, area: "555", number: "5551234567"}`
   - Email: Validates format, extracts domain
   - State: Normalizes to two-letter code

3. **Variable Population**: Parsed data becomes available
   - Standard fields: `lead.email`, `lead.phone.number`
   - Custom fields: Direct access by name

### Pre-Processing Gates

1. **Purchasing Decisions**
   - TrustedForm Decisions runs if configured
   - Data available in `trustedform_decisions` namespace
   - Used by acceptance criteria and caps

2. **Acceptance Criteria**
   - Flow-level [rules](rules.md) evaluate first
   - Source-level [rules](rules.md) evaluate second
   - First failure stops processing

3. **Suppression Lists**
   - Check duplicates based on field combinations
   - Verify against DNC lists
   - Check existing customer lists

4. **Volume Caps**
   - Evaluate cap [rules](rules.md) to determine if lead counts
   - Check current usage against limits
   - Reject if cap exceeded

5. **Pricing Calculation**
   - Source service → Source [rules](rules.md) → Flow service → Flow [rules](rules.md)
   - First layer returning a price wins
   - Purchase price recorded

### Flow Step Execution

Steps process sequentially, each potentially modifying the lead's path:

1. **Filter Steps**
   - Evaluate [rules](rules.md) using current data
   - Can skip to specific step or stop flow
   - Generate filter [events](events.md)

2. **Enhancement Steps**
   - Call external services via [integrations](integrations.md)
   - Append data to `appended` namespace
   - Data immediately available to subsequent steps

3. **Recipient Steps**
   - Internal notifications via [integrations](integrations.md)
   - Apply outbound [mappings](mappings.md)
   - Generate recipient [events](events.md)

4. **Destination Steps**
   - Deliver to buyer [entities](entities.md)
   - Transform data with [mappings](mappings.md)
   - Record sale price from [pricing](pricing.md)
   - Generate destination [events](events.md)

## Phase 4: Lead Delivery

Each destination receives the lead independently.

### Data Transformation
- Apply destination-specific [mappings](mappings.md)
- Use [templates](templates.md) to format values
- Conditional [mappings](mappings.md) based on [rules](rules.md)

### Integration Execution
- [Integration](integrations.md) module handles delivery
- HTTP POST, SOAP, or custom protocol
- Timeout and retry handling

### Response Processing
- Parse response using configured patterns
- Extract success/failure indicators
- Capture response data in `appended` namespace

### Revenue Recording
- On successful delivery, record sale price
- Calculate profit (sale - purchase)
- Update financial metrics

## Phase 5: Analysis & Optimization

Post-processing provides visibility and insights.

### Event Generation
Every significant action creates an [event](events.md):
- Source event: Summarizes entire journey
- Filter events: Record routing decisions
- Enhancement events: Track data appending
- Destination events: Document delivery attempts

### Real-Time Visibility
[Events](events.md) enable:
- Live monitoring dashboards
- Instant vendor feedback
- Quick troubleshooting
- Performance tracking

### Business Intelligence
[Reporting](reporting.md) aggregates events into metrics:
- Acceptance rates by source
- Cost per qualified lead
- Revenue by destination
- Quality scores by vendor

### Detailed Analysis
[Exports](exports.md) provide row-level data for:
- Reconciliation with vendors
- Compliance documentation
- Deep performance analysis
- Custom analytics

## Lifecycle Termination Points

Processing can end at various stages:

### Pre-Processing Termination
- **Authentication Failed**: Invalid API key
- **Acceptance Criteria Failed**: Business rules not met
- **Suppression List Match**: Duplicate or DNC
- **Volume Cap Exceeded**: Limits reached
- **Hours of Operation**: Outside business hours

### Step Processing Termination
- **Filter Stop**: Explicit flow termination
- **Integration Error**: Critical failure
- **Timeout**: Processing time exceeded

### Normal Completion
- All steps executed
- Destinations attempted
- Response sent to source
- Events recorded

## Data Availability Timeline

Understanding when data becomes available is crucial:

1. **Raw Submission**: Unmapped vendor fields
2. **After Mapping**: Standard field names applied
3. **After Parsing**: [Types](types.md) create structured data
4. **After Enhancement**: `appended` namespace populated
5. **In Destinations**: All accumulated data available

## Performance Considerations

### Optimize Early Decisions
- Put most restrictive [rules](rules.md) first
- Use simple field checks before complex logic
- Filter early to reduce processing

### Minimize External Calls
- Batch enhancements when possible
- Set appropriate timeouts
- Handle failures gracefully

### Efficient Data Access
- Use parsed components (e.g., `phone.area`)
- Leverage [templates](templates.md) for transformations
- Avoid redundant calculations

## Troubleshooting the Lifecycle

### Finding Where Leads Fail
1. Check source [events](events.md) for outcomes
2. Review rejection reasons
3. Trace through filter [events](events.md)
4. Examine enhancement failures

### Common Failure Points
- Missing required fields (check [mappings](mappings.md))
- Invalid data format (review [types](types.md))
- Failed acceptance criteria (examine [rules](rules.md))
- Integration timeouts (check service status)

### Using Events Effectively
- Filter by source and time range
- Look for patterns in failures
- Track individual lead journeys
- Monitor step durations

---

*The flow lifecycle is the heartbeat of LeadConduit. Understanding each phase helps you build more effective flows and troubleshoot issues quickly.*