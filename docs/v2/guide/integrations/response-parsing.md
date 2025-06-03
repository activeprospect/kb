# Response Parsing Guide

Extract valuable data from API responses to track delivery status, capture IDs, and handle errors effectively. Master JSON, XML, and custom response parsing.

## 📍 You Are Here

Your integrations return responses that contain important information - success confirmations, lead IDs, error messages. This guide shows you how to parse and use that data effectively.

## 🎯 What You'll Learn

- Response parsing fundamentals
- JSON path notation
- XML parsing with XPath
- Error extraction
- Conditional logic
- Advanced patterns

## 📝 Why Parse Responses?

### What Responses Tell You

API responses contain:
- **Success/Failure** status
- **Record IDs** for tracking
- **Error details** for debugging
- **Warnings** about data issues
- **Metadata** like processing time

### Without Parsing

❌ You only know if the request worked
❌ Can't track leads in destination
❌ Generic error messages
❌ No detailed diagnostics

### With Parsing

✅ Extract specific success indicators
✅ Capture lead IDs for updates
✅ Get detailed error reasons
✅ Build smart retry logic

## 🔧 JSON Response Parsing

### Basic JSON Paths

For this response:
```json
{
  "status": "success",
  "data": {
    "lead_id": "12345",
    "score": 87
  },
  "message": "Lead created successfully"
}
```

Extract values using dot notation:
```
status           → "success"
data.lead_id     → "12345"
data.score       → 87
message          → "Lead created successfully"
```

### Nested Objects

For complex responses:
```json
{
  "result": {
    "lead": {
      "id": "ABC123",
      "status": "active",
      "owner": {
        "name": "John Smith",
        "id": "USER456"
      }
    },
    "warnings": ["Phone might be invalid"]
  }
}
```

Parse paths:
```
result.lead.id          → "ABC123"
result.lead.owner.name  → "John Smith"
result.warnings[0]      → "Phone might be invalid"
```

### Array Handling

For array responses:
```json
{
  "leads": [
    {"id": "1", "status": "created"},
    {"id": "2", "status": "duplicate"}
  ],
  "count": 2
}
```

Access arrays:
```
leads[0].id        → "1"
leads[0].status    → "created"
leads[1].status    → "duplicate"
count              → 2
```

## 📄 XML Response Parsing

### XPath Basics

For this XML:
```xml
<response>
  <status>success</status>
  <lead>
    <id>12345</id>
    <score>87</score>
  </lead>
  <message>Lead created</message>
</response>
```

XPath expressions:
```
/response/status       → "success"
/response/lead/id      → "12345"
//score               → "87" (anywhere in doc)
/response/message     → "Lead created"
```

### Attributes in XML

For XML with attributes:
```xml
<response status="success" code="200">
  <lead id="12345" type="new">
    <field name="email">test@example.com</field>
    <field name="phone">5551234567</field>
  </lead>
</response>
```

Parse attributes:
```
/response/@status              → "success"
/response/@code               → "200"
/response/lead/@id            → "12345"
//field[@name='email']/text() → "test@example.com"
```

## 🎯 LeadConduit Configuration

### Setting Up Response Parsing

In your delivery step:

1. **Identify Response Format**
   - JSON (most common)
   - XML
   - Plain text
   - HTML

2. **Configure Parser**
   ```yaml
   Response Format: JSON
   Success Path: status
   Success Value: success
   Lead ID Path: data.lead_id
   Error Path: error.message
   ```

3. **Map to Fields**
   ```
   Parsed Value        → LeadConduit Field
   data.lead_id        → recipient.id
   data.assigned_to    → recipient.owner
   data.score         → recipient.score
   ```

## 🔍 Success Detection

### Simple Success Check

**Boolean Flag**:
```json
{"success": true, "id": "12345"}
```
```yaml
Success Path: success
Success Value: true
```

**Status Field**:
```json
{"status": "created", "lead_id": "12345"}
```
```yaml
Success Path: status
Success Values: ["created", "updated", "accepted"]
```

### HTTP Status Codes

**Standard Codes**:
```yaml
Success Codes: [200, 201, 202]
Failure Codes: [400, 409, 422]
Error Codes: [500, 502, 503]
```

### Complex Success Logic

**Multiple Conditions**:
```json
{
  "code": 200,
  "status": "ok",
  "data": {"created": true}
}
```
```yaml
Success When:
  - code equals 200
  - AND status equals "ok"
  - AND data.created is true
```

## 🚨 Error Extraction

### Simple Error Messages

**Flat Structure**:
```json
{
  "success": false,
  "error": "Email already exists"
}
```
```yaml
Error Path: error
```

