---
title: Integrations
description: The connection engines that bridge LeadConduit with the outside world
tags:
  - integrations-focused
  - reference
  - technical
  - core-concept
  - connectivity
---

# Integrations

## What are Integrations?

Integrations are LeadConduit's connection engines - they handle the technical complexities of communicating with external systems. Whether you're receiving leads from a web form, validating phone numbers, or delivering to Salesforce, integrations manage the protocols, authentication, data formats, and error handling that make these connections reliable.

Think of integrations as specialized translators. Each one speaks both LeadConduit's language and the unique dialect of a specific external service, handling everything from simple HTTP posts to complex OAuth flows.

## Why Integrations Matter

Every external system is different:
- Your web form sends JSON over HTTP
- Salesforce requires OAuth and specific field names
- That phone validator needs URL parameters
- Your buyer's API demands XML with custom headers

Without integrations, you'd be writing custom code for every connection. With integrations, you configure once and LeadConduit handles all the technical details.

## How Integrations Work

### The Two Directions

Integrations flow in two directions:

**Inbound (World → LeadConduit)**
- Receive leads from external sources
- Parse various data formats
- Validate authentication
- Transform to LeadConduit format

**Outbound (LeadConduit → World)**
- Send leads to external systems
- Format data for destination
- Handle authentication
- Process responses

### Integration Architecture

Every integration has three levels:

1. **Package** - A collection of related integrations
   - Example: `leadconduit-salesforce` (all Salesforce integrations)
   
2. **Module** - A specific action within a package
   - Example: `create_lead` (creates a lead in Salesforce)
   
3. **Configuration** - Your specific settings
   - Example: Your Salesforce credentials and field mappings

## Common Integration Patterns

### Basic HTTP Post

The simplest pattern - send data, get response:

**Use Case:** Simple API calls, webhooks
**Example:** Posting to a buyer's endpoint

```
Your Lead Data → Format as JSON → POST to API → Parse Response
```

### Enhancement Pattern  

Send data to get additional information back:

**Use Case:** Data validation, enrichment
**Example:** Phone number validation

```
Send: Phone number
Receive: Carrier, line type, validity
Append: Data added to lead for use in flow
```

### CRM Pattern

Complex integration with business systems:

**Use Case:** Salesforce, HubSpot, etc.
**Example:** Creating a lead in Salesforce

```
Authenticate → Map Fields → Create Record → Return ID
```

### Feedback Pattern

Receive quality or performance data back:

**Use Case:** Buyer feedback, conversion tracking
**Example:** Buyer reports lead quality

```
Receive Feedback → Match to Original Lead → Update Metrics
```

## Integration Selection

When configuring a flow, you'll see integrations in context:

### 1. Choose an Entity
First, select WHO you're connecting to:
- "Salesforce CRM"
- "TrustedForm"
- "Buyer ABC Corp"

### 2. Select Integration Action
Then choose WHAT action to perform:
- "Create Lead"
- "Validate Certificate"
- "Post Lead Data"

### 3. Configure Details
Finally, set up HOW it works:
- Field mappings
- Authentication
- Options and settings

## Authentication Methods

Different services require different authentication:

| Method | Used By | How It Works |
|--------|---------|--------------|
| **API Key** | Most modern APIs | Key in header or parameter |
| **Basic Auth** | Older systems | Username/password encoded |
| **OAuth 2.0** | Salesforce, Google | Token-based with refresh |
| **Custom Headers** | Proprietary systems | Service-specific headers |
| **IP Whitelist** | Secure endpoints | Your IPs pre-approved |

## Standard vs Service-Specific

### Standard Integrations

Pre-built for common patterns:

**JSON Post**
- Send JSON data via HTTP POST
- Basic authentication options
- Custom headers support

**XML Post**
- Send XML formatted data
- SOAP envelope support
- Namespace handling

**Form Post**
- URL-encoded form data
- Mimics web form submission
- Simple key-value pairs

**Webhook**
- Lightweight HTTP calls
- GET or POST methods
- Quick notifications

