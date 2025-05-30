---
layout: page
title: API Reference
---

# API Reference

LeadConduit provides comprehensive REST APIs for lead submission, data retrieval, flow management, and system integration, enabling seamless connectivity with external systems and custom application development for sophisticated lead management workflows.

## API Overview

### Authentication and Security

**API Authentication:**
LeadConduit uses API key-based authentication for secure access to all API endpoints. API keys are account-specific and provide controlled access based on user permissions and account settings.

```http
Authorization: Bearer YOUR_API_KEY
Content-Type: application/json
Accept: application/json
```

**Security Best Practices:**
- **Secure Storage:** Store API keys securely and never expose them in client-side code
- **HTTPS Only:** All API communications must use HTTPS encryption
- **Key Rotation:** Regularly rotate API keys and revoke unused keys
- **Rate Limiting:** Respect rate limits and implement exponential backoff for retries
- **IP Restrictions:** Configure IP whitelisting for enhanced security

### Base URLs and Endpoints

**Production Environment:**
```
Base URL: https://app.leadconduit.com/api/v1
```

**Sandbox Environment:**
```
Base URL: https://sandbox.leadconduit.com/api/v1
```

**Common Headers:**
```http
Authorization: Bearer YOUR_API_KEY
Content-Type: application/json
User-Agent: YourApp/1.0
Accept: application/json
```

## Lead Submission API

### Submit Lead

Submit a new lead to a specific flow for processing and routing.

**Endpoint:**
```http
POST /flows/{flow_id}/leads
```

**Request Body:**
```json
{
  "lead": {
    "first_name": "John",
    "last_name": "Doe", 
    "email": "john.doe@example.com",
    "phone": "5551234567",
    "address": "123 Main St",
    "city": "Anytown", 
    "state": "CA",
    "postal_code": "90210",
    "source": "website_form",
    "campaign": "summer_2024",
    "custom_field_12345": "premium_customer"
  },
  "trusted_form_cert_url": "https://cert.trustedform.com/...",
  "options": {
    "test_mode": false,
    "async": true,
    "timeout": 30000
  }
}
```

**Success Response (201 Created):**
```json
{
  "id": "lead_abc123def456",
  "status": "accepted",
  "flow_id": "flow_789xyz",
  "created_at": "2024-01-15T10:30:00Z",
  "events": [
    {
      "id": "event_123",
      "type": "received",
      "timestamp": "2024-01-15T10:30:00Z",
      "outcome": "success"
    },
    {
      "id": "event_124", 
      "type": "enhanced",
      "timestamp": "2024-01-15T10:30:01Z",
      "outcome": "success",
      "enhancements": ["email_validation", "phone_format"]
    },
    {
      "id": "event_125",
      "type": "delivered",
      "timestamp": "2024-01-15T10:30:02Z", 
      "outcome": "success",
      "recipient": "buyer_crm_system"
    }
  ],
  "quality_score": 0.85,
  "pricing": {
    "amount": 25.00,
    "currency": "USD"
  }
}
```

**Error Response (400 Bad Request):**
```json
{
  "error": {
    "code": "validation_failed",
    "message": "Lead validation failed",
    "details": [
      {
        "field": "email",
        "code": "invalid_format",
        "message": "Email format is invalid"
      },
      {
        "field": "phone", 
        "code": "missing_required",
        "message": "Phone number is required"
      }
    ]
  }
}
```

### Batch Lead Submission

Submit multiple leads in a single API call for improved efficiency.

**Endpoint:**
```http
POST /flows/{flow_id}/leads/batch
```

**Request Body:**
```json
{
  "leads": [
    {
      "external_id": "lead_001",
      "lead": {
        "first_name": "John",
        "last_name": "Doe",
        "email": "john@example.com",
        "phone": "5551234567"
      }
    },
    {
      "external_id": "lead_002", 
      "lead": {
        "first_name": "Jane",
        "last_name": "Smith",
        "email": "jane@example.com",
        "phone": "5559876543"
      }
    }
  ],
  "options": {
    "continue_on_error": true,
    "max_concurrent": 10
  }
}
```

**Success Response (207 Multi-Status):**
```json
{
  "batch_id": "batch_abc123",
  "total_leads": 2,
  "successful": 1,
  "failed": 1,
  "results": [
    {
      "external_id": "lead_001",
      "status": "success",
      "lead_id": "lead_def456",
      "quality_score": 0.92
    },
    {
      "external_id": "lead_002",
      "status": "error",
      "error": {
        "code": "duplicate_detected",
        "message": "Lead matches existing record"
      }
    }
  ]
}
```

## Lead Retrieval API

### Get Lead Details

Retrieve comprehensive information about a specific lead.

**Endpoint:**
```http
GET /leads/{lead_id}
```

