---
title: Submission Response
description: Send clear, actionable feedback to sources after every lead submission
tags:
  - submission-response
  - api-response
  - source-feedback
---

# Submission Response

## Closing the Communication Loop

Submission responses are how LeadConduit talks back to your sources. They're the difference between sources blindly sending leads into a black hole versus getting clear, actionable feedback that helps them improve quality and optimize their operations. Think of responses as your automated account manager - always providing consistent, helpful feedback.

📍 **You are here**: Configuring how sources receive submission feedback
💬 **What you'll master**: Response formats, status codes, and helpful messaging
🎯 **The outcome**: Sources that improve quality and reduce disputes

## Understanding Submission Responses

### What Is a Submission Response?

After a source submits a lead, LeadConduit sends back:
- Success or failure status
- Specific acceptance/rejection reasons  
- Lead ID for tracking
- Additional metadata (price, warnings, etc.)

This happens in real-time, typically within 200-500ms of submission.

### Why Responses Matter

**For Sources**:
- Know immediately if leads are accepted
- Understand why leads are rejected
- Track their leads in your system
- Optimize their data quality

**For You**:
- Reduce support inquiries
- Improve source quality
- Minimize disputes
- Build better partnerships

**Real Impact**: One lead buyer reduced vendor support tickets by 75% by improving their rejection messages.

## Response Components

### HTTP Status Codes

Use standard codes to indicate result:

**Success Codes**:
```yaml
201 Created: Lead accepted and created
200 OK: Lead accepted (update)
202 Accepted: Lead queued for processing
```

**Client Error Codes**:
```yaml
400 Bad Request: Invalid data format
401 Unauthorized: Authentication failed
402 Payment Required: Account suspended
409 Conflict: Duplicate lead
422 Unprocessable Entity: Failed validation
429 Too Many Requests: Rate limit exceeded
```

**Server Error Codes**:
```yaml
500 Internal Server Error: System failure
503 Service Unavailable: Maintenance mode
504 Gateway Timeout: Processing timeout
```

### Response Body Structure

Provide detailed information:

**Successful Acceptance**:
```json
{
  "result": "success",
  "lead_id": "ABC123DEF456",
  "price": 25.00,
  "message": "Lead accepted successfully",
  "warnings": [],
  "timestamp": "2024-01-15T10:30:45.123Z"
}
```

**Rejection with Details**:
```json
{
  "result": "failure",
  "reason": "Failed acceptance criteria",
  "errors": {
    "phone_1": "Invalid format - must be 10 digits",
    "email": "Disposable email domain not accepted",
    "state": "We do not accept leads from Alaska"
  },
  "lead_id": "TEMP789GHI012",
  "timestamp": "2024-01-15T10:30:45.456Z"
}
```

**Rate Limit Response**:
```json
{
  "result": "error",
  "reason": "Rate limit exceeded",
  "details": {
    "limit": "100 per minute",
    "current": "107",
    "reset_at": "2024-01-15T10:31:00Z"
  },
  "retry_after": 15
}
```

## Configuring Response Formats

### Standard Response Templates

LeadConduit provides customizable templates:

**Success Template**:
```handlebars
{
  "result": "success",
  "lead_id": "{{lead.id}}",
  "price": {{lead.cost}},
  "external_id": "{{lead.source_id}}",
  "created_at": "{{lead.timestamp}}",
  "message": "Lead accepted and processing"
}
```

**Failure Template**:
```handlebars
{
  "result": "failure", 
  "reason": "{{lead.rejection_reason}}",
  "errors": {{json lead.validation_errors}},
  "fields_received": {{json lead.fields}},
  "help_url": "https://docs.yourcompany.com/rejections"
}
```

### Custom Response Formats

Match source expectations:

**XML Response**:
```xml
<response>
  <result>{{lead.outcome}}</result>
  <leadId>{{lead.id}}</leadId>
  <price>{{lead.cost}}</price>
  <message>{{lead.outcome_message}}</message>
</response>
```

**Plain Text Response**:
```
RESULT: {{uppercase lead.outcome}}
ID: {{lead.id}}
PRICE: ${{lead.cost}}
{{#if lead.rejected}}
REASON: {{lead.rejection_reason}}
{{/if}}
```

**Custom JSON Structure**:
```json
{
  "status": {{#compare lead.outcome "success"}}1{{else}}0{{/compare}},
  "data": {
    "reference": "{{lead.id}}",
    "amount": {{lead.cost}},
    "currency": "USD"
  },
  "meta": {
    "processed_at": "{{now}}",
    "processing_time_ms": {{lead.duration_ms}}
  }
}
```

## Rejection Messaging

### Clear Rejection Reasons

Help sources understand and fix issues:

**Vague (Bad)**:
```json
{
  "result": "failure",
  "reason": "Invalid data"
}
```

