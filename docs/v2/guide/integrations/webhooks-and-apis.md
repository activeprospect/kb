# Webhooks and Custom API Integration

Master the art of connecting LeadConduit to any system with an API. Learn webhook configuration, authentication methods, response handling, and advanced integration patterns.

## 📍 You Are Here

You need to integrate with a system that doesn't have a pre-built integration. Whether it's your custom CRM, a proprietary system, or a third-party API, this guide shows you how to build reliable connections.

## 🎯 What You'll Learn

- Webhook configuration basics
- Authentication methods
- Request formatting
- Response parsing
- Error handling
- Advanced patterns

## 🔧 Webhook Basics

### What's a Webhook?

A webhook sends data to any HTTP endpoint:
- **Flexible**: Works with any API
- **Real-time**: Immediate delivery
- **Customizable**: Full control over format
- **Universal**: Standard HTTP/HTTPS

### Basic Configuration

```javascript
// Minimal webhook setup
{
  name: "My Custom CRM",
  url: "https://api.mycrm.com/leads",
  method: "POST",
  headers: {
    "Content-Type": "application/json"
  }
}
```

## 🔐 Authentication Methods

### API Key Authentication

**Header-based**:
```javascript
headers: {
  "X-API-Key": "your-api-key-here",
  "Content-Type": "application/json"
}
```

**Query Parameter**:
```javascript
url: "https://api.example.com/leads?api_key=your-key"
```

**Custom Header**:
```javascript
headers: {
  "Authorization": "ApiKey your-key-here",
  "X-Customer-ID": "12345"
}
```

### Bearer Token

OAuth and JWT tokens:
```javascript
headers: {
  "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
  "Content-Type": "application/json"
}
```

### Basic Authentication

Username/password:
```javascript
// Encoded credentials
headers: {
  "Authorization": "Basic " + btoa(username + ":" + password)
}

// LeadConduit handles encoding
auth: {
  username: "myuser",
  password: "mypass"
}
```

### HMAC Signing

For secure webhooks:
```javascript
// Generate signature
const payload = JSON.stringify(data)
const signature = crypto
  .createHmac('sha256', secret)
  .update(payload)
  .digest('hex')

headers: {
  "X-Signature": signature,
  "X-Timestamp": Date.now()
}
```

## 📤 Request Configuration

### JSON Payload

Most common format:
```javascript
// Configuration
method: "POST"
headers: {
  "Content-Type": "application/json"
}

// Field mapping produces:
{
  "email": "test@example.com",
  "phone": "5551234567",
  "firstName": "John",
  "lastName": "Doe",
  "customFields": {
    "source": "landing-page",
    "score": 85
  }
}
```

### Form URL-Encoded

For legacy systems:
```javascript
// Configuration
headers: {
  "Content-Type": "application/x-www-form-urlencoded"
}

// Produces:
email=test%40example.com&phone=5551234567&firstName=John
```

### XML Payload

Some systems require XML:
```javascript
// Configuration
headers: {
  "Content-Type": "application/xml"
}

// Custom template
body: `
<lead>
  <email>${lead.email}</email>
  <phone>${lead.phone}</phone>
  <name>
    <first>${lead.first_name}</first>
    <last>${lead.last_name}</last>
  </name>
</lead>
`
```

### Custom Formats

Build any format:
```javascript
// CSV line
body: [
  lead.email,
  lead.phone,
  lead.first_name,
  lead.last_name
].join(',')

// Pipe-delimited
body: Object.values(lead).join('|')

// Fixed-width
body: 
  lead.email.padEnd(50) +
  lead.phone.padEnd(15) +
  lead.first_name.padEnd(30)
```

## 📥 Response Handling

### Success Detection

Configure what indicates success:
```javascript
// HTTP status codes
success_codes: [200, 201, 202]

// Response body check
success_check: {
  path: "status",
  value: "success"
}

// Multiple conditions
success_when: {
  status_code: 200,
  body: {
    created: true
  }
}
```

### Parsing Responses

Extract data from responses:

**JSON Response**:
```javascript
// Response
{
  "status": "created",
  "lead": {
    "id": "12345",
    "score": 87
  },
  "message": "Lead created successfully"
}

// Parse configuration
response_parser: {
  outcome: "status",
  lead_id: "lead.id",
  lead_score: "lead.score",
  message: "message"
}
```

**XML Response**:
```xml
<response>
  <status>success</status>
  <leadId>12345</leadId>
</response>

// XPath parsing
response_parser: {
  outcome: "//status",
  lead_id: "//leadId"
}
```

### Error Extraction

Capture error details:
```javascript
// Error response
{
  "error": {
    "code": "INVALID_PHONE",
    "message": "Phone number format invalid",
    "field": "phone"
  }
}

// Parse errors
error_parser: {
  error_code: "error.code",
  error_message: "error.message",
  error_field: "error.field"
}
```

## 🔄 Retry Configuration

### Basic Retry

Simple retry on failure:
```javascript
retry: {
  max_attempts: 3,
  delay: 1000  // 1 second
}
```

### Exponential Backoff

Increasing delays:
```javascript
retry: {
  max_attempts: 5,
  delays: [1000, 2000, 4000, 8000, 16000]
}
```

### Conditional Retry

