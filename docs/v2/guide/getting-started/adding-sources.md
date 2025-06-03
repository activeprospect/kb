---
tags:
  - buyer-focused
  - beginner
  - how-to
  - flows
  - entities-focused
  - vendor-management
  - implementation
---

# Adding Sources to Receive Leads

Sources are the entry points for your leads - where vendors, forms, or partners send their data. This guide walks you through adding and configuring sources to start receiving leads.

## 📍 You Are Here

You're configuring where leads come from. Each source gets its own unique endpoint, credentials, and configuration - like giving each vendor their own secure mailbox.

## 🎯 What You'll Learn

- How to add different types of sources
- Setting up authentication and security
- Configuring field mappings
- Testing your source configuration

## 📋 Types of Sources

Before we dive in, let's understand your options:

### Default Source
- **What it is**: A basic endpoint included with every flow
- **Use when**: Testing or receiving leads from your own forms
- **Best for**: Getting started quickly

### Standard Sources  
- **What it is**: Pre-built integrations with known vendors
- **Use when**: Working with established lead providers
- **Best for**: Quick setup with proven partners

### Custom Sources
- **What it is**: Sources you create for specific needs
- **Use when**: Working with new vendors or unique requirements  
- **Best for**: Maximum flexibility and control

### Account Sources
- **What it is**: Other accounts that can send you leads
- **Use when**: Partnering with other users
- **Best for**: B2B lead sharing

## 🚀 Adding Your First Source

### Step 1: Navigate to Sources

1. Open your flow in edit mode
2. Click the **Sources** tab
3. Click **Add Source** button

### Step 2: Choose Source Type

You'll see the source selection screen:

**For a Quick Start:**
- Choose **Default Source** (it's the simplest)
- This creates a basic endpoint immediately

**For a Vendor Integration:**
- Search for your vendor in the list
- Select them if available (saves configuration time)
- If not found, choose **Custom Source**

**For a Web Form:**
- Enter your form URL in the "Web Form URL" field
- The system will try to auto-detect your fields
- Works best with simple HTML forms

### Step 3: Configure Basic Settings

Every source needs:

1. **Name** 
   - Use something descriptive: "Facebook Ads - California" not "Source 1"
   - Include vendor name and campaign if relevant

2. **Authentication**
   - Note the API key or credentials provided
   - Keep these secure - they're like passwords
   - Each source gets unique credentials

3. **Status**
   - Leave as "Active" to receive leads
   - Set to "Inactive" to pause without deleting

## 🔧 Configuring Field Mappings

Field mappings translate vendor field names to your standard fields:

### Understanding Mappings

Your vendor sends:
```json
{
  "fname": "John",
  "phone_number": "555-1234",
  "email_addr": "john@example.com"
}
```

You want to receive:
```json
{
  "first_name": "John",
  "phone": "555-1234", 
  "email": "john@example.com"
}
```

### Setting Up Mappings

1. **Find the Mappings Section**
   - In your source configuration
   - Look for "Field Mappings" or "Inbound Mappings"

2. **Add Each Mapping**
   - Source Field: `fname` → Target Field: `first_name`
   - Source Field: `phone_number` → Target Field: `phone`
   - Source Field: `email_addr` → Target Field: `email`

3. **Pro Mapping Tips**
   - Map to standard fields when possible (automatic type validation)
   - Create custom fields for vendor-specific data
   - Use consistent naming across sources

## 🔐 Security Configuration

### API Key Authentication

Most sources use API key authentication:

1. **Find the Submission URL**
   ```
   https://app.leadconduit.com/flows/[FLOW_ID]/sources/[SOURCE_NAME]
   ```

2. **Add the API Key**
   - As a header: `X-API-Key: your-key-here`
   - Or in the URL: `?api_key=your-key-here`

3. **Share with Your Vendor**
   - Provide the full URL
   - Include the authentication method
   - Send a sample request

### IP Whitelisting (Optional)

For additional security:
1. Navigate to source settings
2. Add trusted IP addresses
3. Only those IPs can submit leads

## 🧪 Testing Your Source

### Method 1: Simple Test Post

Use curl to test:
```bash
curl -X POST "https://app.leadconduit.com/flows/YOUR_FLOW/sources/YOUR_SOURCE" \
  -H "X-API-Key: your-api-key" \
  -H "Content-Type: application/json" \
  -d '{
    "email": "test@example.com",
    "phone": "555-0123",
    "first_name": "Test"
  }'
```

### Method 2: Test Mode

1. In source settings, find "Test Mode"
2. Enable it to accept but not process leads
3. Perfect for vendor testing without affecting production

### Method 3: Vendor Testing

Share with your vendor:
- Submission endpoint URL
- Required fields list
- Authentication details
- Example successful request

## 📊 Source-Specific Settings

### Acceptance Criteria

Add rules specific to this source:
```
Rule: campaign_id is equal to "CAMP123"
Reason: "Invalid campaign ID for this source"
```

### Volume Caps

Control how many leads this source can send:
- Daily limit: 100 leads
- Monthly limit: 2,000 leads
- Automatic rejection when exceeded

### Pricing

Set source-specific pricing:
- Fixed price: $5.00 per lead
- Conditional: $10 for exclusive, $5 for shared
- External pricing service integration

## 🎯 Common Source Patterns

### Multi-Campaign Source

One vendor, multiple campaigns:
1. Create one source per campaign
2. Use acceptance criteria to validate campaign IDs
3. Track performance separately

### Test vs Production

Separate sources for testing:
1. "Vendor ABC - Test" (with test mode enabled)
2. "Vendor ABC - Production" (live processing)
3. Same mappings, different endpoints

### Regional Sources

Geographic organization:
1. "Solar Leads - California"
2. "Solar Leads - Texas"  
3. "Solar Leads - National"
4. Route based on state in acceptance criteria

## 🚫 Troubleshooting Sources

### "Authentication Failed"
- Double-check API key with vendor
- Verify key is being sent correctly
- Check if key has expired

### "Fields Not Mapping"
- Review incoming field names (check Events)
- Ensure mappings match exactly (case-sensitive)
- Add mappings for any missing fields

### "No Leads Received"
- Verify source is set to Active
- Check vendor is posting to correct URL
- Review IP whitelist if configured
- Look for test posts in Events

## 💡 Best Practices

**Name Sources Clearly**: Include vendor name, campaign, or purpose. You'll appreciate it when you have 20+ sources.

**Document Everything**: Keep notes on each source - contact person, expected volume, special requirements.

**Test Before Going Live**: Always send test leads before opening the floodgates.

**Monitor Early and Often**: Check Events frequently when first setting up a source.

**Use Consistent Patterns**: If you map "phone_home" to "phone" in one source, do it everywhere.

## 🎯 Next Steps

Now that you can receive leads:
- [Set up acceptance criteria](../flow-management/acceptance-criteria.md) to validate lead quality
- [Configure suppression lists](../data-management/suppression-lists.md) to prevent duplicates
- [Add your first integration](./first-integration.md) to deliver leads

## 📚 Related Documentation

- [Source Reference](../../reference/entities.md) - Technical details about sources
- [Field Mappings](../../reference/mappings.md) - Advanced mapping options
- [Authentication](../../reference/integrations.md) - Security options

---

🎉 **Success!** You now know how to add and configure sources. Each source you add expands your ability to receive leads from new vendors and channels. Start simple, test thoroughly, and scale with confidence!