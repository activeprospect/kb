---
title: Custom API Integrations
description: Connect to any third-party API for custom validation, enhancement, or delivery
tags:
  - custom-integration
  - api
  - generic-integration
  - webhook
---

# Custom API Integrations

## Connect to Any API, Anywhere

Not every system fits into a pre-built integration. Custom API integrations (also called Generic Integrations) give you the power to connect LeadConduit to any HTTP endpoint - whether it's your internal CRM, a proprietary validation service, or a partner's unique API. If it speaks HTTP, LeadConduit can talk to it.

📍 **You are here**: Building bridges to any system
🔧 **What you'll master**: HTTP requests, response parsing, and error handling
🌐 **The outcome**: Seamless integration with any API

## Understanding Custom Integrations

### What Are Custom Integrations?

Custom integrations let you:
- Call any HTTP/HTTPS endpoint
- Send data in any format
- Parse any response
- Use results in your flow
- Handle errors gracefully

Think of them as universal adapters for the API world.

### Use Cases

Common scenarios:

```yaml
Internal Systems:
  - Your company CRM
  - Proprietary scoring engine
  - Custom validation service
  - Internal compliance check
  
Partner APIs:
  - Unique buyer endpoints
  - Custom enhancement services
  - Specialized validators
  - Industry-specific tools
  
Webhooks & Callbacks:
  - Notify external systems
  - Trigger workflows
  - Update databases
  - Send alerts
```

## Building Custom Integrations

### Basic HTTP Request

Simple API call:

```yaml
Step: Check Internal Blacklist
Type: Custom Integration

Request:
  Method: POST
  URL: https://api.internal.com/blacklist/check
  Headers:
    Content-Type: application/json
    X-API-Key: {{settings.internal_api_key}}
    
  Body: |
    {
      "email": "{{lead.email}}",
      "phone": "{{lead.phone}}",
      "ip": "{{lead.ip_address}}"
    }
    
Response Handling:
  Success: Status 200
  Parse: JSON
  
Field Mapping:
  blacklisted: {{response.is_blacklisted}}
  blacklist_reason: {{response.reason}}
  risk_score: {{response.risk_score}}
```

### Dynamic URL Construction

Build URLs from lead data:

```yaml
Step: Regional API Router
Type: Custom Integration

URL Construction:
  Base: https://api.company.com
  Path: /v2/leads/{{lead.state}}/validate
  
  Query Parameters:
    source: {{lead.source.id}}
    type: {{lead.product_type}}
    test: {{flow.test_mode}}
    
Example Result:
  https://api.company.com/v2/leads/CA/validate?source=123&type=auto&test=false
```

### Complex Request Bodies

Send structured data:

```yaml
Step: Submit to Partner System
Type: Custom Integration

Request Body (JSON):
  {
    "lead": {
      "personal": {
        "firstName": "{{lead.first_name}}",
        "lastName": "{{lead.last_name}}",
        "dateOfBirth": "{{lead.birth_date}}"
      },
      "contact": {
        "emails": [
          {
            "address": "{{lead.email}}",
            "type": "primary",
            "verified": {{lead.email.valid}}
          }
        ],
        "phones": [
          {
            "number": "{{lead.phone}}",
            "type": "{{lead.phone.type || 'unknown'}}",
            "carrier": "{{lead.phone.carrier}}"
          }
        ]
      },
      "metadata": {
        "source": "{{lead.source.name}}",
        "timestamp": "{{lead.timestamp}}",
        "ipAddress": "{{lead.ip_address}}",
        "userAgent": "{{lead.user_agent}}"
      }
    },
    "options": {
      "validate": true,
      "enhance": false,
      "dedupe": true
    }
  }
```

### XML Requests

Legacy system support:

```yaml
Step: SOAP Service Call
Type: Custom Integration

Headers:
  Content-Type: text/xml
  SOAPAction: "http://partner.com/ValidateLead"
  
Request Body (XML):
  <?xml version="1.0"?>
  <soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
    <soap:Header>
      <auth:Credentials xmlns:auth="http://partner.com/auth">
        <auth:Username>{{settings.soap_username}}</auth:Username>
        <auth:Password>{{settings.soap_password}}</auth:Password>
      </auth:Credentials>
    </soap:Header>
    <soap:Body>
      <lead:ValidateRequest xmlns:lead="http://partner.com/leads">
        <lead:Email>{{lead.email}}</lead:Email>
        <lead:Phone>{{lead.phone}}</lead:Phone>
        <lead:PostalCode>{{lead.postal_code}}</lead:PostalCode>
      </lead:ValidateRequest>
    </soap:Body>
  </soap:Envelope>
```

## Response Parsing

### JSON Response Parsing

Extract data from JSON:

```yaml
Response Example:
{
  "status": "success",
  "data": {
    "validated": true,
    "score": 85,
    "details": {
      "email_valid": true,
      "phone_valid": true,
      "address_confirmed": false
    }
  },
  "meta": {
    "request_id": "abc123",
    "processing_time": 0.234
  }
}

Field Mapping:
  validation_status: {{response.status}}
  validation_score: {{response.data.score}}
  email_valid: {{response.data.details.email_valid}}
  phone_valid: {{response.data.details.phone_valid}}
  request_id: {{response.meta.request_id}}
```

### XML Response Parsing

XPath for XML:

```yaml
Response Example:
<ValidateResponse>
  <Status>Success</Status>
  <Result>
    <Valid>true</Valid>
    <Score>85</Score>
    <EmailStatus>valid</EmailStatus>
    <PhoneStatus>valid</PhoneStatus>
  </Result>
</ValidateResponse>

Field Mapping:
  status: {{response.xpath('//Status')}}
  valid: {{response.xpath('//Result/Valid')}}
  score: {{response.xpath('//Result/Score')}}
  email_status: {{response.xpath('//EmailStatus')}}
```

### Text Response Parsing

Simple text responses:

```yaml
Response Example:
SUCCESS|85|VALID|ABC123

Parsing Strategy:
  Split by: |
  
Field Mapping:
  status: {{response.split('|')[0]}}
  score: {{response.split('|')[1]}}
  validation: {{response.split('|')[2]}}
  reference: {{response.split('|')[3]}}
```

### Regex Parsing

Complex text extraction:

```yaml
Response Example:
Lead accepted with ID: 12345 and price: $45.00

Regex Patterns:
  id_pattern: "ID: (\d+)"
  price_pattern: "price: \$(\d+\.\d{2})"
  
Field Mapping:
  lead_id: {{response.match(id_pattern)[1]}}
  price: {{response.match(price_pattern)[1]}}
```

## Advanced Features

### Conditional Logic

Smart request routing:

```yaml
Step: Dynamic API Selection

Logic:
  If lead.value > 100:
    URL: https://premium.api.com/validate
    Timeout: 5 seconds
    
  Else if lead.state in ['CA', 'TX']:
    URL: https://regional.api.com/validate
    Timeout: 3 seconds
    
  Else:
    URL: https://standard.api.com/validate
    Timeout: 2 seconds
```

### Request Transformation

Modify data before sending:

```yaml
Data Preparation:
  # Clean phone number
  phone: {{lead.phone.replace(/\D/g, '')}}
  
  # Format date
  birth_date: {{lead.birth_date | date: 'MM/DD/YYYY'}}
  
  # Calculate age
  age: {{now - lead.birth_date | years}}
  
  # Conditional values
  type: {{lead.email.corporate ? 'B2B' : 'B2C'}}
```

### Multi-Step Flows

Chain API calls:

```yaml
Step 1: Get Auth Token
  URL: https://api.service.com/auth
  Method: POST
  Body: 
    client_id: {{settings.client_id}}
    client_secret: {{settings.client_secret}}
  
  Store: auth_token = {{response.access_token}}

Step 2: Use Token for API Call
  URL: https://api.service.com/validate
  Headers:
    Authorization: Bearer {{auth_token}}
  Body:
    email: {{lead.email}}
    
Step 3: Process Results
  If response.needs_verification:
    Call: https://api.service.com/verify
```

### Batch Processing

Send multiple leads:

```yaml
Batch Configuration:
  Collect: 100 leads or 5 minutes
  
Request:
  URL: https://api.bulk.com/validate-batch
  Method: POST
  
  Body:
    {
      "batch_id": "{{batch.id}}",
      "leads": [
        {{#each batch.leads}}
        {
          "id": "{{this.id}}",
          "email": "{{this.email}}",
          "phone": "{{this.phone}}"
        }{{#unless @last}},{{/unless}}
        {{/each}}
      ]
    }
    
Response Processing:
  Loop through results
  Match by lead ID
  Update each lead
```

## Error Handling

### HTTP Error Codes

Handle different failures:

```yaml
Error Responses:

400 Bad Request:
  Action: Don't retry
  Log: Request format error
  Lead: Mark as error
  
401 Unauthorized:
  Action: Refresh auth token
  Retry: Once with new token
  
429 Too Many Requests:
  Action: Back off
  Retry: After delay
  
500 Server Error:
  Action: Retry with backoff
  Max Attempts: 3
  
503 Service Unavailable:
  Action: Use fallback service
```

### Timeout Handling

Manage slow APIs:

```yaml
Timeout Strategy:

Fast Timeout (1-2 seconds):
  For: Real-time validation
  On Timeout: Use cached/default value
  
Medium Timeout (3-5 seconds):
  For: Enhancement services
  On Timeout: Retry once
  
Long Timeout (10-30 seconds):
  For: Complex calculations
  On Timeout: Queue for batch
```

### Fallback Strategies

Always have Plan B:

