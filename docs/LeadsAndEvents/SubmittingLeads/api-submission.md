---
layout: page
title: API Submission
permalink: /LeadsAndEvents/SubmittingLeads/api-submission
---

# API Submission

API submission provides real-time, programmatic lead submission to LeadConduit flows. This method enables high-volume, automated lead processing with immediate response feedback and seamless integration into existing systems and workflows.

## API Submission Overview

### Why Use API Submission

**Real-Time Processing:**
- Immediate lead submission and response
- Sub-second processing capabilities
- Live validation and feedback
- Instant error detection and handling

**Scalability:**
- Handle thousands of leads per minute
- Automated processing workflows
- No manual intervention required
- Consistent performance under load

**Integration Flexibility:**
- Direct system-to-system communication
- Custom application integration
- Webhook and event-driven processing
- Multi-platform compatibility

### Submission Methods

LeadConduit supports multiple HTTP methods for API submission:

**POST (Recommended):**
- Form data (application/x-www-form-urlencoded)
- JSON payload (application/json)
- XML payload (application/xml)

**GET Method:**
- Query parameter submission
- Simple integration scenarios
- Limited data capacity
- Caching considerations

## Submission Documentation (Submission Docs)

### Accessing Submission Docs

**Flow-Specific Documentation:**
1. Navigate to your LeadConduit flow
2. Click "Submission Docs" dropdown in top-right
3. Select the specific source
4. Review comprehensive integration documentation

**Documentation Sections:**
- **Submission URL**: Unique endpoint for the flow/source combination
- **Fields**: Available fields with examples and requirements
- **Acceptance Criteria**: Rules that must be met for success
- **HTTP Methods**: Supported submission formats with examples
- **Interactive Examples**: Live testing interface

### Submission URL Structure

**URL Format:**
```
https://app.leadconduit.com/flows/{flow_id}/sources/{source_id}/submit
```

**Security Features:**
- Unique hashed URLs per flow/source combination
- No authentication credentials required for submission
- Secure transmission over HTTPS
- Rate limiting and abuse protection

### Field Definitions

**Standard Fields:**
- Comprehensive list of available standard fields
- Field type specifications (text, email, phone, etc.)
- Validation requirements and formats
- Example values for each field

**Custom Fields:**
- Account-specific field definitions
- Custom validation rules
- Business-specific data requirements
- Integration mapping guidance

## HTTP Method Examples

### Form POST Submission

**Content-Type:** `application/x-www-form-urlencoded`

**Example Request:**
```http
POST /flows/abc123/sources/def456/submit HTTP/1.1
Host: app.leadconduit.com
Content-Type: application/x-www-form-urlencoded

first_name=John&last_name=Smith&email=john@example.com&phone=555-123-4567&state=CA
```

**Benefits:**
- Simple implementation
- Wide compatibility
- Efficient for basic data
- Easy debugging and testing

### JSON POST Submission

**Content-Type:** `application/json`

**Example Request:**
```http
POST /flows/abc123/sources/def456/submit HTTP/1.1
Host: app.leadconduit.com
Content-Type: application/json

{
  "first_name": "John",
  "last_name": "Smith",
  "email": "john@example.com",
  "phone": "555-123-4567",
  "state": "CA",
  "custom_field": "value"
}
```

**Advantages:**
- Complex data structure support
- Nested object capability
- Modern API standard
- Better data type handling

### XML POST Submission

**Content-Type:** `application/xml`

**Example Request:**
```http
POST /flows/abc123/sources/def456/submit HTTP/1.1
Host: app.leadconduit.com
Content-Type: application/xml

<?xml version="1.0" encoding="UTF-8"?>
<lead>
  <first_name>John</first_name>
  <last_name>Smith</last_name>
  <email>john@example.com</email>
  <phone>555-123-4567</phone>
  <state>CA</state>
</lead>
```

**Use Cases:**
- Legacy system integration
- Enterprise XML workflows
- SOAP service compatibility
- Structured data requirements

### GET Method Submission

**URL with Query Parameters:**
```http
GET /flows/abc123/sources/def456/submit?first_name=John&last_name=Smith&email=john@example.com&phone=555-123-4567&state=CA HTTP/1.1
Host: app.leadconduit.com
```

**Limitations:**
- URL length restrictions
- Limited data capacity
- No complex data structures
- Caching implications

## Response Formats and Handling

### Response Structure

All submissions receive immediate responses indicating processing results:

**Success Response:**
```json
{
  "outcome": "success",
  "lead": {
    "id": "550e8400-e29b-41d4-a716-446655440000",
    "price": 25.00
  },
  "reason": "Lead accepted and processed successfully"
}
```

**Failure Response:**
```json
{
  "outcome": "failure",
  "lead": {
    "id": "550e8400-e29b-41d4-a716-446655440000"
  },
  "reason": "Lead rejected: Invalid email format"
}
```

**Error Response:**
```json
{
  "outcome": "error",
  "reason": "System error during processing"
}
```

### Response Codes and Meanings

**HTTP Status Codes:**
- **200 OK**: Request processed successfully (check outcome field)
- **400 Bad Request**: Invalid request format or missing required data
- **404 Not Found**: Invalid submission URL or flow/source not found
- **429 Too Many Requests**: Rate limit exceeded
- **500 Internal Server Error**: System error during processing

