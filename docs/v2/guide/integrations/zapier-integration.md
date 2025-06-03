# Zapier Integration Guide

Connect LeadConduit to thousands of apps through Zapier. Learn to create Zaps, handle data transformations, and build powerful automations without coding.

## 📍 You Are Here

You need to connect LeadConduit to apps that don't have direct integrations. Zapier provides the bridge, allowing you to send leads to 5,000+ applications and automate complex workflows.

## 🎯 What You'll Learn

- Zapier fundamentals with LeadConduit
- Creating your first Zap
- Data mapping strategies
- Multi-step workflows
- Error handling
- Performance optimization

## 🔌 Understanding Zapier Integration

### What Zapier Enables

Connect LeadConduit to:
- **CRMs**: Pipedrive, Monday.com, Copper
- **Communication**: Slack, Teams, Discord
- **Spreadsheets**: Google Sheets, Airtable
- **Marketing**: Klaviyo, Brevo, ConvertKit
- **Project Management**: Asana, Trello, Notion
- **Custom Apps**: Webhooks, Code steps

### How It Works

```
LeadConduit → Webhook → Zapier → Destination App
    ↓            ↓         ↓            ↓
Lead arrives  Trigger    Process    Deliver
```

## 🚀 Setting Up Zapier Webhook

### Step 1: Create Zap Trigger

In Zapier:
1. Click **Create Zap**
2. Choose Trigger: **Webhooks by Zapier**
3. Select **Catch Hook**
4. Copy the webhook URL

```
https://hooks.zapier.com/hooks/catch/123456/abcdef/
```

### Step 2: Configure LeadConduit

Add delivery step:
```yaml
Step Type: Delivery
Integration: Generic Webhook
Name: Send to Zapier
URL: [Your Zapier webhook URL]
Method: POST
Headers:
  Content-Type: application/json
```

### Step 3: Map Fields

Send all needed data:
```javascript
// Field mappings
email → email
phone_1 → phone
first_name → first_name
last_name → last_name
state → state
source → lead_source
created_at → submission_date

// Custom fields
lead.custom_field → custom_data
appended.score → lead_score
```

### Step 4: Test Connection

1. Send test lead from LeadConduit
2. In Zapier, click **Test Trigger**
3. Select the test data
4. Continue with action setup

## 🔄 Common Zapier Workflows

### Google Sheets Logging

Track all leads in spreadsheet:

**Trigger**: LeadConduit webhook
**Action**: Google Sheets - Create Spreadsheet Row

```javascript
// Map to columns
A: {{email}}
B: {{phone}}
C: {{first_name}} {{last_name}}
D: {{state}}
E: {{zap_timestamp}}
F: =IF({{quality_score}}>80,"High","Low")
```

### Slack Notifications

Alert team of high-value leads:

**Trigger**: LeadConduit webhook
**Filter**: Only if score > 90
**Action**: Slack - Send Channel Message

```
🎯 High-Value Lead Alert!
Name: {{first_name}} {{last_name}}
Email: {{email}}
Score: {{lead_score}}
Source: {{lead_source}}
View: https://app.leadconduit.com/events/{{event_id}}
```

### CRM Creation with Enrichment

Add to CRM with additional data:

**Step 1**: LeadConduit webhook
**Step 2**: Clearbit - Enrich Company
**Step 3**: Pipedrive - Create Person
**Step 4**: Pipedrive - Create Deal

```javascript
// Person data
name: {{first_name}} {{last_name}}
email: {{email}}
phone: {{phone}}
company: {{clearbit_company_name}}

// Deal data
title: "Lead - {{clearbit_company_name}}"
value: {{clearbit_company_metrics_estimatedAnnualRevenue}}
probability: {{lead_score}}
```

### Multi-Channel Follow-up

Coordinate outreach:

**Step 1**: LeadConduit webhook
**Step 2**: Delay - 5 minutes
**Step 3**: SendGrid - Send Email
**Step 4**: Delay - 1 hour
**Step 5**: Twilio - Send SMS
**Step 6**: Calendly - Create Invitation

## 📊 Advanced Zapier Features

### Paths (Conditional Logic)

Route based on lead data:

```
Path A: High Value
  Condition: score > 80 AND state in ["CA","TX"]
  Action: Add to Premium CRM Pipeline
  
Path B: Needs Nurturing  
  Condition: score between 50-80
  Action: Add to Email Drip Campaign
  
Path C: Low Quality
  Condition: score < 50
  Action: Log to Sheet Only
```

### Formatter Steps

Transform data between steps:

**Text Formatting**:
```javascript
// Capitalize names
Input: john doe
Transform: Title Case
Output: John Doe

// Extract domain
Input: john@company.com
Transform: Extract Pattern
Pattern: @(.+)
Output: company.com
```

