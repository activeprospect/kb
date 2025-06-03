# Email Marketing Platform Integrations

Connect LeadConduit to popular email marketing platforms for automated list management, campaign triggers, and lead nurturing. Master integrations with ActiveCampaign, Constant Contact, Mailchimp, and more.

## 📍 You Are Here

You need to automatically add leads to email marketing platforms, trigger campaigns, and manage subscriber data. This guide covers the major email platform integrations and best practices for each.

## 🎯 What You'll Learn

- Platform-specific setup steps
- Field mapping strategies
- List and tag management
- Automation triggers
- Compliance considerations
- Error handling

## 📧 ActiveCampaign Integration

### Initial Setup

Configure ActiveCampaign connection:

1. **Get API Credentials**:
   - Log into ActiveCampaign
   - Settings → Developer
   - Copy API URL and Key

2. **Add Integration**:
   ```yaml
   Step Type: Delivery
   Integration: ActiveCampaign
   Name: Add to ActiveCampaign
   API URL: https://youraccnt.api-us1.com
   API Key: [Your API key]
   ```

### Contact Creation

Map lead fields:

```javascript
// Required fields
email → email
first_name → firstName
last_name → lastName

// Optional fields
phone_1 → phone
city → fieldValues[city]
state → fieldValues[state]
zip → fieldValues[zip]

// Custom fields
lead.source → fieldValues[lead_source]
lead.quality_score → fieldValues[quality_score]
```

### List Management

Add to specific lists:

```yaml
List Selection:
  Method: Static
  List ID: 2
  Status: Active

# Or dynamic assignment
List Selection:
  Method: Dynamic
  List Field: {{lead.campaign_list_id}}
```

### Automation Triggers

Start automations on add:

```javascript
// Trigger automation
automation_id: 5

// With custom data
automation_data: {
  score: {{lead.quality_score}},
  source: {{lead.source}},
  date_added: {{now}}
}
```

### Tags and Segmentation

Apply dynamic tags:

```javascript
// Tag based on lead data
tags: [
  "leadconduit",
  "{{lead.state}}",
  "score_{{lead.score_range}}",
  "{{lead.source}}"
]

// Conditional tags
if (lead.score > 80) {
  tags.push("high_value");
}
if (lead.state in ["CA", "TX", "FL"]) {
  tags.push("priority_state");
}
```

## 📬 Constant Contact Integration

### Setup Process

1. **OAuth Connection**:
   - Click "Connect to Constant Contact"
   - Authorize LeadConduit
   - Select account

2. **Configure Step**:
   ```yaml
   Step Type: Delivery
   Integration: Constant Contact
   Name: Add Contact
   Account: [Selected account]
   ```

### Contact Management

Create or update contacts:

```javascript
// Contact data
email_address → email
first_name → first_name
last_name → last_name
phone_numbers: [{
  phone_number: {{phone_1}},
  kind: "home"
}]

// Address
street_addresses: [{
  street: {{address}},
  city: {{city}},
  state: {{state}},
  postal_code: {{zip}},
  country: "USA"
}]
```

### List Assignment

Multiple list options:

```javascript
// Single list
list_memberships: ["list_id_123"]

// Multiple lists
list_memberships: [
  "general_list_id",
  "state_{{state}}_list_id",
  "source_{{source}}_list_id"
]

// Conditional lists
if (lead.product_interest) {
  lists.push("product_" + lead.product_interest);
}
```

### Custom Fields

Map to custom fields:

```javascript
custom_fields: [
  {
    custom_field_id: "custom_field_1",
    value: {{lead.custom_data}}
  },
  {
    custom_field_id: "lead_score",
    value: {{lead.quality_score}}
  }
]
```

## 🐵 Mailchimp Integration

### Authentication

Set up API connection:

1. **Get API Key**:
   - Account → Extras → API Keys
   - Create key for LeadConduit

2. **Find Data Center**:
   - Look at API key suffix (e.g., -us10)
   - This is your data center

3. **Configure**:
   ```yaml
   API Key: xxxxxxxxxx-us10
   Data Center: us10
   ```

### Audience Management

Add to audiences (lists):

```javascript
// Select audience
audience_id: "a1b2c3d4"

// Member data
email_address: {{email}}
status: "subscribed" // or "pending" for double opt-in
merge_fields: {
  FNAME: {{first_name}},
  LNAME: {{last_name}},
  PHONE: {{phone_1}},
  STATE: {{state}}
}
```

### Tags and Segments

Organize subscribers:

```javascript
// Apply tags
tags: [
  "leadconduit",
  "{{date:YYYY-MM}}",
  "{{lead.source}}",
  "{{lead.quality_tier}}"
]

// Segment assignment
segments: {
  static_segment_id: "12345",
  conditional_merge: true
}
```

### Marketing Preferences

Set interests and preferences:

```javascript
interests: {
  "interest_id_1": true,  // Newsletter
  "interest_id_2": false, // Promotions
  "interest_id_3": {{lead.wants_updates}}
}

marketing_permissions: [{
  marketing_permission_id: "gdpr_email",
  enabled: true
}]
```

## 🔄 Common Patterns

### Double Opt-In Flow

Compliance-focused approach:

```javascript
// Step 1: Add as pending
{
  email: {{email}},
  status: "pending",
  merge_fields: {
    SIGNUP_SOURCE: "leadconduit",
    SIGNUP_DATE: {{now}}
  }
}

// Platform sends confirmation email
// User confirms = status changes to "subscribed"
```

### Progressive Profiling

Update data over time:

```javascript
// Initial add
{
  email: {{email}},
  status: "subscribed",
  merge_fields: {
    FNAME: {{first_name}},
    LNAME: {{last_name}}
  }
}

// Later update with more data
{
  email: {{email}},
  merge_fields: {
    PHONE: {{phone}},
    BIRTHDAY: {{birthday}},
    INTERESTS: {{interests}}
  },
  update_existing: true
}
```

### Suppression Handling

Respect unsubscribes:

```javascript
// Check suppression before adding
Pre-step: Query Suppression List

// Only add if not suppressed
if (!suppressed) {
  // Add to email platform
} else {
  // Skip or route elsewhere
}
```

## ⚡ Performance Optimization

### Batch Operations

For high volume:

```javascript
// Collect leads for batch
const batchSize = 500;
const batch = [];

// Add to batch
batch.push({
  email_address: lead.email,
  status: "subscribed",
  merge_fields: getMergeFields(lead)
});

// Send when full
if (batch.length >= batchSize) {
  sendBatch(batch);
  batch = [];
}
```

### Caching Strategies

Reduce API calls:

```javascript
// Cache list IDs
const listCache = {
  "California Leads": "list_123",
  "Texas Leads": "list_456",
  "High Value": "list_789"
};

// Use cached values
const listId = listCache[getListName(lead)];
```

## 🚨 Error Handling

### Common Errors

**"Already exists"**:
```javascript
// Handle existing contacts
if (error.code === "MEMBER_EXISTS") {
  // Update instead of create
  updateContact(email, data);
}
```

**"Invalid email"**:
```javascript
// Pre-validate emails
if (!isValidEmail(email)) {
  // Route to manual review
  routeToReview(lead, "Invalid email format");
}
```

**Rate Limits**:
```javascript
// Implement backoff
if (error.code === "RATE_LIMIT") {
  delay(60000); // Wait 1 minute
  retry();
}
```

## 📋 Best Practices

### Field Mapping

Standardize across platforms:

```javascript
// Consistent mapping
const fieldMap = {
  leadconduit: {
    email: "email",
    first_name: "first_name",
    last_name: "last_name",
    phone_1: "phone"
  },
  activecampaign: {
    email: "email",
    first_name: "firstName",
    last_name: "lastName",
    phone_1: "phone"
  },
  mailchimp: {
    email: "email_address",
    first_name: "FNAME",
    last_name: "LNAME",
    phone_1: "PHONE"
  }
};
```

### Compliance

Ensure legal compliance:

1. **Explicit Consent**: Only add leads with clear consent
2. **Suppression Lists**: Check and respect opt-outs
3. **Data Minimization**: Only send necessary fields
4. **Audit Trail**: Log all email platform additions

### Testing

Thorough testing process:

1. **Test Contacts**: Use test emails first
2. **Verify Data**: Check fields mapped correctly
3. **Test Automations**: Ensure triggers work
4. **Monitor Bounces**: Watch for delivery issues

## 📊 Monitoring Integration Health

Track key metrics:

```javascript
const integrationMetrics = {
  success_rate: successful_adds / total_attempts,
  duplicate_rate: duplicates / total_attempts,
  error_rate: errors / total_attempts,
  avg_response_time: sum(response_times) / count,
  
  // Platform specific
  automation_triggers: automation_starts / successful_adds,
  unsubscribe_rate: unsubscribes / total_added,
  engagement_rate: opens / delivered
};
```

## 🔧 Platform-Specific Tips

### ActiveCampaign
- Use automation triggers for complex workflows
- Leverage deal/pipeline features for sales
- Set up lead scoring based on engagement

### Constant Contact
- Best for simple newsletter management
- Use for event registrations
- Good for retail/local business

### Mailchimp
- Excellent for e-commerce integration
- Strong segmentation capabilities
- Use for A/B testing campaigns

## 📚 Related Documentation

- [Webhook Integration](./webhooks-and-apis.md) - Custom integrations
- [Data Mapping](../data-management/data-mapping.md) - Field transformations
- [Email Compliance](../compliance/email-compliance.md) - Legal requirements

---

📧 **Email Excellence**: Successful email marketing starts with clean data and proper integration. Choose the right platform for your needs and implement thoroughly!