# Email Marketing Platform Integrations

Connect LeadConduit to popular email marketing platforms like Mailchimp, ActiveCampaign, and Constant Contact. Learn configuration, best practices, and advanced features.

## 📍 You Are Here

You need to automatically add leads to email marketing lists, trigger campaigns, and maintain clean subscriber data. This guide covers the major email platforms and how to integrate them effectively.

## 🎯 What You'll Learn

- Platform-specific configurations
- Field mapping strategies
- Consent and compliance
- List management
- Automation triggers
- Best practices

## 📧 Mailchimp Integration

### Initial Setup

1. **Add Mailchimp Step**
   - Add Step → Delivery → Mailchimp
   - Click "Connect to Mailchimp"
   - Authorize LeadConduit

2. **Select Audience**
   ```
   Audience: Main Newsletter List
   Or map dynamically: {lead.list_name}
   ```

### Field Mapping

**Standard Fields**:
```
LeadConduit → Mailchimp
────────────────────────
email       → EMAIL (required)
first_name  → FNAME
last_name   → LNAME  
phone_1     → PHONE
state       → STATE
zip         → ZIP
```

**Custom Fields**:
```
lead_source → SOURCE
interest    → INTEREST
score       → LEADSCORE
```

### Subscription Management

**Status Options**:
- `subscribed` - Active subscriber
- `pending` - Requires confirmation
- `unsubscribed` - Opted out
- `cleaned` - Invalid/bounced

**Double Opt-in**:
```javascript
// Require confirmation
status: "pending"
send_welcome: false

// Skip confirmation (with explicit consent)
status: "subscribed"
consent_timestamp: {lead.consent_date}
```

### Tags and Segments

**Add Tags Dynamically**:
```javascript
tags: [
  lead.source,
  lead.campaign,
  "webform",
  Date.now()
]

// Conditional tags
if (lead.score > 80) tags.push("hot-lead")
if (lead.state == "CA") tags.push("california")
```

### Marketing Permissions

For GDPR compliance:
```javascript
marketing_permissions: [
  {
    marketing_permission_id: "email",
    enabled: lead.email_consent
  },
  {
    marketing_permission_id: "sms",
    enabled: lead.sms_consent
  }
]
```

## 🚀 ActiveCampaign Integration

### Connection Setup

1. **Get API Credentials**
   - Log into ActiveCampaign
   - Settings → Developer → API Access
   - Copy URL and Key

2. **Configure in LeadConduit**
   ```
   API URL: https://youracccount.api-us1.com
   API Key: your-api-key-here
   ```

### Contact Creation

**Basic Mapping**:
```
email      → email (required)
first_name → firstName
last_name  → lastName
phone      → phone
```

**Custom Fields**:
```javascript
// Map to custom field IDs
fieldValues: [
  {
    field: "1",  // Lead Source field ID
    value: lead.source
  },
  {
    field: "2",  // Score field ID
    value: lead.score
  }
]
```

### List Management

**Add to Lists**:
```javascript
// Single list
list: "2"  // List ID

// Multiple lists
lists: [
  { id: "2", status: "active" },
  { id: "5", status: "active" }
]

// Dynamic list assignment
list: lead.interest == "solar" ? "3" : "2"
```

### Automation Triggers

**Enter Automation**:
```javascript
automation: "5"  // Automation ID

// With entry point
automation: {
  id: "5",
  entry_point: "subscribed"
}
```

### Deal Creation

Create deals automatically:
```javascript
deal: {
  title: `${lead.first_name} - Web Lead`,
  value: lead.estimated_value || 1000,
  currency: "USD",
  pipeline: "1",
  stage: "1",
  owner: "3"
}
```

## 📮 Constant Contact Integration

### Authentication

1. **Connect Account**
   - Add Step → Constant Contact
   - Click "Connect"
   - Authorize access

2. **Select Account**
   - Choose from available accounts
   - Verify correct account

### Contact Configuration

**Required Fields**:
```
email → email_address (required)
```

**Recommended Fields**:
```
first_name   → first_name
last_name    → last_name
phone_1      → cell_phone
phone_2      → home_phone
company      → company_name
address      → street_address
city         → city
state        → state_code
zip          → postal_code
```

### List Assignment

**Static List**:
```
list_ids: ["abc123def456"]
```

**Dynamic Lists**:
```javascript
// Based on interest
list_ids: lead.interest == "newsletter" 
  ? ["list_1_id"] 
  : ["list_2_id"]

// Multiple lists
list_ids: [
  "main_list_id",
  lead.source_list_id
].filter(Boolean)
```

### Custom Fields

Map to custom fields:
```javascript
custom_fields: [
  {
    custom_field_id: "lead_source",
    value: lead.source
  },
  {
    custom_field_id: "lead_score",
    value: String(lead.score)
  }
]
```

## 🔄 Common Configuration Patterns

### Consent-Based Subscription

