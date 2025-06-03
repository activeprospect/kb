---
tags:
  - buyer-focused
  - intermediate
  - how-to
  - flows
  - integrations
  - distribution
  - technical
---

# Configuring Lead Delivery

Set up reliable delivery of your validated leads to CRMs, call centers, and custom endpoints. Learn real-time posting, batch delivery, and advanced routing strategies.

## 📍 You Are Here

You're configuring how leads exit LeadConduit and reach their destinations. Whether sending to a single CRM or routing to multiple buyers, proper delivery configuration ensures reliable, trackable lead distribution.

## 🎯 What You'll Learn

- Delivery methods and options
- Real-time vs batch delivery
- Field mapping strategies
- Response handling
- Multi-recipient routing
- Monitoring and troubleshooting

## 🚀 Delivery Methods

### Real-Time Delivery

Immediate posting as leads arrive:
- **Speed**: Sub-second delivery
- **Use Cases**: Hot transfers, live calls
- **Formats**: JSON, XML, Form-encoded
- **Response**: Immediate success/failure

### Batch File Delivery

Scheduled file transfers:
- **Speed**: Hourly, daily, custom schedules
- **Use Cases**: CRM imports, reporting
- **Formats**: CSV, Excel, custom delimited
- **Delivery**: FTP, SFTP, S3, email

### Webhook Delivery

HTTP POST to any endpoint:
- **Flexibility**: Any system with an API
- **Authentication**: Headers, query params
- **Retry Logic**: Automatic failure handling
- **Response Parsing**: Extract data from responses

## 🏗️ Setting Up Delivery

### Step 1: Add Delivery Step

1. In your flow, click **Add Step**
2. Select **Delivery**
3. Choose delivery type:
   - Pre-built integration (Salesforce, HubSpot)
   - Generic webhook
   - Batch file delivery

### Step 2: Configure Endpoint

**For Webhooks**:
```
URL: https://api.yourcrm.com/leads
Method: POST
Content-Type: application/json
Authentication: Bearer {api_key}
```

**For Batch Files**:
```
Format: CSV
Schedule: Daily at 2 AM
Delivery: SFTP
Path: /leads/daily/
Filename: leads_{date}.csv
```

### Step 3: Map Fields

Connect LeadConduit fields to destination fields:

```
LeadConduit Field → Destination Field
─────────────────────────────────────
email            → contact_email
phone_1          → primary_phone  
first_name       → fname
last_name        → lname
state            → mailing_state
lead.id          → external_id
```

**Mapping Best Practices**:
- Map all required fields
- Use consistent naming
- Include tracking fields
- Test with sample data

## 📤 Real-Time Configuration

### Basic Webhook Setup

```json
{
  "url": "https://api.example.com/leads",
  "method": "POST",
  "headers": {
    "Authorization": "Bearer abc123",
    "Content-Type": "application/json"
  },
  "timeout": 30000,
  "retry_count": 3
}
```

### Field Mapping Examples

**Simple Mapping**:
```
email → email
phone → phone_number
```

**With Transformations**:
```
phone_1 → primary_phone (format: "+1{value}")
state → state_code (uppercase)
created_at → submission_date (format: "YYYY-MM-DD")
```

**Conditional Mapping**:
```
if (lead_type == "purchase") {
  intent → purchase_intent
} else {
  intent → interest_level
}
```

### Response Configuration

Parse responses to track delivery:

**Success Response**:
```json
{
  "status": "success",
  "lead_id": "12345",
  "message": "Lead created"
}
```

**Response Parsing**:
```
outcome = json.status
reason = json.message
recipient.id = json.lead_id
```

## 📁 Batch Delivery Configuration

### Setting Up Batch Files

1. **Navigate to Libraries → Batches**
2. **Click Create New Batch**
3. **Configure Settings**:

```
Name: Daily CRM Import
Format: CSV
Headers: Include
Delimiter: Comma
Text Qualifier: Double Quote
Line Ending: Windows (CRLF)
```

### Scheduling Options

**Fixed Schedule**:
- Daily at specific time
- Hourly intervals
- Weekly on specific days
- Monthly on specific date

**Dynamic Schedule**:
- When X leads accumulated
- After Y hours of inactivity
- Custom cron expressions

### Delivery Methods

**SFTP Configuration**:
```
Host: sftp.partner.com
Port: 22
Username: leadconduit
Authentication: SSH Key
Directory: /incoming/leads/
Filename Pattern: LC_{date}_{time}.csv
```

**S3 Configuration**:
```
Bucket: partner-lead-bucket
Region: us-east-1
Path: /leads/{year}/{month}/
Filename: leads_{date}.csv
Access: IAM Role
```

**Email Configuration**:
```
To: imports@partner.com
Subject: Daily Lead File - {date}
Body: Attached please find {count} leads
Compress: ZIP
Password: Optional encryption
```

