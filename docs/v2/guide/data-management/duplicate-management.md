# Duplicate Detection and Suppression

Master duplicate lead management and suppression lists to improve data quality, reduce costs, and maintain compliance. Learn detection strategies, list management, and best practices.

## 📍 You Are Here

You need to prevent duplicate leads from entering your system and manage suppression lists for compliance. This guide shows you how to implement effective duplicate detection and suppression strategies.

## 🎯 What You'll Learn

- Duplicate detection methods
- Suppression list management
- Time-based duplicate windows
- Cross-flow deduplication
- Performance optimization
- Compliance requirements

## 🔍 Understanding Duplicates

### Why Duplicates Matter

**Business Impact**:
- Wasted money on duplicate leads
- Poor customer experience
- Reduced conversion rates
- Compliance violations
- Damaged vendor relationships

**Common Sources**:
- Multiple form submissions
- Different lead sources
- Data entry errors
- Refreshed pages
- Intentional gaming

## 🛡️ Built-in Duplicate Detection

### Flow-Level Deduplication

LeadConduit automatically tracks duplicates within each flow.

**Default Behavior**:
- Checks email and phone
- 30-day lookback window
- Configurable per flow
- Real-time detection

**Configuration**:
```yaml
Duplicate Detection:
  Enabled: true
  Fields: [email, phone_1]
  Window: 30 days
  Action: Reject
  Reason: "Duplicate lead"
```

### Customizing Detection

**Change Detection Fields**:
```javascript
// Single field
duplicate_fields: ["email"]

// Multiple fields (AND logic)
duplicate_fields: ["email", "phone_1"]

// Composite key
duplicate_fields: ["email", "state", "last_name"]
```

**Adjust Time Window**:
```javascript
// Last 24 hours only
duplicate_window: "24 hours"

// Last 90 days
duplicate_window: "90 days"

// No time limit
duplicate_window: "unlimited"
```

## 📋 Suppression Lists

### What Are Suppression Lists?

Centralized lists for blocking across flows:
- Opt-out/DNC numbers
- Known bad actors
- Previous customers
- Compliance blocks
- Quality control

### Creating a Suppression List

1. **Navigate to Lists**
   - Main menu → Libraries → Lists
   - Click "Create New List"

2. **Configure List**
   ```yaml
   Name: "Email Opt-Outs"
   Type: "Suppression"
   Match Field: "email"
   Case Sensitive: false
   ```

3. **Add Entries**
   - Manual entry
   - Bulk upload (CSV)
   - API updates
   - Flow automation

### List Types and Use Cases

**Email Suppression**:
```yaml
Name: "Unsubscribed Emails"
Match: "email"
Use: Block opted-out emails
Update: Real-time from ESP
```

**Phone DNC**:
```yaml
Name: "Internal DNC"
Match: "phone_1"
Use: TCPA compliance
Update: Hourly from call center
```

**Quality Control**:
```yaml
Name: "Low Quality Sources"
Match: "source_id"
Use: Block bad publishers
Update: Manual review
```

**Fraud Prevention**:
```yaml
Name: "Known Fraudsters"
Match: "ip_address"
Use: Block suspicious IPs
Update: Security team
```

## 🔧 Implementing Suppression

### In Acceptance Criteria

Check lists before accepting:
```javascript
// Single list check
Rule: list("Email Opt-Outs").contains(email) is false
Reason: Email has opted out

// Multiple list checks
Rule: list("Internal DNC").contains(phone_1) is false
      AND list("Litigators").contains(phone_1) is false
Reason: Phone number suppressed

// Dynamic list name
Rule: list(lead.suppression_list).contains(email) is false
Reason: On custom suppression list
```

### In Flow Steps

Use filter steps for complex logic:
```javascript
// Filter step configuration
if (list("VIP Customers").contains(email)) {
  route_to = "premium_handler"
} else if (list("Previous Buyers").contains(email)) {
  skip_marketing = true
}
```

### Automatic List Updates

Add to lists from flows:
```javascript
// On opt-out
if (lead.opted_out) {
  list("Email Opt-Outs").add(email)
  list("Phone DNC").add(phone_1)
}

// On quality issue
if (lead.invalid_data) {
  list("Bad Sources").add(source_id)
}
```

## 🔄 Advanced Duplicate Strategies

### Cross-Flow Deduplication

Share duplicate detection across flows:

**Option 1: Global Suppression List**
```javascript
// Check global list
Rule: list("All Leads 30 Days").contains(email) is false
Reason: Lead exists in another flow

// Update on success
on_success: {
  list("All Leads 30 Days").add(email, {
    expires: 30_days_from_now
  })
}
```

**Option 2: Shared Database**
```javascript
// External API check
enhancement: "Global Dedupe API"
endpoint: "https://dedupe.internal.com/check"
response: {
  exists: false,
  last_seen: null
}
```

### Time-Based Duplicate Windows

Different windows for different scenarios:

```javascript
// Immediate duplicates (double-click)
Rule: duplicate_check(email, "5 minutes") is false
Reason: Duplicate submission

// Daily duplicates
Rule: duplicate_check(email, "24 hours") is false
Reason: Already received today

// Campaign duplicates
Rule: duplicate_check(email + campaign_id, "campaign_duration") is false
Reason: Already in this campaign
```

### Fuzzy Matching

Catch near-duplicates:

