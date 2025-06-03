---
tags:
  - buyer-focused
  - intermediate
  - how-to
  - business-logic
  - rules-focused
  - quality-control
  - flows
  - technical
---

# Acceptance Criteria Mastery

Acceptance criteria are your first line of defense against bad leads. They enforce your purchase agreements, ensure data quality, and protect you from paying for leads that can't convert. This guide shows you how to build bulletproof acceptance criteria.

## 📍 You Are Here

You're configuring the rules that determine which leads enter your flow. Think of acceptance criteria as your automated quality control inspector - checking every lead against your standards before you pay for it.

## 🎯 What You'll Master

- Building effective rule combinations
- Using data from purchasing decisions
- Creating source-specific criteria
- Optimizing for both quality and volume
- Writing clear rejection messages

## 🧠 Understanding Acceptance Criteria

### How They Work

Acceptance criteria are rules evaluated BEFORE you pay for a lead:

1. **Lead arrives** at your source
2. **Data is parsed** and validated
3. **Purchasing decisions run** (like TrustedForm validation)
4. **Acceptance criteria evaluate** using all available data
5. **Accept or reject** with specific reason

### The Two Levels

**Flow-Level Criteria**
- Apply to ALL sources in your flow
- Set your universal standards
- Examples: valid phone, required consent

**Source-Level Criteria**  
- Apply only to specific sources
- Override or extend flow-level rules
- Examples: vendor-specific states, campaign requirements

## 🛠️ Building Basic Criteria

### Start with Required Fields

Every lead should have essential data:

```
Rule: email is not blank
Reason: Email address is required

Rule: phone is not blank  
Reason: Phone number is required

Rule: first_name is not blank
Reason: First name is required
```

### Add Data Quality Checks

Ensure fields contain valid data:

```
Rule: phone.valid is true
Reason: Invalid phone number format

Rule: email.valid is true
Reason: Invalid email address format

Rule: age is greater than or equal to 18
Reason: Must be 18 or older
```

💡 **Pro tip**: Use the `.valid` property from type parsing - it's more reliable than regex patterns.

## 🎯 Advanced Criteria Patterns

### Geographic Restrictions

Control which states/regions you accept:

```
Rule: state is one of ["CA", "TX", "FL", "NY"]
Reason: Outside service area

Rule: zip_code is not one of ["90210", "10001"]
Reason: Excluded zip code

Rule: time_zone is equal to "PST"
Reason: Pacific timezone only
```

### Business Logic Validation

Enforce your specific requirements:

```
Rule: loan_amount is between 5000 and 100000
Reason: Loan amount outside acceptable range

Rule: credit_score is greater than 600
Reason: Minimum credit score not met

Rule: insurance_type is one of ["auto", "home", "life"]
Reason: Insurance type not supported
```

### Consent and Compliance

Ensure every lead has proper consent:

```
Rule: trustedform_url is not blank
Reason: TrustedForm certificate required

Rule: tcpa_consent is true
Reason: TCPA consent not provided

Rule: opt_in_date is less than 90 days ago
Reason: Consent too old
```

## 🔧 Using Purchasing Decision Data

### TrustedForm Decisions

When TrustedForm Decisions is enabled, you can use:

```
Rule: trustedform_decisions.valid is true
Reason: Invalid TrustedForm certificate

Rule: trustedform_decisions.age_seconds is less than 5400
Reason: Certificate older than 90 minutes

Rule: trustedform_decisions.domain is one of ["mysite.com", "partner.com"]
Reason: Certificate from unauthorized domain
```

⚠️ **Important**: TrustedForm Decisions data is ONLY available in acceptance criteria, not in flow steps.

### Other Purchasing Decisions

If you have phone or email verification:

```
Rule: phone_intel.connected is true
Reason: Phone number disconnected

Rule: email_verification.deliverable is true
Reason: Email address undeliverable
```

## 🎨 Source-Specific Strategies

### Vendor Quality Requirements

Different vendors might need different standards:

**Source: Premium Vendor**
```
Rule: All flow rules PLUS
Rule: exclusive is true
Reason: Only exclusive leads from this vendor
```

