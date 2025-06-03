# Troubleshooting Common Issues

Quick solutions to the most frequent LeadConduit challenges. Learn to diagnose problems, understand error messages, and implement fixes to keep your leads flowing.

## 📍 You Are Here

You've encountered an issue with your lead flow. This guide provides systematic approaches to diagnose and resolve common problems, from submission failures to delivery errors.

## 🎯 Quick Diagnosis

### Lead Not Arriving?

1. **Check Events** → No event = submission issue
2. **Check Source Status** → Disabled = won't accept
3. **Check Authentication** → Invalid = rejected
4. **Check Flow Status** → Paused = not processing

### Lead Rejected?

1. **Check Acceptance Criteria** → Requirements not met
2. **Check Validation** → Type parsing failed
3. **Check Filters** → Business rule stopped it
4. **Check Volume Caps** → Limit reached

### Delivery Failed?

1. **Check Recipient Status** → Disabled = won't send
2. **Check Credentials** → Expired = auth failure
3. **Check Mapping** → Missing fields = rejection
4. **Check Endpoint** → Down = timeout

## 🚫 Submission Issues

### "Authentication Failed"

**Symptoms**:
- 401 Unauthorized response
- No events in flow
- Source shows no activity

**Solutions**:
```bash
# Verify API key is active
Flow → Sources → [Source Name] → Settings

# Check header format
X-API-Key: abc123def456  ✓
x-api-key: abc123def456  ✗ (case sensitive)
API-Key: abc123def456    ✗ (wrong header name)

# Test with curl
curl -X POST https://app.leadconduit.com/flows/[ID]/sources/[NAME] \
  -H "X-API-Key: YOUR_KEY" \
  -H "Content-Type: application/json" \
  -d '{"email":"test@example.com"}'
```

### "Field Required"

**Error Message**:
```json
{
  "outcome": "failure",
  "reason": "email is required"
}
```

**Check**:
1. Field name matches exactly (case-sensitive)
2. Value not empty/null
3. JSON structure correct
4. Content-Type header set

**Common Fixes**:
```javascript
// Wrong field name
{ "Email": "test@example.com" }  ✗
{ "email": "test@example.com" }  ✓

// Empty value
{ "email": "" }                  ✗
{ "email": "test@example.com" }  ✓

// Null value
{ "email": null }                ✗
{ "email": "test@example.com" }  ✓
```

### "Invalid Format"

**Error Examples**:
- "Invalid phone number format"
- "Email address is invalid"
- "State must be 2 letters"

**Format Requirements**:
```javascript
// Phone formats
"5551234567"      ✓ (10 digits)
"555-123-4567"    ✓ (formatted)
"(555) 123-4567"  ✓ (formatted)
"555-1234"        ✗ (too short)
"1-555-123-4567"  ✗ (11 digits)

// Email formats  
"user@example.com"     ✓
"user+tag@example.com" ✓
"user@example"         ✗ (no TLD)
"user.example.com"     ✗ (no @)

// State formats
"CA"         ✓ (2-letter code)
"California" ✗ (full name)
"ca"         ✗ (lowercase)
```

## 🔄 Processing Issues

### "Lead Stuck in Processing"

**Symptoms**:
- Event shows "processing"
- No delivery attempts
- No completion status

**Diagnose**:
1. Check flow for disabled steps
2. Look for filter stopping flow
3. Review step criteria
4. Check for circular dependencies

**Fix**:
```
Flow → Steps → Review each step status
Enable any disabled steps
Clear blocking filters
Test with new lead
```

### "Filter Unexpectedly Stopping Leads"

**Common Causes**:
- Filter rule too broad
- Logic error in conditions
- Dependent field missing
- Time-based criteria

**Debug Process**:
1. Check Events → Filter Evaluation
2. Review filter rules
3. Test with known good data
4. Adjust logic as needed

**Example Fix**:
```javascript
// Too restrictive
age >= 25 AND age <= 35 AND income > 50000  

// More reasonable
age >= 25 AND age <= 65 AND income > 30000
```

### "Enhancement Not Working"

**Symptoms**:
- Data not appended
- Fields remain empty
- Step shows skipped

**Solutions**:
1. Verify API credentials current
2. Check usage limits
3. Ensure input data valid
4. Review step criteria

## 📤 Delivery Issues

### "Connection Timeout"

**Error**: "Request timeout after 30000ms"

