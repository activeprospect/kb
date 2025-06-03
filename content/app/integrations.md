# LeadConduit Integrations

## Overview

Integrations are the connection engines of LeadConduit. They bridge the gap between LeadConduit's standardized lead processing system and the diverse world of external services, each with their own APIs, data formats, and business requirements. Think of integrations as universal translators that speak both LeadConduit's language and the unique dialect of each external system.

Integrations answer the fundamental question:
**How do I connect my lead flow to the outside world?**

Integrations work seamlessly with other LeadConduit concepts:
- **Entities** define WHO you're connecting to
- **Mappings** transform data for the connection
- **Types** ensure data quality across connections
- **Integrations** provide the HOW of the connection

## Why Integrations Exist

### The Tower of Babel Problem
Every service speaks a different language:
- Salesforce wants SOAP with specific field names
- Your web form posts JSON with custom fields
- That email validator needs URL parameters
- The buyer's API requires XML with auth headers
- Your tracking pixel just needs a simple GET request

Without integrations, you'd need custom code for every connection.

### The Bidirectional Flow Problem
Lead data flows in multiple directions:
- **Inbound**: Forms, APIs, and partners send you leads
- **Outbound**: You send leads to buyers, CRMs, and services
- **Enhancement**: Services add data then return it
- **Feedback**: Partners report lead quality back

Integrations handle all these patterns with consistent interfaces.

### The Business Logic Problem
Connections aren't just technical - they encode business relationships:
- Authentication and authorization
- Pricing and billing
- Data ownership and access
- Quality standards and validation
- Contractual requirements

Integrations encapsulate both technical and business logic.

## Core Concepts

### Integration Architecture

Every integration consists of:

1. **Package**: A collection of related integrations
   - Example: `leadconduit-salesforce` package
   - Contains multiple integration modules
   - Distributed via npm

2. **Module**: A specific integration within a package
   - Example: `leadconduit-salesforce.outbound.create_contact`
   - Implements one specific action
   - Has unique module ID

3. **Direction**: The flow of data
   - `inbound`: Receives leads into LeadConduit
   - `outbound`: Sends leads from LeadConduit
   - Determines available functions and behavior

### The Two Faces of Integration

#### Inbound Integrations (World → LeadConduit)
**Purpose**: Accept leads from external sources
**Key Functions**:
- `request()`: Parse incoming data into lead variables
- `response()`: Format LeadConduit's response back

**Example Flow**:
```
Web Form → HTTP POST → Inbound Integration → Lead Object → Flow Processing
```

**What They Handle**:
- Various data formats (JSON, XML, form-encoded)
- Authentication validation
- Field mapping to standard fields
- Response formatting

#### Outbound Integrations (LeadConduit → World)
**Purpose**: Send leads to external systems
**Key Functions**:
- `handle()`: Send data and process response
- `validate()`: Check required data before sending
- Append returned data to lead

**Example Flow**:
```
Lead in Flow → Outbound Integration → External API → Appended Data
```

**What They Handle**:
- API authentication
- Request formatting
- Error handling
- Response parsing
- Data appending

### Integration Module Structure

Every integration module exports:

**Required Functions**:
```javascript
// For inbound
request(vars)      // Transform incoming data
response(vars)     // Build response

// For outbound  
handle(vars)       // Send and process
validate(vars)     // Check requirements
```

**Variable Declarations**:
```javascript
request.variables()   // What data we accept/need
response.variables()  // What data we return/append
```

**Metadata**:
```javascript
name              // Human-readable name
editable          // Supports UI configuration
envVariables      // Required environment vars
```

### Standard vs Custom Integration Patterns

LeadConduit provides two levels of integration:

**Standard Integrations**:
- Pre-built for common patterns
- Available to all accounts
- Examples:
  - `leadconduit-default`: Basic HTTP
  - `leadconduit-custom`: JSON/XML/SOAP
  - `leadconduit-form`: Form posts

**Service-Specific Integrations**:
- Built for particular services
- Encode service requirements
- Examples:
  - `leadconduit-salesforce`
  - `leadconduit-trustedform`
  - `leadconduit-briteverify`

### The Integration Selection Process

When configuring a flow:

1. **Choose Entity**: Identifies WHO (the service/partner)
2. **Entity Has Modules**: Defines HOW (available integrations)
3. **Select Module**: Determines specific integration
4. **Configure Integration**: Set mappings and options

This separation allows:
- Same entity, different integrations
- Integration reuse across entities
- Flexible configuration per use

## Integration Patterns

### Basic HTTP Pattern
The simplest integration - send data, get response:
```
Module: leadconduit-custom.outbound.json
Use Case: Simple API calls
Features: Basic auth, custom headers, JSON body
```

### Enhancement Pattern
Send data, get enrichment back:
```
Module: leadconduit-clearbit.outbound.enrich
Purpose: Add company data based on email
Flow: Send email → Receive company info → Append to lead
```

### Delivery Pattern
Send lead to buyer/CRM:
```
Module: leadconduit-salesforce.outbound.create_lead
Purpose: Create lead in Salesforce
Flow: Map fields → Send to SF → Get SF ID back
```

