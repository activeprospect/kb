---
title: Recipient Steps
description: Deliver your processed leads to buyers, CRMs, and systems with precision
tags:
  - recipient-steps
  - delivery
  - distribution
---

# Recipient Steps

## The Final Mile of Lead Delivery

Recipient steps are where all your hard work pays off - literally. They deliver your validated, enhanced, perfectly-formatted leads to buyers, CRMs, dialers, and any other system that needs them. This is where leads become revenue, where data becomes action, and where your operation proves its value.

📍 **You are here**: Mastering the art and science of lead delivery
📮 **What you'll master**: Delivery configuration, error handling, and optimization
💰 **The outcome**: Reliable delivery that maximizes acceptance and revenue

## Understanding Recipient Steps

### What Makes Recipient Steps Special

Recipient steps:
- Send leads to external systems
- Handle various formats and protocols
- Process acceptance/rejection responses
- Track delivery success and revenue
- Manage retries and failures

They're the shipping department of your lead operation.

### The Delivery Flow

```
Lead Data → Format/Map → Send to Recipient → Parse Response → Update Lead
     ↓           ↓              ↓                 ↓              ↓
Enhanced    Match buyer    HTTP POST         Accept/Reject   Revenue
& filtered  requirements   JSON/XML/Form     Lead ID         tracked
```

### Delivery Economics

Every delivery has financial implications:

```yaml
Successful Delivery:
  Revenue: $45.00
  Cost: $15.00
  Margin: $30.00
  
Failed Delivery:
  Revenue: $0.00
  Cost: $15.00 (still paid)
  Margin: -$15.00
  
Impact: Every 1% improvement in delivery rate = $X more profit
```

## Types of Recipients

### Lead Buyers

The most common recipient type:

**Direct Buyer Integration**:
```yaml
Recipient: "ABC Insurance Buyers"
Type: Custom Integration
Settings:
  Endpoint: https://api.abcinsurance.com/leads
  Method: POST
  Format: JSON
  Auth: Bearer token
  
Field Mapping:
  firstName: {{lead.first_name}}
  lastName: {{lead.last_name}}
  phoneNumber: {{format lead.phone_1 "##########"}}
  stateCode: {{lead.state}}
  
Response Parsing:
  Success: status = "accepted"
  Lead ID: response.leadId
  Price: response.price
```

### CRM Systems

Your internal sales platforms:

**Salesforce Integration**:
```yaml
Recipient: "Salesforce Production"
Type: salesforce.create_lead
Settings:
  Instance: na152.salesforce.com
  Object: Lead
  
Field Mapping:
  FirstName: {{lead.first_name}}
  LastName: {{lead.last_name}}
  Email: {{lead.email}}
  Phone: {{lead.phone_1}}
  LeadSource: {{source.name}}
  Lead_Score__c: {{lead.score}}
  
Options:
  Assignment Rules: true
  Duplicate Check: true
  Trigger Workflows: true
```

### Dialers

Direct to calling systems:

**Dialer Integration**:
```yaml
Recipient: "Five9 Dialer"
Type: webhook.post
Settings:
  URL: https://api.five9.com/campaigns/{{campaign_id}}/leads
  
Field Mapping:
  number1: {{lead.phone_1}}
  number2: {{lead.phone_2}}
  first_name: {{lead.first_name}}
  account_number: {{lead.id}}
  priority: {{#if lead.score > 80}}1{{else}}2{{/if}}
  
Options:
  Call Window: 9am-8pm
  Max Attempts: 3
  Timezone: {{lead.timezone}}
```

### Marketing Automation

Nurture and email systems:

**Marketing Platform**:
```yaml
Recipient: "HubSpot Marketing"
Type: hubspot.create_or_update_contact
Settings:
  Portal ID: 12345678
  
Field Mapping:
  email: {{lead.email}}
  firstname: {{lead.first_name}}
  lastname: {{lead.last_name}}
  phone: {{lead.phone_1}}
  lead_score: {{lead.score}}
  lead_source: {{source.name}}
  
Lists:
  Add to: "New Leads - {{lead.product_interest}}"
  Workflow: "Welcome Series - {{lead.state}}"
```

## Delivery Configuration

### Field Mapping Mastery

Transform your data to match any format:

**Simple Mapping**:
```yaml
# Direct field to field
their_field: {{our_field}}
contactEmail: {{lead.email}}
primaryPhone: {{lead.phone_1}}
```

**Transformed Mapping**:
```yaml
# Format adjustments
phoneFormatted: {{format lead.phone_1 "(###) ###-####"}}
fullName: {{lead.first_name}} {{lead.last_name}}
stateFullName: {{#compare lead.state "==" "CA"}}California{{/compare}}
submittedDate: {{format lead.timestamp "YYYY-MM-DD"}}
```

**Conditional Mapping**:
```yaml
# Include fields conditionally
{{#if lead.phone_2}}
  secondaryPhone: {{lead.phone_2}}
{{/if}}

{{#if lead.score > 70}}
  priority: "HIGH"
{{else}}
  priority: "NORMAL"  
{{/if}}
```