**Immediate Actions**:
1. Test endpoint directly
2. Increase timeout setting
3. Check recipient status page
4. Verify network connectivity

**Configuration**:
```javascript
// Increase timeout
timeout: 60000  // 60 seconds

// Add retry logic
retry_count: 3
retry_delay: 5000  // 5 seconds
```

### "Invalid Response"

**Symptoms**:
- Delivery marked as error
- Can't parse response
- Unexpected format

**Debug**:
```javascript
// Check response format
Expected: JSON
Received: HTML error page

// Common issues
- Wrong Content-Type
- API returning errors as HTML
- Malformed JSON
- Character encoding issues
```

### "Field Mapping Errors"

**Error**: "Required field 'customer_email' missing"

**Troubleshooting**:
1. Verify field mapped correctly
2. Check field has data
3. Ensure JSON structure matches
4. Test with minimal payload

**Mapping Debug**:
```javascript
// LeadConduit field → Destination field
email → customer_email  ✓
email → customerEmail   ✗ (case mismatch)
email → email          ✗ (wrong field name)
```

## 🔍 Validation Issues

### "Type Validation Failed"

**Common Type Errors**:
```
Phone: "Invalid phone number"
Email: "Invalid email format"
Date: "Cannot parse date"
Number: "Not a valid number"
```

**Fix by Type**:
```javascript
// Phone - ensure 10 digits
phone.replace(/\D/g, '').slice(-10)

// Email - check format
email.toLowerCase().trim()

// Date - use ISO format
"2024-01-15" or "01/15/2024"

// Number - remove formatting
"$1,234.56" → 1234.56
```

### "Custom Validation Failed"

**For complex validations**:
1. Review validation logic
2. Check field dependencies
3. Test edge cases
4. Add helpful error messages

## 📊 Reporting Issues

### "Report Not Showing Data"

**Check**:
- Date range includes data
- Filters not too restrictive
- User has permission
- Events being recorded

**Common Fixes**:
```
Date Range: Last 30 days → Last 90 days
Filter: Outcome = Success → All Outcomes
Group By: Too many levels → Reduce grouping
```

### "Report Performance Slow"

**Optimize**:
1. Reduce date range
2. Limit groupings
3. Remove unnecessary columns
4. Use report caching

## 🆘 Emergency Procedures

### Flow Completely Down

1. **Check System Status**
   - Visit status.activeprospect.com
   - Check for maintenance windows

2. **Isolate the Issue**
   - Test with simple curl request
   - Try different source
   - Check all flows or just one

3. **Temporary Workaround**
   - Enable batch collection
   - Route to backup endpoint
   - Store for later processing

### Data Loss Prevention

**If leads aren't delivering**:
1. Don't panic - leads are stored
2. Check Events for lead data
3. Fix delivery issue
4. Resubmit failed leads
5. Verify all recovered

### Mass Failure Response

**When many leads fail**:
1. Pause affected sources
2. Identify root cause
3. Fix configuration
4. Test with single lead
5. Resume and monitor

## 💡 Prevention Tips

### Regular Health Checks

**Daily**:
- Monitor success rates
- Check for new errors
- Review delivery times

**Weekly**:
- Test all integrations
- Review error patterns
- Update credentials

**Monthly**:
- Full flow audit
- Performance review
- Documentation update

### Proactive Monitoring

Set alerts for:
- Success rate < 90%
- Response time > 3 seconds
- Authentication failures
- Volume anomalies

## 📞 Getting Help

### Before Contacting Support

Gather:
1. Flow ID and name
2. Event IDs for examples
3. Error messages (exact text)
4. Time range of issue
5. Steps to reproduce

### Support Channels

**Email**: support@activeprospect.com
- Best for: Non-urgent issues
- Include: All details above

**Documentation**: docs.activeprospect.com
- Best for: How-to questions
- Search: Error message first

**Community**: community.activeprospect.com
- Best for: Best practices
- Check: Similar issues

## 📚 Related Documentation

- [Understanding Events](../analytics/understanding-events.md) - Event debugging
- [Testing Your Flow](../getting-started/testing-your-flow.md) - Pre-launch testing
- [Monitoring Performance](../analytics/monitoring-performance.md) - Ongoing health

---

🔧 **Resolution Ready**: Most issues have simple solutions. Stay calm, follow the diagnostic steps, and remember that LeadConduit stores all data - nothing is lost while you troubleshoot!