**Success Response (200 OK):**
```json
{
  "id": "lead_abc123def456",
  "flow_id": "flow_789xyz",
  "created_at": "2024-01-15T10:30:00Z",
  "updated_at": "2024-01-15T10:35:00Z",
  "status": "delivered",
  "lead_data": {
    "first_name": "John",
    "last_name": "Doe",
    "email": "john.doe@example.com",
    "phone": "+15551234567",
    "address": "123 Main St",
    "city": "Anytown",
    "state": "CA",
    "postal_code": "90210-1234"
  },
  "enhancements": {
    "email_validation": {
      "status": "valid",
      "deliverable": true,
      "quality_score": 0.95
    },
    "phone_validation": {
      "status": "valid", 
      "line_type": "mobile",
      "carrier": "Verizon"
    }
  },
  "events": [
    {
      "id": "event_123",
      "type": "received",
      "timestamp": "2024-01-15T10:30:00Z",
      "outcome": "success"
    }
  ],
  "quality_metrics": {
    "overall_score": 0.85,
    "completeness": 0.90,
    "accuracy": 0.88,
    "fraud_risk": 0.05
  }
}
```

### Search Leads

Search and filter leads based on various criteria.

**Endpoint:**
```http
GET /leads?{query_parameters}
```

**Query Parameters:**
```http
GET /leads?flow_id=flow_789xyz&created_after=2024-01-01T00:00:00Z&status=delivered&limit=100&offset=0
```

**Success Response (200 OK):**
```json
{
  "total_count": 1250,
  "page_count": 13,
  "current_page": 1,
  "per_page": 100,
  "leads": [
    {
      "id": "lead_abc123",
      "created_at": "2024-01-15T10:30:00Z",
      "status": "delivered",
      "quality_score": 0.85,
      "source": "website_form",
      "campaign": "summer_2024"
    }
  ]
}
```

## Flow Management API

### List Flows

Retrieve all flows associated with the account.

**Endpoint:**
```http
GET /flows
```

**Success Response (200 OK):**
```json
{
  "flows": [
    {
      "id": "flow_789xyz",
      "name": "Main Lead Processing Flow",
      "status": "active",
      "created_at": "2024-01-01T00:00:00Z",
      "updated_at": "2024-01-10T15:30:00Z",
      "statistics": {
        "total_leads": 5420,
        "acceptance_rate": 0.78,
        "average_quality": 0.82
      }
    }
  ]
}
```

### Get Flow Configuration

Retrieve detailed configuration for a specific flow.

**Endpoint:**
```http
GET /flows/{flow_id}
```

**Success Response (200 OK):**
```json
{
  "id": "flow_789xyz",
  "name": "Main Lead Processing Flow",
  "status": "active",
  "description": "Primary flow for website lead processing",
  "configuration": {
    "steps": [
      {
        "id": "step_001",
        "type": "source",
        "name": "Website Form",
        "position": 1,
        "settings": {
          "required_fields": ["email", "phone"],
          "acceptance_criteria": "lead.age >= 18"
        }
      },
      {
        "id": "step_002", 
        "type": "enhancement",
        "name": "Email Validation",
        "position": 2,
        "service": "email_validator",
        "settings": {
          "check_deliverability": true,
          "require_valid": true
        }
      }
    ]
  }
}
```

## Event and Analytics API

### Get Flow Events

Retrieve events for a specific flow with filtering options.

**Endpoint:**
```http
GET /flows/{flow_id}/events
```

**Query Parameters:**
```http
GET /flows/flow_789xyz/events?event_type=delivered&start_date=2024-01-01&end_date=2024-01-31&limit=1000
```

**Success Response (200 OK):**
```json
{
  "total_events": 15420,
  "events": [
    {
      "id": "event_abc123",
      "lead_id": "lead_def456",
      "type": "delivered",
      "timestamp": "2024-01-15T10:30:02Z",
      "outcome": "success",
      "recipient": {
        "id": "recipient_789",
        "name": "CRM Integration",
        "type": "http_post"
      },
      "duration_ms": 245,
      "response_code": 200
    }
  ]
}
```

### Get Analytics Data

Retrieve aggregated analytics and performance metrics.

**Endpoint:**
```http
GET /analytics
```

**Query Parameters:**
```http
GET /analytics?flow_id=flow_789xyz&metric=conversion_rate&group_by=source&start_date=2024-01-01&end_date=2024-01-31
```

**Success Response (200 OK):**
```json
{
  "period": {
    "start_date": "2024-01-01",
    "end_date": "2024-01-31"
  },
  "metrics": [
    {
      "source": "website_form",
      "total_leads": 1250,
      "accepted_leads": 975,
      "delivered_leads": 890,
      "acceptance_rate": 0.78,
      "delivery_rate": 0.91,
      "conversion_rate": 0.15,
      "average_quality": 0.85
    },
    {
      "source": "social_media",
      "total_leads": 750,
      "accepted_leads": 520,
      "delivered_leads": 485,
      "acceptance_rate": 0.69,
      "delivery_rate": 0.93,
      "conversion_rate": 0.12,
      "average_quality": 0.72
    }
  ]
}
```

## Configuration Management API

### Update Flow Settings

Modify flow configuration and settings.

**Endpoint:**
```http
PUT /flows/{flow_id}/settings
```

