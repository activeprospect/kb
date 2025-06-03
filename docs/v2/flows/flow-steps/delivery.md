---
title: Delivery Configuration
description: Master the art of reliable, efficient lead delivery to your buyers
tags:
  - delivery
  - recipient-steps
  - integration
  - posting
---

# Delivery Configuration

## Turning Leads into Revenue

Delivery is where preparation meets execution. After your lead has been validated, enhanced, and priced, it needs to reach the buyer reliably and quickly. LeadConduit's delivery system handles the complexity of various buyer requirements, retry logic, and response parsing - so you can focus on optimization rather than integration headaches.

📍 **You are here**: Configuring bulletproof lead delivery
🚀 **What you'll master**: Delivery methods, formats, and reliability
💰 **The outcome**: Happy buyers and consistent revenue

## Understanding Delivery

### Delivery Philosophy

LeadConduit delivery follows core principles:

1. **Reliability First** - Every lead delivered
2. **Speed Matters** - Milliseconds count
3. **Format Flexibility** - Match buyer needs
4. **Clear Feedback** - Know what happened
5. **Graceful Recovery** - Handle failures smartly

### Delivery Flow

The journey of a delivery:

```
Lead Ready for Delivery
    ↓
Select Delivery Method
    ↓
Map to Buyer Format
    ↓
Send to Endpoint
    ↓
Parse Response
    ↓
Handle Success/Failure
    ↓
Update Lead Record
```

## Delivery Methods

### Standard HTTP POST

The most common method:

```yaml
Method: HTTP POST
Configuration:
  URL: https://buyer.com/api/leads
  Headers:
    Content-Type: application/x-www-form-urlencoded
    Authorization: Basic abc123
  
Format: Form POST
Fields:
  first_name: {{lead.first_name}}
  last_name: {{lead.last_name}}
  email: {{lead.email}}
  phone: {{lead.phone}}
  
Success Response:
  Status: 200
  Body contains: "accepted"
```

### JSON Delivery

Modern API format:

```yaml
Method: HTTP POST  
Configuration:
  URL: https://api.buyer.com/v2/leads
  Headers:
    Content-Type: application/json
    X-API-Key: {{api_key}}
    
Body: JSON
Template: |
  {
    "lead": {
      "contact": {
        "firstName": "{{lead.first_name}}",
        "lastName": "{{lead.last_name}}",
        "email": "{{lead.email}}",
        "phone": "{{lead.phone}}"
      },
      "metadata": {
        "source": "{{lead.source.name}}",
        "timestamp": "{{lead.timestamp}}",
        "ip": "{{lead.ip_address}}"
      }
    }
  }
  
Success Response:
  Status: 201
  JSON path: result.status = "success"
```

### XML Delivery

Legacy system support:

```yaml
Method: HTTP POST
Configuration:
  URL: https://legacy.buyer.com/leads.asmx
  Headers:
    Content-Type: text/xml
    SOAPAction: "http://buyer.com/SubmitLead"
    
Body: XML
Template: |
  <?xml version="1.0"?>
  <soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
    <soap:Body>
      <SubmitLead xmlns="http://buyer.com/">
        <FirstName>{{lead.first_name}}</FirstName>
        <LastName>{{lead.last_name}}</LastName>
        <Email>{{lead.email}}</Email>
        <Phone>{{lead.phone}}</Phone>
      </SubmitLead>
    </soap:Body>
  </soap:Envelope>
  
Success Response:
  XPath: //Success = "true"
```

### Email Delivery

Simple notification style:

```yaml
Method: Email
Configuration:
  To: leads@buyer.com
  From: delivery@yourdomain.com
  Subject: New Lead - {{lead.first_name}} {{lead.last_name}}
  
Body Template: |
    New Lead Received
    
    Name: {{lead.first_name}} {{lead.last_name}}
    Email: {{lead.email}}
    Phone: {{lead.phone}}
    State: {{lead.state}}
    
    Interested in: {{lead.product_interest}}
    
    Lead ID: {{lead.id}}
    Received: {{lead.timestamp}}
```

## Advanced Delivery Features

### Dynamic URL Construction

Build URLs dynamically:

```yaml
Base URL: https://api.buyer.com
Path Construction:
  /leads/{{lead.state}}/{{lead.product_type}}
  
Example Result:
  https://api.buyer.com/leads/CA/auto-insurance
  
Query Parameters:
  source: {{lead.source.id}}
  test: {{flow.environment === 'test' ? '1' : '0'}}
  
Full URL:
  https://api.buyer.com/leads/CA/auto-insurance?source=123&test=0
```

### Conditional Delivery

Route based on data:

```yaml
Delivery Rules:
  If lead.state in ['CA', 'TX', 'FL']:
    URL: https://api.buyer.com/high-value
  Else if lead.credit_score >= 700:
    URL: https://api.buyer.com/premium  
  Else:
    URL: https://api.buyer.com/standard
    
Different Endpoints:
  Mobile leads: https://mobile.buyer.com/api
  Desktop leads: https://desktop.buyer.com/api
```

### Batch Delivery

Send multiple leads:

```yaml
Batch Configuration:
  Size: 100 leads
  Timeout: 5 minutes
  Format: JSON Array
  
Template: |
  {
    "batch_id": "{{batch.id}}",
    "count": {{batch.count}},
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
```

## Response Handling

### Success Detection

Know when delivery worked:

```yaml
HTTP Status Success:
  - 200 OK
  - 201 Created
  - 202 Accepted
  
Body Content Success:
  Text contains: "success" or "accepted"
  JSON path: response.status = "ok"
  XML path: //result/success = "true"
  
Advanced Success:
  status = 200 
  AND json.result.accepted = true
  AND json.result.price > 0
```

### Failure Handling

Manage delivery failures:

```yaml
Failure Types:
  Timeout: 
    - After 30 seconds
    - Retry 3 times
    
  Connection Error:
    - Cannot reach endpoint
    - Retry with backoff
    
  HTTP Error:
    - 4xx: Don't retry (bad request)
    - 5xx: Retry (server error)
    
  Business Rejection:
    - Status 200 but "duplicate" message
    - Don't retry, mark rejected
```

### Response Parsing

Extract buyer information:

```yaml
Parse Success Response:
  Lead ID: json.response.lead_id
  Buyer Price: json.response.payout
  Confirmation: json.response.confirmation_code
  
Store in Lead:
  buyer.lead_id = {{parsed.lead_id}}
  buyer.price = {{parsed.payout}}
  buyer.confirmation = {{parsed.confirmation_code}}
  
Use Later:
  In receipts
  For reconciliation
  In reporting
```

## Delivery Optimization

### Speed Optimization

Make delivery fast:

```yaml
Connection Settings:
  Keep-Alive: Enabled
  Connection Pooling: 10 connections
  DNS Caching: 5 minutes
  
Timeouts:
  Connect: 5 seconds
  Read: 25 seconds
  Total: 30 seconds
  
Parallel Delivery:
  Max concurrent: 50
  Per buyer limit: 10
```

### Retry Strategy

Smart retry logic:

```yaml
Retry Configuration:
  Max Attempts: 3
  
  Backoff Strategy:
    1st retry: 1 second
    2nd retry: 5 seconds  
    3rd retry: 15 seconds
    
  Retry Conditions:
    - Timeout
    - Connection error
    - HTTP 500-599
    - Custom: response.retry = true
    
  Don't Retry:
    - HTTP 400-499
    - Explicit rejection
    - Duplicate detection
```

### Load Balancing

Distribute delivery load:

```yaml
Multiple Endpoints:
  Primary: https://api1.buyer.com
  Secondary: https://api2.buyer.com
  Tertiary: https://api3.buyer.com
  
Strategy: Round Robin
Failover: Automatic
Health Check: Every 60 seconds
```

## Delivery Security

### Authentication Methods

Secure your deliveries:

```yaml
Basic Authentication:
  Username: {{settings.username}}
  Password: {{settings.password}}
  Header: Authorization: Basic base64(user:pass)
  
Token Authentication:
  Header: X-API-Token: {{settings.api_token}}
  
OAuth 2.0:
  Token Endpoint: https://auth.buyer.com/token
  Client ID: {{settings.client_id}}
  Client Secret: {{settings.client_secret}}
  Scope: leads.write
  
IP Whitelisting:
  Add LeadConduit IPs to buyer firewall
```

### Encryption

Protect data in transit:

```yaml
TLS Requirements:
  Minimum: TLS 1.2
  Preferred: TLS 1.3
  
Certificate Validation:
  Verify: Yes
  Allow Self-Signed: No (production)
  
Sensitive Fields:
  SSN: {{lead.ssn | encrypt}}
  Account: {{lead.account | mask}}
```

## Testing Delivery

### Test Mode

Safe testing without consequences:

```yaml
Test Configuration:
  URL: https://sandbox.buyer.com/api
  Add Header: X-Test-Mode: true
  
Test Behavior:
  - No billing
  - No buyer notification
  - Full response parsing
  - Complete logging
```

### Delivery Preview

See what will be sent:

```yaml
Preview Shows:
  - Full URL
  - All headers
  - Request body
  - Mapped values
  
Before: {{lead.first_name}}
After: "John"

Before: {{lead.phone}}
After: "5551234567"
```

### Common Testing Scenarios

Verify edge cases:

```yaml
Test Cases:
  1. Valid lead - Success response
  2. Duplicate - Rejection handling
  3. Missing field - Error response
  4. Timeout - Retry behavior
  5. Server error - Failover
  6. Malformed response - Parsing
```

## Monitoring Delivery

### Key Metrics

Track delivery health:

```yaml
Success Metrics:
  - Delivery rate (target: >95%)
  - Response time (target: <2s)
  - Timeout rate (target: <1%)
  - Error rate (target: <2%)
  
Business Metrics:
  - Acceptance rate by buyer
  - Average price by buyer
  - Revenue per successful delivery
```

### Alerts

Proactive monitoring:

```yaml
Alert Conditions:
  - Delivery rate < 90% (15 min)
  - Response time > 5s (average)
  - Consecutive failures > 10
  - Buyer endpoint down > 5 min
  
Actions:
  - Email operations team
  - Slack notification
  - PagerDuty escalation
```

## Troubleshooting Delivery

### Common Issues

**"Connection timeout"**
- Check buyer endpoint status
- Verify firewall rules
- Test from different location
- Review timeout settings

**"Invalid response"**
- Check response format
- Verify parsing rules
- Review buyer documentation
- Test with curl/Postman

**"Authentication failed"**
- Verify credentials
- Check token expiration
- Confirm IP whitelist
- Review auth method

### Debug Tools

LeadConduit provides:

```yaml
Delivery Log:
  - Full request (headers + body)
  - Full response  
  - Timing breakdown
  - Retry attempts
  
Test Console:
  - Send test lead
  - Modify on the fly
  - See raw response
  - Debug parsing
```

## Best Practices

### Delivery Design

1. **Match Buyer Specs**
   - Follow documentation exactly
   - Test edge cases
   - Confirm field mapping
   - Validate responses

2. **Plan for Failure**
   - Set reasonable timeouts
   - Configure smart retries
   - Have failover ready
   - Monitor actively

3. **Optimize Performance**
   - Use connection pooling
   - Enable compression
   - Minimize payload
   - Cache when possible

4. **Secure Everything**
   - Use HTTPS always
   - Rotate credentials
   - Encrypt sensitive data
   - Audit access

### Common Patterns

**Multi-Format Support**:
```yaml
Same buyer, different formats:
  - JSON for API
  - XML for legacy  
  - Email for backup
```

**Conditional Routing**:
```yaml
Route by:
  - Geographic region
  - Lead quality score
  - Time of day
  - Buyer capacity
```

**Graduated Retry**:
```yaml
1st failure: Try backup URL
2nd failure: Add delay
3rd failure: Queue for manual review
```

## Your Next Steps

### Essential Reading
1. **[Response Parsing](/reference/integrations#response-parsing)** - Handle buyer responses
2. **[Retry Logic](/help-guide/delivery/retry-strategies)** - Failure recovery
3. **[Testing Guide](/help-guide/testing/delivery)** - Pre-launch validation

### Common Tasks
- Set up new buyer endpoint
- Configure authentication
- Map custom fields
- Test delivery flow

---

🚀 **Remember**: Delivery is where the rubber meets the road. A well-configured delivery step ensures your leads reach buyers quickly, reliably, and profitably. Test thoroughly, monitor closely, and optimize constantly.

*Next: Explore [Enhancement Integrations](/flows/flow-steps/enhancement-integrations) to add value before delivery.*