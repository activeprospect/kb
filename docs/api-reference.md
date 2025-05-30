# API Reference

## Introduction

This document provides comprehensive API reference information for the ActiveProspect platform, including LeadConduit and TrustedForm APIs. The APIs are RESTful and communicate using JSON over HTTPS. Anything that can be accomplished in the user interface can also be done using the APIs.

## Base URLs

- **LeadConduit API**: `https://app.leadconduit.com`
- **TrustedForm API**: `https://cert.trustedform.com`

## Authentication

ActiveProspect APIs use [HTTP Basic Authentication](https://en.wikipedia.org/wiki/Basic_access_authentication) with the following credentials:

- **Username**: `API`
- **Password**: Your API key

### Example Authorization Header
```
Authorization: Basic API:1f1b96c9150d8050e858c043d543bb4eadae0e6f
```

### Obtaining API Keys

1. **User-level API Key (Recommended)**: Available in your user profile settings
2. **Company-level API Key**: Available in account settings (use user-level when possible)

## LeadConduit API

### Overview

The LeadConduit API allows you to programmatically manage flows, leads, entities, and all other aspects of your lead processing operations.

### Core Endpoints

#### Account Management

- **GET /account** - Get account information
- **PUT /account** - Update account information

#### Flows

- **GET /flows** - List all flows
- **POST /flows** - Create a new flow
- **GET /flows/{id}** - Get a specific flow
- **PUT /flows/{id}** - Update a flow
- **DELETE /flows/{id}** - Delete a flow

#### Entities

- **GET /entities** - List all entities
- **POST /entities** - Create a new entity
- **GET /entities/{id}** - Get a specific entity
- **PUT /entities/{id}** - Update an entity
- **DELETE /entities/{id}** - Delete an entity

#### Fields

- **GET /fields** - List all fields
- **POST /fields** - Create a custom field
- **GET /fields/{id}** - Get a specific field
- **PUT /fields/{id}** - Update a field
- **DELETE /fields/{id}** - Delete a field

#### Events and Leads

- **GET /events** - Query lead events
- **GET /leads** - Query leads (requires paid account)

#### Caps and Limits

- **GET /caps** - List all cap counters
- **GET /caps/{id}** - Get a specific cap counter

#### Credentials

- **GET /credentials** - List all credentials
- **POST /credentials** - Create a new credential
- **GET /credentials/{id}** - Get a specific credential
- **PUT /credentials/{id}** - Update a credential
- **DELETE /credentials/{id}** - Delete a credential

#### Destinations

- **GET /destinations** - List all configured destinations

### Lead Submission

#### Posting Leads

Submit leads to a flow using HTTP POST to the flow's submission URL:

```
POST https://app.leadconduit.com/flows/{flow_id}/sources/{source_id}/submit
```

#### Request Format

**Headers:**
- `Content-Type: application/json` (recommended)
- `Content-Type: application/x-www-form-urlencoded` (supported)

**JSON Example:**
```json
{
  "email": "user@example.com",
  "first_name": "John",
  "last_name": "Doe",
  "phone_1": "555-123-4567",
  "state": "TX"
}
```

#### Response Formats

**Success Response (200 OK):**
```json
{
  "outcome": "success",
  "reason": "Lead accepted",
  "lead_id": "507f1f77bcf86cd799439011"
}
```

**Failure Response (200 OK):**
```json
{
  "outcome": "failure",
  "reason": "Invalid state"
}
```

**Error Response (4xx/5xx):**
```json
{
  "outcome": "error",
  "reason": "Authentication failed"
}
```

### Data Types and Validation

LeadConduit uses intelligent field types that automatically validate and normalize data:

#### Common Field Types

- **email**: Validates email format, extracts domain components
- **phone**: Validates US phone numbers, extracts area code and components
- **state**: Validates and normalizes US states to two-letter codes
- **postal_code**: Validates ZIP codes and postal codes
- **date**: Validates and normalizes dates in multiple formats
- **number**: Validates numeric values, strips currency symbols
- **boolean**: Validates true/false values with flexible input formats

### Rules and Templates

#### Rule Structure

Rules use a three-part structure for conditional logic:

```json
{
  "lhv": "lead.state",
  "op": "is equal to",
  "rhv": "TX"
}
```

#### Available Operators

- `is equal to` / `is not equal to`
- `is less than` / `is greater than`
- `is included in` / `is not included in`
- `includes` / `does not include`
- `is between` / `is not between`
- `matches pattern` / `does not match pattern`
- `is blank` / `is not blank`

#### Template Syntax

Templates use Handlebars-style syntax for dynamic values:

```
{{lead.first_name}} {{lead.last_name}}
{{lead.state == 'CA' ? 'Pacific' : 'Other'}}
{{format lead.phone format="(###) ###-####"}}
```

### Rate Limiting

- API requests are subject to rate limiting
- Limits vary by account type and subscription level
- Rate limit headers are included in responses:
  - `X-RateLimit-Limit`: Total allowed requests
  - `X-RateLimit-Remaining`: Remaining requests
  - `X-RateLimit-Reset`: Time when limit resets

### Error Handling

#### HTTP Status Codes

- **200**: Success
- **201**: Created successfully
- **400**: Bad Request - Invalid parameters
- **401**: Unauthorized - Authentication failed
- **403**: Forbidden - Insufficient permissions
- **404**: Not Found - Resource doesn't exist
- **422**: Unprocessable Entity - Validation errors
- **429**: Too Many Requests - Rate limit exceeded
- **500**: Internal Server Error

#### Error Response Format

```json
{
  "error": "invalid_request",
  "error_description": "The request is missing required parameters",
  "details": {
    "field": "email",
    "message": "Email address is required"
  }
}
```

## TrustedForm API

### Overview

The TrustedForm API allows you to retain (claim) certificates, retrieve certificate data, and perform various operations on TrustedForm certificates.

### API Versions

TrustedForm API is available in multiple versions:

- **v4.0** (Current, Recommended)
- **v3.0** (Deprecated)
- **v2.0** (Deprecated)

### Authentication

TrustedForm uses the same authentication as LeadConduit:

```
Authorization: Basic API:{your_api_key}
```

### Certificate Operations

#### Retaining Certificates (API v4.0)

**Endpoint:** `POST https://cert.trustedform.com/{certificate_id}`

**Headers:**
```
Content-Type: application/json
Api-Version: 4.0
Authorization: Basic API:{api_key}
```

**Request Body:**
```json
{
  "match_lead": {
    "email": "user@example.com",
    "phone": "555-123-4567"
  },
  "retain": {
    "reference": "lead_123",
    "vendor": "Acme Corp"
  }
}
```

#### Response Format

**Success (201 Created):**
```json
{
  "outcome": "success",
  "operations": {
    "retain": {
      "outcome": "success",
      "reference": "lead_123",
      "vendor": "Acme Corp"
    },
    "match_lead": {
      "outcome": "success",
      "matches_found": true
    }
  }
}
```

**Failure:**
```json
{
  "outcome": "failure",
  "reason": "Certificate has expired"
}
```

**Error:**
```json
{
  "outcome": "error",
  "reason": "No valid products detected"
}
```

### Certificate Validation

#### Lead Matching

Lead matching is required for API v4.0 to ensure data security:

- Provide email address, phone number, or both
- Up to 3 email addresses or phone numbers can be provided
- At least one must match the certificate data

#### Common Error Responses

- **Certificate expired**: Certificate is older than retention window
- **No matches found**: Provided contact info doesn't match certificate
- **Invalid product**: Account doesn't have required TrustedForm products
- **Sandbox certificates cannot be retained**: Certificate was generated in sandbox mode

### TrustedForm Insights

If subscribed to TrustedForm Insights, additional data points are available:

```json
{
  "insights": {
    "data_points": ["ip_address", "user_agent", "timestamp"],
    "page_scan": {
      "text": "required consent language",
      "found": true
    }
  }
}
```

### TrustedForm Verify

Compliance checking operations for consent verification:

```json
{
  "verify": {
    "consent_check": {
      "advertiser_name": "Acme Corp",
      "outcome": "success"
    }
  }
}
```

## TrustedForm JavaScript SDK

### Integration

Include the TrustedForm script on your web pages to generate certificates:

```html
<script type="text/javascript">
  // TrustedForm script goes here
</script>
```

### Callback Functions

Implement callback functions to handle certificate generation:

```javascript
function trustedFormCertIdCallback(certificateId) {
  console.log("Certificate ID:", certificateId);
}

function trustedFormCertUrlCallback(certificateUrl) {
  console.log("Certificate URL:", certificateUrl);
  // Add certificate URL to form
  document.getElementById('xxTrustedFormCertUrl').value = certificateUrl;
}
```

### Configuration Options

The TrustedForm script supports various configuration options:

- **Field mapping**: Automatically populate certificate URL into form fields
- **Page scanning**: Scan page content for compliance validation
- **Custom callbacks**: Execute custom code when certificates are generated
- **Consent tracking**: Track specific consent interactions

## Best Practices

### API Usage

1. **Use user-level API keys** instead of company-level keys when possible
2. **Implement proper error handling** for all API calls
3. **Respect rate limits** and implement exponential backoff for retries
4. **Validate data** before sending to APIs to avoid unnecessary errors
5. **Store certificate URLs** permanently with lead data for compliance

### Security

1. **Use HTTPS** for all API communications
2. **Keep API keys secure** and rotate them regularly
3. **Validate SSL certificates** when making API calls
4. **Don't log sensitive data** in application logs
5. **Implement proper authentication** in your applications

### Performance

1. **Batch operations** when possible to reduce API calls
2. **Cache responses** when appropriate (respecting cache headers)
3. **Use appropriate timeouts** for API requests
4. **Monitor API usage** to stay within limits
5. **Implement retry logic** for transient errors

### Lead Processing

1. **Validate acceptance criteria** before submitting leads
2. **Handle different response outcomes** appropriately
3. **Implement feedback loops** for conversion tracking
4. **Monitor lead quality** using API metrics
5. **Use templates** for dynamic data transformation

## SDKs and Libraries

### Official SDKs

Currently, ActiveProspect provides:

- **JavaScript SDK**: For TrustedForm certificate generation
- **REST APIs**: Full programmatic access to all features

### Community Libraries

Community-maintained libraries are available for various programming languages. Check the ActiveProspect Developer Portal for current options.

## Support and Resources

### Documentation

- **Developer Portal**: https://developers.activeprospect.com
- **API Documentation**: Comprehensive API reference with examples
- **Knowledge Base**: Step-by-step guides and best practices

### Support Channels

- **Email Support**: support@activeprospect.com
- **Community Forum**: Access through the ActiveProspect Knowledge Base
- **Professional Services**: Available for enterprise customers

### Rate Limits and Quotas

Rate limits vary by:
- Account type (free vs. paid)
- Subscription level
- API endpoint
- Historical usage patterns

Contact support for specific rate limit information for your account.

---

*This documentation is current as of the API versions specified. Check the Developer Portal for the most up-to-date information and any new API endpoints or features.*