**Number Operations**:
```javascript
// Calculate commission
Input: {{lead_price}}
Transform: Spreadsheet-Style Formula
Formula: {{input}}*0.15
Output: Commission amount
```

### Code Steps

Custom JavaScript/Python:
```javascript
// JavaScript example
const lead = inputData.lead;
const score = calculateScore(lead);

// Add business logic
if (lead.state === 'CA' && score > 75) {
  output = {
    route: 'premium',
    priority: 'high',
    estimated_value: score * 100
  };
} else {
  output = {
    route: 'standard',
    priority: 'normal',
    estimated_value: score * 50
  };
}
```

## 🔍 Error Handling

### Handling Failures

Configure error behavior:

**In LeadConduit**:
```yaml
Retry: 3 times
Retry Delay: 5 seconds
On Failure: Continue flow
Store Error: Yes
```

**In Zapier**:
- Enable **Error Handler**
- Add fallback action
- Send notification
- Log to error sheet

### Common Error Solutions

**"Required field missing"**:
```javascript
// Add default values in Zapier
email: {{email||no-email@provided.com}}
phone: {{phone||0000000000}}
name: {{first_name||Unknown}} {{last_name||User}}
```

**"Invalid data format"**:
```javascript
// Format in Zapier
phone: {{phone|remove: "-"|remove: " "|remove: "("|remove: ")"}}
date: {{created_at|date: "YYYY-MM-DD"}}
```

## ⚡ Performance Optimization

### Batch Processing

For high volume:
1. Collect leads in LeadConduit
2. Batch delivery every 15 minutes
3. Process as digest in Zapier
4. Bulk insert to destination

### Minimize Steps

**Instead of**:
```
Webhook → Format → Format → Filter → CRM
```

**Use**:
```
Webhook → Code (all logic) → CRM
```

### Use Filters Early

Stop processing early:
```
1. Webhook Trigger
2. Filter: Only continue if score > 50
3. (Remaining steps only for qualified leads)
```

## 💡 Best Practices

### Field Naming

Use consistent names:
```javascript
// LeadConduit → Zapier mapping
email → email (not Email or email_address)
phone_1 → phone (not phone_number)
first_name → first_name (not fname)
```

### Testing Strategy

1. **Test in Zapier Editor** first
2. **Use test data** that covers edge cases
3. **Monitor first 24 hours** closely
4. **Set up error notifications**

### Documentation

Document your Zaps:
```yaml
Zap Name: LeadConduit → Salesforce (High Value)
Purpose: Create opportunities for leads >$1000
Frequency: Real-time
Owner: Marketing Ops
Last Updated: 2024-01-15
```

## 🚫 Common Pitfalls

### Rate Limits

Zapier limits:
- **Free**: 100 tasks/month
- **Starter**: 750 tasks/month
- **Professional**: 2,000 tasks/month

Optimize by:
- Filtering in LeadConduit first
- Using multi-step Zaps efficiently
- Batching when possible

### Data Loss

Prevent with:
- Error handling
- Backup logging
- Monitoring alerts
- Regular testing

### Complexity Creep

Keep Zaps simple:
- One clear purpose per Zap
- Maximum 10 steps
- Use sub-Zaps for complexity
- Document logic

## 📋 Setup Checklist

**LeadConduit Side**:
- [ ] Webhook step configured
- [ ] All fields mapped
- [ ] Authentication set (if needed)
- [ ] Error handling configured

**Zapier Side**:
- [ ] Webhook URL copied correctly
- [ ] Test data received
- [ ] Actions configured
- [ ] Error handler added

**Testing**:
- [ ] Test with valid data
- [ ] Test with invalid data
- [ ] Test with missing fields
- [ ] Monitor for 24 hours

## 🎯 Example Implementations

### Marketing Automation

```
LeadConduit → Zapier → Multiple Actions:
├── Add to Mailchimp
├── Create Calendly link
├── Notify sales team
└── Log to analytics
```

### Lead Distribution

```
LeadConduit → Zapier Paths:
├── Path A (score>80) → Premium CRM
├── Path B (score 50-80) → Standard CRM
└── Path C (score<50) → Nurture campaign
```

### Reporting Dashboard

```
LeadConduit → Zapier → Google Sheets
                    ↓
            Auto-refresh dashboard
                    ↓
            Email daily summary
```

## 📚 Related Documentation

- [Webhooks and APIs](./webhooks-and-apis.md) - Webhook configuration
- [Response Parsing](./response-parsing.md) - Handling responses
- [Data Mapping](../data-management/data-mapping.md) - Field transformations

---

⚡ **Zapier Power**: With Zapier, LeadConduit connects to virtually any application. Start simple, test thoroughly, and expand your automations as needed!