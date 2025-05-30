---
layout: page
title: Generic HTTP Integrations
---

# Generic HTTP Integrations

Generic HTTP integrations in LeadConduit provide flexible, customizable delivery options for recipient systems that don't have pre-built integrations. These configurations support various HTTP methods, data formats, and authentication mechanisms, enabling integration with virtually any web-based API or service.

## HTTP Integration Overview

### When to Use Generic HTTP

**Custom API Integration:**
- Recipient systems without pre-built LeadConduit integrations
- Custom-built APIs and proprietary systems
- Legacy systems with HTTP interfaces
- Specialized business applications requiring custom data formats

**Flexible Configuration Requirements:**
- Non-standard data formats or structures
- Custom authentication mechanisms
- Unique business logic and data transformation
- Integration with internal systems and applications

**Development and Testing:**
- Prototype integrations and proof-of-concept development
- Testing new recipient systems before full integration
- Development environment and staging system integration
- Custom webhook and callback implementations

### Integration Capabilities

**Supported HTTP Methods:**
- **POST:** Standard form submission and JSON API calls
- **PUT:** Resource creation and full update operations
- **PATCH:** Partial resource updates and modifications
- **GET:** Query parameter-based data submission (limited use)

**Data Format Support:**
- **Form POST:** Standard HTML form encoding (application/x-www-form-urlencoded)
- **JSON:** RESTful API integration with JSON payloads
- **XML:** SOAP and XML-based service integration
- **Custom Formats:** Text, CSV, or proprietary data structures

## Configuration Components

### Basic Connection Settings

**Endpoint Configuration:**
```
Basic HTTP Setup:
├── URL: https://api.recipient.com/leads
├── Method: POST, PUT, PATCH, or GET
├── Content-Type: application/json, application/x-www-form-urlencoded, text/xml
├── Accept: application/json, text/xml, text/plain
└── User-Agent: LeadConduit/1.0 (custom user agent)
```

**URL Template Support:**
- Dynamic URL generation based on lead data
- Path parameter substitution
- Query parameter construction
- Environment-specific endpoint configuration

**URL Examples:**
```
URL Template Examples:
├── Static: https://api.recipient.com/leads
├── Dynamic: https://api.recipient.com/{% raw %}{{source.campaign}}{% endraw %}/leads
├── Path Params: https://api.recipient.com/leads/{% raw %}{{lead.id}}{% endraw %}
└── Query Params: https://api.recipient.com/leads?source={% raw %}{{source.name}}{% endraw %}
```

### HTTP Headers Configuration

**Standard Headers:**
- Content-Type specification for request payload
- Accept headers for response format preferences
- User-Agent identification for request tracking
- Custom headers for API-specific requirements

**Authentication Headers:**
```
Authentication Header Examples:
├── API Key: Authorization: Bearer your-api-key-here
├── Basic Auth: Authorization: Basic base64(username:password)
├── Custom: X-API-Key: your-api-key-here
└── JWT: Authorization: Bearer jwt-token-here
```

**Custom Header Support:**
- Dynamic header values using lead data
- Template-based header generation
- Conditional header inclusion
- Multiple custom headers per integration

### Request Body Configuration

**Form Data (POST):**
```
Form Data Example:
first_name={% raw %}{{lead.first_name}}{% endraw %}&
last_name={% raw %}{{lead.last_name}}{% endraw %}&
email={% raw %}{{lead.email}}{% endraw %}&
phone={% raw %}{{lead.phone}}{% endraw %}&
state={% raw %}{{lead.state}}{% endraw %}
```

**JSON Payload:**
```json
JSON Payload Example:
{
  "contact": {
    "firstName": "{% raw %}{{lead.first_name}}{% endraw %}",
    "lastName": "{% raw %}{{lead.last_name}}{% endraw %}",
    "email": "{% raw %}{{lead.email}}{% endraw %}",
    "phone": "{% raw %}{{lead.phone}}{% endraw %}"
  },
  "lead": {
    "source": "{% raw %}{{source.name}}{% endraw %}",
    "campaign": "{% raw %}{{source.campaign}}{% endraw %}",
    "value": {% raw %}{{lead.value}}{% endraw %},
    "created": "{% raw %}{{submission.timestamp}}{% endraw %}"
  }
}
```

**XML Payload:**
```xml
XML Payload Example:
<lead>
  <contact>
    <firstName>{% raw %}{{lead.first_name}}{% endraw %}</firstName>
    <lastName>{% raw %}{{lead.last_name}}{% endraw %}</lastName>
    <email>{% raw %}{{lead.email}}{% endraw %}</email>
    <phone>{% raw %}{{lead.phone}}{% endraw %}</phone>
  </contact>
  <metadata>
    <source>{% raw %}{{source.name}}{% endraw %}</source>
    <campaign>{% raw %}{{source.campaign}}{% endraw %}</campaign>
    <timestamp>{% raw %}{{submission.timestamp}}{% endraw %}</timestamp>
  </metadata>
</lead>
```

## Authentication Methods

### API Key Authentication