**Nested Object Mapping**:
```yaml
# Build complex structures
applicant:
  name:
    first: {{lead.first_name}}
    last: {{lead.last_name}}
  contact:
    email: {{lead.email}}
    phone: 
      primary: {{lead.phone_1}}
      {{#if lead.phone_2}}
      secondary: {{lead.phone_2}}
      {{/if}}
  address:
    street: {{lead.address_1}}
    city: {{lead.city}}
    state: {{lead.state}}
    zip: {{lead.postal_code}}
```

### Authentication Methods

Secure your deliveries:

**API Key**:
```yaml
Headers:
  X-API-Key: ${BUYER_API_KEY}
  Content-Type: application/json
```

**Bearer Token**:
```yaml
Headers:
  Authorization: Bearer ${BUYER_TOKEN}
  Accept: application/json
```

**Basic Auth**:
```yaml
Auth:
  Username: ${BUYER_USERNAME}
  Password: ${BUYER_PASSWORD}
```

**Custom Headers**:
```yaml
Headers:
  X-Partner-ID: "LC-12345"
  X-Campaign-ID: {{source.campaign_id}}
  X-Request-ID: {{lead.id}}
  X-Timestamp: {{now}}
```

### Response Handling

Parse any response format:

**JSON Response**:
```yaml
Expected Response:
{
  "status": "success",
  "leadId": "ABC123",
  "price": 45.00,
  "message": "Lead accepted"
}

Parsing:
  Success: status = "success"
  Lead ID: leadId
  Revenue: price
  Message: message
```

**XML Response**:
```yaml
Expected Response:
<response>
  <result>accepted</result>
  <id>12345</id>
  <amount>45.00</amount>
</response>

Parsing:
  Success: //result = "accepted"
  Lead ID: //id
  Revenue: //amount
```

**Custom Logic**:
```yaml
Response Codes:
  200 + "OK" in body: Success
  200 + "DUP" in body: Duplicate (no revenue)
  400: Invalid data (check message)
  401: Auth failed (pause delivery)
  429: Rate limited (retry with backoff)
  500: Server error (retry 3x)
```

## Delivery Patterns

### Single Buyer Delivery

The simplest pattern:

```yaml
Lead → Format → Deliver to Buyer → Track Result
```

**Configuration**:
```yaml
Recipient: "Primary Buyer"
Delivery: Immediate
Timeout: 10 seconds
Retries: 3 with exponential backoff
```

### Multi-Buyer Distribution

Maximize revenue through competition:

**Exclusive Window**:
```yaml
Hour 0-24: Exclusive Buyer ($75)
  ↓ (if rejected)
Hour 24-48: Premium Buyers ($45)
  ↓ (if rejected)  
Hour 48+: Bulk Buyers ($15)
```

**Simultaneous Post**:
```yaml
Send to all buyers at once:
├── Buyer A
├── Buyer B  
├── Buyer C
└── Accept first responder
```

**Waterfall**:
```yaml
Try Buyer A ($50)
  ↓ (if rejected/error)
Try Buyer B ($40)
  ↓ (if rejected/error)
Try Buyer C ($30)
  ↓ (if rejected/error)
Send to Remediation Pool
```

### Ping/Post Pattern

For real-time bidding:

**Ping Phase**:
```yaml
Step 1: Send partial data to buyers
Fields: state, loan_amount, credit_range

Step 2: Collect bids
Buyer A: $45
Buyer B: $52 ← Winner
Buyer C: $38

Step 3: Accept highest bid
```

**Post Phase**:
```yaml
Step 4: Send full data to winner
All fields to Buyer B

Step 5: Handle response
If accepted: Revenue = $52
If rejected: Try next highest bidder
```

### Batch Delivery

For high-volume efficiency:

```yaml
Accumulate: 100 leads or 5 minutes
Format: CSV or JSON array
Deliver: Single HTTP POST
Parse: Bulk response

Benefits:
- Reduced API calls
- Better throughput
- Lower overhead
```

## Error Handling & Retries

### Smart Retry Logic

Not all errors are equal:

**Retry Strategy**:
```yaml
Timeout Errors:
  Retry: 3 times
  Backoff: 1s, 2s, 4s
  Increase timeout each retry

Rate Limit (429):
  Retry: After specified time
  Honor: Retry-After header
  Max wait: 5 minutes

Server Errors (5xx):
  Retry: 3 times
  Backoff: Exponential
  Alert: If all fail

Client Errors (4xx):
  400 Bad Request: Don't retry (our fault)
  401 Unauthorized: Don't retry, alert
  409 Conflict: Don't retry (duplicate)
```

### Fallback Strategies

Always have Plan B:

**Primary → Secondary**:
```yaml
Try: Production endpoint
If fail: Backup endpoint
If fail: Queue for manual review
```

**Format Degradation**:
```yaml
Try: Custom JSON integration
If fail: Standard webhook
If fail: Email notification
```

### Circuit Breakers

Protect against cascading failures:

```yaml
If error rate > 50% in last 100 attempts:
  Open circuit (stop trying)
  Wait 5 minutes
  Try 1 test request
  If success: Close circuit
  If fail: Wait longer
```