**Nested Errors**:
```json
{
  "status": "error",
  "errors": {
    "email": ["Invalid format", "Domain not allowed"],
    "phone": ["Required field"]
  }
}
```
```yaml
Error Paths:
  - errors.email[0]
  - errors.phone[0]
```

### Field-Specific Errors

**Validation Errors**:
```json
{
  "errors": [
    {"field": "email", "message": "Invalid format"},
    {"field": "phone", "message": "Not a valid number"}
  ]
}
```

Parse and format:
```javascript
// Extract all errors
errors = response.errors.map(e => `${e.field}: ${e.message}`)
error_message = errors.join(', ')
// Result: "email: Invalid format, phone: Not a valid number"
```

## 🔄 Conditional Parsing

### Different Paths for Different Outcomes

**Success Response**:
```json
{
  "status": "success",
  "lead": {"id": "12345"}
}
```

**Error Response**:
```json
{
  "status": "error",
  "message": "Invalid phone number"
}
```

**Configuration**:
```yaml
If status equals "success":
  Lead ID Path: lead.id
Else:
  Error Path: message
```

### Handling Variable Responses

**Sometimes ID, Sometimes URL**:
```json
// Response 1
{"lead_id": "12345"}

// Response 2
{"lead_url": "https://crm.com/leads/12345"}
```

**Flexible Parsing**:
```javascript
lead_identifier = response.lead_id || 
                 response.lead_url?.split('/').pop()
```

## 💡 Advanced Patterns

### Parsing Arrays of Results

**Batch Response**:
```json
{
  "results": [
    {"email": "test1@example.com", "status": "created", "id": "123"},
    {"email": "test2@example.com", "status": "duplicate", "id": null}
  ]
}
```

**Extract Summary**:
```javascript
successful = results.filter(r => r.status === "created").length
failed = results.filter(r => r.status !== "created").length
first_id = results.find(r => r.id)?.id
```

### Computed Values

**Calculate from Response**:
```json
{
  "base_score": 70,
  "bonuses": {
    "email_valid": 10,
    "phone_valid": 10,
    "complete_profile": 5
  }
}
```

**Compute Total**:
```javascript
total_score = base_score + 
              Object.values(bonuses).reduce((a,b) => a+b, 0)
// Result: 95
```

### Fallback Values

**Handle Missing Data**:
```javascript
// With defaults
lead_id = response.data?.lead?.id || "NO_ID"
status = response.status || "unknown"
message = response.message || "No message provided"

// Conditional paths
if (response.success) {
  outcome = "success"
  id = response.lead_id
} else {
  outcome = "failure"
  reason = response.error || response.message || "Unknown error"
}
```

## 🧪 Testing Response Parsing

### Test Your Configuration

1. **Use Test Responses**
   ```json
   {
     "status": "success",
     "lead_id": "TEST123"
   }
   ```

2. **Verify Extraction**
   - Check parsed values in Events
   - Confirm correct field mapping
   - Test error scenarios

### Common Test Cases

**Success Case**:
```json
{
  "created": true,
  "id": "12345",
  "message": "Success"
}
```

**Failure Case**:
```json
{
  "created": false,
  "error": "Duplicate email"
}
```

**Malformed Response**:
```
This is not JSON
```

## 🚫 Common Issues

### "Cannot Parse Response"

**Causes**:
- Response not in expected format
- Invalid JSON/XML
- Empty response
- HTML error page instead of API response

**Solutions**:
1. Check Content-Type header
2. Validate response format
3. Handle empty responses
4. Look for error pages

### "Path Not Found"

**Debug**:
```javascript
// Log full response
console.log(JSON.stringify(response, null, 2))

// Check structure
expected: response.data.lead.id
actual: response.result.lead_id
```

### "Wrong Data Type"

**Issue**: Expecting string, got number
```json
{"lead_id": 12345}  // Number, not string
```

**Solution**:
```javascript
// Convert types
lead_id = String(response.lead_id)
score = Number(response.score)
is_valid = Boolean(response.valid)
```

## 📋 Parsing Checklist

**Response Setup**:
- [ ] Identify response format
- [ ] Configure parser type
- [ ] Set success indicators
- [ ] Define error paths

**Field Mapping**:
- [ ] Map ID fields
- [ ] Extract status info
- [ ] Capture errors
- [ ] Handle missing data

**Testing**:
- [ ] Test success responses
- [ ] Test error responses
- [ ] Test edge cases
- [ ] Verify in Events

## 📚 Related Documentation

- [Webhooks and APIs](./webhooks-and-apis.md) - Integration setup
- [Field Mapping](../data-management/data-mapping.md) - Data transformation
- [Understanding Events](../analytics/understanding-events.md) - Debug parsing

---

🎯 **Parse Perfectly**: Good response parsing turns cryptic API responses into actionable data. Take time to understand response structures and build robust parsing rules!