**Outcome Values:**
- **success**: Lead accepted and will be processed through the flow
- **failure**: Lead rejected based on acceptance criteria or validation
- **error**: System error prevented processing

### Response Time Expectations

**Performance Standards:**
- Typical response time: 200-500 milliseconds
- Maximum response time: 10 seconds
- 99.9% availability guarantee
- Regional processing optimization

## Data Mapping and Normalization

### Field Mapping

**Standard Field Mapping:**
- Direct field name mapping to LeadConduit standards
- Automatic type conversion and validation
- Format normalization (phone, email)
- Geographic data standardization

**Custom Field Handling:**
- Account-specific field definitions
- Custom validation rules
- Business logic integration
- Specialized data processing

### Data Transformation

**Automatic Normalization:**
- Phone number standardization
- Email validation and cleanup
- Address formatting
- Name capitalization

**Template Processing:**
- Dynamic field calculation
- Conditional data transformation
- Cross-field validation
- Computed value generation

## Volume and Performance Considerations

### Rate Limiting

**Submission Limits:**
- Default rate limits per source
- Burst capacity handling
- Fair usage policies
- Custom limit configurations for high-volume accounts

**Best Practices:**
- Implement retry logic with exponential backoff
- Monitor rate limit headers in responses
- Distribute load across multiple sources if needed
- Contact support for high-volume requirements

### Performance Optimization

**Connection Management:**
- Use HTTP/1.1 keep-alive connections
- Implement connection pooling
- Consider HTTP/2 for improved performance
- Monitor connection timeout settings

**Payload Optimization:**
- Send only required and beneficial fields
- Use efficient encoding (JSON over XML for speed)
- Minimize payload size
- Batch related operations when possible

## Error Handling and Retry Logic

### Error Categories

**Transient Errors:**
- Network connectivity issues
- Temporary system overload
- Rate limit exceeded
- Timeout conditions

**Permanent Errors:**
- Invalid submission format
- Missing required fields
- Invalid URL or credentials
- Acceptance criteria not met

### Retry Strategies

**Exponential Backoff:**
```
Initial delay: 1 second
Max retries: 5
Backoff multiplier: 2
Max delay: 60 seconds
```

**Retry Logic Implementation:**
- Check error type before retrying
- Don't retry permanent failures
- Log all retry attempts
- Implement circuit breakers for persistent failures

### Monitoring and Alerting

**Key Metrics to Track:**
- Submission success rate
- Average response time
- Error rate by type
- Volume trends and patterns

**Alert Thresholds:**
- Success rate below 95%
- Response time above 2 seconds
- Error rate above 5%
- Volume deviation beyond normal range

## Security Considerations

### Data Protection

**Transmission Security:**
- HTTPS required for all submissions
- TLS 1.2 or higher encryption
- Certificate pinning recommendations
- No sensitive data in URLs (use POST)

**Data Privacy:**
- PII handling compliance
- Data retention policies
- Right to deletion support
- Consent management integration

### Access Control

**URL Security:**
- Unique hashed submission URLs
- No predictable URL patterns
- Regular URL rotation if needed
- Access logging and monitoring

**Rate Limiting:**
- DDoS protection mechanisms
- Fair usage enforcement
- Abuse detection and prevention
- Source-level restrictions

## Integration Examples

### Programming Language Examples

**Python Example:**
```python
import requests

url = "https://app.leadconduit.com/flows/abc123/sources/def456/submit"
data = {
    "first_name": "John",
    "last_name": "Smith",
    "email": "john@example.com",
    "phone": "555-123-4567",
    "state": "CA"
}

response = requests.post(url, json=data)
result = response.json()

if result["outcome"] == "success":
    print(f"Lead accepted with ID: {result['lead']['id']}")
else:
    print(f"Lead rejected: {result['reason']}")
```

**JavaScript Example:**
```javascript
const submitLead = async (leadData) => {
  const url = "https://app.leadconduit.com/flows/abc123/sources/def456/submit";
  
  try {
    const response = await fetch(url, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(leadData)
    });
    
    const result = await response.json();
    
    if (result.outcome === 'success') {
      console.log(`Lead accepted: ${result.lead.id}`);
    } else {
      console.log(`Lead rejected: ${result.reason}`);
    }
  } catch (error) {
    console.error('Submission error:', error);
  }
};
```

### Webhook Integration

**Real-Time Processing:**
- Webhook endpoints for immediate submission
- Event-driven lead processing
- Async processing capabilities
- Scalable webhook handling

**Webhook Configuration:**
- Secure endpoint setup
- Authentication mechanisms
- Retry and failure handling
- Monitoring and logging

## Testing and Validation

### Development Testing

**Interactive Testing:**
- Use Submission Docs interactive examples
- Test different HTTP methods
- Validate field mapping
- Check acceptance criteria

**Automated Testing:**
- Unit tests for submission functions
- Integration tests with test flows
- Load testing for performance validation
- Error condition testing

### Production Monitoring

**Health Checks:**
- Regular submission testing
- Response time monitoring
- Error rate tracking
- Volume pattern analysis

**Quality Assurance:**
- Success rate monitoring
- Data quality validation
- Acceptance criteria effectiveness
- Partner feedback tracking

API submission provides the foundation for scalable, reliable lead processing. Proper implementation ensures optimal performance, data quality, and system integration while maintaining security and compliance standards.