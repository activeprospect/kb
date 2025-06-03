---
tags:
  - buyer-focused
  - beginner
  - how-to
  - integrations
  - implementation
  - technical
  - evaluation
---

# Setting Up Your First Integration

Connect LeadConduit to your CRM, email system, or other business tools. This guide walks through your first integration setup with best practices for success.

## 📍 You Are Here

You have a flow receiving leads, and now you need to send them somewhere useful. Whether it's a CRM, email platform, or custom endpoint, this guide shows you how to set up reliable delivery.

## 🎯 What You'll Learn

- Choosing the right integration
- Step-by-step configuration
- Testing your connection
- Troubleshooting common issues
- Best practices for reliability

## 🤔 Choosing Your First Integration

### Common First Integrations

**For Sales Teams**:
- Salesforce
- HubSpot
- Pipedrive
- Custom CRM webhook

**For Marketing**:
- Mailchimp
- ActiveCampaign
- Constant Contact
- Marketing automation

**For Call Centers**:
- Five9
- Velocify
- Phone burner
- Custom dialer

**For Testing**:
- Webhook.site
- RequestBin
- Custom endpoint

## 🚀 Setting Up a Webhook Integration

We'll start with a webhook - the most flexible integration type.

### Step 1: Add Integration Step

1. Open your flow
2. Click **Add Step** after your source
3. Select **Delivery**
4. Choose **Custom Webhook**

### Step 2: Configure Endpoint

Enter your destination details:

```
Name: My CRM Webhook
URL: https://api.mycrm.com/leads
Method: POST
Content-Type: application/json
```

### Step 3: Add Authentication

Most APIs require authentication:

**API Key in Header**:
```
Header Name: X-API-Key
Header Value: your-api-key-here
```

**Bearer Token**:
```
Header Name: Authorization
Header Value: Bearer your-token-here
```

### Step 4: Map Your Fields

Connect LeadConduit fields to API fields:

```
LeadConduit Field → API Field
─────────────────────────────
email            → contact_email
phone_1          → phone_number
first_name       → given_name
last_name        → family_name
state            → location_state
```

### Step 5: Configure Response Parsing

Tell LeadConduit how to read the response:

```
Success Indicator: status_code = 200
Lead ID Location: response.body.id
Error Message: response.body.error
```

## 🔧 Example: Salesforce Integration

### Step 1: Add Salesforce Step

1. Click **Add Step**
2. Select **Delivery**
3. Choose **Salesforce**
4. Click **Add Salesforce**

### Step 2: Authenticate

1. Click **Connect to Salesforce**
2. Log in with Salesforce credentials
3. Authorize LeadConduit access
4. Connection confirmed!

### Step 3: Configure Lead Creation

**Object Type**: Lead

**Field Mappings**:
```
email       → Email
phone_1     → Phone
first_name  → FirstName
last_name   → LastName
company     → Company (required)
state       → State
```

**Required Fields**:
- LastName (map from last_name)
- Company (set default if not collected)

### Step 4: Set Options

- **Duplicate Handling**: Update existing
- **Assignment Rule**: Use active rule
- **Owner**: Round-robin or specific user
- **Lead Source**: Set to "Web" or dynamic

## 📧 Example: Mailchimp Integration

### Step 1: Add Mailchimp Step

1. **Add Step** → **Delivery** → **Mailchimp**
2. Name it "Add to Newsletter"

### Step 2: Connect Account

1. Click **Connect Mailchimp**
2. Log in to Mailchimp
3. Authorize access
4. Select your account

### Step 3: Configure List

**List Selection**:
- Choose your audience/list
- Or map dynamically based on data

**Field Mappings**:
```
email      → EMAIL (required)
first_name → FNAME
last_name  → LNAME
phone_1    → PHONE
state      → STATE
```

**Subscription Settings**:
- Status: Subscribed
- Marketing permissions: Based on consent
- Tags: Add based on source/campaign

## 🧪 Testing Your Integration

### Step 1: Use Test Mode

Before going live:
1. Enable **Test Mode** on the integration
2. Send a test lead
3. Verify it appears correctly
4. Check field mapping

### Step 2: Send Test Lead

From your flow:
1. Click **Test** button
2. Fill in sample data
3. Submit test lead
4. Check the **Events** tab

### Step 3: Verify Delivery

Check your destination:
- Lead appears in CRM?
- Contact added to email list?
- All fields mapped correctly?
- No duplicate created?

### Step 4: Test Edge Cases

Don't forget to test:
- Missing optional fields
- Invalid data formats
- Duplicate submissions
- API errors/timeouts

## 🚫 Common Issues and Solutions

### "Authentication Failed"

**Symptoms**: 401 or 403 errors

**Solutions**:
1. Re-authenticate the integration
2. Check API key hasn't expired
3. Verify permissions are correct
4. Try in a private browser

### "Required Field Missing"

**Error**: "Company is required"

**Solutions**:
1. Map the field if available
2. Set a default value
3. Make field required in your source
4. Use conditional logic

### "Invalid Field Value"

**Error**: "State must be 2-letter code"

**Fix with transformation**:
```
California → CA
Texas → TX
New York → NY
```

### "Duplicate Record"

**Solutions**:
1. Enable update mode
2. Set unique identifier
3. Check duplicate settings
4. Use upsert operation

## 💡 Best Practices

### Field Mapping

**Do**:
- Map all available fields
- Use consistent naming
- Document custom mappings
- Test edge cases

**Don't**:
- Leave required fields unmapped
- Assume field formats
- Ignore case sensitivity
- Skip testing

### Error Handling

**Always Configure**:
- Retry attempts (3-5)
- Retry delays (exponential)
- Failure notifications
- Backup delivery method

### Performance

**Optimize for Speed**:
- Minimize field mappings
- Use batch where available
- Enable caching
- Monitor response times

## 🎯 Integration Checklist

Before activating:
- [ ] Authentication working
- [ ] All required fields mapped
- [ ] Test lead delivered successfully
- [ ] Response parsing configured
- [ ] Error handling set up
- [ ] Retry logic enabled
- [ ] Documentation complete
- [ ] Team members trained

## 🔄 Next Steps

### After Your First Integration

1. **Add More Integrations**
   - Email verification
   - Phone validation
   - Duplicate checking

2. **Configure Advanced Features**
   - Conditional routing
   - Multi-step delivery
   - Failover options

3. **Monitor Performance**
   - Set up alerts
   - Track success rates
   - Optimize slow steps

### Common Second Integrations

**Data Quality**:
- Email verification
- Phone validation
- Address standardization

**Compliance**:
- TrustedForm
- DNC checking
- Age verification

**Enhancement**:
- Demographic append
- Lead scoring
- Social matching

## 📚 Related Documentation

- [Configuring Delivery](../flow-management/configuring-delivery.md) - Advanced delivery options
- [Data Mapping](../data-management/data-mapping.md) - Complex field transformations
- [Integration Directory](../integrations/) - All available integrations

---

🎯 **Integration Success**: Your first integration is the gateway to automated lead flow. Take time to test thoroughly - a well-configured integration saves hours of manual work!