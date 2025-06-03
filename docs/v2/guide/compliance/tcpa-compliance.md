# TCPA Compliance Guide

Comprehensive guide to Telephone Consumer Protection Act (TCPA) compliance in LeadConduit. Learn regulations, implementation strategies, and best practices to protect your business.

## 📍 You Are Here

You need to ensure your lead generation and communication practices comply with TCPA regulations. This guide explains the requirements and shows how to implement compliant processes in LeadConduit.

## 🎯 What You'll Learn

- TCPA requirements and penalties
- Consent collection best practices
- DNC list management
- Time zone restrictions
- Record keeping requirements
- Compliance automation

## ⚖️ Understanding TCPA

### What is TCPA?

The Telephone Consumer Protection Act regulates:
- **Automated Calls**: Robocalls and autodialed calls
- **Text Messages**: SMS marketing and notifications
- **Fax Communications**: Commercial faxes
- **Do Not Call**: National and internal DNC lists

### Key Requirements

1. **Prior Express Written Consent**
   - Clear disclosure of intent to call/text
   - Specific consent language
   - Signature (electronic OK)
   - Cannot be a condition of purchase

2. **Time Restrictions**
   - Calls only 8 AM - 9 PM (consumer's time)
   - No calls on holidays
   - Respect opt-outs immediately

3. **Identification**
   - Provide company name
   - Valid callback number
   - Clear opt-out instructions

### Penalties

Violations can result in:
- **Statutory**: $500-$1,500 per violation
- **Class Actions**: Millions in damages
- **Reputation**: Brand damage
- **Operations**: Shut down by carriers

## 🛡️ Implementing Consent Collection

### Required Consent Elements

Your consent must include:

```html
<div class="consent-language">
  <p>By clicking "Submit" and providing your phone number, you agree to receive 
  marketing calls and texts from [Company Name] and up to [X] partners at the 
  number provided, including by automated means. Consent is not a condition of 
  purchase. Message and data rates may apply. Reply STOP to unsubscribe.</p>
  
  <p>See our <a href="/privacy">Privacy Policy</a> and 
  <a href="/terms">Terms of Service</a>.</p>
</div>
```

### Implementation in LeadConduit

**Step 1: Capture Consent Fields**
```javascript
// Required fields
consent_text: "Full consent language displayed"
consent_timestamp: "2024-01-15T10:30:00Z"
consent_method: "website_form"
ip_address: "192.168.1.1"
page_url: "https://example.com/form"
```

**Step 2: Validate Consent**
```javascript
// Acceptance criteria
Rule: consent_timestamp is not blank
Reason: Consent timestamp required

Rule: consent_text contains "automated"
Reason: Must disclose automated calling

Rule: age_confirmed is true
Reason: Must be 18+ for valid consent
```

**Step 3: Store Evidence**
```javascript
// Map to CRM
tcpa_consent_text → Custom_Consent_Text__c
tcpa_consent_date → Consent_Date__c
tcpa_consent_ip → Consent_IP__c
tcpa_consent_page → Consent_URL__c
```

## 📋 DNC List Management

### Implementing DNC Checks

**Step 1: Add DNC Enhancement**
```
Add Step → Enhancement → DNC.com or TrueCaller
Map phone number field
Configure list types:
- Federal DNC
- State DNC
- Litigator lists
- Internal suppression
```

**Step 2: Configure Filtering**
```javascript
// Filter configuration
Rule: dnc.registered is false
Reason: Number on Do Not Call list

Rule: dnc.litigator is false  
Reason: Known TCPA litigator

Rule: dnc.complainer is false
Reason: Previous complaint filed
```

### Internal Suppression List

**Managing Opt-Outs**:
```javascript
// Suppression list setup
List Name: "Internal DNC"
List Type: "Phone Numbers"
Match Field: phone_1

// Add on opt-out
if (lead.opt_out) {
  add_to_suppression_list("Internal DNC", lead.phone)
}
```

**Honoring Suppression**:
```javascript
// Check before delivery
Rule: suppression_list("Internal DNC").contains(phone_1) is false
Reason: Number opted out
```

## 🕐 Time Zone Compliance

### Automatic Time Zone Detection

**Step 1: Add Time Zone Enhancement**
```
Enhancement: Phone Time Zone Lookup
Input: phone_1
Output: timezone, local_time
```

**Step 2: Implement Calling Windows**
```javascript
// Calculate local time
local_hour = getHourInTimezone(lead.timezone)

// Acceptance criteria
Rule: local_hour is greater than or equal to 8
      AND local_hour is less than 21
Reason: Outside calling hours (8 AM - 9 PM)

// Skip weekends if required
Rule: day_of_week is not "Saturday" 
      AND day_of_week is not "Sunday"
Reason: No weekend calling
```

### Holiday Restrictions

```javascript
// Define holidays
holidays = [
  "2024-01-01", // New Year's
  "2024-07-04", // Independence Day
  "2024-11-28", // Thanksgiving
  "2024-12-25"  // Christmas
]

// Check in acceptance
Rule: current_date not in holidays
Reason: No calling on holidays
```

## 📱 SMS/Text Compliance

### Additional SMS Requirements

Beyond voice calls, texts need:
- Clear opt-in for SMS specifically
- Message frequency disclosure
- STOP instructions in every message
- Carrier compliance

### SMS Consent Language

```html
<label>
  <input type="checkbox" name="sms_consent" required>
  I agree to receive up to 4 marketing text messages per month from 
  [Company] at the mobile number provided. Message and data rates may 
  apply. Text STOP to cancel. Text HELP for help.
</label>
```

### SMS Implementation

```javascript
// Separate SMS consent
Rule: sms_consent is true
Reason: No SMS consent provided

// Track separately
sms_consent → CRM_SMS_Consent__c
sms_consent_date → CRM_SMS_Date__c

// Different retention
sms_retention_days: 1825  // 5 years
```

## 🔄 Consent Revocation

### Handling Opt-Outs

**Real-Time Processing**:
```javascript
// Webhook from call center
{
  "phone": "5551234567",
  "action": "opt_out",
  "timestamp": "2024-01-15T10:30:00Z",
  "reason": "consumer_request"
}

// Add to suppression immediately
add_to_suppression("DNC", phone)
update_crm_record(phone, {opted_out: true})
```

**Opt-Out Channels**:
- Phone: "Remove me from your list"
- SMS: Reply "STOP"
- Email: Unsubscribe link
- Web: Preference center

## 📊 Record Keeping

### Required Records

Maintain for 5 years:
- Consent records
- Opt-out requests
- Call/text logs
- Suppression list changes
- Compliance audits

### Implementation

```javascript
// Audit trail in LeadConduit
event_data: {
  consent_captured: true,
  consent_version: "2.1",
  dnc_checked: true,
  dnc_result: "clean",
  time_zone_checked: true,
  local_time: "14:30",
  opt_out_checked: true
}

// Archive to storage
archive_to_s3({
  bucket: "tcpa-records",
  key: `${year}/${month}/${day}/${lead.id}.json`,
  data: complete_lead_record,
  retention: "5 years"
})
```

## 🚨 Red Flags to Avoid

### Never Do This

❌ **Pre-checked consent boxes**
```html
<!-- WRONG -->
<input type="checkbox" name="consent" checked>

<!-- RIGHT -->
<input type="checkbox" name="consent">
```

❌ **Buying aged leads**
- Consent expires
- Cannot transfer consent
- Must be directly collected

❌ **Ignoring time zones**
- Always check local time
- Never assume Eastern Time
- Account for daylight saving

❌ **Generic consent language**
- Must be specific
- Name your company
- Describe communication types

## 💡 Best Practices

### Clear and Conspicuous

Make consent obvious:
- **Font size**: At least 12pt
- **Contrast**: High readability
- **Location**: Near submit button
- **Language**: Plain English

### Versioning Consent

Track consent versions:
```javascript
consent_version: "3.1"
consent_text_hash: sha256(consent_text)
consent_updated: "2024-01-15"

// Check version in flow
if (consent_version < current_version) {
  require_reconsent = true
}
```

### Regular Audits

Monthly reviews:
- [ ] Consent language current
- [ ] DNC lists updated
- [ ] Suppression honored
- [ ] Time zones working
- [ ] Records archived

## 🔧 Compliance Automation

### Automated Monitoring

Set up alerts:
```javascript
// Alert on high-risk patterns
if (dnc_hit_rate > 0.05) {
  alert("High DNC hit rate: Check source quality")
}

if (consent_age > 90_days) {
  alert("Using aged consent: Verify validity")
}

if (calling_hour_violations > 0) {
  alert("Time zone violation detected")
}
```

### Compliance Dashboard

Track key metrics:
- Consent capture rate
- DNC hit rate
- Opt-out rate
- Time zone compliance
- Consent age distribution

## 🎯 Implementation Checklist

**Consent Collection**:
- [ ] Clear consent language
- [ ] Not pre-checked
- [ ] Timestamp captured
- [ ] IP address logged
- [ ] Page URL stored

**DNC Management**:
- [ ] Federal DNC checked
- [ ] State lists checked
- [ ] Internal suppression
- [ ] Litigator screening
- [ ] Real-time updates

**Time Restrictions**:
- [ ] Time zone detection
- [ ] 8 AM - 9 PM enforcement
- [ ] Holiday calendar
- [ ] Weekend rules

**Record Keeping**:
- [ ] 5-year retention
- [ ] Automated archival
- [ ] Audit trail complete
- [ ] Retrieval tested

## 📚 Related Documentation

- [Implementing TrustedForm](./implementing-trustedform.md) - Consent verification
- [Consent Management](./consent-management.md) - Managing consent
- [DNC Integration](../integrations/dnc-services.md) - DNC services

---

⚖️ **Compliance Confidence**: TCPA compliance isn't optional - it's essential for sustainable business. Implement these practices thoroughly and sleep better knowing you're protected!