---
tags:
  - buyer-focused
  - intermediate
  - how-to
  - flows
  - troubleshooting
  - operation
  - semi-technical
---

# Disabling and Testing Steps

Temporarily disable flow steps for testing, debugging, or maintenance without deleting your configuration. This guide shows you how to safely disable steps and understand the downstream impacts.

## 📍 You Are Here

You're learning to use step disabling as a powerful debugging and testing tool. Whether isolating issues, testing new configurations, or performing maintenance, disabling steps helps you control flow behavior without losing your work.

## 🎯 What You'll Learn

- How to disable and enable steps
- Understanding downstream impacts
- Safe testing strategies
- Common use cases

## 🔧 How to Disable a Step

### Basic Process

1. **Locate the Step**
   - Open your flow in edit mode
   - Find the step you want to disable

2. **Access Step Options**
   - Click the **gear icon** on the step
   - Select **Disable** from the menu

3. **Confirm the Action**
   - Read any warnings about downstream impacts
   - Confirm to proceed

### Visual Indicators

Once disabled:
- The step appears grayed out
- A "Disabled" label is shown
- Affected downstream steps are highlighted
- The flow diagram shows the skip path

## ⚠️ Understanding Downstream Impacts

### The Warning Message

When disabling a step that other steps depend on, you'll see:

> **Warning**: Downstream steps have criteria related to this step. Flow behavior may be unpredictable.

This means:
- Steps that use data from this step won't have that data
- Filters checking for this step's results will behave differently
- Mappings expecting appended data will be empty

### What Gets Affected

**Enhancement Steps**:
- Appended data won't exist
- Fields like `appended.service_name.result` will be undefined
- Dependent rules may fail

**Filter Steps**:
- Rules checking step outcomes won't work as expected
- Routing logic may break
- Leads might take unexpected paths

**Delivery Steps**:
- Missing expected fields in mappings
- Potential delivery failures
- Incomplete data sent to destinations

## 🎯 Safe Disabling Strategies

### Strategy 1: Bottom-Up Disabling

Start with the last steps and work backward:
1. Disable delivery steps first
2. Then enhancement steps
3. Finally filter steps
4. This minimizes unexpected behavior

### Strategy 2: Branch Isolation

When testing a specific branch:
1. Disable the entire branch at once
2. Use a filter at the branch start
3. Route test leads around the branch
4. Re-enable when testing complete

### Strategy 3: Test Mode Alternative

Instead of disabling, consider:
1. Add a test mode filter at the step
2. Use a custom field like `test_mode`
3. Skip steps when `test_mode is true`
4. More control, less disruption

## 💡 Common Use Cases

### Testing New Enhancements

**Scenario**: Adding a new data verification service

```
1. Add the new enhancement step
2. Disable it initially
3. Send test leads through
4. Enable for specific test leads only
5. Verify results before full enablement
```

### Debugging Delivery Issues

**Scenario**: CRM delivery failing

```
1. Disable the CRM delivery step
2. Add a webhook test destination
3. Verify data arrives correctly
4. Fix CRM configuration
5. Re-enable CRM delivery
```

### Cost Control During Testing

**Scenario**: Expensive enhancement service

```
1. Disable costly enhancement steps
2. Test flow logic without charges
3. Enable for final testing only
4. Disable again if issues found
```

### Maintenance Windows

**Scenario**: Destination system maintenance

```
1. Disable delivery to system
2. Optional: Add alternate delivery
3. Leads queue or route elsewhere
4. Re-enable after maintenance
```

## 🔄 Re-Enabling Steps

### Process

1. Click the gear icon on disabled step
2. Select **Enable**
3. Step returns to normal operation
4. Downstream indicators clear

### Verification After Enabling

Always verify:
- Step processes correctly
- Downstream steps receive expected data
- No leads were lost during disabled period
- Performance returns to normal

## 📊 Best Practices

### Before Disabling

**Document Your Changes**:
- Note which steps you're disabling
- Record the reason
- Set a reminder to re-enable

**Check Dependencies**:
- Review downstream steps
- Identify data dependencies
- Plan for missing data

**Consider Alternatives**:
- Can you use step rules instead?
- Would a filter be more appropriate?
- Is there a test mode option?

### During Disabled Period

**Monitor Closely**:
- Watch Events for unexpected behavior
- Check that leads flow as expected
- Verify no critical data is lost

**Limit Duration**:
- Disable for shortest time possible
- Re-enable as soon as testing complete
- Don't leave steps disabled accidentally

### After Re-Enabling

**Verify Everything**:
- Send test lead through complete flow
- Check all data populates correctly
- Confirm normal operation resumed

## 🚫 Common Pitfalls

### Forgetting to Re-Enable

**Problem**: Steps left disabled after testing
**Solution**: 
- Set calendar reminders
- Document in team notes
- Regular flow audits

### Cascading Failures

**Problem**: Disabling one step breaks many others
**Solution**:
- Map dependencies first
- Disable in logical groups
- Test incrementally

### Data Loss

**Problem**: Important data not collected while disabled
**Solution**:
- Consider impact on reporting
- Plan for data recovery
- Use alternative capture methods

## 🎯 Advanced Patterns

### Conditional Disabling

Use step rules instead of manual disabling:

```
Step Rule: test_mode is not equal to true
Effect: Step only runs for production leads
```

### A/B Testing Pattern

Test new steps safely:

```
1. Clone existing step
2. Disable original
3. Add routing filter
4. Send percentage to new step
5. Compare results
6. Choose winner
```

### Gradual Rollout

Enable features progressively:

```
Day 1: Enable for 10% of leads
Day 2: If successful, increase to 25%
Day 3: Increase to 50%
Day 4: Full deployment
```

## 📚 Related Documentation

- [Working with Flow Steps](./working-with-steps.md) - Step configuration basics
- [Testing Strategies](../troubleshooting/testing-strategies.md) - Comprehensive testing approaches
- [Flow Performance](./performance-optimization.md) - Optimizing flow efficiency

---

🔧 **Test with Confidence**: Disabling steps gives you surgical control over your flow behavior. Use it wisely for testing and debugging, but always remember to re-enable when done!