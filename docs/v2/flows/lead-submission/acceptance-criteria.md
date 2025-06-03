---
title: Acceptance Criteria
description: Build intelligent quality gates that protect your business from bad leads
tags:
  - acceptance-criteria
  - validation
  - quality-control
---

# Acceptance Criteria

## Your Quality Firewall

Acceptance criteria are the rules that determine whether a lead is worth accepting into your flow. They're your first line of defense against bad data, protecting you from wasted money, time, and frustrated sales teams. Think of them as a bouncer at an exclusive club - only the leads that meet your standards get in.

📍 **You are here**: Building the quality gates that protect your business
🛡️ **What you'll master**: Rules, validation strategies, and smart rejection handling
💰 **The payoff**: Only pay for leads that can actually convert

## Understanding Acceptance Criteria

### What Are Acceptance Criteria?

Acceptance criteria are rules evaluated at the source level that determine:
- Should this lead be accepted into the flow?
- If rejected, what specific reason should we give?
- How do we communicate this to the source?

This happens before any processing, before any cost is incurred, before any time is wasted.

### When Criteria Are Evaluated

```
Lead Arrives → Authentication → Field Mapping → TYPE PARSING → ACCEPTANCE CRITERIA
                                                     ↓                ↓
                                              Data cleaned      Pass or Fail?
                                                                     ↓
                                                              Accept or Reject
```

Key insight: Types parse first, then criteria evaluate. This means you can use parsed components in your rules.

### The Economics of Criteria

Consider the impact:
- Accept a bad lead: Costs money, wastes sales time, hurts metrics
- Reject a good lead: Lost opportunity, vendor frustration
- The sweet spot: Reject bad leads with clear reasons, accept all good leads

**Real numbers**: One mortgage company reduced bad lead costs by $127,000/month with properly configured criteria.

## Building Effective Criteria

### Start with the Basics

Every flow should validate fundamental data quality:

**Essential Criteria Set**:
```yaml
Email is valid
AND (Phone 1 is valid OR Phone 2 is valid)
AND State is not blank
AND Age is between 18 and 100
```

This simple set catches:
- Invalid email formats
- Bad phone numbers
- Missing geographic data
- Impossible ages

### Layer Your Requirements

Build criteria in layers, from basic to specific:

**Layer 1: Data Validity**
```yaml
# Can we even contact this person?
Email format is valid
Phone format is valid
```

**Layer 2: Business Requirements**
```yaml
# Do they meet our basic criteria?
State is included in "CA,TX,FL,NY"
Age is greater than or equal to 25
```

**Layer 3: Quality Standards**
```yaml
# Is this a quality lead?
Email.is_free is false
Phone.is_mobile is true
TrustedForm certificate exists
```

**Layer 4: Advanced Filtering**
```yaml
# Premium lead qualification
Loan amount is greater than 100000
Credit score is greater than 700
Homeowner is true
```

### Using Type Intelligence

Because types parse before criteria, use their components:

**Email Intelligence**:
```yaml
# Don't just check valid, check quality
email.valid is true
AND email.is_disposable is false
AND email.is_role is false  # No info@, admin@
```

**Phone Intelligence**:
```yaml
# Ensure contactable numbers
phone_1.valid is true
AND phone_1.is_tollfree is false
AND (phone_1.type equals "mobile" OR phone_1.type equals "landline")
```

**Geographic Intelligence**:
```yaml
# Use parsed components
postal_code.state equals "CA"
AND postal_code.valid is true
```

## Common Criteria Patterns

### For Lead Buyers

**High-Intent Mortgage Leads**:
```yaml
# Required fields
first_name is not blank
AND last_name is not blank
AND email.valid is true
AND phone_1.valid is true

# Quality indicators  
AND loan_amount is greater than 50000
AND property_state is included in list "CA,TX,FL,NY,WA"
AND credit_rating is not equal to "poor"

# Compliance
AND TrustedForm.cert_age_minutes is less than 30
```