Only subscribe with explicit consent:
```javascript
// Check consent before adding
if (!lead.email_consent) {
  skip_step = true
} else {
  status = "subscribed"
  consent_source = lead.consent_source
  consent_timestamp = lead.consent_date
}
```

### Lead Scoring Integration

Pass lead scores to email platform:
```javascript
// Mailchimp
merge_fields: {
  SCORE: lead.score,
  GRADE: lead.score > 80 ? "A" : "B"
}

// ActiveCampaign
fieldValues: [
  { field: "score_field_id", value: lead.score }
]

// Add to high-value list if score high
if (lead.score > 90) {
  lists.push("vip_list_id")
}
```

### Source Attribution

Track where leads came from:
```javascript
// Standard fields
source: lead.source
campaign: lead.campaign
medium: lead.medium

// Tags for segmentation
tags: [
  `source:${lead.source}`,
  `campaign:${lead.campaign}`,
  `date:${new Date().toISOString().split('T')[0]}`
]
```

## 🛡️ Compliance and Best Practices

### Email Consent

**Always Verify Consent**:
```javascript
// Only add if explicit consent
if (lead.email_consent !== true) {
  outcome = "skipped"
  reason = "No email consent"
  return
}
```

### Double Opt-in

When required by law:
```javascript
// Mailchimp
status: "pending"  // Triggers confirmation email

// ActiveCampaign
status: "unconfirmed"
send_confirmation: true

// Constant Contact
confirm_opt_in: true
```

### Unsubscribe Handling

Honor opt-outs:
```javascript
// Check suppression list first
if (suppression_list.contains(lead.email)) {
  skip = true
  reason = "Previously unsubscribed"
}

// Update status if unsubscribed
if (lead.unsubscribed) {
  status = "unsubscribed"
  reason = lead.unsubscribe_reason
}
```

## 🚫 Common Issues and Solutions

### "Contact Already Exists"

**Solution**: Enable update mode
```javascript
// Mailchimp
update_existing: true

// ActiveCampaign
update_if_exists: true

// Constant Contact
update_contact: true
```

### "Invalid Email Format"

**Pre-validate**:
```javascript
// Check format before sending
if (!isValidEmail(lead.email)) {
  skip = true
  reason = "Invalid email format"
}

// Clean email
email = lead.email.toLowerCase().trim()
```

### "List Not Found"

**Debug**:
1. Verify list ID is correct
2. Check permissions for list
3. Ensure list is active
4. Try refreshing connection

### Rate Limiting

**Handle API limits**:
```javascript
// Add delays between requests
delay: 100  // milliseconds

// Batch where possible
batch_size: 500

// Implement exponential backoff
retry_delay: [1000, 2000, 4000, 8000]
```

## 💡 Advanced Features

### Dynamic Content

Personalize based on lead data:
```javascript
// Mailchimp merge tags
merge_fields: {
  FNAME: lead.first_name,
  PRODUCT: lead.interested_product,
  DISCOUNT: lead.score > 80 ? "20%" : "10%"
}
```

### Automation Triggers

Start sequences automatically:
```javascript
// ActiveCampaign automation
if (lead.downloaded_guide) {
  automation_id = "nurture_sequence"
} else if (lead.requested_demo) {
  automation_id = "sales_sequence"
}
```

### Lead Scoring Updates

Keep scores synchronized:
```javascript
// Update score on each interaction
contact_score = existing_score + lead.engagement_points

// Move between lists based on score
if (contact_score > 100) {
  move_to_list = "hot_leads"
}
```

## 📊 Testing Email Integrations

### Test Checklist

1. **Authentication**
   - [ ] Connection successful
   - [ ] Correct account selected
   - [ ] Permissions adequate

2. **Contact Creation**
   - [ ] New contact created
   - [ ] All fields mapped
   - [ ] Tags applied
   - [ ] Lists assigned

3. **Updates**
   - [ ] Existing contacts updated
   - [ ] No duplicates created
   - [ ] Fields merge correctly

4. **Compliance**
   - [ ] Consent checked
   - [ ] Opt-outs honored
   - [ ] GDPR fields set

### Test Scenarios

```javascript
// Test 1: New subscriber
{
  email: "new@example.com",
  consent: true,
  source: "webform"
}

// Test 2: Existing contact
{
  email: "existing@example.com",
  update_fields: true
}

// Test 3: No consent
{
  email: "noconsent@example.com",
  consent: false  // Should skip
}

// Test 4: High-value lead
{
  email: "vip@example.com",
  score: 95,  // Should trigger VIP handling
  consent: true
}
```

## 📚 Related Documentation

- [First Integration](../getting-started/first-integration.md) - Integration basics
- [Data Mapping](../data-management/data-mapping.md) - Field transformation
- [TCPA Compliance](../compliance/tcpa-compliance.md) - Consent management

---

📧 **Email Excellence**: Proper email integration ensures your leads receive timely, relevant communication while maintaining compliance. Test thoroughly and monitor deliverability for best results!