**Source: Budget Vendor**
```
Rule: All flow rules PLUS  
Rule: source.volume_today is less than 50
Reason: Daily limit reached for this source
```

### Campaign-Specific Rules

For different marketing campaigns:

```
Source: Facebook Campaign - Solar
Rule: interested_in is equal to "solar"
Reason: Wrong campaign interest

Source: Google Ads - Auto Insurance  
Rule: insurance_type is equal to "auto"
Reason: Wrong insurance type for campaign
```

## 📝 Writing Effective Rejection Messages

### Be Specific
❌ "Invalid data"
✅ "Phone number area code 555 is invalid"

### Be Helpful
❌ "Failed validation"
✅ "Email domain @test.com not accepted - use real email"

### Be Actionable
❌ "Bad lead"
✅ "Missing required field: last_name"

### Examples of Good Messages

```
"Phone number disconnected - verify before resubmitting"
"Outside service area - we only accept CA, NV, AZ"
"Duplicate lead - already received 3 days ago"
"Invalid consent - TrustedForm certificate expired"
```

## 🚀 Optimization Strategies

### Start Broad, Then Narrow

Week 1: Basic requirements only
```
- Valid email
- Valid phone
- Required fields
```

Week 2: Add quality filters
```
- Phone connected
- Email deliverable
- Recent consent
```

Week 3: Fine-tune for conversion
```
- Specific states
- Age ranges
- Interest levels
```

### Monitor and Adjust

Check your metrics weekly:
- **Acceptance rate**: Too low? Loosen criteria
- **Lead quality**: Too many bad leads? Tighten criteria
- **Conversion rate**: Track which criteria predict success

### Test Before Deploying

1. Create criteria in test mode
2. Run historical leads through them
3. Check what would be rejected
4. Adjust before going live

## 🔍 Common Patterns

### The Insurance Buyer Pattern

```
# Basic Requirements
email is not blank
phone.valid is true
state is one of [licensed states]

# Insurance Specific
insurance_type is not blank
currently_insured is one of ["yes", "no"]
coverage_amount is greater than 0

# Compliance
trustedform_decisions.valid is true
tcpa_consent is true
```

### The Mortgage Buyer Pattern

```
# Basic Requirements
All standard field requirements

# Financial Qualifiers
loan_amount is between 50000 and 2000000
credit_score is greater than or equal to 620
employment_status is one of ["employed", "self-employed"]
property_type is not equal to "manufactured"

# Compliance
trustedform_decisions.age_seconds is less than 300
state is not one of ["NY", "VT"] # Licensing restrictions
```

### The Education Buyer Pattern

```
# Basic Requirements
All standard field requirements

# Education Specific
education_level is not blank
program_interest is not blank
start_timeframe is one of ["immediately", "1_month", "3_months"]

# Quality Filters
age is between 18 and 65
us_citizen is true OR eligible_to_work is true
```

## 🚫 Troubleshooting

### "Too many rejections"

1. Check Events for top rejection reasons
2. Look for patterns (all from one source?)
3. Verify field mappings are correct
4. Consider if criteria are too strict

### "Bad leads getting through"

1. Review accepted leads that failed
2. Identify missing criteria
3. Add rules for those scenarios
4. Consider adding purchasing decisions

### "Vendors complaining"

1. Share specific rejection reasons
2. Provide example of acceptable data
3. Check if their field names map correctly
4. Consider source-specific criteria

## 💡 Best Practices

**Layer Your Rules**: Start with basic validation, then add business logic, then compliance.

**Use Clear Logic**: Combine related rules with AND, separate alternatives with OR.

**Test Edge Cases**: What happens with missing fields? Invalid formats? Edge values?

**Document Everything**: Comment why each rule exists, especially for complex logic.

**Review Regularly**: What made sense last month might be too strict/loose now.

## 📚 Related Documentation

- [Rules Reference](../../reference/rules.md) - Complete rule syntax
- [Types Reference](../../reference/types.md) - Understanding .valid properties
- [TrustedForm Guide](../compliance/trustedform-basics.md) - Consent validation

---

🎯 **Power Up Your Criteria**: Well-crafted acceptance criteria are the foundation of a profitable flow. They protect your investment, ensure quality, and keep vendors honest. Master them, and you master your lead flow!