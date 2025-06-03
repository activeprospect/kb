---
title: Sources
description: Configure and manage the entry points where leads flow into LeadConduit
tags:
  - sources
  - integration
  - lead-submission
---

# Sources

## Your Lead Entry Points

Sources are the front doors of your lead operation. They define how external systems - vendors, web forms, partners - send leads into your LeadConduit flows. Every lead's journey begins at a source, making this one of the most critical configurations you'll manage.

📍 **You are here**: Learning to configure and optimize lead sources
🔌 **What you'll build**: Reliable connections that accept good leads and reject bad ones
💡 **Key insight**: One well-configured source can save thousands in bad lead costs

## Understanding Sources

### What Is a Source?

A source is a configured connection point that:
- Accepts incoming lead data
- Authenticates the sender
- Maps fields to your standards
- Applies initial quality gates
- Provides submission feedback

Think of it as a smart reception desk that knows exactly who's allowed in and what they should bring.

### Source Types

LeadConduit offers four source categories:

**1. Default Source**
- Created automatically with your account
- Perfect for testing and manual entry
- No configuration required
- Always available

**2. Standard Sources**
Pre-built integrations for major platforms:
- Facebook Lead Ads
- Google Ads
- TikTok Lead Generation
- Major lead aggregators
- Common CRM systems

**3. Custom Sources**
Build your own for unique needs:
- Proprietary vendor APIs
- Internal lead generation
- Custom web forms
- Legacy system integration

**4. Account Sources**
Connect with other LeadConduit users:
- Instant compatibility
- Built-in authentication
- Automatic field mapping
- Real-time delivery

## Configuring Sources

### Basic Configuration

Every source needs fundamental settings:

**1. Identity**
```yaml
Name: "Facebook - Auto Insurance - California"
Description: "FB lead gen campaign for CA auto insurance"
Tags: ["facebook", "auto", "california", "tier-1"]
```

💡 **Naming Best Practice**: Include platform, vertical, and geography. You'll thank yourself when you have 50+ sources.

**2. Authentication**
Secure your sources appropriately:

**Open (Testing only)**:
- No authentication required
- Use only for internal testing
- Never in production

**API Key**:
```yaml
Method: API Key
Key Location: Header
Key Name: X-API-Key
Key Value: abc123def456
```

**Whitelist + API Key**:
```yaml
IP Whitelist: 
  - 192.168.1.100
  - 10.0.0.0/24
API Key: Required
```

**3. Field Configuration**
Define what data you expect:

```yaml
Required Fields:
  - first_name (text)
  - last_name (text)
  - email (email)
  - phone (phone)
  - state (us_state)

Optional Fields:
  - phone_2 (phone)
  - city (text)
  - zip_code (postal_code)
  - opted_in_at (date)
```

### Advanced Configuration

**Response Format**
Control what sources receive back:
```yaml
Success Response:
  - Status: 201 Created
  - Body: {
      "result": "success",
      "lead_id": "{{lead.id}}",
      "price": {{lead.price}}
    }

Failure Response:
  - Status: 400 Bad Request
  - Body: {
      "result": "failure",
      "reason": "{{lead.rejection_reason}}",
      "errors": {{lead.validation_errors}}
    }
```

**Rate Limiting**
Protect your system:
```yaml
Rate Limits:
  - 100 requests per minute
  - 5000 requests per hour
  - 50000 requests per day
```

**Custom Headers**
Add metadata to every lead:
```yaml
Capture Headers:
  - User-Agent → lead.source_system
  - X-Campaign-ID → lead.campaign_id
  - X-Source-ID → lead.vendor_id
```

## Source Integration Patterns

### Web Form Integration

The simplest pattern - direct POST submission:

**Source Type**: Inbound Field
**Configuration**:
```yaml
Endpoint: https://app.leadconduit.com/v2/sources/ABC123/submit
Method: POST
Content-Type: application/json
Fields: Defined in UI
```

**Integration Code** (example):
```javascript
// Your website form
const submitLead = async (formData) => {
  const response = await fetch('YOUR_SOURCE_URL', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'X-API-Key': 'YOUR_API_KEY'
    },
    body: JSON.stringify(formData)
  });
  
  const result = await response.json();
  if (result.result === 'success') {
    // Show success message
  } else {
    // Handle rejection
  }
};
```

### Vendor API Integration

For professional lead vendors:

**Source Type**: Custom or Standard Integration
**Configuration**:
```yaml
Authentication: OAuth 2.0
Polling Interval: Every 5 minutes
Batch Size: 100 leads
Field Mapping: Vendor → LeadConduit
Error Handling: Retry 3x with backoff
```

**Key Features**:
- Automatic polling or webhook
- Bulk lead processing
- Error recovery
- Detailed logging

### Real-Time Streaming

For high-volume, low-latency needs:

**Source Type**: Webhook or WebSocket
**Configuration**:
```yaml
Connection: Persistent WebSocket
Heartbeat: Every 30 seconds
Reconnect: Automatic with backoff
Buffer: 1000 messages
Acknowledgment: Per message
```

## Managing Multiple Sources

### Source Organization

Structure sources logically:

**By Platform**:
```
Facebook Sources/
├── FB - Auto Insurance - National
├── FB - Home Insurance - CA
└── FB - Life Insurance - Seniors

Google Sources/
├── Google - Search - Auto
├── Google - Display - Home
└── Google - YouTube - Life
```