Only retry certain errors:
```javascript
retry: {
  max_attempts: 3,
  retry_on: [500, 502, 503, 504],  // Server errors
  dont_retry_on: [400, 401, 403]   // Client errors
}
```

## 🏗️ Advanced Patterns

### Dynamic URLs

Route to different endpoints:
```javascript
// Based on lead type
url: lead.type == "sales" 
  ? "https://api.example.com/sales/leads"
  : "https://api.example.com/marketing/leads"

// Based on geography
url: `https://api.example.com/${lead.region}/leads`

// Load balancing
const endpoints = [
  "https://api1.example.com",
  "https://api2.example.com",
  "https://api3.example.com"
]
url: endpoints[Math.floor(Math.random() * endpoints.length)]
```

### Batch Requests

Send multiple leads:
```javascript
// Collect leads
batch: {
  size: 100,
  timeout: 60000  // 1 minute
}

// Batch payload
{
  "leads": [
    { "email": "test1@example.com", "phone": "5551234567" },
    { "email": "test2@example.com", "phone": "5551234568" },
    // ... up to 100 leads
  ]
}
```

### Request Enrichment

Add metadata:
```javascript
// Add tracking
body: {
  ...lead,
  metadata: {
    source: "leadconduit",
    timestamp: new Date().toISOString(),
    flow_id: flow.id,
    event_id: event.id
  }
}

// Add hash for verification
body: {
  ...lead,
  hash: sha256(JSON.stringify(lead) + secret)
}
```

### Conditional Requests

Send only when needed:
```javascript
// Skip low-quality leads
if (lead.score < 50) {
  skip = true
  reason = "Score too low for API"
}

// Time-based routing
const hour = new Date().getHours()
if (hour < 9 || hour > 17) {
  url = "https://api.example.com/after-hours"
}
```

## 🧪 Testing Webhooks

### Test Endpoints

Use these for development:
- **webhook.site** - Instant endpoint
- **requestbin.com** - Inspect requests
- **beeceptor.com** - Mock responses
- **postman-echo.com** - Echo service

### Local Testing

Test against local server:
```bash
# Start local server
npx json-server --watch db.json --port 3000

# Use ngrok for public URL
ngrok http 3000

# Configure webhook
url: "https://abc123.ngrok.io/leads"
```

### Test Scenarios

**Success Test**:
```javascript
// Valid data, expects 200 OK
{
  "email": "test@example.com",
  "phone": "5551234567"
}
```

**Validation Error**:
```javascript
// Invalid email, expects 400
{
  "email": "not-an-email",
  "phone": "5551234567"
}
```

**Server Error**:
```javascript
// Point to error endpoint
url: "https://httpstat.us/500"
// Verify retry behavior
```

**Timeout Test**:
```javascript
// Slow endpoint
url: "https://httpstat.us/200?sleep=5000"
timeout: 3000  // Will timeout
```

## 🛡️ Security Best Practices

### Use HTTPS

Always use encrypted connections:
```javascript
// Good
url: "https://api.example.com/leads"

// Bad
url: "http://api.example.com/leads"
```

### Validate Certificates

Don't skip certificate validation:
```javascript
// Secure (default)
validate_ssl: true

// Only for development
validate_ssl: false
```

### Secure Credentials

Store securely:
```javascript
// Use environment variables
headers: {
  "X-API-Key": "${API_KEY}"  // From environment
}

// Rotate regularly
// Document in secure location
// Never commit to code
```

### IP Whitelisting

When available:
```javascript
// Provide LeadConduit IPs
allowed_ips: [
  "52.4.126.222",
  "52.55.64.3",
  // ... full list
]
```

## 📊 Monitoring and Debugging

### Request Logging

What to log:
- Request URL
- Headers (minus auth)
- Payload
- Response status
- Response body
- Timing

### Common Issues

**"Connection Refused"**:
- Check URL is correct
- Verify firewall rules
- Test from different location

**"SSL Certificate Error"**:
- Check certificate validity
- Ensure correct domain
- Update CA certificates

**"Timeout"**:
- Increase timeout setting
- Check endpoint performance
- Implement retry logic

**"Invalid JSON"**:
- Validate JSON structure
- Check special characters
- Verify encoding

## 💡 Best Practices

### Design Principles

1. **Idempotency**
   - Same request = same result
   - Use unique identifiers
   - Handle duplicates gracefully

2. **Graceful Degradation**
   - Handle errors properly
   - Provide fallbacks
   - Don't lose data

3. **Monitoring**
   - Track success rates
   - Monitor response times
   - Alert on failures

### Performance Tips

1. **Connection Pooling**
   - Reuse connections
   - Reduce overhead
   - Improve speed

2. **Appropriate Timeouts**
   - Not too short (false failures)
   - Not too long (blocking)
   - Match endpoint SLA

3. **Efficient Payloads**
   - Send only needed fields
   - Compress if supported
   - Batch when beneficial

## 📚 Related Documentation

- [First Integration](../getting-started/first-integration.md) - Integration basics
- [Configuring Delivery](../flow-management/configuring-delivery.md) - Delivery options
- [Response Parsing](./response-parsing.md) - Advanced parsing

---

🔌 **API Mastery**: Webhooks provide unlimited integration possibilities. Start simple, test thoroughly, and gradually add complexity as needed. Remember: good error handling is worth the investment!