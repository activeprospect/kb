# Understanding Lead Submission

Learn how leads flow into your system and what happens at each step of the submission process. This guide explains submission documentation, authentication, and response handling.

## 📍 You Are Here

You're learning the technical side of lead submission - how sources send data to your flows, what documentation they need, and how to troubleshoot submission issues.

## 🎯 What You'll Learn

- How submission documentation works
- Authentication and security
- Request and response formats
- Batch importing leads
- Troubleshooting submissions

## 📋 Submission Documentation

### What Are Submission Docs?

Submission docs are auto-generated technical guides for each source in your flow. They provide:
- Unique submission endpoint URL
- Authentication credentials
- Required and optional fields
- Sample requests in multiple formats
- Expected response formats
- Acceptance criteria requirements

### Accessing Submission Docs

1. **Navigate to Your Flow**
   - Click **Flows** in navigation
   - Select your specific flow

2. **Open Submission Docs**
   - Click **Submission Docs** dropdown (top right)
   - Select the source you want docs for

3. **Unique URL Generated**
   - Each source gets a unique documentation URL
   - Safe to share with vendors
   - No account credentials required

![Flow Navigation and Submission Docs](./images/flow-submission-docs.png)

### What's in the Documentation

**Endpoint Information**:
```
POST https://app.leadconduit.com/flows/[FLOW_ID]/sources/[SOURCE_NAME]
Headers:
  Content-Type: application/json
  X-API-Key: [YOUR_API_KEY]
```

**Required Fields** (from your acceptance criteria):
- email (must be valid format)
- phone (10-digit US format)
- first_name (not blank)
- state (2-letter code)

**Sample Request**:
```json
{
  "email": "john.doe@example.com",
  "phone": "5551234567",
  "first_name": "John",
  "last_name": "Doe",
  "state": "CA",
  "zip": "90210"
}
```

**Sample Response** (Success):
```json
{
  "outcome": "success",
  "lead": {
    "id": "550e8400-e29b-41d4-a716-446655440000"
  },
  "price": 15.00
}
```

## 🔐 Authentication Methods

### API Key Authentication

Most common method for programmatic submission:

**Header Authentication**:
```
X-API-Key: abc123def456ghi789
```

**Query Parameter** (alternative):
```
https://app.leadconduit.com/flows/[ID]/sources/[NAME]?api_key=abc123
```

### Security Best Practices

- **Keep API keys secret** - Treat like passwords
- **Use HTTPS only** - Never submit over HTTP
- **Rotate keys periodically** - Update every 90 days
- **IP whitelisting** (optional) - Restrict to known IPs
- **Monitor usage** - Watch for unusual patterns

## 📤 Submission Formats

### JSON (Recommended)

Most common and flexible:
```bash
curl -X POST https://app.leadconduit.com/flows/[ID]/sources/[NAME] \
  -H "Content-Type: application/json" \
  -H "X-API-Key: [KEY]" \
  -d '{
    "email": "test@example.com",
    "phone": "5551234567",
    "first_name": "Test"
  }'
```

### Form URL-Encoded

For simple web forms:
```bash
curl -X POST https://app.leadconduit.com/flows/[ID]/sources/[NAME] \
  -H "Content-Type: application/x-www-form-urlencoded" \
  -H "X-API-Key: [KEY]" \
  -d "email=test@example.com&phone=5551234567&first_name=Test"
```

### XML

For legacy systems:
```xml
POST /flows/[ID]/sources/[NAME]
Content-Type: application/xml
X-API-Key: [KEY]

<lead>
  <email>test@example.com</email>
  <phone>5551234567</phone>
  <first_name>Test</first_name>
</lead>
```

## 📊 Understanding Responses

### Success Response

```json
{
  "outcome": "success",
  "lead": {
    "id": "550e8400-e29b-41d4-a716-446655440000"
  },
  "price": 15.00,
  "billable": 1
}
```

**Key Fields**:
- `outcome` - "success" indicates acceptance
- `lead.id` - Unique identifier for tracking
- `price` - Cost of this lead (if configured)
- `billable` - Transaction count for billing

### Failure Response