**By Partner**:
```
Vendor A/
├── Vendor A - Exclusive Leads
├── Vendor A - Shared Leads
└── Vendor A - Aged Leads

Vendor B/
├── Vendor B - Real-time
├── Vendor B - Batch
└── Vendor B - Test
```

### Source Performance Tracking

Monitor key metrics:

**Volume Metrics**:
- Leads per hour/day/month
- Peak submission times
- Batch sizes and frequency

**Quality Metrics**:
- Acceptance rate
- Common rejection reasons
- Field completion rates
- Type validation success

**Technical Metrics**:
- Response times
- Error rates
- Timeout frequency
- Authentication failures

### Source Optimization

Improve source performance:

**1. Acceptance Rate Optimization**
```yaml
Current: 60% acceptance
Analysis: 
  - 25% fail phone validation
  - 15% missing required fields
  
Solutions:
  - Add phone formatting guide
  - Highlight required fields
  - Pre-validate on vendor side
  
Result: 85% acceptance
```

**2. Speed Optimization**
- Use connection pooling
- Enable HTTP/2
- Implement batch submission
- Optimize field parsing

**3. Error Reduction**
- Add client-side validation
- Implement retry logic
- Use idempotency keys
- Monitor timeout patterns

## Testing Sources

### Test Methodology

Always test thoroughly:

**1. Single Lead Test**
- Submit one perfect lead
- Verify acceptance
- Check field mapping
- Confirm response format

**2. Validation Testing**
- Submit invalid email
- Submit invalid phone
- Miss required fields
- Exceed field lengths

**3. Load Testing**
- Submit 100 leads rapidly
- Test rate limiting
- Verify queue handling
- Monitor performance

**4. Error Testing**
- Test auth failure
- Test network timeout
- Test malformed data
- Test cap exceeded

### Test Tools

**Built-in Tester**:
- Available on every source
- Pre-fills sample data
- Shows real-time results
- Captures full response

**API Testing Tools**:
- Postman collections
- cURL commands
- Automated test suites
- Load testing tools

## Common Source Issues

### Authentication Problems

**Symptoms**: 401/403 errors
**Common Causes**:
- Incorrect API key
- IP not whitelisted
- Certificate expired
- OAuth token invalid

**Solutions**:
1. Verify credentials
2. Check IP whitelist
3. Regenerate tokens
4. Test from allowed IPs

### Field Mapping Issues

**Symptoms**: Data in wrong fields
**Common Causes**:
- Mismatched field names
- Wrong data types
- Nested vs flat structure
- Array handling

**Solutions**:
1. Review field mappings
2. Check sample payloads
3. Use explicit paths
4. Test with real data

### Performance Problems

**Symptoms**: Slow processing, timeouts
**Common Causes**:
- No connection pooling
- Serial processing
- Large payloads
- Network latency

**Solutions**:
1. Enable keep-alive
2. Implement batching
3. Compress payloads
4. Use regional endpoints

## Source Security

### Best Practices

Protect your sources:

**1. Always Use HTTPS**
- Encrypted transmission
- Certificate validation
- No HTTP fallback

**2. Implement Authentication**
- API keys minimum
- IP whitelisting for fixed sources
- OAuth for user-based sources
- Rotate credentials regularly

**3. Validate Input**
- Check data types
- Enforce field lengths
- Sanitize content
- Block malicious payloads

**4. Monitor Activity**
- Track submission patterns
- Alert on anomalies
- Log security events
- Review access regularly

### Compliance Considerations

Ensure sources support compliance:

**Consent Tracking**:
- Capture opt-in timestamp
- Record consent language
- Store TrustedForm certificates
- Track opt-in source

**Data Privacy**:
- Minimal data collection
- Secure transmission
- Audit trail maintenance
- Right to deletion support

## Advanced Source Features

### Conditional Acceptance

Accept leads based on real-time conditions:

```yaml
Accept When:
  - Time: Business hours only
  - Volume: Under daily cap
  - Quality: Score > 50
  - Capacity: Buyers available
```

### Dynamic Pricing

Adjust source costs dynamically:

```yaml
Base Price: $5
Adjustments:
  - If exclusive: +$10
  - If state = "CA": +$2
  - If age < 35: +$3
  - If weekend: -$1
```

### Source Chaining

Connect sources in sequence:

```
Source A → Enhancement → Source B → Final Flow
```

Use cases:
- Pre-process before flow
- Aggregate multiple sources
- Add required data
- Normalize formats

## Your Next Steps

### Essential Reading
1. **[Field Mappings](/flows/lead-submission/mappings)** - Transform any data format
2. **[Acceptance Criteria](/flows/lead-submission/acceptance-criteria)** - Set quality standards
3. **[Testing Guide](/help-guide/testing/source-testing)** - Verify everything works

### Quick Wins
1. Configure your first test source
2. Submit a sample lead
3. Check the field mapping
4. Verify the response

### Advanced Topics
1. **[Batch Processing](/help-guide/advanced/batch-sources)** - Handle bulk submissions
2. **[Webhook Sources](/help-guide/integrations/webhooks)** - Real-time integration
3. **[Custom Authentication](/help-guide/security/custom-auth)** - Advanced security

---

🎯 **Pro Tip**: The best source configuration is invisible - it just works. Invest time in proper setup, and your sources will run smoothly for years.

*Next up: [Field Mappings](/flows/lead-submission/mappings) - Learn how to transform any vendor's format into your standard fields.*