**Header-Based API Keys:**
- Include API key in request headers
- Support custom header names
- Secure key transmission
- Easy integration and management

**Query Parameter API Keys:**
- Include API key in URL query parameters
- Less secure but sometimes required
- Simple implementation
- Compatible with GET-based integrations

**API Key Configuration:**
```
API Key Methods:
├── Header: Authorization: Bearer {% raw %}{{api_key}}{% endraw %}
├── Custom Header: X-API-Key: {% raw %}{{api_key}}{% endraw %}
├── Query Parameter: ?api_key={% raw %}{{api_key}}{% endraw %}
└── Body Parameter: {"api_key": "{% raw %}{{api_key}}{% endraw %}"}
```

### OAuth Integration

**OAuth 2.0 Flow:**
- Authorization code grant flow
- Client credentials grant for server-to-server
- Automatic token refresh handling
- Secure token storage and transmission

**OAuth Configuration:**
- Client ID and secret management
- Scope configuration and permissions
- Token endpoint configuration
- Refresh token handling

### Basic Authentication

**HTTP Basic Auth:**
- Username and password combination
- Base64 encoding for transmission
- Simple implementation and wide compatibility
- Secure credential storage

**Configuration Example:**
```
Basic Auth Setup:
├── Username: your-username
├── Password: your-password
├── Header: Authorization: Basic base64(username:password)
└── Encoding: Automatic base64 encoding
```

### Custom Authentication

**Bearer Token Authentication:**
- Static or dynamic bearer tokens
- JWT token integration
- Custom token refresh mechanisms
- Flexible token format support

**HMAC Signature Authentication:**
- Request signing with shared secrets
- Timestamp-based signatures
- Payload integrity verification
- Advanced security implementation

**Custom Authentication Examples:**
```
Custom Auth Methods:
├── Bearer: Authorization: Bearer {% raw %}{{token}}{% endraw %}
├── JWT: Authorization: Bearer {% raw %}{{jwt_token}}{% endraw %}
├── HMAC: X-Signature: {% raw %}{{hmac_signature}}{% endraw %}
└── Custom: X-Auth-Token: {% raw %}{{custom_token}}{% endraw %}
```

## Response Handling

### Success Response Processing

**Response Status Codes:**
- HTTP 200 OK: Successful processing
- HTTP 201 Created: Resource created successfully
- HTTP 202 Accepted: Accepted for processing
- HTTP 204 No Content: Successful with no response body

**Response Data Extraction:**
```
Response Processing:
├── Extract record ID from response
├── Capture processing status information
├── Store additional response data
├── Log success metrics and timing
└── Update lead with response information
```

**Response Parsing:**
- JSON response parsing and field extraction
- XML response parsing and data extraction
- Plain text response handling
- Custom response format processing

### Error Response Handling

**Error Status Codes:**
- HTTP 400 Bad Request: Invalid data or format
- HTTP 401 Unauthorized: Authentication failure
- HTTP 403 Forbidden: Permission denied
- HTTP 404 Not Found: Endpoint not available
- HTTP 429 Too Many Requests: Rate limiting
- HTTP 500+ Server Errors: Recipient system issues

**Error Processing Logic:**
```
Error Handling Strategy:
├── Parse error messages from response
├── Classify errors as temporary or permanent
├── Log detailed error information
├── Trigger appropriate retry logic
├── Generate alerts for persistent issues
└── Provide debugging information
```

### Response Validation

**Expected Response Validation:**
- Verify response format and structure
- Validate required response fields
- Check response data consistency
- Confirm processing success indicators

**Custom Validation Rules:**
- Define success criteria beyond HTTP status
- Implement business logic validation
- Check response timing and performance
- Validate data round-trip accuracy

## Advanced Configuration

### Conditional Logic

**Dynamic Configuration:**
- Conditional URL selection based on lead data
- Dynamic header configuration
- Conditional payload formatting
- Business rule-based integration selection

**Conditional Examples:**
```
Conditional Integration:
├── URL: {% raw %}{{#if lead.premium}}premium-api{{else}}standard-api{{/if}}{% endraw %}.com/leads
├── Headers: {% raw %}{{#if lead.urgent}}X-Priority: High{{/if}}{% endraw %}
├── Payload: Include additional fields for high-value leads
└── Authentication: Different credentials for different lead types
```

### Retry and Timeout Configuration

**HTTP Client Settings:**
- Connection timeout configuration
- Read timeout settings
- Total request timeout limits
- Keep-alive connection management

**Retry Logic:**
- Maximum retry attempts
- Retry interval configuration
- Exponential backoff settings
- Error-specific retry rules

**Timeout Configuration:**
```
Timeout Settings:
├── Connection: 10 seconds
├── Read: 30 seconds
├── Total: 60 seconds
├── Retries: 3 attempts
└── Backoff: Exponential (2s, 4s, 8s)
```

### Connection Pooling

**Performance Optimization:**
- HTTP connection pooling and reuse
- Concurrent connection limits
- Connection lifetime management
- DNS caching and optimization

**Scalability Configuration:**
- Maximum connections per recipient
- Connection pool sizing
- Resource management and cleanup
- Performance monitoring and optimization

