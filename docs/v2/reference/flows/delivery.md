---
title: Delivery Phase
description: The distribution center where processed leads are mapped and delivered to their final destinations
tags:
  - flows
  - reference
  - technical
  - delivery
  - integrations
---

# Delivery Phase

## Overview

The delivery phase is where your carefully processed lead reaches its final destination. After passing through validation, enrichment, and routing, it's time to deliver the lead to your CRM, dialer, buyer's system, or any other recipient. This phase handles the technical complexities of data transformation, protocol management, and delivery confirmation.

Think of this phase as your shipping department - packaging each lead in exactly the format each recipient expects and ensuring successful delivery.

## How Delivery Works

### The Delivery Pipeline

```
Processed Lead
    ↓
Field Mapping (Transform to recipient format)
    ↓
Integration Protocol (Package for delivery)
    ↓
Authentication & Delivery (Send to system)
    ↓
Response Processing (Confirm success)
    ↓
Event Recording (Track outcome)
```

### Key Components

1. **Destination Configuration** - Where and how to deliver
2. **Field Mappings** - Transform your fields to their fields
3. **Integration Module** - Technical delivery method
4. **Response Handling** - Process success/failure

## Field Mapping for Delivery

Before delivery, your standardized fields must transform to match each recipient's requirements:

### Mapping Configuration

| Your Field | Recipient Expects | Mapping Result |
|------------|-------------------|----------------|
| `email` | `Email_Address__c` | Your email → Their Email_Address__c |
| `phone_1` | `Primary_Phone` | Your phone_1 → Their Primary_Phone |
| `loan_amount` | `Requested_Loan_Amount` | Your loan_amount → Their Requested_Loan_Amount |
| `appended.credit_score` | `Credit_Score__c` | Enhancement data → Their custom field |

### Advanced Mapping Features

**Value Transformation:**
```
Simple copy:
  phone_1 → PhoneNumber

With formatting:
  {{format phone_1 "(###) ###-####"}} → PhoneNumber

Conditional mapping:
  {{if state "CA" then "California" else state}} → State_Full

Combined fields:
  {{first_name}} {{last_name}} → Full_Name
```

**Using Templates:**
[Templates](../templates.md) enable dynamic mappings:
- Concatenate multiple fields
- Apply conditional logic
- Format values
- Calculate derived values

**Null Handling:**
- Missing fields can map to defaults
- Empty values can be suppressed
- Required fields generate errors if missing

## Integration Protocols

Each destination uses an [integration](../integrations.md) module that handles the technical delivery:

### Common Integration Types

| Type | Use Case | Features |
|------|----------|----------|
| **REST API** | Modern systems | JSON, authentication headers |
| **SOAP** | Legacy systems | XML, WSDL-based |
| **Webhook** | Simple HTTP | Form-encoded or JSON |
| **Direct** | LeadConduit-to-LeadConduit | Optimized internal protocol |

### Authentication Methods

Different systems require different authentication:

**API Key:**
```
Header: X-API-Key: your-key-here
Used by: Most modern APIs
```

**Basic Auth:**
```
Header: Authorization: Basic base64(user:pass)
Used by: Older systems
```

**OAuth 2.0:**
```
Token refresh handled automatically
Used by: Salesforce, HubSpot, etc.
```

**Custom Headers:**
```
Any required headers configured
Used by: Proprietary systems
```

## Delivery Patterns

### Single Destination

The simplest pattern - one lead, one destination:

```
Lead → Salesforce CRM
├── Map fields to Salesforce schema
├── Use OAuth authentication
├── Create Lead object
└── Return Lead ID on success
```

### Multiple Sequential (Waterfall)

Try destinations in order until one accepts:

```
Lead → Premium Buyer
├── Attempt delivery
├── If accepted → Stop (sold)
└── If rejected → Continue

Lead → Standard Buyer A  
├── Attempt delivery
├── If accepted → Stop (sold)
└── If rejected → Continue

Lead → Standard Buyer B
└── Final attempt
```

### Multiple Parallel

Deliver to multiple systems simultaneously:

```
Lead splits to:
├── CRM System (customer record)
├── Dialer (immediate contact)
├── Email Platform (nurture campaign)
└── Analytics (tracking)

All receive the same lead data
Each delivery tracked independently
```

### Conditional Delivery

Route to different destinations based on data:

```
If loan_amount > 50000:
  → Premium Loan CRM
  
Else if loan_amount > 25000:
  → Standard Loan CRM
  
Else:
  → Small Loan System
```

## Response Processing

### Success Responses

Successful delivery typically returns:
- HTTP 200-299 status codes
- System-specific ID (Lead ID, Record ID)
- Acceptance confirmation
- Sometimes additional metadata

**What Happens:**
1. Response marked successful
2. System ID stored if provided
3. Event records success
4. Lead marked as delivered

### Failure Responses

Failed delivery can mean different things:

| Response Type | Meaning | Flow Behavior |
|---------------|---------|---------------|
| **Hard Reject** | Buyer doesn't want lead | Try next destination |
| **Soft Reject** | Temporary issue | May retry |
| **System Error** | Technical problem | Log and continue |
| **Timeout** | No response | Configurable behavior |

**Common Reject Reasons:**
- "Duplicate lead"
- "Outside service area"  
- "Cap exceeded"
- "Invalid data"
- "System unavailable"

### Response Data Capture

Responses can provide valuable data:

```
Success Response:
{
  "id": "00Q1234567",
  "created": true,
  "url": "https://crm.com/leads/00Q1234567"
}

Available as:
- appended.salesforce.id
- appended.salesforce.created
- appended.salesforce.url
```

## Error Handling

### Timeout Configuration

Each destination can configure:
- Connection timeout (reaching system)
- Response timeout (waiting for answer)
- Total timeout (entire operation)

Typical settings: 5-30 seconds

### Retry Logic

Some integrations support automatic retry:
- Exponential backoff
- Maximum retry attempts
- Retry only on specific errors

### Fallback Behavior

When delivery fails:
1. Log detailed error information
2. Continue to next step (if any)
3. Mark delivery as failed
4. Source gets aggregate response

## Delivery Tracking

### What's Tracked

Every delivery attempt records:
- Timestamp
- Destination identity
- Request data (mappings applied)
- Response received
- Success/failure outcome
- Duration

### Delivery Events

Multiple events capture the delivery:

**Pre-Delivery Event:**
- Shows mapped data
- Authentication details (masked)
- Integration configuration

**Post-Delivery Event:**
- HTTP status code
- Response body
- Parsed outcome
- Any returned IDs

### Analytics

Delivery data enables:
- Success rates by destination
- Average response times
- Common rejection reasons
- Volume by recipient
- Revenue attribution

## Best Practices

### Field Mapping
- Map all required fields explicitly
- Use templates for complex transforms
- Set defaults for optional fields
- Test mappings with sample data

### Error Handling
- Set reasonable timeouts (5-15 seconds)
- Don't require delivery success
- Log failures for debugging
- Have fallback destinations

### Response Processing
- Parse responses for useful data
- Store system IDs for reconciliation
- Track rejection reasons
- Monitor success rates

### Performance
- Minimize mapped fields
- Use efficient templates
- Batch when supported
- Cache authentication tokens

## Common Integration Examples

### CRM Delivery
```
Salesforce Lead Creation:
├── Map to Lead object fields
├── OAuth 2.0 authentication
├── Create via REST API
├── Parse returned Lead ID
└── Available for reporting
```

### Dialer Delivery
```
Five9 Campaign Addition:
├── Map to campaign fields
├── API key authentication
├── Add to calling list
├── Confirm addition
└── Track dial attempts
```

### Buyer Delivery
```
Partner Buyer System:
├── Their custom field mapping
├── Their auth requirements
├── Their acceptance criteria
├── Parse accept/reject
└── Track for billing
```

## Technical Considerations

### Data Format

Most modern integrations use JSON:
```json
{
  "email": "john@example.com",
  "phone": "5551234567",
  "customField": "value"
}
```

Legacy systems might require:
- XML formatting
- Form-encoded data
- Fixed-width formats
- CSV structures

### Security

All delivery includes:
- SSL/TLS encryption
- Credential encryption at rest
- No sensitive data in logs
- Masked authentication in events

### Scalability

Delivery phase handles:
- Concurrent deliveries
- High volume throughput
- Geographic distribution
- Failover capabilities

---

*The delivery phase completes the lead's journey by ensuring it reaches its destination in the right format, through the right protocol, with confirmation of success. It's where all your processing pays off in successful lead delivery.*