```javascript
// Email variations
base_email = email.toLowerCase()
  .replace(/\+.*@/, '@')  // Remove plus addressing
  .replace(/\.(?=.*@)/, '') // Remove dots before @

Rule: duplicate_check(base_email) is false
Reason: Email variation already exists

// Phone variations
clean_phone = phone.replace(/\D/g, '')  // Digits only
Rule: duplicate_check(clean_phone) is false
Reason: Phone number already exists
```

## 📊 Managing List Performance

### List Size Considerations

Performance by size:
- **< 10,000**: Instant lookups
- **10,000 - 100,000**: Sub-second
- **100,000 - 1,000,000**: May need optimization
- **> 1,000,000**: Consider alternatives

### Optimization Strategies

**1. Use Expiring Entries**:
```javascript
// Add with expiration
list("Recent Leads").add(email, {
  expires_at: Date.now() + (30 * 24 * 60 * 60 * 1000)
})
```

**2. Partition Large Lists**:
```javascript
// Separate by criteria
list("DNC_2024_Q1")
list("DNC_2024_Q2")
list("DNC_Current")  // Last 90 days only
```

**3. Archive Old Data**:
```javascript
// Monthly cleanup
if (entry.age > 90_days) {
  archive_to_s3(entry)
  list.remove(entry)
}
```

## 🔐 Compliance Considerations

### Retention Requirements

Different lists need different retention:

**Opt-Outs**: Keep forever
```javascript
list("Opt Outs").add(email, {
  expires: "never",
  reason: "Consumer request",
  date: Date.now()
})
```

**Duplicates**: Limited window
```javascript
list("Recent Duplicates").add(email, {
  expires: "30 days",
  source: lead.source
})
```

**Compliance**: As required
```javascript
list("CCPA Requests").add(email, {
  expires: "13 months",
  request_type: "delete",
  date: Date.now()
})
```

### Audit Trails

Track list changes:
```javascript
// Log additions
on_list_add: {
  log: {
    action: "added",
    list: "DNC",
    value: phone,
    reason: "Consumer opt-out",
    user: "system",
    timestamp: Date.now()
  }
}

// Log removals
on_list_remove: {
  log: {
    action: "removed",
    list: "Temporary Block",
    value: email,
    reason: "Block expired",
    user: "system",
    timestamp: Date.now()
  }
}
```

## 💡 Best Practices

### List Hygiene

**Regular Maintenance**:
1. Review list sizes monthly
2. Archive expired entries
3. Remove invalid entries
4. Consolidate similar lists
5. Document list purposes

### Naming Conventions

Use clear, consistent names:
```
✅ Good:
- Email_OptOuts_Permanent
- Phone_DNC_Internal
- IP_Fraud_Temporary
- Source_Quality_Block

❌ Bad:
- List1
- BadEmails
- DontCall
- Temp
```

### Testing Strategies

Always test suppression:
```javascript
// Test data that should be suppressed
test_cases: [
  { email: "test@optout.com", expected: "rejected" },
  { phone: "5550000000", expected: "rejected" },
  { ip: "192.168.1.1", expected: "rejected" }
]

// Verify in staging
run_test_cases()
check_results()
```

## 🚫 Common Issues

### "List Not Found"

**Causes**:
- Typo in list name
- List not created yet
- Wrong account/environment

**Solution**:
```javascript
// Check if list exists first
if (list_exists("My List")) {
  Rule: list("My List").contains(email) is false
} else {
  // Handle missing list
  log_error("List 'My List' not found")
}
```

### "Performance Degradation"

**Symptoms**: Slow lead processing

**Solutions**:
1. Reduce list size
2. Use field indexing
3. Implement caching
4. Consider external service

### "False Positives"

**Issue**: Legitimate leads blocked

**Prevention**:
```javascript
// Be specific with matching
// Instead of just email domain
list("Blocked Domains").contains(email.split('@')[1])

// Use full email
list("Blocked Emails").contains(email.toLowerCase())

// Add exemptions
if (list("VIP Exemptions").contains(email)) {
  skip_suppression = true
}
```

## 📈 Monitoring and Reporting

### Key Metrics

Track suppression effectiveness:
- Duplicate rate by source
- Suppression hit rate
- List growth rate
- False positive rate
- Processing time impact

### Duplicate Analysis Report

```javascript
Report: "Duplicate Analysis"
Metrics:
  - Total Leads
  - Duplicate Count
  - Duplicate Rate (%)
  - Top Duplicate Sources
  - Duplicate Reasons
Group By: Source, Day
Period: Last 30 days
```

## 🎯 Implementation Checklist

**Basic Setup**:
- [ ] Enable flow deduplication
- [ ] Configure duplicate window
- [ ] Select match fields
- [ ] Set rejection message

**Suppression Lists**:
- [ ] Create necessary lists
- [ ] Import existing data
- [ ] Configure in acceptance criteria
- [ ] Set up auto-updates

**Monitoring**:
- [ ] Create duplicate reports
- [ ] Set up alerts
- [ ] Review weekly
- [ ] Optimize as needed

## 📚 Related Documentation

- [Data Quality](./data-quality.md) - Overall quality management
- [Acceptance Criteria](../flow-management/acceptance-criteria.md) - Rule configuration
- [TCPA Compliance](../compliance/tcpa-compliance.md) - DNC requirements

---

🛡️ **Duplicate Defense**: Effective duplicate and suppression management saves money, improves quality, and ensures compliance. Start simple and expand based on your needs!