## Testing and Validation

### Integration Testing

**Configuration Testing:**
```
Testing Checklist:
├── Endpoint connectivity and availability
├── Authentication method validation
├── Request format and payload verification
├── Response parsing and handling
├── Error condition simulation
├── Performance and timeout testing
└── Security and credential validation
```

**Test Data Scenarios:**
- Valid data with expected responses
- Invalid data with error responses
- Edge cases and boundary conditions
- Large payload and volume testing

### Debugging and Troubleshooting

**Request/Response Logging:**
- Complete HTTP request logging
- Response data capture and analysis
- Error message extraction and logging
- Performance timing and metrics

**Common Issues and Solutions:**
```
Troubleshooting Guide:
├── 401 Errors: Check authentication credentials
├── 400 Errors: Validate payload format and required fields
├── Timeout Errors: Increase timeout settings or optimize payload
├── SSL Errors: Verify certificate configuration
└── DNS Errors: Check endpoint URL and network connectivity
```

### Performance Monitoring

**Integration Metrics:**
- Response time measurement and trending
- Success rate tracking and analysis
- Error rate monitoring and alerting
- Throughput and capacity measurement

**Optimization Strategies:**
- Payload size optimization
- Request frequency management
- Connection reuse and pooling
- Caching and performance tuning

## Security Considerations

### Data Protection

**Transmission Security:**
- HTTPS required for all integrations
- TLS 1.2 or higher encryption
- Certificate validation and verification
- Secure credential transmission

**Data Minimization:**
- Send only required data fields
- Implement data filtering and selection
- Support field-level security controls
- Maintain data privacy compliance

### Credential Management

**Secure Storage:**
- Encrypted credential storage
- Access control and permissions
- Regular credential rotation
- Audit logging for credential access

**Best Practices:**
```
Security Best Practices:
├── Use HTTPS for all communications
├── Implement proper authentication
├── Regularly rotate API credentials
├── Monitor for security violations
├── Validate SSL certificates
├── Log security-related events
└── Implement rate limiting protection
```

## Use Cases and Examples

### CRM Integration

**Custom CRM API:**
```json
CRM Integration Example:
POST https://crm.company.com/api/leads
Headers:
  Authorization: Bearer api-key-here
  Content-Type: application/json

Payload:
{
  "first_name": "{% raw %}{{lead.first_name}}{% endraw %}",
  "last_name": "{% raw %}{{lead.last_name}}{% endraw %}",
  "email": "{% raw %}{{lead.email}}{% endraw %}",
  "phone": "{% raw %}{{lead.phone}}{% endraw %}",
  "source": "{% raw %}{{source.name}}{% endraw %}",
  "campaign_id": "{% raw %}{{source.campaign}}{% endraw %}"
}
```

### Webhook Integration

**Real-Time Webhook:**
```json
Webhook Example:
POST https://app.company.com/webhook/leads
Headers:
  X-Webhook-Secret: shared-secret-here
  Content-Type: application/json

Payload:
{
  "event": "lead.created",
  "timestamp": "{% raw %}{{submission.timestamp}}{% endraw %}",
  "lead": {
    "id": "{% raw %}{{lead.id}}{% endraw %}",
    "contact": {
      "name": "{% raw %}{{lead.first_name}} {{lead.last_name}}{% endraw %}",
      "email": "{% raw %}{{lead.email}}{% endraw %}",
      "phone": "{% raw %}{{lead.phone}}{% endraw %}"
    }
  }
}
```

### Legacy System Integration

**XML SOAP Integration:**
```xml
SOAP Example:
POST https://legacy.company.com/soap/endpoint
Headers:
  Content-Type: text/xml; charset=utf-8
  SOAPAction: "CreateLead"

Payload:
<soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Body>
    <CreateLead>
      <FirstName>{% raw %}{{lead.first_name}}{% endraw %}</FirstName>
      <LastName>{% raw %}{{lead.last_name}}{% endraw %}</LastName>
      <Email>{% raw %}{{lead.email}}{% endraw %}</Email>
      <Phone>{% raw %}{{lead.phone}}{% endraw %}</Phone>
    </CreateLead>
  </soap:Body>
</soap:Envelope>
```

## Best Practices

### Configuration Management

**Documentation and Maintenance:**
- Document all custom integration configurations
- Maintain version control for integration settings
- Regular testing and validation procedures
- Change management and approval processes

**Performance Optimization:**
- Minimize payload size and complexity
- Optimize request frequency and timing
- Implement efficient error handling
- Monitor and optimize resource usage

### Reliability and Monitoring

**Monitoring and Alerting:**
- Implement comprehensive monitoring
- Set up alerting for failures and performance issues
- Regular health checks and validation
- Continuous performance optimization

**Error Handling:**
- Implement robust error handling and recovery
- Provide detailed error logging and reporting
- Support manual intervention when needed
- Maintain audit trails for troubleshooting

Generic HTTP integrations provide maximum flexibility for connecting LeadConduit with virtually any web-based system. Proper configuration, testing, and monitoring ensure reliable lead delivery while maintaining security and performance standards.