**Insurance Lead Criteria**:
```yaml
# Basics
email.valid is true
AND phone_1.valid is true
AND state is not blank

# Insurance specific
AND currently_insured is not blank
AND vehicles_count is greater than 0
OR (property_type is not blank AND property_value is greater than 0)

# No junk
AND email.is_free is false
AND phone_1.is_voip is false
```

### For Lead Sellers

**Universal Quality Standards**:
```yaml
# Minimum viable lead
(email.valid is true OR phone_1.valid is true)
AND first_name is not blank
AND last_name is not blank

# Geographic coverage
AND state is included in list "ALL_US_STATES"
AND country equals "US"

# Timestamp sanity
AND timestamp is less than {{now}}
AND timestamp is greater than {{now minus="24h"}}
```

### Time-Based Criteria

**Business Hours Only**:
```yaml
# Accept Monday-Friday, 8am-8pm EST
{{format timestamp format="u" tz="America/New_York"}} is between 1 and 5
AND {{format timestamp format="H" tz="America/New_York"}} is between 8 and 20
```

**Fresh Leads Only**:
```yaml
# Lead must be less than 5 minutes old
{{minutes_since timestamp}} is less than 5
```

### Duplicate Prevention

**Email-Based**:
```yaml
# No duplicate emails in last 30 days
email was not submitted in last 30 days
```

**Phone-Based**:
```yaml
# No duplicate phones in last 7 days
phone_1 was not submitted in last 7 days
```

**Household-Based**:
```yaml
# One per household per month
{{lead.address_1}}_{{lead.postal_code}} was not submitted in last 30 days
```

## Advanced Criteria Techniques

### Conditional Requirements

Different requirements for different scenarios:

**By Source Type**:
```yaml
# Stricter for affiliate traffic
{{#if source.type equals "affiliate"}}
  email.valid is true
  AND phone_1.valid is true
  AND TrustedForm exists
{{else}}
  email.valid is true
  OR phone_1.valid is true
{{/if}}
```

**By Value Tier**:
```yaml
# Higher standards for higher value
{{#if loan_amount > 200000}}
  credit_score is greater than 720
  AND income is greater than 100000
{{else}}
  credit_score is greater than 620
  AND income is greater than 50000
{{/if}}
```

### Scoring-Based Acceptance

Create a quality score:

```yaml
# Calculate score (in a custom field)
score = 0
+10 if email.valid
+10 if phone_1.valid
+20 if phone_1.is_mobile
+15 if not email.is_free
+25 if TrustedForm exists
+20 if state in high_value_states

# Acceptance criteria
lead_score is greater than or equal to 50
```

### List-Based Filtering

Use external lists for dynamic criteria:

**Suppression Lists**:
```yaml
email is not included in suppression_list("optouts")
AND phone_1 is not included in suppression_list("dnc")
AND domain is not included in list("blocked_domains")
```

**Inclusion Lists**:
```yaml
source_id is included in list("approved_publishers")
OR traffic_source is included in list("trusted_sources")
```

## Rejection Handling

### Clear Rejection Messages

Help sources fix problems:

**Bad Example**:
```
"Rejected: Failed criteria"
```

**Good Example**:
```
"Rejected: Invalid phone number format. Expected 10 digits, received: {{phone_1}}"
```

**Best Example**:
```json
{
  "result": "rejected",
  "reason": "Failed acceptance criteria",
  "details": {
    "phone_1": "Invalid format - must be 10 digits",
    "email": "Disposable email addresses not accepted",
    "state": "We do not accept leads from {{state}}"
  }
}
```

### Rejection Categories

Organize rejections for better tracking:

**Data Quality**:
- Invalid email format
- Invalid phone format
- Missing required fields
- Failed type validation

**Business Rules**:
- Outside service area
- Age requirements not met
- Loan amount too low
- Credit score insufficient

**Compliance**:
- Missing consent
- TrustedForm too old
- On suppression list
- Failed TCPA check

**Technical**:
- Duplicate lead
- Volume cap exceeded
- Outside business hours
- Source not authorized

