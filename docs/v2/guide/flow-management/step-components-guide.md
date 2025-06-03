---
title: 'Step Components Guide'
description: 'Master all LeadConduit step components including filters, mappings, criteria, and advanced configurations'
sidebar_label: 'Step Components'
sidebar_position: 8
tags:
  - Flow Management
  - Steps
  - Components
  - Configuration
  - Filters
  - Mappings
---

# Step Components Guide

<div className="you-are-here">

### 📍 You Are Here

**Application**: LeadConduit  
**Section**: Flow Management  
**Topic**: Understanding and Configuring Step Components

</div>

## Overview

This guide provides comprehensive coverage of all step components in LeadConduit, helping you understand and effectively use rules, feedback, criteria, mappings, and other step configurations.

### What You'll Learn

<div className="grid-three-column">

<div className="info-card">

#### 🎯 Step Types
- Filters and rules
- Enhancements
- Deliveries

</div>

<div className="info-card">

#### ⚙️ Configurations
- Field mappings
- Step criteria
- Feedback handling

</div>

<div className="info-card">

#### 📊 Advanced Features
- Notes and documentation
- Disabling steps
- Performance optimization

</div>

</div>

## Step Component Architecture

### Component Hierarchy

```yaml
Step:
  ├── Basic Settings
  │   ├── Name
  │   ├── Type
  │   └── Position
  ├── Configuration
  │   ├── Field Mappings
  │   ├── Step Criteria
  │   └── Integration Settings
  ├── Advanced Options
  │   ├── Rules (Filters only)
  │   ├── Feedback
  │   └── Notes
  └── Status
      ├── Enabled/Disabled
      └── Warnings/Errors
```

## Filter Components

### Rule Configuration

Filters use rules to determine when to stop lead processing:

```yaml
Filter Rule Structure:
  Rule Name: Block Invalid Emails
  Conditions:
    - Field: email
      Operator: is not valid email
      Action: Stop processing
  Reason: Invalid email format
```

#### Complex Rule Sets

Create sophisticated filtering logic:

```javascript
// Multi-condition rule
{
  "rule_set": {
    "name": "Quality Filter",
    "operator": "AND",
    "rules": [
      {
        "field": "email",
        "operator": "is valid email"
      },
      {
        "field": "phone",
        "operator": "is valid phone"
      },
      {
        "operator": "OR",
        "rules": [
          {
            "field": "state",
            "operator": "is present"
          },
          {
            "field": "postal_code",
            "operator": "is present"
          }
        ]
      }
    ]
  }
}
```

### Common Filter Patterns

<div className="filter-patterns">

<div className="pattern-card">

#### 🛑 Stop on Delivery Failure
```yaml
Rule: Previous step outcome
Condition: outcome != "success"
Action: Stop flow
```

</div>

<div className="pattern-card">

#### 🔍 Data Validation
```yaml
Rule: Required fields
Condition: email is blank OR phone is blank
Action: Stop with reason "Missing data"
```

</div>

<div className="pattern-card">

#### 📊 Score Threshold
```yaml
Rule: Quality check
Condition: lead_score < 50
Action: Stop with reason "Low quality"
```

</div>

</div>

## Field Mapping Components

### Basic Field Mapping

Map fields between LeadConduit and integrations:

```yaml
Basic Mapping:
  Source Field: lead.email
  Destination Field: contact_email
  Required: Yes
  Default Value: (none)
```

### Advanced Mapping Techniques

#### Conditional Mapping

```javascript
// Map based on conditions
{
  "field_mappings": {
    "category": "{{#if lead.score > 80}}Premium{{else}}Standard{{/if}}",
    "priority": "{{#if lead.value > 1000}}High{{else}}Normal{{/if}}",
    "assignment": "{{#if lead.state == 'CA'}}West Coast Team{{else}}East Coast Team{{/if}}"
  }
}
```

#### Value Transformation

```javascript
// Transform values during mapping
{
  "transformations": {
    "phone": "{{lead.phone | remove: '-' | remove: '(' | remove: ')'}}",
    "name": "{{lead.first_name | capitalize}} {{lead.last_name | capitalize}}",
    "date": "{{lead.created_at | date: '%Y-%m-%d'}}",
    "amount": "{{lead.loan_amount | times: 100 | round}}"  // Convert to cents
  }
}
```

#### Computed Fields

```javascript
// Create new fields from existing data
{
  "computed_fields": {
    "full_address": "{{lead.address}}, {{lead.city}}, {{lead.state}} {{lead.zip}}",
    "age": "{{now | minus: lead.birth_date | divided_by: 31536000 | floor}}",
    "lifetime_value": "{{lead.purchase_amount | times: lead.purchase_frequency}}",
    "qualified": "{{#if lead.score > 70 AND lead.verified}}true{{else}}false{{/if}}"
  }
}
```

### Mapping Validation

Ensure mappings work correctly:

<div className="validation-checklist">

