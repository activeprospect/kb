---
title: 'Infusionsoft/Keap Integration Guide'
description: 'Complete guide to integrating Infusionsoft/Keap CRM with LeadConduit for automated contact management'
sidebar_label: 'Infusionsoft/Keap'
sidebar_position: 3
tags:
  - Integration
  - CRM
  - Infusionsoft
  - Keap
  - API
  - Contact Management
---

# Infusionsoft/Keap Integration Guide

<div className="you-are-here">

### 📍 You Are Here

**Application**: LeadConduit  
**Section**: Integrations  
**Topic**: Infusionsoft/Keap CRM Integration

</div>

## Overview

This guide covers the complete integration between LeadConduit and Infusionsoft (now Keap), enabling automated contact creation, updates, and campaign management directly from your lead flows.

### What You'll Learn

<div className="grid-three-column">

<div className="info-card">

#### 🔐 Authentication
- OAuth setup process
- Credential management
- Connection testing

</div>

<div className="info-card">

#### 📊 Contact Management
- Creating contacts
- Updating existing records
- Custom field mapping

</div>

<div className="info-card">

#### 🎯 Advanced Features
- Tag management
- Campaign triggers
- Lead source tracking

</div>

</div>

## Prerequisites

Before setting up the integration, ensure you have:

1. **Infusionsoft/Keap Account**: Active subscription with API access
2. **LeadConduit Account**: Access to create and modify flows
3. **API Permissions**: Administrator access in Infusionsoft/Keap

## Setting Up the Integration

### Step 1: Add Infusionsoft as a Recipient

1. Navigate to your LeadConduit flow
2. Click **Add Recipient** in the Steps section
3. Select **Infusionsoft** from the integration list

![Integration Selection](/images/integrations/infusionsoft-select.png)

### Step 2: Authenticate Your Account

The integration uses OAuth for secure authentication:

1. Click **Connect Account** in the integration settings
2. You'll be redirected to Infusionsoft's login page
3. Enter your credentials and authorize LeadConduit
4. Upon successful authentication, you'll return to LeadConduit

<div className="warning-box">
<strong>⚠️ Important</strong>: Only users with API access can complete authentication. Contact your Infusionsoft administrator if you encounter permission errors.
</div>

### Step 3: Configure Basic Settings

After authentication, configure the integration basics:

```yaml
Integration Settings:
  Action: Create Contact
  Duplicate Handling: Update Existing
  Error Behavior: Continue Flow
```

## Field Mapping

### Automatically Mapped Fields

LeadConduit automatically maps these standard fields:

| LeadConduit Field | Infusionsoft Field | Notes |
|-------------------|-------------------|-------|
| `first_name` | First Name | Required |
| `last_name` | Last Name | Required |
| `email` | Email | Primary identifier |
| `phone_1` | Phone 1 | Main phone |
| `phone_2` | Phone 2 | Alternative phone |
| `phone_3` | Phone 3 | Additional phone |
| `address_1` | Street Address 1 | |
| `address_2` | Street Address 2 | |
| `city` | City | |
| `state` | State | |
| `postal_code` | Postal Code | |
| `website` | Website | |
| `comments` | Person Notes | |
| `title` | Job Title | |
| `dob` | Date of Birth | Format: YYYY-MM-DD |

### Custom Field Mapping

To map additional fields:

1. Click **Edit Field Mappings**
2. Add custom mappings:

```javascript
// Example custom mapping
{
  "lead_source": "{{lead.source}}",
  "custom_score": "{{lead.quality_score}}",
  "utm_campaign": "{{lead.utm_campaign}}"
}
```

### Advanced Field Options

Configure these optional fields for enhanced functionality:

<div className="grid-two-column">

<div className="code-example">

#### Contact Configuration
```yaml
Address Type: BILLING  # or SHIPPING
Contact Type: Lead     # or Customer, Prospect
Preferred Locale: en_US
Source Type: API
```

</div>

<div className="code-example">

#### Assignment Options
```yaml
Lead Source ID: 123    # From Infusionsoft
Owner ID: 456         # User ID for assignment
Tag IDs: [789, 1011]  # Apply tags on creation
```

</div>

</div>

## Tag Management