**Specific (Good)**:
```json
{
  "result": "failure",
  "reason": "Failed validation on 2 fields",
  "errors": {
    "phone_1": "Invalid format - received '555-CALL-NOW', expected 10 digits",
    "email": "Missing required field"
  }
}
```

**Helpful (Best)**:
```json
{
  "result": "failure",
  "reason": "Failed validation on 2 fields",
  "errors": {
    "phone_1": {
      "message": "Invalid phone format",
      "received": "555-CALL-NOW",
      "expected": "10-digit US phone number",
      "example": "5551234567",
      "help": "https://docs.site.com/phone-format"
    },
    "email": {
      "message": "Email required but not provided",
      "help": "https://docs.site.com/required-fields"
    }
  }
}
```

### Categorized Rejections

Group rejections logically:

**By Type**:
```json
{
  "result": "failure",
  "category": "data_quality",
  "subcategory": "invalid_format",
  "errors": {
    "field_errors": {
      "phone": "Invalid format",
      "email": "Invalid domain"
    }
  }
}
```

**By Severity**:
```json
{
  "result": "failure",
  "fatal_errors": {
    "email": "Required field missing"
  },
  "warnings": {
    "phone_2": "Secondary phone invalid but not required"
  },
  "suggestions": {
    "state": "California leads perform better than Nevada"
  }
}
```

## Advanced Response Features

### Conditional Responses

Different responses for different scenarios:

**Based on Source Type**:
```handlebars
{{#compare source.type "premium"}}
  {
    "result": "{{lead.outcome}}",
    "lead_id": "{{lead.id}}",
    "price": {{lead.cost}},
    "exclusive_until": "{{add_hours lead.timestamp 24}}",
    "quality_score": {{lead.score}}
  }
{{else}}
  {
    "result": "{{lead.outcome}}",
    "lead_id": "{{lead.id}}"
  }
{{/compare}}
```

**Based on Outcome**:
```handlebars
{{#compare lead.outcome "success"}}
  {{> success_response}}
{{else compare lead.rejection_reason "duplicate"}}
  {{> duplicate_response}}
{{else compare lead.rejection_reason "cap_exceeded"}}
  {{> cap_exceeded_response}}
{{else}}
  {{> general_failure_response}}
{{/compare}}
```

### Enriched Responses

Include helpful additional data:

**With Warnings**:
```json
{
  "result": "success",
  "lead_id": "ABC123",
  "warnings": [
    "Phone number is landline - mobile preferred",
    "Email domain has low engagement rates",
    "Close to daily cap (450/500)"
  ]
}
```

**With Suggestions**:
```json
{
  "result": "failure",
  "reason": "Low quality score",
  "score": 35,
  "minimum_required": 50,
  "suggestions": [
    "Include TrustedForm certificate for +15 points",
    "Provide mobile phone for +10 points",
    "Use business email for +5 points"
  ]
}
```

**With Analytics**:
```json
{
  "result": "success",
  "lead_id": "ABC123",
  "analytics": {
    "acceptance_rate_today": "78%",
    "your_rank_today": 3,
    "leads_remaining_today": 127
  }
}
```

### Async Response Options

For sources that can't wait:

**Immediate Acknowledgment**:
```json
{
  "result": "queued",
  "tracking_id": "QUEUE123456",
  "status_url": "https://api.site.com/status/QUEUE123456",
  "estimated_processing": "2-5 seconds"
}
```

**Webhook Callback**:
```json
{
  "result": "accepted",
  "message": "Processing async - will callback",
  "callback_url": "{{source.callback_url}}",
  "callback_eta": "5 seconds"
}
```

## Response Headers

### Standard Headers

Include useful metadata:

```yaml
Content-Type: application/json
X-Lead-ID: ABC123DEF456
X-Request-ID: req_789GHI012
X-Processing-Time: 247ms
X-Account-Status: active
X-Rate-Limit-Remaining: 43
X-Rate-Limit-Reset: 1705325460
```

### Custom Headers

Add business-specific information:

```yaml
X-Quality-Score: 87
X-Buyer-Demand: high
X-Price-Trend: increasing
X-Cap-Utilization: 78%
X-Source-Rank: 2
```

## Common Response Patterns

### For Lead Buyers

**Quality Feedback Loop**:
```json
{
  "result": "success",
  "lead_id": "ABC123",
  "quality_indicators": {
    "phone_type": "mobile",
    "email_deliverable": true,
    "consent_age_minutes": 2,
    "duplicate_check": "unique"
  },
  "recommendations": {
    "optimal_contact_time": "2:00 PM - 4:00 PM",
    "preferred_channel": "SMS"
  }
}
```