- [ ] Required fields are always mapped
- [ ] Data types match (string, number, boolean)
- [ ] Date formats are correct
- [ ] Special characters are handled
- [ ] Default values are appropriate
- [ ] Null/empty values are handled

</div>

## Step Criteria

### Understanding Step Criteria

Control when steps execute:

```yaml
Step Criteria:
  Purpose: Conditional execution
  Evaluation: Before step runs
  Result: Execute or skip
```

### Common Criteria Patterns

<div className="grid-two-column">

<div className="code-example">

#### Time-Based Execution
```javascript
// Business hours only
{
  "criteria": {
    "day_of_week": ["Mon", "Tue", "Wed", "Thu", "Fri"],
    "hour_of_day": {
      "min": 9,
      "max": 17
    },
    "timezone": "America/New_York"
  }
}
```

</div>

<div className="code-example">

#### Source-Based Routing
```javascript
// Different handling by source
{
  "criteria": {
    "conditions": [
      {
        "field": "lead.source",
        "operator": "equals",
        "value": "premium_partner"
      }
    ]
  }
}
```

</div>

</div>

### Complex Criteria Logic

Build sophisticated execution conditions:

```javascript
// Multi-level criteria
{
  "step_criteria": {
    "name": "Premium Lead Handler",
    "conditions": {
      "ALL": [
        {
          "field": "lead.score",
          "operator": ">=",
          "value": 80
        },
        {
          "ANY": [
            {
              "field": "lead.value",
              "operator": ">",
              "value": 1000
            },
            {
              "field": "lead.source",
              "operator": "in",
              "value": ["direct", "referral"]
            }
          ]
        }
      ]
    }
  }
}
```

## Feedback Configuration

### Understanding Feedback

Feedback allows recipients to send information back to LeadConduit:

```yaml
Feedback Flow:
  1. Lead delivered to recipient
  2. Recipient processes lead
  3. Recipient sends feedback
  4. LeadConduit updates lead record
```

### Feedback Setup

Enable and configure feedback:

```javascript
// Feedback configuration
{
  "feedback": {
    "enabled": true,
    "url": "https://app.leadconduit.com/feedback/{{flow.id}}/{{lead.id}}",
    "auth_token": "{{feedback.token}}",
    "timeout": 86400,  // 24 hours
    "accepted_outcomes": ["converted", "rejected", "returned"]
  }
}
```

### Processing Feedback

Handle feedback responses:

```javascript
// Feedback handler
{
  "on_feedback": {
    "converted": {
      "update_fields": {
        "status": "sold",
        "sold_at": "{{feedback.timestamp}}",
        "sold_price": "{{feedback.price}}"
      },
      "trigger_pixel": true
    },
    "rejected": {
      "update_fields": {
        "status": "rejected",
        "rejection_reason": "{{feedback.reason}}"
      }
    }
  }
}
```

## Step Notes

### Effective Documentation

Use notes to document complex configurations:

```markdown
## Delivery Configuration Notes

### Purpose
This step delivers leads to our premium buyer with special handling for high-value leads.

### Special Logic
- Leads > $10k go to dedicated endpoint
- California leads use different API key
- Timeout increased for large payloads

### Contact
Technical issues: buyer-tech@example.com
Business questions: account-manager@example.com

### Last Updated
2024-01-15 - Increased timeout for better reliability
```

### Note Templates

<div className="note-templates">

<div className="template-card">

#### 🔧 Technical Notes
```markdown
## Technical Details
- API Version: 2.0
- Rate Limit: 100/minute
- Retry Logic: 3 attempts, exponential backoff
- Error Codes: See wiki/error-codes
```

</div>

<div className="template-card">

#### 📊 Business Logic
```markdown
## Business Rules
- Pricing: $X per lead
- Volume Cap: 1000/day
- Quality Requirements: Score > 70
- SLA: 95% acceptance rate
```

</div>

</div>

## Disabling Steps

### When to Disable vs Delete

<div className="comparison-table">

| Scenario | Disable | Delete |
|----------|---------|--------|
| Temporary issue | ✓ | ✗ |
| Testing alternatives | ✓ | ✗ |
| Permanent removal | ✗ | ✓ |
| Preserving history | ✓ | ✗ |
| A/B testing | ✓ | ✗ |

</div>

### Disabling Best Practices

```yaml
Disabling Checklist:
  - Document why step is disabled
  - Set reminder to review
  - Update dependent steps
  - Notify stakeholders
  - Monitor flow performance
```

## Step Warnings and Errors

### Understanding Warnings

Common warnings and their meanings:

<div className="warning-grid">

<div className="warning-card">

#### ⚠️ Missing Configuration
**Cause**: Required fields not set  
**Fix**: Open step and complete configuration

</div>

<div className="warning-card">

#### ⚠️ Invalid Mapping
**Cause**: Source field doesn't exist  
**Fix**: Update field mappings

</div>

<div className="warning-card">