### Applying Tags

Tags help categorize and trigger automation in Infusionsoft:

```javascript
// In field mappings
{
  "tag_ids": [
    100,  // "New Lead" tag
    101,  // "Website Inquiry" tag
    102   // Campaign-specific tag
  ]
}
```

### Dynamic Tag Assignment

Use LeadConduit's conditional logic for dynamic tagging:

```javascript
// Example: Tag based on lead score
{
  "tag_ids": "{{#if lead.score >= 80}}103{{/if}}"
}
```

<div className="tip-box">
<strong>💡 Pro Tip</strong>: Create a tag mapping document to track tag IDs and their purposes. This prevents confusion as your tag library grows.
</div>

## Campaign Management

### Triggering Campaign Sequences

Automatically add contacts to campaign sequences:

```yaml
Campaign Settings:
  Campaign ID: 45
  Sequence: 1
  Start Immediately: true
```

### Multi-Campaign Assignment

For complex workflows, assign to multiple campaigns:

```javascript
{
  "campaigns": [
    {"id": 45, "sequence": 1},
    {"id": 47, "sequence": 3}
  ]
}
```

## Error Handling

### Common Integration Errors

<div className="error-table">

| Error | Cause | Solution |
|-------|-------|----------|
| `401 Unauthorized` | Token expired | Re-authenticate the integration |
| `409 Conflict` | Duplicate email | Enable "Update Existing" option |
| `400 Bad Request` | Invalid field data | Check field mapping formats |
| `503 Service Unavailable` | API limit reached | Implement retry logic |

</div>

### Implementing Error Filters

Add a filter after the Infusionsoft step to handle failures:

```yaml
Filter Configuration:
  Name: Handle Infusionsoft Errors
  Rules:
    - When: infusionsoft.outcome != "success"
      Then: Stop Processing
  Send to: Error Handler Flow
```

## Response Handling

### Available Response Fields

After delivery, these fields are available:

```javascript
{
  "infusionsoft.outcome": "success",
  "infusionsoft.contact_id": "12345",
  "infusionsoft.reason": null,
  "infusionsoft.duplicate": false
}
```

### Using Response Data

Leverage response data for conditional logic:

```javascript
// Example: Different actions for new vs. existing contacts
{{#if infusionsoft.duplicate}}
  // Send "Welcome Back" email
{{else}}
  // Send "New Customer Welcome" sequence
{{/if}}
```

## Best Practices

### 1. Data Validation

Always validate data before sending:

```yaml
Validation Rules:
  - Email: Valid format required
  - Phone: Standardize to E.164 format
  - State: Use 2-letter codes
  - Date fields: YYYY-MM-DD format
```

### 2. Rate Limiting

Infusionsoft enforces API rate limits:

- **Standard**: 10 requests/second
- **Burst**: 20 requests/second (short duration)

Implement throttling:

```javascript
// LeadConduit automatically handles rate limiting
// But for high-volume flows, consider:
{
  "delivery_delay": 100,  // milliseconds
  "retry_attempts": 3,
  "backoff_multiplier": 2
}
```

### 3. Lead Source Attribution

Always track lead sources for ROI analysis:

```javascript
{
  "lead_source_id": "{{#source_lookup lead.source_name}}",
  "referring_page": "{{lead.referring_url}}",
  "utm_params": {
    "campaign": "{{lead.utm_campaign}}",
    "source": "{{lead.utm_source}}",
    "medium": "{{lead.utm_medium}}"
  }
}
```

## Testing Your Integration

### Step 1: Test Authentication

Use the integration's test feature:

1. Click **Test Connection**
2. Verify successful authentication
3. Check available custom fields

### Step 2: Send Test Lead

Create a test lead with all required fields:

```json
{
  "first_name": "Test",
  "last_name": "Lead",
  "email": "test@example.com",
  "phone_1": "555-0123",
  "city": "Austin",
  "state": "TX"
}
```

### Step 3: Verify in Infusionsoft

1. Log into Infusionsoft/Keap
2. Search for the test contact
3. Verify all fields mapped correctly
4. Check tags and campaign assignments

## Advanced Integration Patterns

### Pattern 1: Lead Scoring Integration