```yaml
Primary Service Failed:

Option 1 - Secondary Service:
  Try: https://backup.api.com
  With: Same parameters
  
Option 2 - Cached Data:
  Use: Last known good value
  If: Less than 24 hours old
  
Option 3 - Default Values:
  Set: Conservative defaults
  Flag: For manual review
  
Option 4 - Skip Step:
  Continue: Without enhancement
  Note: In lead record
```

## Authentication Methods

### API Key Authentication

Simple and common:

```yaml
Header Authentication:
  X-API-Key: {{settings.api_key}}
  
Query Parameter:
  https://api.com/endpoint?api_key={{settings.api_key}}
  
Basic Auth:
  Authorization: Basic {{base64(username:password)}}
```

### OAuth 2.0

Modern token-based:

```yaml
OAuth Flow:

1. Get Access Token:
   URL: https://auth.provider.com/token
   Method: POST
   Body:
     grant_type: client_credentials
     client_id: {{settings.client_id}}
     client_secret: {{settings.client_secret}}
     
   Store: access_token, expires_in

2. Use Token:
   Headers:
     Authorization: Bearer {{access_token}}
     
3. Refresh When Expired:
   Automatic token refresh
   Before expiration
```

### Custom Authentication

Unique auth schemes:

```yaml
HMAC Signature:
  # Generate signature
  signature = HMAC-SHA256(
    secret_key,
    method + path + timestamp + body
  )
  
  Headers:
    X-Timestamp: {{timestamp}}
    X-Signature: {{signature}}
    
Custom Token:
  # Rotate tokens
  Headers:
    X-Auth-Token: {{settings.tokens[current_index]}}
    X-Auth-Version: "2.0"
```

## Performance Optimization

### Connection Management

Reuse connections:

```yaml
Connection Settings:
  Keep-Alive: true
  Connection Pooling: 10
  DNS Cache: 300 seconds
  
Benefits:
  - Reduce latency
  - Lower overhead
  - Better throughput
```

### Request Optimization

Make requests efficient:

```yaml
Optimization Tips:

1. Minimize Payload:
   - Send only required fields
   - Use compression
   - Avoid redundant data
   
2. Batch When Possible:
   - Group similar requests
   - Reduce round trips
   - Amortize overhead
   
3. Cache Responses:
   - Store validation results
   - Reuse within window
   - Reduce API calls
```

### Parallel Processing

Speed up multiple calls:

```yaml
Parallel Requests:

Instead of Sequential:
  1. Validate Email (1s)
  2. Validate Phone (1s)
  3. Check Blacklist (1s)
  Total: 3 seconds
  
Run in Parallel:
  - All three simultaneously
  Total: 1 second (max of all)
```

## Monitoring & Debugging

### Request Logging

Track what's happening:

```yaml
Log Details:
  - Full request (headers + body)
  - Full response
  - Timing breakdown
  - Error details
  
Debugging:
  - Enable verbose logging
  - Capture raw responses
  - Track performance
  - Monitor errors
```

### Testing Tools

Validate before going live:

```yaml
Test Console:
  - Send test request
  - See raw response
  - Modify on the fly
  - Save test cases
  
Integration Tests:
  - Success response
  - Error responses
  - Timeout behavior
  - Auth failures
```

### Performance Metrics

Monitor integration health:

```yaml
Key Metrics:
  - Response time (p50, p95, p99)
  - Success rate
  - Error rate by type
  - Timeout frequency
  
Alerts:
  - Response time > 5s
  - Error rate > 5%
  - Repeated auth failures
```

## Best Practices

### Design Principles

1. **Fail Gracefully**
   - Expect failures
   - Have fallbacks
   - Don't block flow
   - Log everything

2. **Optimize for Speed**
   - Set appropriate timeouts
   - Use caching
   - Minimize payload
   - Reuse connections

3. **Secure Everything**
   - Use HTTPS
   - Rotate credentials
   - Validate certificates
   - Mask sensitive data

4. **Plan for Scale**
   - Handle rate limits
   - Implement backoff
   - Use connection pools
   - Monitor performance

### Common Patterns

**Validation Service**:
```yaml
Quick check with fallback
Cache results
Continue on timeout
```

**Enrichment Service**:
```yaml
Enhance if available
Use defaults if not
Never block delivery
```

**Notification Webhook**:
```yaml
Fire and forget
Retry important ones
Log all attempts
```

## Your Next Steps

### Essential Reading
1. **[Templates Guide](/reference/templates)** - Dynamic request bodies
2. **[Response Parsing](/help-guide/integrations/parsing)** - Extract any data
3. **[Error Handling](/help-guide/integrations/errors)** - Robust integration

### Common Tasks
- Connect to internal API
- Parse custom responses
- Handle authentication
- Optimize performance

---

🌐 **Remember**: Custom integrations are your Swiss Army knife. They connect LeadConduit to any system that speaks HTTP. Start simple, test thoroughly, handle errors gracefully, and monitor constantly. The possibilities are endless.

*Next: Return to [Flow Steps Overview](/flows/flow-steps) to see how all pieces fit together.*