#### ⚠️ Authentication Required
**Cause**: No credentials configured  
**Fix**: Add authentication details

</div>

</div>

### Resolving Configuration Errors

Step-by-step error resolution:

1. **Identify the Error**
   - Check step icon for warnings
   - Open step to see details
   - Review error message

2. **Understand the Cause**
   - Missing required fields
   - Invalid configuration
   - Integration issues

3. **Apply the Fix**
   - Update configuration
   - Test with sample data
   - Save changes

4. **Verify Resolution**
   - Warning icon should disappear
   - Test lead processing
   - Monitor for issues

## Performance Considerations

### Step Optimization

Optimize step performance:

```javascript
// Performance configuration
{
  "performance": {
    "timeout": 5000,  // 5 seconds
    "retry_attempts": 2,
    "connection_pooling": true,
    "compression": "gzip",
    "batch_size": 100
  }
}
```

### Monitoring Step Performance

Track key metrics:

<div className="metrics-grid">

<div className="metric-card">

#### ⏱️ Response Time
```
Average: < 200ms
P95: < 500ms
P99: < 1000ms
```

</div>

<div className="metric-card">

#### ✅ Success Rate
```
Target: > 98%
Warning: < 95%
Critical: < 90%
```

</div>

<div className="metric-card">

#### 🔄 Throughput
```
Leads/second: Monitor
Queue depth: < 100
Backpressure: Alert
```

</div>

</div>

## Advanced Step Patterns

### Pattern 1: Conditional Enhancement Chain

```javascript
// Progressive enhancement based on data availability
[
  {
    "step": "Phone Validation",
    "criteria": "phone is present",
    "continue_on_error": true
  },
  {
    "step": "Email Validation",
    "criteria": "email is present",
    "continue_on_error": true
  },
  {
    "step": "Address Standardization",
    "criteria": "address is present",
    "continue_on_error": true
  }
]
```

### Pattern 2: Failover Delivery

```javascript
// Try primary, fallback to secondary
{
  "delivery_chain": [
    {
      "name": "Primary API",
      "timeout": 3000,
      "stop_on_success": true
    },
    {
      "name": "Secondary API",
      "timeout": 5000,
      "criteria": "previous.outcome != success"
    }
  ]
}
```

### Pattern 3: Data Enrichment Pipeline

```javascript
// Build complete lead profile
{
  "enrichment_pipeline": [
    {
      "step": "Demographic Append",
      "adds_fields": ["age", "income", "education"]
    },
    {
      "step": "Property Data",
      "adds_fields": ["home_value", "mortgage_date"],
      "criteria": "address is present"
    },
    {
      "step": "Score Calculation",
      "uses_fields": "all_available",
      "produces": "lead_score"
    }
  ]
}
```

## Troubleshooting Guide

### Common Issues

<div className="troubleshooting-grid">

<div className="issue-card">

#### Step Not Executing
- Check step criteria
- Verify it's enabled
- Review flow logic
- Check previous step outcomes

</div>

<div className="issue-card">

#### Mapping Errors
- Verify field names
- Check data types
- Test with sample data
- Review transformation syntax

</div>

<div className="issue-card">

#### Performance Issues
- Monitor response times
- Check rate limits
- Review payload size
- Consider batching

</div>

</div>

## Best Practices

### 1. Step Organization

```yaml
Organization Guidelines:
  - Group related steps
  - Use descriptive names
  - Maintain logical flow
  - Document complex logic
  - Regular review and cleanup
```

### 2. Error Handling

```yaml
Error Strategy:
  - Use filters after deliveries
  - Set appropriate timeouts
  - Configure retry logic
  - Log failures for analysis
  - Alert on critical errors
```

### 3. Testing

```yaml
Testing Checklist:
  - Test each step individually
  - Verify all mappings
  - Check error scenarios
  - Validate criteria logic
  - Monitor production performance
```

## Next Steps

<div className="next-steps-grid">

<a href="/docs/v2/guide/flow-management/optimization" className="next-step-card">
<h4>Flow Optimization</h4>
<p>Improve flow performance</p>
</a>

<a href="/docs/v2/guide/integrations/custom-integrations" className="next-step-card">
<h4>Custom Integrations</h4>
<p>Build your own steps</p>
</a>

<a href="/docs/v2/reference/steps/api" className="next-step-card">
<h4>Steps API Reference</h4>
<p>Programmatic control</p>
</a>

</div>

## Additional Resources

- [Step Configuration Examples](https://github.com/activeprospect/leadconduit-examples)
- [Video Tutorial: Advanced Step Configuration](https://www.youtube.com/watch?v=example)
- [Community Forum: Step Components](https://community.activeprospect.com/c/steps)

---

<div className="feedback-section">

### 📝 Feedback

**Was this guide helpful?** [Yes](#) | [No](#) | [Report an Issue](#)

**Need help?** Contact our [Support Team](mailto:support@activeprospect.com)

</div>