**Tiered Acceptance**:
```json
{
  "result": "success",
  "lead_id": "ABC123",
  "tier": "premium",
  "price": 45.00,
  "benefits": {
    "exclusive_hours": 24,
    "contact_priority": "high",
    "enhanced_data": true
  }
}
```

### For Lead Sellers

**Distribution Confirmation**:
```json
{
  "result": "success",
  "lead_id": "ABC123",
  "distribution": {
    "exclusive_buyer": "Buyer A",
    "exclusive_until": "2024-01-16T10:30:45Z",
    "shared_buyers": ["Buyer B", "Buyer C"],
    "total_revenue": 125.00
  }
}
```

**Performance Metrics**:
```json
{
  "result": "success",
  "lead_id": "ABC123",
  "metrics": {
    "acceptance_rate": "92%",
    "average_revenue": "$42.50",
    "buyer_demand": "high",
    "quality_score": 88
  }
}
```

## Error Handling

### Graceful Degradation

Always provide useful responses:

**System Error Response**:
```json
{
  "result": "error",
  "message": "Temporary system issue",
  "error_code": "SYS_001",
  "support_ticket": "auto-generated",
  "retry_after": 30,
  "status_page": "https://status.yourcompany.com"
}
```

**Partial Success Response**:
```json
{
  "result": "partial_success",
  "lead_id": "ABC123",
  "completed": [
    "validation",
    "duplicate_check",
    "acceptance"
  ],
  "failed": {
    "enhancement": "Third-party service timeout"
  },
  "message": "Lead accepted but without enhancement data"
}
```

## Best Practices

### Response Design

1. **Be Consistent**
   - Same format for all responses
   - Predictable field names
   - Standard error structures
   - Clear success indicators

2. **Be Specific**
   - Exact rejection reasons
   - Field-level errors
   - Actionable feedback
   - Clear next steps

3. **Be Fast**
   - Minimize processing time
   - Stream responses
   - Avoid blocking operations
   - Cache when possible

4. **Be Helpful**
   - Include documentation links
   - Provide examples
   - Suggest improvements
   - Share best practices

### Source Communication

**Document Everything**:
- Response format specification
- Field descriptions
- Error code dictionary
- Example responses
- Change notifications

**Version Carefully**:
```yaml
Default: v2 response format
Legacy support: v1 available via header
Version header: X-API-Version: 2
Deprecation notice: 90 days minimum
```

## Testing Responses

### Test Scenarios

Cover all cases:

1. **Success Cases**
   - Perfect lead
   - Lead with warnings
   - High-value lead
   - Edge cases

2. **Rejection Cases**
   - Each validation rule
   - Multiple failures
   - Cap exceeded
   - Duplicate detection

3. **Error Cases**
   - Authentication failure
   - Rate limiting
   - System errors
   - Timeout scenarios

### Response Validation

Ensure quality:

```yaml
Response Time: < 500ms (p95)
Format: Valid JSON/XML
Status Codes: Appropriate HTTP codes
Content: All required fields present
Encoding: UTF-8 always
```

## Monitoring and Analytics

### Track Response Metrics

Monitor health:

**Performance Metrics**:
- Average response time
- Response size
- Error rate
- Timeout frequency

**Business Metrics**:
- Acceptance rate
- Rejection categories
- Source satisfaction
- Dispute frequency

### Source Feedback

Use responses to improve:

**Monthly Report to Sources**:
```
Your Submission Summary:
- Total submitted: 10,000
- Accepted: 8,500 (85%)
- Rejected: 1,500 (15%)

Top Rejection Reasons:
1. Invalid phone: 600 (40%)
2. Duplicate: 450 (30%)
3. Outside service area: 300 (20%)
4. Other: 150 (10%)

Recommendations:
- Validate phones before submission
- Check for duplicates in last 7 days
- Focus on CA, TX, FL leads
```

## Your Next Steps

### Essential Reading
1. **[Sources Configuration](/flows/lead-submission/sources)** - Where responses are configured
2. **[Acceptance Criteria](/flows/lead-submission/acceptance-criteria)** - Generate clear rejections
3. **[API Documentation](/help-guide/api/responses)** - Technical specifications

### Quick Improvements
1. Review current rejection messages
2. Add one helpful field to responses
3. Test all response scenarios
4. Document response format

### Advanced Topics
- **[Async Responses](/help-guide/advanced/async-responses)** - Handle long processing
- **[Response Analytics](/help-guide/analytics/response-metrics)** - Measure effectiveness
- **[Source Portals](/help-guide/features/source-portals)** - Self-service for sources

---

💡 **Remember**: Every response is a conversation with your source. Make it clear, helpful, and actionable. Good responses create good partnerships.

*Congratulations! You've mastered lead submission. Next: [Flow Steps](/flows/flow-steps) - Learn how to process leads after they're accepted.*