## Testing Your Criteria

### Test Methodology

Always test both positive and negative cases:

**1. Perfect Lead Test**
```json
{
  "first_name": "John",
  "last_name": "Doe",
  "email": "john.doe@gmail.com",
  "phone_1": "4155551234",
  "state": "CA",
  "loan_amount": 250000
}
```
Expected: Accepted

**2. Each Criterion Individually**
- Invalid email → Rejected for email
- Invalid phone → Rejected for phone
- Wrong state → Rejected for geography
- Low amount → Rejected for value

**3. Edge Cases**
- Exactly at thresholds
- Multiple failures
- Missing optional fields
- Unusual but valid data

### Monitoring Criteria Performance

Track key metrics:

**Acceptance Rate**:
- Overall: Should be 60-90%
- By source: Identify problem sources
- By criterion: Find too-strict rules
- Over time: Spot trends

**Rejection Reasons**:
- Top reasons: Focus improvement here
- By source: Train specific partners
- Patterns: Identify systematic issues

**False Positives**:
- Good leads rejected
- Review samples regularly
- Adjust too-strict criteria
- Balance quality vs volume

## Common Mistakes

### Over-Restrictive Criteria

**Problem**: 90% rejection rate
**Symptoms**:
- Low lead volume
- High cost per accepted lead
- Vendor complaints
- Missed opportunities

**Solution**:
- Review each criterion's impact
- Loosen non-critical rules
- Use OR instead of AND where appropriate
- Test criteria changes carefully

### Under-Restrictive Criteria

**Problem**: Bad leads getting through
**Symptoms**:
- Sales complaints
- Low contact rates
- Poor conversion
- Wasted money

**Solution**:
- Add validation layers
- Tighten quality standards
- Use type components
- Monitor downstream metrics

### Vague Rejections

**Problem**: "Failed validation"
**Impact**:
- Sources can't improve
- Disputes increase
- Relationships suffer
- Problems persist

**Solution**:
- Specific rejection reasons
- Include failed values
- Provide examples
- Help sources succeed

## Best Practices

### Design Principles

1. **Start Strict, Loosen Gradually**
   - Easy to accept more later
   - Hard to reject after accepting
   - Protect quality from day one

2. **Layer Your Logic**
   - Basic → Business → Quality → Premium
   - Clear categories
   - Easy to adjust layers

3. **Use Type Intelligence**
   - Leverage parsed components
   - Don't re-validate
   - Trust type results

4. **Provide Clear Feedback**
   - Specific rejection reasons
   - Actionable improvements
   - Help sources succeed

### Maintenance Strategy

**Weekly**:
- Review rejection rates
- Check top rejection reasons
- Sample rejected leads
- Adjust if needed

**Monthly**:
- Analyze acceptance trends
- Compare source quality
- Review criteria effectiveness
- Update documentation

**Quarterly**:
- Full criteria audit
- Business rule alignment
- Competitive analysis
- Strategic adjustments

## Your Next Steps

### Essential Reading
1. **[Rules Reference](/reference/rules)** - Deep dive into rule engine
2. **[Types Reference](/reference/types)** - Understand parsed components
3. **[Volume Caps](/flows/lead-submission/volume-caps)** - Control flow quantity

### Quick Actions
1. Review your current criteria
2. Check acceptance rates
3. Analyze top rejections
4. Add one improvement

### Advanced Topics
- **[Dynamic Criteria](/help-guide/advanced/dynamic-criteria)** - Time and volume-based rules
- **[Criteria Testing](/help-guide/testing/criteria-testing)** - Comprehensive test strategies
- **[Multi-Tier Criteria](/help-guide/patterns/tiered-criteria)** - Complex acceptance logic

---

🎯 **Remember**: The best acceptance criteria are invisible to good leads and instructive to bad ones. They protect your business while helping partners improve.

*Next: [Volume Caps](/flows/lead-submission/volume-caps) - Control not just quality, but quantity too.*