### Feedback Pattern
Receive quality/performance data:
```
Module: leadconduit-default.inbound.feedback
Purpose: Accept return data from buyers
Flow: Receive feedback → Match to lead → Update metrics
```

### Ping Pattern
Test submissions for configuration:
```
Special Handling: is_ping parameter
Purpose: Test without creating real leads
Flow: Detect ping → Process differently → Return test response
```

## Special Integration Features

### Authentication Handling

Integrations support various auth methods:

**API Key**: Environment variables or configuration
**OAuth**: Token management and refresh
**Custom Headers**: Service-specific auth
**IP Restrictions**: Source validation

### Pricing Integration

For buyer integrations with pricing:
```
Buyer returns: price, cost, revenue
LeadConduit: Tracks financials
Reports: Show actual revenue/cost
```

### Variable Transformation

**Request Variables**: 
- Define input requirements
- Support type validation
- Enable UI configuration

**Response Variables**:
- Define appended data
- Support nested structures
- Enable downstream use

### Error Handling

Integrations distinguish between:
- **Success**: Lead accepted/processed
- **Failure**: Business rejection (duplicate, invalid)
- **Error**: Technical failure (timeout, auth)

This drives retry logic and reporting.

## Integration Development Patterns

### Request/Response Style
For simple HTTP transactions:
```javascript
request: Build HTTP request object
response: Parse HTTP response
LeadConduit: Handles actual HTTP
```

### Handle Style
For complex interactions:
```javascript
handle: Full control of transaction
Multiple requests: Login → Send → Logout
External libraries: Use service SDKs
```

### Rich UI Support
Some integrations include configuration UIs:
- Vue.js interfaces
- Wizard-style setup
- OAuth flow handling
- Credential management

## How Integrations Connect Everything

### Integration + Entity
Entity identifies the service:
- Has associated integration modules
- Provides identity and metadata
- Enables configuration reuse

### Integration + Mapping
Mappings prepare data:
- Transform fields for integration
- Apply business rules
- Format for destination

### Integration + Types
Types ensure data quality:
- Validate before sending
- Parse responses correctly
- Maintain consistency

### Integration + Rules
Rules control flow:
- Conditional delivery
- Routing logic
- Enhancement decisions

## Common Integration Scenarios

### Multi-Step Lead Flow
```
1. Inbound from Web Form → Parse JSON
2. Enhancement: TrustedForm → Validate certificate  
3. Enhancement: Clearbit → Append company data
4. Filter: Rules based on appended data
5. Delivery: Salesforce → Create opportunity
6. Delivery: Email → Notify sales team
```

### Account-to-Account Transfer
```
1. Seller Account → leadconduit-account.outbound
2. LeadConduit → Route between accounts
3. Buyer Account → leadconduit-account.inbound
4. Full tracking → Both accounts see activity
```

### Feedback Loop
```
1. Original delivery → Track lead ID
2. Buyer processes → Determines quality
3. Feedback API → Send status back
4. Update metrics → Adjust routing
```

## Best Practices

### Integration Selection
1. **Use Specific When Available**: `leadconduit-salesforce` over `leadconduit-custom`
2. **Standard for Simple**: Default integrations for basic HTTP
3. **Custom for Complex**: When specific modules don't exist
4. **Match the Entity**: Integration should align with entity type

### Configuration Management
1. **Reuse Entities**: Same endpoint across flows
2. **Document Mappings**: Complex transformations need notes
3. **Test with Pings**: Verify configuration safely
4. **Version Carefully**: Integration updates affect all flows

### Performance Optimization
1. **Batch When Possible**: Some integrations support bulk
2. **Async for Slow Services**: Don't block lead flow
3. **Cache Enhancements**: Reuse appended data
4. **Monitor Timeouts**: Adjust for slow endpoints

### Security
1. **Never Hardcode Secrets**: Use environment variables
2. **Validate Sources**: Check authentication
3. **Mask Sensitive Data**: PII protection
4. **Audit Access**: Track who configures what

## Common Misconceptions

### "One integration per service"
**Reality**: Services often have multiple integrations for different actions (create, update, query).

### "Integrations are just HTTP calls"
**Reality**: Integrations encode business logic, authentication, error handling, and data transformation.

### "Custom means coding"
**Reality**: `leadconduit-custom` provides configurable integrations without writing code.

### "All integrations are public"
**Reality**: Private integrations can be restricted to specific accounts.

## Key Takeaways

1. **Two Directions**: Inbound receives, Outbound sends
2. **Package.Module.Action**: Hierarchical organization
3. **More Than HTTP**: Business logic + technical connection
4. **Entity Association**: Integrations attach to entities
5. **Standard vs Specific**: Generic patterns vs service-specific
6. **Rich Metadata**: Variables, validation, documentation
7. **Flexible Authentication**: Multiple auth patterns supported
8. **Error Intelligence**: Success vs Failure vs Error
9. **Configuration Over Code**: Most needs met without custom development
10. **Ecosystem Integration**: Works seamlessly with entities, mappings, types, and rules