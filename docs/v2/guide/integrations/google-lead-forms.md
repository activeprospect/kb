---
tags:
  - implementation
  - intermediate
  - how-to
  - integrations
  - google-ads
  - lead-forms
  - webhooks
  - marketing
---

# Google Lead Forms Integration

Connect Google Ads lead form extensions directly to LeadConduit for real-time lead capture and processing. This guide covers setup, webhook configuration, field mapping, and optimization strategies.

## 📍 You Are Here

You're setting up Google Lead Forms to automatically send leads from your Google Ads campaigns directly into your LeadConduit flow. This eliminates manual downloads and enables instant lead processing as soon as prospects submit their information.

## 🎯 What You'll Achieve

- Real-time lead delivery from Google Ads
- Automatic webhook configuration
- Comprehensive field mapping
- Lead validation and enhancement
- Multi-campaign management
- Performance tracking and optimization

## 📋 Prerequisites

Before starting, ensure you have:

### Google Ads Requirements
- **Google Ads account** with active campaigns
- **Admin access** to configure lead forms
- **Lead form extensions** enabled
- Understanding of your campaign structure

### LeadConduit Requirements
- Active LeadConduit account
- Flow created and saved
- Understanding of [webhook integration](./webhooks-and-apis.md)
- Recipients configured for lead delivery

## 🚀 Step 1: Create Google Lead Form Extension

### Access Lead Form Extensions

1. **Navigate to Google Ads**
   - Log into your Google Ads account
   - Go to **Ads & extensions**
   - Click **Extensions**
   - Select **Lead form extensions**

2. **Create New Lead Form**
   - Click the blue **+** button
   - Select **+ Lead form extension**
   - Choose campaign or ad group level

### Configure Your Form

3. **Basic Information**
   ```
   Extension name: Contact Form - Summer Campaign
   Headline: Get Your Free Quote
   Business name: Your Company
   Description: Fill out this form for an instant quote
   ```

4. **Select Fields to Collect**
   
   Available fields:
   | Field Category | Options |
   |---------------|---------|
   | **Name** | Full name OR First/Last name |
   | **Contact** | Email, Phone number |
   | **Location** | City, ZIP, State, Country |
   | **Business** | Company name, Job title |
   | **Work Contact** | Work email, Work phone |

   💡 **Best Practice**: Only collect essential fields to maximize conversion rates.

5. **Privacy and Consent**
   - Add privacy policy URL
   - Include consent text
   - Configure thank you message

## 🔧 Step 2: Set Up LeadConduit Integration

### Create Google Lead Form Source

1. **Add New Source**
   - Open your flow in edit mode
   - Click **Sources** tab
   - Click **Add Source**
   - Search for "Google Lead Form Webhook"
   - Select and configure

2. **Configure Source Settings**
   ```
   Label: Google Ads - Summer Campaign
   Integration: Google Lead Form Webhook
   ```
   - Save your flow (critical!)

3. **Get Webhook URL**
   - Click on your new source
   - Find **Posting Instructions**
   - Copy the submission URL:
   ```
   https://next.leadconduit.com/v2/flows/YOUR_FLOW_ID/sources/YOUR_SOURCE_ID/submit
   ```

### Configure Webhook in Google Ads

4. **Set Up Webhook**
   - Return to Google Ads
   - In your lead form extension
   - Find **Lead delivery options**
   - Select **Webhook**
   - Paste your LeadConduit URL

5. **Configure Webhook Settings**
   ```
   Webhook URL: [Your LeadConduit URL]
   Key: [Optional - for security]
   Test webhook: Click to verify
   ```

## 📊 Step 3: Field Mapping Configuration

### Standard Field Mappings

Google sends these fields automatically:

| Google Field | LeadConduit Field | Notes |
|-------------|-------------------|-------|
| user_column_data[0] | Varies by position | Check order in form |
| lead_id | google_lead_id | Unique identifier |
| form_id | google_form_id | Form identifier |
| campaign_id | google_campaign_id | Campaign tracking |
| api_version | api_version | Webhook version |
| gcl_id | google_click_id | Click tracking |

### Dynamic Field Mapping

Google uses positional data. Map based on your form field order:

```javascript
// Example mapping for form with: Name, Email, Phone, Company
{
  "first_name": "{{user_column_data[0].string_value}}",
  "email": "{{user_column_data[1].string_value}}", 
  "phone_1": "{{user_column_data[2].string_value}}",
  "company": "{{user_column_data[3].string_value}}"
}
```

### Handling Column Types

Different field types have different value keys:
- Text fields: `string_value`
- Location fields: May include multiple components
- Custom fields: Check webhook payload

## 🎯 Step 4: Advanced Configuration

### Multi-Campaign Setup

Manage multiple campaigns efficiently:

1. **Campaign-Specific Sources**
   - Create separate source for each campaign
   - Use descriptive labels
   - Track performance independently

2. **Unified Processing**
   ```
   Campaign A Form → Source A ↘
   Campaign B Form → Source B → Single Flow → CRM
   Campaign C Form → Source C ↗
   ```

### Lead Validation Rules

Add acceptance criteria:

```
Rule: Email is valid email
Rule: Phone length is equal to 10
Rule: google_campaign_id is not empty
```

### Enhancement Integration

Enhance Google leads:

```
Step 1: Receive from Google
Step 2: Validate email (BriteVerify)
Step 3: Append demographics
Step 4: Score lead quality
Step 5: Route to appropriate team
```

