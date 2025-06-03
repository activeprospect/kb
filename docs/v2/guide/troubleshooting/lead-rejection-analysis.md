---
tags:
  - buyer-focused
  - intermediate
  - troubleshooting
  - how-to
  - analytics
  - quality-control
  - vendor-management
  - events-focused
---

# Lead Rejection Analysis

When leads are being rejected at higher rates than expected, this guide helps you diagnose the cause and implement solutions. Learn to use Events effectively, identify patterns, and communicate clearly with sources about requirements.

## 📍 You Are Here

You're investigating why leads are failing your acceptance criteria. This guide shows you how to find patterns in rejections, fix common issues, and improve your acceptance rates without compromising quality.

## 🎯 What You'll Learn

- How to analyze rejection patterns using Events
- Common rejection causes and fixes
- Communicating requirements to sources
- Balancing quality with acceptance rates

## 🔍 Step 1: Gathering Rejection Data

### Using the Events System

Events provide complete visibility into why each lead was rejected:

1. **Navigate to Events**
   - Open your flow
   - Click the **Events** tab
   - Filter by outcome: "Failure"

2. **Identify Patterns**
   - Look at "Reason" column for rejection messages
   - Note which sources have highest rejection rates
   - Check timestamps for time-based patterns

3. **Drill Into Specific Events**
   - Click any failed event
   - Review the complete data received
   - See exactly which rule failed

💡 **Pro tip**: Export Events data for deeper analysis in spreadsheets.

### Common Rejection Reasons

Here's what to look for in your Events:

**"Email address is required"**
- Source not sending email field
- Field named differently than expected
- Empty values being sent

**"Invalid phone number format"**
- Type parsing found invalid format
- Missing area code
- International numbers not supported

**"Outside service area"**
- State/zip not in accepted list
- Geographic restrictions too narrow
- Source sending wrong locations

**"TrustedForm certificate invalid"**
- Certificate expired (>90 days old)
- Certificate URL malformed
- No certificate provided

## 📊 Step 2: Analyzing Patterns

### By Source Analysis

Check if rejections are concentrated in specific sources:

```
Source A: 80% acceptance rate ✅
Source B: 45% acceptance rate ⚠️
Source C: 92% acceptance rate ✅
```

If one source has significantly lower acceptance, investigate:
- Are their field mappings correct?
- Do they understand your requirements?
- Is their data quality different?

### By Time Analysis

Look for time-based patterns:

**Business hours vs after-hours**
- Different data quality at different times?
- Automated vs manual submissions?

**Day of week patterns**
- Monday rejections higher? (Weekend data buildup)
- Friday quality issues? (End of week rush)

### By Rejection Type

Group rejections by reason:

**Field validation failures (40%)**
- Focus on field mapping fixes
- Check type validation rules

**Business logic failures (35%)**
- Review if criteria too strict
- Consider source-specific rules

**Compliance failures (25%)**
- Ensure sources understand requirements
- Provide implementation guides

## 🛠️ Step 3: Common Fixes

### Fix 1: Field Mapping Issues

**Problem**: Source sends `phone_number`, you expect `phone`

**Solution**: Add field mapping in source configuration:
```
Source Field: phone_number → Target Field: phone
Source Field: e_mail → Target Field: email
Source Field: fname → Target Field: first_name
```

See [Field Mapping Guide](../data-management/field-configuration.md) for details.

### Fix 2: Type Validation Too Strict

**Problem**: Valid data failing type parsing

**Example**: Phone `555.123.4567` rejected (dots not dashes)

**Solution**: Types handle various formats automatically, but check if:
- Source sending unusual format
- International data needs different type
- Custom field needs different validation

Reference: [Types Documentation](../../reference/types.md)

### Fix 3: Acceptance Criteria Too Narrow

**Problem**: Good leads rejected by overly strict rules

**Review your rules**:
```
❌ Too strict: age is equal to 25
✅ Better: age is between 21 and 65

❌ Too strict: income is greater than 100000  
✅ Better: income is greater than 50000
```