**Request Body:**
```json
{
  "settings": {
    "acceptance_criteria": "lead.age >= 21 && lead.income >= 50000",
    "quality_threshold": 0.70,
    "volume_cap": {
      "daily_limit": 1000,
      "hourly_limit": 100
    },
    "notifications": {
      "email": "admin@company.com",
      "webhook_url": "https://company.com/webhooks/leadconduit"
    }
  }
}
```

**Success Response (200 OK):**
```json
{
  "flow_id": "flow_789xyz",
  "updated_at": "2024-01-15T11:00:00Z",
  "settings": {
    "acceptance_criteria": "lead.age >= 21 && lead.income >= 50000",
    "quality_threshold": 0.70,
    "volume_cap": {
      "daily_limit": 1000,
      "hourly_limit": 100
    }
  }
}
```

## Webhook API

### Webhook Event Types

LeadConduit can send webhook notifications for various events:

- `lead.received` - New lead submitted
- `lead.accepted` - Lead passed acceptance criteria
- `lead.rejected` - Lead failed acceptance criteria
- `lead.delivered` - Lead successfully delivered to recipient
- `lead.failed` - Lead delivery failed
- `lead.converted` - Lead conversion reported

### Webhook Payload Format

**Example Webhook Payload:**
```json
{
  "event_type": "lead.delivered",
  "timestamp": "2024-01-15T10:30:02Z",
  "flow_id": "flow_789xyz",
  "lead_id": "lead_abc123def456",
  "data": {
    "lead": {
      "first_name": "John",
      "last_name": "Doe",
      "email": "john@example.com",
      "phone": "+15551234567"
    },
    "recipient": {
      "id": "recipient_789",
      "name": "CRM Integration"
    },
    "quality_score": 0.85,
    "delivery_time_ms": 245
  },
  "signature": "sha256=abc123def456..."
}
```

## Error Handling

### HTTP Status Codes

- `200 OK` - Request successful
- `201 Created` - Resource created successfully  
- `400 Bad Request` - Invalid request parameters
- `401 Unauthorized` - Invalid or missing API key
- `403 Forbidden` - Insufficient permissions
- `404 Not Found` - Resource not found
- `409 Conflict` - Resource conflict (e.g., duplicate)
- `422 Unprocessable Entity` - Validation errors
- `429 Too Many Requests` - Rate limit exceeded
- `500 Internal Server Error` - Server error

### Error Response Format

```json
{
  "error": {
    "code": "validation_failed",
    "message": "Request validation failed",
    "details": [
      {
        "field": "email",
        "code": "invalid_format", 
        "message": "Email format is invalid"
      }
    ],
    "request_id": "req_abc123def456"
  }
}
```

## Rate Limiting

### Rate Limit Headers

```http
X-RateLimit-Limit: 1000
X-RateLimit-Remaining: 999
X-RateLimit-Reset: 1642694400
```

### Rate Limit Guidelines

- **Standard Rate Limit:** 1,000 requests per hour
- **Burst Capacity:** Up to 100 requests per minute
- **Batch Operations:** Count as single request regardless of batch size
- **Webhook Deliveries:** Not counted against rate limits

## SDKs and Libraries

### Official SDKs

**JavaScript/Node.js:**
```bash
npm install @activeprospect/leadconduit-sdk
```

**Python:**
```bash
pip install leadconduit-python
```

**PHP:**
```bash
composer require activeprospect/leadconduit-php
```

### Code Examples

**JavaScript Example:**
```javascript
const LeadConduit = require('@activeprospect/leadconduit-sdk');

const client = new LeadConduit({
  apiKey: 'your_api_key',
  environment: 'production' // or 'sandbox'
});

// Submit a lead
const lead = await client.submitLead('flow_789xyz', {
  first_name: 'John',
  last_name: 'Doe',
  email: 'john@example.com',
  phone: '5551234567'
});

console.log('Lead submitted:', lead.id);
```

**Python Example:**
```python
from leadconduit import LeadConduitClient

client = LeadConduitClient(
    api_key='your_api_key',
    environment='production'
)

# Submit a lead
lead = client.submit_lead('flow_789xyz', {
    'first_name': 'John',
    'last_name': 'Doe', 
    'email': 'john@example.com',
    'phone': '5551234567'
})

print(f'Lead submitted: {lead.id}')
```

## Best Practices

### API Integration Guidelines

- **Idempotency:** Use unique external IDs to prevent duplicate submissions
- **Error Handling:** Implement comprehensive error handling and retry logic
- **Monitoring:** Track API response times and success rates
- **Testing:** Use sandbox environment for development and testing
- **Documentation:** Maintain up-to-date integration documentation

### Performance Optimization

- **Batch Processing:** Use batch endpoints for high-volume operations
- **Async Processing:** Enable asynchronous processing for better performance
- **Caching:** Cache flow configurations and frequently accessed data
- **Connection Pooling:** Reuse HTTP connections for better efficiency
- **Compression:** Enable gzip compression for large payloads

LeadConduit's comprehensive API provides powerful tools for integrating lead management capabilities into custom applications and workflows, enabling seamless data exchange and automated lead processing at scale.