## 🔀 Multi-Recipient Routing

### Parallel Delivery

Send to multiple recipients simultaneously:

```
Flow Structure:
Source → Validation → ├─ CRM Delivery
                      ├─ Email System
                      └─ Call Center
```

### Conditional Routing

Route based on lead attributes:

```
if (state in ["CA", "TX"]) {
  → West Coast Team
} else if (state in ["NY", "FL"]) {
  → East Coast Team  
} else {
  → General Queue
}
```

### Failover Configuration

Backup delivery options:

```
Primary: Salesforce API
  ↓ (on failure)
Secondary: Email to sales@
  ↓ (on failure)  
Tertiary: Store in database
```

## 📊 Response Handling

### Success Responses

Track successful deliveries:
```javascript
// Parse success indicators
if (response.status == 200 && response.body.created) {
  outcome = "success"
  lead_id = response.body.id
  billable = true
}
```

### Failure Handling

Manage delivery failures:
```javascript
// Categorize failures
if (response.status == 400) {
  outcome = "failure"
  reason = "Invalid data: " + response.body.error
} else if (response.status == 429) {
  outcome = "error"
  reason = "Rate limit exceeded"
  retry_after = response.headers["Retry-After"]
}
```

### Retry Logic

Configure automatic retries:
```
Retry Strategy:
- Max Attempts: 3
- Backoff: Exponential
- Initial Delay: 1 second
- Max Delay: 30 seconds
- Retry On: 5xx errors, timeouts
```

## 🛡️ Security and Authentication

### API Key Authentication

**Header-based**:
```
X-API-Key: your-secret-key
Authorization: Bearer {token}
```

**Query Parameter**:
```
https://api.example.com/leads?api_key={key}
```

### OAuth 2.0

For advanced integrations:
1. Configure OAuth app
2. Set redirect URI
3. Handle token refresh
4. Secure token storage

### IP Whitelisting

Additional security layer:
- Provide LeadConduit IPs to partner
- Configure firewall rules
- Monitor for changes

## 📈 Monitoring Delivery

### Key Metrics

Track delivery health:
- **Success Rate**: Should be >95%
- **Response Time**: Target <1 second
- **Retry Rate**: Monitor for issues
- **Error Patterns**: Identify trends

### Setting Up Alerts

Configure notifications for:
- Delivery failures exceed threshold
- Response times spike
- Authentication errors
- Batch delivery delays

### Delivery Reports

Create custom reports:
```
Report: Delivery Performance
Columns: Recipient, Success %, Avg Response Time, Errors
Group By: Hour of Day
Filter: Last 24 Hours
```

## 🚫 Common Issues

### "Connection Timeout"

**Causes**:
- Endpoint slow/unavailable
- Network issues
- Firewall blocking

**Solutions**:
- Increase timeout setting
- Check endpoint status
- Verify IP whitelist

### "Authentication Failed"

**Check**:
- API keys current
- Headers properly formatted
- OAuth tokens not expired
- Credentials match environment

### "Invalid Response"

**Verify**:
- Response format (JSON/XML)
- Content-Type headers
- Character encoding
- Response size limits

### "Mapping Errors"

**Common Issues**:
- Field name mismatches
- Data type conflicts
- Missing required fields
- Format differences

## 💡 Best Practices

### For Real-Time

1. **Set Reasonable Timeouts**
   - 30 seconds standard
   - 10 seconds for fast endpoints
   - 60 seconds for complex processing

2. **Implement Retry Logic**
   - Retry on network errors
   - Not on data validation errors
   - Use exponential backoff

3. **Monitor Performance**
   - Track response times
   - Alert on degradation
   - Have fallback options

### For Batch Delivery

1. **Schedule Wisely**
   - Avoid peak processing times
   - Consider recipient time zones
   - Allow processing windows

2. **File Management**
   - Use clear naming conventions
   - Include timestamps
   - Implement retention policies

3. **Error Recovery**
   - Keep delivery logs
   - Enable redelivery
   - Archive sent files

## 📋 Delivery Checklist

Before activating:
- [ ] Endpoint URL verified
- [ ] Authentication tested
- [ ] All required fields mapped
- [ ] Response parsing configured
- [ ] Error handling defined
- [ ] Retry logic appropriate
- [ ] Monitoring alerts set
- [ ] Test delivery successful

## 📚 Related Documentation

- [Managing Flow Steps](./managing-flow-steps.md) - Step configuration
- [Testing Your Flow](../getting-started/testing-your-flow.md) - Pre-launch testing
- [Integrations Reference](../../reference/integrations.md) - Available integrations

---

📤 **Delivery Excellence**: Reliable lead delivery is crucial for business success. Take time to configure properly, test thoroughly, and monitor continuously for optimal performance!