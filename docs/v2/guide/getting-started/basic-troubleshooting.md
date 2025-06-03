---
tags:
  - buyer-focused
  - beginner
  - troubleshooting
  - how-to
  - flows
  - operation
  - semi-technical
---

# Basic Troubleshooting Guide

Quick solutions for common issues new users encounter. Learn to diagnose problems, understand error messages, and get your leads flowing again.

## 📍 You Are Here

Something's not working as expected. Don't worry - most issues have simple solutions. This guide helps you quickly identify and fix the most common problems.

## 🎯 Quick Fixes

### My Leads Aren't Showing Up

**Check These First**:
1. ✅ Is your flow active? (Green status)
2. ✅ Is your source enabled?
3. ✅ Are you sending to the right URL?
4. ✅ Is your API key correct?

**Look at Events Tab**:
- **No events?** → Submission problem
- **Events show "failure"?** → Validation problem
- **Events show "success"?** → Check delivery

### My Integration Isn't Working

**Quick Checks**:
1. 🔑 Authentication current?
2. 📝 Required fields mapped?
3. 🌐 Endpoint responding?
4. ✅ Test mode off?

**Test It**:
```bash
# Test your endpoint directly
curl -X POST https://your-endpoint.com/test \
  -H "Content-Type: application/json" \
  -d '{"test": "data"}'
```

### Leads Are Being Rejected

**Common Reasons**:
- ❌ Missing required field
- ❌ Invalid format (email, phone)
- ❌ Duplicate lead
- ❌ Failed acceptance criteria

**Check Events** → Click on lead → View rejection reason

## 🔍 Using Events to Debug

### What Are Events?

Every lead creates events showing:
- When it arrived
- What happened to it
- Where it went
- Why it failed (if applicable)

### How to Use Events

1. **Go to Events Tab** in your flow
2. **Find Your Test Lead** (most recent)
3. **Click to Expand**
4. **Read the Timeline**:
   ```
   10:15:32 - Lead received from "Web Form"
   10:15:32 - Email validation: PASSED
   10:15:33 - Phone validation: FAILED (invalid format)
   10:15:33 - Lead rejected: Invalid phone number
   ```

### Event Status Meanings

- **🟢 Success**: Everything worked
- **🔴 Failure**: Business rule rejection
- **🟡 Error**: Technical problem
- **⚪ Skipped**: Criteria not met

## 📝 Common Error Messages

### "Authentication Failed"

**What It Means**: Your API key or credentials are wrong

**How to Fix**:
1. Copy API key from source settings
2. Ensure no extra spaces
3. Check it hasn't expired
4. Verify you're using the right header name

### "Field 'email' is required"

**What It Means**: You're not sending a required field

**How to Fix**:
1. Check your field names (case-sensitive!)
2. Ensure the field has a value
3. Verify JSON structure is correct
4. Look for typos

**Examples**:
```javascript
// Wrong
{ "Email": "test@example.com" }  // Capital E
{ "e-mail": "test@example.com" } // Hyphen
{ "email": "" }                   // Empty

// Right
{ "email": "test@example.com" }
```

### "Invalid phone number format"

**What It Means**: Phone doesn't match expected format

**How to Fix**:
```javascript
// Accepted formats
"5551234567"      // 10 digits
"555-123-4567"    // Dashes OK
"(555) 123-4567"  // Parentheses OK

// Not accepted
"555-1234"        // Too short
"1-555-123-4567"  // 11 digits
"555.123.4567"    // Dots (unless configured)
```

### "Lead already exists"

**What It Means**: Duplicate detection triggered

**How to Fix**:
1. Check your duplicate settings
2. Use different test data
3. Clear test leads if needed
4. Adjust duplicate window

## 🚨 Submission Problems

### Getting 404 Not Found

**Check**:
- ✅ URL is exactly correct
- ✅ Flow ID is right
- ✅ Source name matches (case-sensitive)
- ✅ Using HTTPS not HTTP

**Correct URL Format**:
```
https://app.leadconduit.com/flows/[FLOW_ID]/sources/[SOURCE_NAME]
                                   ^^^^^^^^            ^^^^^^^^^^^
                                   Your flow ID       Exact source name
```

### Getting 500 Server Error

**Usually Means**:
- Malformed JSON
- Content-Type header missing
- Request too large
- Server temporarily down

**Fix**:
1. Validate JSON structure
2. Add Content-Type: application/json
3. Check payload size < 1MB
4. Wait and retry

### No Response / Timeout

**Common Causes**:
- Firewall blocking
- Wrong URL
- Network issues
- Server overloaded

**Try**:
1. Test from different network
2. Use curl to test directly
3. Check status.activeprospect.com
4. Contact support if persists

## 🔧 Flow Configuration Issues

### Source Not Accepting Leads

**Status Check**:
```
Flow → Sources → [Your Source]
Status: ✅ Active (good)
Status: ❌ Paused (won't accept)
```

**Also Check**:
- Acceptance criteria too strict?
- Required fields configured?
- API key active?

### Delivery Not Working

**Quick Diagnosis**:
1. Look at Events → Delivery attempt
2. Check response code
3. Review error message
4. Test endpoint separately

**Common Fixes**:
- Re-authenticate integration
- Update field mappings
- Fix endpoint URL
- Increase timeout

### Filters Blocking Everything

**Debug Process**:
1. Temporarily disable filter
2. Send test lead
3. Check Events for what would fail
4. Adjust filter logic
5. Re-enable and test

## 💡 Testing Tips

### Use Test Data

**Good Test Data**:
```json
{
  "email": "test@example.com",
  "phone": "5551234567",
  "first_name": "Test",
  "last_name": "User",
  "state": "CA",
  "zip": "90210"
}
```

### Test Incrementally

1. **Test source first** (just receive)
2. **Add one step** (validate email)
3. **Test again**
4. **Add next step**
5. **Continue building**

### Use the Test Button

Every source has a test feature:
1. Click **Test** on source
2. Fill in form
3. Submit
4. Check Events immediately

## 🆘 When to Contact Support

### Gather This Information First

1. **Flow ID**: Found in URL or flow settings
2. **Event ID**: From a failed lead
3. **Error Message**: Exact text
4. **Time Range**: When issue occurred
5. **Steps Tried**: What you've attempted

### Contact Support When

- Same error after trying fixes
- Server errors (500) persist
- Authentication won't work
- Need configuration help
- Questions about features

**Email**: support@activeprospect.com

## 📋 Quick Reference Checklist

**Lead Not Arriving?**
- [ ] Flow is active
- [ ] Source is enabled
- [ ] URL is correct
- [ ] API key is valid
- [ ] Check Events tab

**Lead Rejected?**
- [ ] Check rejection reason
- [ ] Verify required fields
- [ ] Validate data formats
- [ ] Review acceptance criteria

**Integration Failed?**
- [ ] Authentication current
- [ ] Endpoint responding
- [ ] Fields mapped correctly
- [ ] Test mode disabled

**Still Stuck?**
- [ ] Read exact error message
- [ ] Check Events timeline
- [ ] Test with curl
- [ ] Try simpler test data
- [ ] Contact support

## 📚 Related Documentation

- [Common Issues](../troubleshooting/common-issues.md) - Advanced troubleshooting
- [Understanding Submission](./understanding-submission.md) - How leads flow
- [Testing Your Flow](./testing-your-flow.md) - Comprehensive testing

---

🔧 **Don't Give Up!** Every expert has faced these same issues. With the Events tab and this guide, you can solve most problems in minutes. Remember: the issue is usually something simple!