## Performance Optimization

### Speed Techniques

Make delivery fast:

**Connection Pooling**:
```yaml
Keep alive: true
Pool size: 10 connections
Reuse for: 300 seconds
```

**Compression**:
```yaml
Request:
  Content-Encoding: gzip
  Body: Compressed JSON

Response:
  Accept-Encoding: gzip
  Process: Decompress automatically
```

**Regional Endpoints**:
```yaml
If buyer_region = "west":
  Use: https://west.api.buyer.com
Else:
  Use: https://east.api.buyer.com
```

### Reliability Techniques

Ensure delivery success:

**Idempotency**:
```yaml
Headers:
  X-Idempotency-Key: {{lead.id}}-{{delivery_attempt}}
  
Prevents: Duplicate delivery on retry
```

**Acknowledgment**:
```yaml
Delivery confirmed when:
  1. HTTP 200 received
  2. Response parsed successfully
  3. Buyer lead ID captured
  4. Revenue recorded
```

**Monitoring**:
```yaml
Track per recipient:
  - Success rate
  - Average response time
  - Error types
  - Revenue per lead
  
Alert when:
  - Success rate < 90%
  - Response time > 2s
  - Errors spike
```

## Testing Deliveries

### Test Mode

Safe testing without real delivery:

```yaml
Test Settings:
  Mode: Test/Sandbox
  Endpoint: https://sandbox.buyer.com/leads
  Responses: Simulated success/failure
  Revenue: Not recorded
```

### Test Cases

Cover all scenarios:

**Success Path**:
```json
{
  "email": "test@example.com",
  "phone_1": "5555551234",
  "state": "CA"
}
// Expect: 200 OK, lead ID returned
```

**Validation Failures**:
```json
{
  "email": "invalid-email",
  "phone_1": "123",
  "state": "XX"
}
// Expect: 400 Bad Request, specific errors
```

**Edge Cases**:
- Maximum field lengths
- Special characters
- Missing optional fields
- Timezone boundaries

### Load Testing

Ensure scalability:

```yaml
Test Plan:
  Ramp: 0 to 1000 leads/minute
  Duration: 30 minutes
  Monitor: Response times, error rates
  
Success Criteria:
  - 95% success rate
  - p95 latency < 2 seconds
  - No memory leaks
  - Graceful degradation
```

## Common Delivery Issues

### Authentication Problems

**Symptoms**: 401/403 errors
**Solutions**:
- Verify credentials
- Check token expiration
- Confirm IP whitelist
- Review permissions

### Mapping Errors

**Symptoms**: 400 errors, "missing field"
**Solutions**:
- Verify field names exactly
- Check required vs optional
- Confirm data types
- Test with minimal payload

### Timeout Issues

**Symptoms**: Sporadic failures
**Solutions**:
- Increase timeout gradually
- Check recipient capacity
- Implement retries
- Consider async delivery

### Revenue Tracking

**Symptoms**: Missing revenue data
**Solutions**:
- Verify response parsing
- Check field mapping
- Confirm buyer returns price
- Audit delivery events

## Best Practices

### Delivery Design

1. **Map Thoughtfully**
   - Match buyer expectations exactly
   - Document special requirements
   - Test edge cases
   - Version mappings

2. **Handle Errors Gracefully**
   - Specific error messages
   - Smart retry logic
   - Clear alerts
   - Fallback options

3. **Monitor Everything**
   - Success rates by buyer
   - Revenue by source/buyer
   - Response times
   - Error patterns

4. **Optimize Continuously**
   - A/B test formats
   - Negotiate better rates
   - Improve acceptance
   - Reduce latency

### Buyer Relations

**Communication**:
- Share delivery specs
- Provide test leads
- Monitor quality together
- Regular reviews

**Documentation**:
```yaml
Buyer: ABC Insurance
Contact: John Doe
Endpoint: https://api.abc.com/leads
Format: JSON (see schema)
Auth: Bearer token (rotate monthly)
Special Requirements:
  - Phone must be mobile
  - Include TrustedForm
  - Business hours only
```

## Your Next Steps

### Essential Reading
1. **[Custom Integrations](/flows/flow-steps/custom-integrations)** - Beyond standard delivery
2. **[Mappings Deep Dive](/reference/mappings)** - Advanced transformation
3. **[Integration Reference](/reference/integrations)** - Available recipients

### Quick Wins
1. Add delivery monitoring
2. Implement smart retries
3. Test all error paths
4. Document buyer requirements

### Advanced Topics
- **[Multi-Buyer Strategy](/help-guide/patterns/multi-buyer)** - Maximize revenue
- **[Delivery Analytics](/help-guide/analytics/delivery-metrics)** - Track performance
- **[Custom Recipients](/help-guide/development/custom-recipients)** - Build your own

---

💰 **Remember**: Recipient steps are where leads become revenue. Every failed delivery is money lost. Invest in reliable, well-tested delivery configuration and watch your margins improve.

*Next: Continue your journey with [Lead Events](/leads/lead-events) to understand the complete audit trail of your deliveries.*