Sync lead scores between systems:

```javascript
{
  "custom_fields": {
    "LeadScore": "{{lead.score}}",
    "ScoreDate": "{{now}}",
    "ScoringModel": "v2.1"
  }
}
```

### Pattern 2: Multi-Touch Attribution

Track all touchpoints:

```javascript
{
  "notes": "Lead Path: {{lead.touchpoints | join: ' > '}}",
  "custom_fields": {
    "FirstTouch": "{{lead.first_touchpoint}}",
    "LastTouch": "{{lead.last_touchpoint}}",
    "TouchCount": "{{lead.touchpoint_count}}"
  }
}
```

### Pattern 3: Conditional Updates

Update only specific fields for existing contacts:

```javascript
{{#if infusionsoft.duplicate}}
  {
    "update_fields": ["phone_1", "custom_score"],
    "preserve_fields": ["tags", "owner_id"]
  }
{{/if}}
```

## Monitoring and Optimization

### Key Metrics to Track

Monitor these metrics for integration health:

<div className="metrics-grid">

<div className="metric-card">

#### 🎯 Success Rate
```
Target: > 95%
Formula: Successful / Total Attempts
Alert: < 90%
```

</div>

<div className="metric-card">

#### ⏱️ Response Time
```
Target: < 500ms
Average: 200-300ms
Alert: > 1000ms
```

</div>

<div className="metric-card">

#### 🔄 Duplicate Rate
```
Expected: 10-30%
Formula: Duplicates / Total
Review: > 50%
```

</div>

</div>

### Creating Integration Reports

Build reports to monitor performance:

```yaml
Report Configuration:
  Name: Infusionsoft Integration Health
  Columns:
    - Date
    - Total Leads
    - Success Count
    - Failure Count
    - Average Response Time
    - Duplicate Percentage
  Grouping: By Day
  Filters:
    - Step: Infusionsoft Delivery
    - Date Range: Last 30 Days
```

## Troubleshooting Guide

### Connection Issues

<div className="troubleshooting-section">

**Problem**: "Authentication failed" error

**Solutions**:
1. Verify Infusionsoft account is active
2. Check API access permissions
3. Re-authenticate the integration
4. Clear browser cache and cookies

</div>

### Data Sync Issues

<div className="troubleshooting-section">

**Problem**: Fields not updating in Infusionsoft

**Solutions**:
1. Verify field names match exactly
2. Check data types (string vs. number)
3. Ensure custom fields exist in Infusionsoft
4. Review field-level permissions

</div>

### Performance Issues

<div className="troubleshooting-section">

**Problem**: Slow delivery or timeouts

**Solutions**:
1. Check Infusionsoft API status
2. Reduce payload size
3. Implement batch processing
4. Contact support for rate limit increases

</div>

## Migration Guide

### Transitioning from Legacy Integration

If upgrading from an older integration version:

1. **Export Current Mappings**: Document all field mappings
2. **Test in Parallel**: Run both integrations briefly
3. **Validate Data**: Ensure all fields transfer correctly
4. **Update Reporting**: Adjust reports for new field names

## Next Steps

<div className="next-steps-grid">

<a href="/docs/v2/guide/integrations/salesforce-integration" className="next-step-card">
<h4>Salesforce Integration</h4>
<p>Learn about CRM alternatives</p>
</a>

<a href="/docs/v2/guide/automation/marketing-automation" className="next-step-card">
<h4>Marketing Automation</h4>
<p>Automate your campaigns</p>
</a>

<a href="/docs/v2/reference/api/webhook-specs" className="next-step-card">
<h4>Webhook Reference</h4>
<p>Custom integration options</p>
</a>

</div>

## Additional Resources

- [Infusionsoft API Documentation](https://developer.keap.com/docs/rest/)
- [LeadConduit Integration Gallery](/docs/v2/reference/integrations)
- [Community Forum: Infusionsoft Topics](https://community.activeprospect.com/c/infusionsoft)

---

<div className="feedback-section">

### 📝 Feedback

**Was this guide helpful?** [Yes](#) | [No](#) | [Report an Issue](#)

**Need help?** Contact our [Integration Support Team](mailto:support@activeprospect.com)

</div>