## 🔄 Testing Your Integration

### Submit Test Lead

1. **Use Google's Test Tool**
   - In lead form extension
   - Click "Test webhook"
   - Fill sample data
   - Submit test

2. **Verify in LeadConduit**
   - Check Events tab
   - Find test submission
   - Verify all fields mapped
   - Check data formatting

### Test Data Examples

| Field | Test Value | Expected Result |
|-------|-----------|----------------|
| Full Name | Test User | Parsed if needed |
| Email | test@example.com | Valid, lowercase |
| Phone | (555) 123-4567 | Normalized: 5551234567 |
| Company | Test Corp | As entered |

## 🚫 Troubleshooting

### "Webhook Not Receiving Data"

**Problem**: No leads arriving in LeadConduit
**Solutions**:
1. Verify webhook URL is exact
2. Check Google Ads webhook status
3. Ensure flow is published
4. Test with Google's tool
5. Check LeadConduit logs

### "Fields Not Mapping Correctly"

**Problem**: Data in wrong fields
**Solutions**:
1. Check field order in Google form
2. Verify user_column_data indices
3. Review sample webhook payload
4. Adjust mapping positions
5. Test with single field first

### "Missing Campaign Data"

**Problem**: No campaign/ad group info
**Solutions**:
1. Use newer API version
2. Include metadata fields in mapping
3. Check webhook configuration
4. Enable enhanced conversions

### "Duplicate Leads"

**Problem**: Same lead multiple times
**Solutions**:
1. Check for webhook retries
2. Implement deduplication rules
3. Use google_lead_id for uniqueness
4. Add time-based filters

## 💡 Best Practices

### Form Optimization

1. **Field Selection**
   - Minimum viable fields only
   - Use progressive profiling
   - Match landing page fields

2. **Mobile Experience**
   - Test on mobile devices
   - Keep forms short
   - Use appropriate input types

3. **Consent Management**
   - Clear opt-in language
   - Link to privacy policy
   - Store consent timestamp

### Performance Tracking

Track these metrics:

| Metric | Target | Measurement |
|--------|--------|-------------|
| Form Submit Rate | >20% | Impressions vs Submits |
| Lead Quality Score | >7/10 | Enhancement data |
| Speed to Contact | <5 min | Timestamp tracking |
| Cost per Lead | Varies | Campaign specific |
| Conversion Rate | >2% | Leads to customers |

### Campaign Alignment

1. **Message Match**
   - Form headline matches ad copy
   - Consistent value proposition
   - Same offer/incentive

2. **Audience Targeting**
   - Form fields match audience needs
   - Appropriate for campaign type
   - Geographic considerations

## 🎨 Advanced Strategies

### Lead Scoring Implementation

```javascript
// Calculate lead score based on Google data
let score = 0;

// Campaign quality
if (campaign_name.includes('high-intent')) score += 3;

// Completeness
if (work_email) score += 2;
if (company_name) score += 2;
if (phone) score += 1;

// Engagement
if (form_submit_time < 30) score += 2; // Quick submit

return score;
```

### Dynamic Routing

Route based on lead attributes:

```
Filter: Enterprise Leads
Rule: company_size is greater than 500
Action: Route to Enterprise Sales

Filter: SMB Leads  
Rule: company_size is less than 50
Action: Route to SMB Team
```

### A/B Testing Forms

Test different configurations:

1. **Form A**: Minimal fields (name, email)
2. **Form B**: Additional qualification (company, role)
3. **Measure**: Quantity vs Quality trade-off

## 📊 Webhook Payload Reference

### Sample Payload Structure

```json
{
  "lead_id": "123456789",
  "form_id": "987654321",
  "campaign_id": "456789123",
  "api_version": "1.0",
  "user_column_data": [
    {
      "column_name": "Full Name",
      "string_value": "John Doe"
    },
    {
      "column_name": "Email",
      "string_value": "john@example.com"
    },
    {
      "column_name": "Phone Number",
      "string_value": "+1-555-123-4567"
    }
  ],
  "gcl_id": "CjwKCAjw...",
  "adgroup_id": "789456123",
  "creative_id": "321654987"
}
```

### Accessing Nested Data

Use dot notation for nested fields:
```
{{user_column_data[0].string_value}}
{{user_column_data[0].column_name}}
```

## 🔗 Integration with Google Services

### Google Analytics

Track form submissions:
```javascript
// Send event to GA
gtag('event', 'generate_lead', {
  'event_category': 'Google Lead Form',
  'event_label': campaign_id,
  'value': lead_value
});
```

### Google Ads Conversion Tracking

1. Create conversion action
2. Use google_lead_id for matching
3. Import conversions back to Google Ads

### Customer Match Integration

Sync leads back for remarketing:
1. Export from LeadConduit
2. Hash email addresses
3. Upload to Customer Match
4. Create similar audiences

## 📚 Related Documentation

- [Webhook Configuration](./webhooks-and-apis.md) - General webhook setup
- [Field Mapping Guide](../data-management/data-mapping.md) - Advanced mapping techniques
- [Lead Scoring](../advanced/lead-scoring.md) - Quality evaluation
- [Facebook Lead Ads](./facebook-lead-ads.md) - Similar platform comparison

---

🎯 **Google Forms Connected**: Your Google Ads lead forms now flow seamlessly into LeadConduit, enabling instant validation, enhancement, and delivery. Every form submission is immediately available for your sales team to act on!