### Service-Specific Integrations

Built for particular services:

**Salesforce**
- OAuth authentication
- Field mapping to SF objects
- Error handling for SF responses

**TrustedForm**
- Certificate validation
- Consent verification
- Compliance data extraction

**Email Services**
- SMTP configuration
- Template support
- Tracking pixels

## Working with Enhancement Data

When integrations return data, it's automatically available:

### The Appended Namespace

Enhancement data appears in `appended.{service}.*`:

| Service Returns | Available As |
|----------------|--------------|
| Phone validation | `appended.phone_check.carrier` |
| Email verification | `appended.email_verify.deliverable` |
| Company lookup | `appended.clearbit.company_name` |

### Using Enhancement Data

In subsequent steps:
- Filter based on results: "If carrier is 'Verizon'"
- Include in delivery: Map appended data to recipient
- Make routing decisions: Premium treatment for verified data

## Error Handling

Integrations distinguish between three outcomes:

### Success
- Lead accepted/processed
- Data returned as expected
- Continue processing

### Failure (Business Logic)
- Duplicate lead
- Failed validation
- Outside service area
- Lead rejected but system working

### Error (Technical Issue)
- Timeout
- Authentication failure
- Service unavailable
- May trigger retry logic

## Common Integration Examples

### Web Form to LeadConduit
```
Integration: Form Post (Inbound)
Receives: URL-encoded form data
Parses: Into lead fields
Returns: Success/failure to form
```

### LeadConduit to CRM
```
Integration: Salesforce (Outbound)
Authenticates: OAuth token
Maps: Your fields to SF fields
Creates: Lead or Contact
Returns: Salesforce ID
```

### Phone Validation
```
Integration: Phone Validator (Outbound)
Sends: Phone number
Validates: Number format and connectivity
Returns: Carrier, type, validity
Appends: Results for use in flow
```

### Buyer Delivery
```
Integration: Custom JSON (Outbound)
Formats: Lead as buyer expects
Posts: To buyer's endpoint
Parses: Accept/reject response
Records: Outcome for reporting
```

## Best Practices

### Selection
- Use service-specific integrations when available
- Standard integrations for simple HTTP needs
- Match integration to entity type
- Consider authentication requirements

### Configuration
- Test with sample data first
- Document complex mappings
- Use meaningful names
- Keep credentials secure

### Performance
- Set appropriate timeouts
- Handle slow services gracefully
- Monitor error rates
- Cache when possible

### Security
- Never hardcode credentials
- Use HTTPS always
- Validate inbound sources
- Mask sensitive data in logs

## Integration Features

### Ping Support
Test integrations without creating real leads:
- Special `is_ping` parameter
- Validates configuration
- Returns test response
- No data stored

### Rich Responses
Integrations can return complex data:
- Nested objects
- Arrays
- Metadata
- Multiple values

### Retry Logic
For transient failures:
- Configurable retry attempts
- Exponential backoff
- Error type detection
- Timeout handling

### Batch Support
Some integrations support bulk operations:
- Multiple leads per request
- Efficient for high volume
- Reduces API calls
- Better performance

## Technical Details

### Module Structure
Each integration module provides:
- Request handling (format outbound data)
- Response parsing (process returns)
- Variable declarations (inputs/outputs)
- Validation logic (check requirements)

### Data Flow
1. Lead data prepared by mappings
2. Integration formats for destination
3. Authentication added
4. Request sent
5. Response parsed
6. Data appended to lead
7. Success/failure determined

### Integration Updates
- Packages versioned independently
- Updates apply to all using flows
- Backward compatibility maintained
- Test in staging first

## Related Concepts

- **[Entities](entities.md)** - Define WHO you're connecting to
- **[Mappings](mappings.md)** - Transform data for integrations
- **[Types](types.md)** - Ensure data quality before sending
- **[Events](events.md)** - Track all integration activity

---

*Integrations are the bridges between LeadConduit and the world. They handle the complex technical details of external communication, letting you focus on business logic rather than API specifications.*