See [Acceptance Criteria Guide](../flow-management/acceptance-criteria.md)

### Fix 4: Missing Required Fields

**Problem**: Source not sending all required fields

**Solutions**:
1. Make field optional if not critical
2. Set default value in mappings
3. Work with source to add field
4. Create source-specific criteria

## 📞 Step 4: Communicating with Sources

### Creating a Requirements Document

Share clear requirements with your sources:

```markdown
# Lead Submission Requirements

## Required Fields
- email (valid email format)
- phone (10-digit US phone)
- first_name (text)
- last_name (text)
- state (2-letter abbreviation)
- zip_code (5 digits)
- trustedform_url (valid TrustedForm certificate)

## Accepted Values
- States: CA, TX, FL, NY, PA
- Age: 21-65
- Certificate Age: Less than 90 minutes

## Submission Endpoint
POST https://app.leadconduit.com/flows/[ID]/sources/[NAME]
Header: X-API-Key: [their-key]

## Example Successful Submission
{
  "email": "john.doe@example.com",
  "phone": "555-123-4567",
  "first_name": "John",
  "last_name": "Doe",
  "state": "CA",
  "zip_code": "90210",
  "trustedform_url": "https://cert.trustedform.com/[token]"
}
```

### Providing Rejection Feedback

Help sources understand why leads fail:

**Daily Summary Email**:
```
Yesterday's Performance:
- Submitted: 1,000 leads
- Accepted: 750 leads (75%)
- Rejected: 250 leads (25%)

Top Rejection Reasons:
1. "Invalid phone number format" - 100 leads
2. "Outside service area" - 75 leads  
3. "Missing email address" - 50 leads
4. "TrustedForm certificate expired" - 25 leads

Action Items:
- Ensure phones include area code
- Only send leads from: CA, TX, FL, NY, PA
- All leads must include email
- Submit within 90 minutes of capture
```

## 📈 Step 5: Optimization Strategies

### Gradual Criteria Refinement

Don't make all rules strict immediately:

**Week 1**: Basic validation only
- Required fields present
- Valid email/phone format

**Week 2**: Add quality filters
- Geographic restrictions
- Age requirements

**Week 3**: Full compliance
- TrustedForm validation
- Complete criteria set

### A/B Testing Rules

Test rule changes on subset:

1. Create duplicate source
2. Apply new rules to test source
3. Compare acceptance rates
4. Roll out if improved

### Source-Specific Optimization

Different sources may need different rules:

**Premium Source Config**:
- Stricter quality requirements
- Higher pricing for better data
- Lower volume caps

**Volume Source Config**:
- More permissive rules
- Lower pricing
- Higher volume caps

## 🎯 Quick Diagnosis Checklist

When investigating rejections:

- [ ] Check Events for specific rejection reasons
- [ ] Group rejections by source
- [ ] Look for time-based patterns
- [ ] Verify field mappings are correct
- [ ] Review if acceptance criteria too strict
- [ ] Check type validation on fields
- [ ] Confirm sources understand requirements
- [ ] Test with known good data

## 💡 Best Practices

**Start Permissive**: Begin with loose rules and tighten based on quality issues.

**Clear Rejection Messages**: "Phone area code 555 invalid" better than "Invalid phone".

**Monitor Daily**: Check rejection rates daily when making changes.

**Document Changes**: Track what rules you changed and why.

**Communicate Proactively**: Tell sources before changing requirements.

## 📚 Related Documentation

- [Events Reference](../../reference/lifecycle.md) - Deep dive into event data
- [Acceptance Criteria](../flow-management/acceptance-criteria.md) - Building better rules
- [Field Types](../../reference/types.md) - Understanding validation
- [Source Configuration](../getting-started/adding-sources.md) - Source setup

---

📊 **Data-Driven Decisions**: Good rejection analysis turns frustrated sources into successful partners. Use Events data to make informed decisions about your acceptance criteria, and remember - the goal is quality leads, not just volume!