```json
{
  "outcome": "failure",
  "reason": "Invalid phone number format",
  "errors": [
    {
      "field": "phone",
      "message": "Phone number must be 10 digits"
    }
  ]
}
```

**Key Fields**:
- `outcome` - "failure" indicates rejection
- `reason` - Human-readable rejection reason
- `errors` - Detailed field-level errors

### Error Response

```json
{
  "outcome": "error",
  "message": "Authentication failed",
  "status": 401
}
```

**Common Errors**:
- 401 - Authentication failed
- 404 - Flow/source not found
- 500 - Server error
- 503 - Service unavailable

## 📥 Batch Importing

### Using the Import Feature

From the submission docs page:

1. **Click "Import Leads"** (top right)
2. **Select CSV File**
   - First row must be headers
   - Headers should match field names
3. **Map Fields** if needed
4. **Start Import**
   - Processes in browser
   - 6 concurrent submissions max
   - Shows progress and results

![Batch Import Interface](./images/batch-import.png)

### CSV Format Example

```csv
email,phone,first_name,last_name,state,zip
john@example.com,5551234567,John,Doe,CA,90210
jane@example.com,5559876543,Jane,Smith,TX,78701
```

### Import Limitations

- **Browser-based** - Runs in your browser
- **Concurrent limit** - 6 leads at a time
- **No scheduling** - Manual process only
- **Size limits** - Large files may timeout

For high-volume imports, use API submission instead.

## 🔄 The Submission Flow

### What Happens When a Lead is Submitted

1. **HTTP Request Received**
   - Endpoint validates format
   - Authentication checked

2. **Source Configuration Applied**
   - Field mappings transform data
   - Default values added

3. **Type Parsing**
   - Fields parsed by type
   - Validation flags set

4. **Acceptance Criteria**
   - Business rules evaluated
   - Accept/reject decision made

5. **Processing** (if accepted)
   - Enhancement steps run
   - Filters evaluate
   - Delivery attempted

6. **Response Sent**
   - Outcome returned to submitter
   - Includes ID and any errors

### Timing

Typical processing times:
- Simple flow: 200-500ms
- With enhancements: 500-2000ms
- Complex routing: 1000-3000ms

## 🚫 Common Submission Issues

### "Authentication Failed"

**Check**:
- API key is correct
- Key is active (not expired)
- Using correct header/parameter name
- Source is active

### "Field Required"

**Verify**:
- Field name matches exactly (case-sensitive)
- Value is not empty/null
- Format meets requirements

### "Invalid Format"

**Common Causes**:
- Phone missing area code
- Email missing @ symbol
- State using full name not code
- Date in wrong format

### "Source Not Found"

**Troubleshoot**:
- URL is correct
- Source name hasn't changed
- Flow is active
- Using correct environment

## 💡 Best Practices

### For Sources/Vendors

**Test First**:
- Use submission docs test feature
- Verify all fields work
- Check response handling
- Test error scenarios

**Handle Responses**:
- Check outcome field
- Log lead IDs
- Retry on errors (with backoff)
- Parse rejection reasons

**Monitor Performance**:
- Track acceptance rates
- Log response times
- Alert on failures
- Review rejection reasons

### For Flow Owners

**Clear Documentation**:
- Keep acceptance criteria updated
- Document special requirements
- Provide example data
- Include contact information

**Version Control**:
- Notify sources of changes
- Provide migration period
- Test thoroughly
- Document breaking changes

## 🎯 Submission Checklist

Before going live:
- [ ] Source has submission docs URL
- [ ] Authentication is configured
- [ ] Required fields documented
- [ ] Test submission successful
- [ ] Response handling implemented
- [ ] Error scenarios tested
- [ ] Monitoring in place
- [ ] Support contact shared

## 📚 Related Documentation

- [Adding Sources](./adding-sources.md) - Source configuration
- [Events Reference](../../reference/lifecycle.md) - Understanding event data
- [API Reference](../../reference/integrations.md) - Technical details

---

📤 **Submission Success**: Understanding how leads enter your system is crucial for smooth operations. With proper documentation and testing, submissions become reliable and automated!