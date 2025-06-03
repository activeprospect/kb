# Testing Your Flow

Ensure your flow works perfectly before going live. Learn systematic testing approaches, tools, and best practices for catching issues early.

## 📍 You Are Here

Your flow is configured and ready for testing. Before sending real leads, you need to verify everything works correctly. This guide shows you how to test thoroughly and confidently.

## 🎯 What You'll Learn

- Pre-launch testing checklist
- Using test tools effectively
- Testing each component
- Load and stress testing
- Troubleshooting test failures
- Going live safely

## 🏗️ Pre-Testing Setup

### Enable Test Mode

Before testing:
1. Set flow to **Test Mode** (won't bill)
2. Enable **verbose logging**
3. Set up **test recipients**
4. Configure **alerts**

### Prepare Test Data

Create realistic test scenarios:

```json
// Valid Lead
{
  "email": "test.valid@example.com",
  "phone": "5551234567",
  "first_name": "Test",
  "last_name": "Valid",
  "state": "CA",
  "zip": "90210"
}

// Invalid Email
{
  "email": "notanemail",
  "phone": "5551234567",
  "first_name": "Test",
  "last_name": "Invalid"
}

// Missing Required Field
{
  "email": "test@example.com",
  // phone missing
  "first_name": "Test"
}
```

## 🧪 Component Testing

### Step 1: Test Source Configuration

**What to Test**:
- Authentication works
- URL is accessible
- Field names match
- Required fields enforced

**How to Test**:
1. Use source's **Test** button
2. Submit minimal valid data
3. Check Events tab
4. Verify lead received

**Expected Result**:
```
Event: Lead Received
Status: Success
Source: Your Test Source
Fields: All mapped correctly
```

### Step 2: Test Each Enhancement

**For Each Enhancement Step**:
1. Send lead with valid data
2. Verify enhancement runs
3. Check appended fields
4. Test error handling

**Example - Email Validation**:
```
Test 1: valid@example.com
Result: valid = true, deliverable = true

Test 2: invalid@fake-domain-xyz.com
Result: valid = false, reason = "Domain does not exist"

Test 3: role@example.com
Result: valid = true, role_address = true
```

### Step 3: Test Filters

**Critical Filter Tests**:

**Acceptance Criteria**:
- ✅ Valid lead passes
- ❌ Invalid lead rejected
- 📝 Rejection reason clear

**Business Rules**:
```javascript
// Test age filter
Test 1: age = 25 → PASS
Test 2: age = 17 → REJECT (too young)
Test 3: age = null → REJECT (missing)

// Test geographic filter
Test 1: state = "CA" → PASS
Test 2: state = "XX" → REJECT (invalid)
Test 3: state = "HI" → REJECT (not serviceable)
```

### Step 4: Test Delivery

**Delivery Testing Checklist**:
- [ ] Authentication successful
- [ ] All fields mapped
- [ ] Response parsed correctly
- [ ] Success tracked
- [ ] Failures handled
- [ ] Retries working

**Test Scenarios**:
1. **Successful delivery**
2. **Auth failure** (bad credentials)
3. **Timeout** (slow endpoint)
4. **Invalid data** (missing required)
5. **Duplicate** (send same lead twice)

## 🔄 End-to-End Testing

### Complete Flow Test

Run leads through the entire flow:

```
1. Submit test lead via API
2. Watch Events in real-time
3. Verify each step executes
4. Check final delivery
5. Confirm in destination system
```

### Test All Paths

**Success Path**:
- Valid data → Enhancements → Delivery → Success

**Failure Paths**:
- Invalid email → Rejection → Proper error
- Duplicate → Filter → Correct message
- API error → Retry → Recovery

### Edge Cases

Don't forget to test:
- **Empty fields**: `"phone": ""`
- **Special characters**: `"name": "O'Brien"`
- **Long values**: 500 character strings
- **Unicode**: `"name": "José García"`
- **Null values**: `"middle_name": null`

## 📊 Load Testing

### Gradual Load Increase

Test how your flow handles volume:

```bash
# Start small
Minute 1: Send 1 lead
Minute 2: Send 10 leads
Minute 3: Send 50 leads
Minute 4: Send 100 leads

# Monitor
- Processing time
- Queue depth
- Error rate
- API limits
```

### Concurrent Testing

Test parallel processing:

```bash
# Send 10 leads simultaneously
for i in {1..10}; do
  curl -X POST [your-endpoint] \
    -H "X-API-Key: [key]" \
    -d @testlead.json &
done
```

### Stress Points

Identify where flow breaks:
- Enhancement API rate limits
- Delivery endpoint capacity
- Database connection limits
- Memory constraints

## 🛠️ Testing Tools

### Built-in Test Feature

Every source has a test interface:
1. Navigate to source
2. Click **Test** button
3. Fill form with test data
4. Submit and track

### API Testing Tools

**Postman**:
- Save test collections
- Environment variables
- Automated test runs
- Response validation

**cURL**:
```bash
# Basic test
curl -X POST https://app.leadconduit.com/flows/[ID]/sources/[NAME] \
  -H "X-API-Key: YOUR_KEY" \
  -H "Content-Type: application/json" \
  -d '{"email":"test@example.com","phone":"5551234567"}'

# Test with file
curl -X POST https://app.leadconduit.com/flows/[ID]/sources/[NAME] \
  -H "X-API-Key: YOUR_KEY" \
  -H "Content-Type: application/json" \
  -d @testlead.json

# Verbose output
curl -v -X POST ...
```

### Webhook Testing

For testing deliveries:
- webhook.site
- requestbin.com
- ngrok (local testing)
- beeceptor.com

## 🎯 Test Scenarios

### Scenario 1: Valid Lead

```json
{
  "email": "john.doe@gmail.com",
  "phone": "5551234567",
  "first_name": "John",
  "last_name": "Doe",
  "state": "CA",
  "zip": "90210",
  "age": "35",
  "consent": true
}
```

**Expected**: Full success through delivery

### Scenario 2: Invalid Email

```json
{
  "email": "not.an.email",
  "phone": "5551234567",
  "first_name": "Test",
  "last_name": "User"
}
```

**Expected**: Rejection at email validation

### Scenario 3: Duplicate Lead

Send same lead twice:

**First**: Success
**Second**: Rejected as duplicate

### Scenario 4: API Failure

Simulate endpoint down:
1. Point delivery to bad URL
2. Send test lead
3. Verify retry attempts
4. Check failure handling

## 📋 Testing Checklist

### Before Testing
- [ ] Flow in test mode
- [ ] Test data prepared
- [ ] Events tab open
- [ ] Destination access ready

### Source Testing
- [ ] Authentication works
- [ ] Fields map correctly
- [ ] Required fields enforced
- [ ] Error messages clear

### Processing Testing
- [ ] Enhancements run
- [ ] Filters work correctly
- [ ] Validations accurate
- [ ] Edge cases handled

### Delivery Testing
- [ ] Successful delivery
- [ ] Failed delivery handling
- [ ] Retry logic works
- [ ] Response parsing correct

### Load Testing
- [ ] Normal volume works
- [ ] Peak volume handled
- [ ] Recovery from overload
- [ ] No data loss

## 🚀 Going Live

### Final Checks

Before activating:
1. **Remove test mode**
2. **Verify production credentials**
3. **Clear test data**
4. **Set appropriate alerts**
5. **Document configuration**

### Soft Launch

Start cautiously:
1. **Enable for limited sources**
2. **Monitor closely first day**
3. **Check early results**
4. **Gradually increase volume**

### Monitoring Plan

Set up monitoring:
- Success rate alerts
- Volume anomalies
- Error rate thresholds
- Performance degradation

## 🚫 Common Testing Mistakes

### Testing Only Success Cases

**Wrong**: Only testing valid data

**Right**: Test failures, edges, errors

### Not Testing Under Load

**Wrong**: Single lead tests only

**Right**: Test expected daily volume

### Skipping Integration Tests

**Wrong**: Assuming endpoints work

**Right**: Test actual delivery endpoints

### Forgetting Edge Cases

**Wrong**: Standard data only

**Right**: Special characters, limits, nulls

## 💡 Testing Best Practices

1. **Test Early and Often**
   - Don't wait until complete
   - Test each component
   - Iterate based on results

2. **Use Realistic Data**
   - Match production formats
   - Include edge cases
   - Test all scenarios

3. **Document Tests**
   - What you tested
   - Expected results
   - Actual results
   - Issues found

4. **Automate When Possible**
   - Regression testing
   - Load testing
   - Monitoring

## 📚 Related Documentation

- [Basic Troubleshooting](./basic-troubleshooting.md) - When tests fail
- [Monitoring Performance](../analytics/monitoring-performance.md) - Post-launch monitoring
- [Common Issues](../troubleshooting/common-issues.md) - Problem resolution

---

✅ **Test Complete**: Thorough testing prevents production problems. Take time to test properly - your future self will thank you when everything runs smoothly!