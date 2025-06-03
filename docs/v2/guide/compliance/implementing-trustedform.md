---
tags:
  - buyer-focused
  - intermediate
  - how-to
  - compliance
  - integrations
  - compliance-documentation
  - technical
  - implementation
---

# Implementing TrustedForm in Your Flow

This guide walks you through adding TrustedForm validation to your flows, from basic setup to advanced configuration. You'll learn how to verify consent, validate certificates, and optimize costs while maintaining compliance.

## 📍 You Are Here

You're implementing TrustedForm to verify that proper consent was captured for every lead. This protects you from TCPA violations and provides documented proof of consumer consent.

## 🎯 What You'll Implement

- TrustedForm Decisions for accept/reject logic
- TrustedForm Insights for full certificate data
- Certificate validation in acceptance criteria
- Certificate retention strategies
- Cost optimization techniques

## 🔑 Understanding the Two Services

### TrustedForm Decisions (Purchasing Decision)

**What it does**: Basic certificate validation during pre-processing
**When it runs**: BEFORE acceptance criteria
**What it provides**: 
- Certificate validity (true/false)
- Certificate age
- Domain verification
- Form state detection

**Cost**: Lower - just validation data
**Use for**: Accept/reject decisions

### TrustedForm Insights (Enhancement Step)

**What it does**: Full certificate data retrieval
**When it runs**: AFTER acceptance (in flow steps)
**What it provides**:
- All Decisions data PLUS
- Full consent text
- Page snapshots
- All certificate metadata
- Detailed claim information

**Cost**: Higher - complete data access
**Use for**: Storing consent documentation

## 🚀 Step 1: Enable TrustedForm Decisions

### Navigate to Purchasing Decisions

1. Open your flow in edit mode
2. Find **Purchasing Decisions** or **Pre-Processing**
3. Click **Add Purchasing Decision**

### Configure TrustedForm Decisions

1. **Select Service**: Choose "TrustedForm Decisions"
2. **Name**: Keep default or rename to "TrustedForm Validation"
3. **Certificate URL Field**: Select the field containing the TrustedForm URL
   - Common names: `trustedform_url`, `xxTrustedFormCertUrl`, `tf_cert`
4. **Save** the configuration

### What This Enables

Now in acceptance criteria, you can access:
- `trustedform_decisions.valid` - Is the certificate valid?
- `trustedform_decisions.age_seconds` - How old is it?
- `trustedform_decisions.domain` - What domain created it?
- `trustedform_decisions.state` - Form state detection

## 🎯 Step 2: Configure Acceptance Criteria

### Basic Certificate Validation

Add these rules to your acceptance criteria:

```
Rule: trustedform_url is not blank
Reason: TrustedForm certificate required

Rule: trustedform_decisions.valid is true
Reason: Invalid TrustedForm certificate

Rule: trustedform_decisions.age_seconds is less than 5400
Reason: Certificate older than 90 minutes
```

### Advanced Validation Options

**Domain Whitelisting**:
```
Rule: trustedform_decisions.domain is one of ["mysite.com", "partner1.com", "partner2.com"]
Reason: Certificate from unauthorized domain
```

**Form State Detection**:
```
Rule: trustedform_decisions.state is equal to "submitted"
Reason: Form was not submitted (visit only)
```

**Conditional Age Requirements**:
```
Rule: trustedform_decisions.state is equal to "submitted" 
      AND trustedform_decisions.age_seconds is less than 5400
Reason: Submitted form certificate too old (90 min limit)

Rule: trustedform_decisions.state is equal to "visit"
      AND trustedform_decisions.age_seconds is less than 259200
Reason: Visit certificate too old (3 day limit)
```

## 🔍 Step 3: Add TrustedForm Insights (Optional)

For leads that pass validation, you may want full certificate data:

### Add Enhancement Step

1. In your flow, go to **Steps**
2. Click **Add Step** → **Enhancement**
3. Select **TrustedForm Insights**

### Configure the Enhancement

1. **Name**: "TrustedForm Full Certificate"
2. **Certificate URL**: Map to your TrustedForm URL field
3. **Position**: Place early in your flow (before destinations)

### Available Data

After this step, you can access in the `appended` namespace:
```
appended.trustedform.consent_text - Full consent language
appended.trustedform.page_url - Original form URL
appended.trustedform.snapshots - Visual proof
appended.trustedform.claims - All certificate claims
appended.trustedform.created_at - Exact timestamp
```

## 💰 Cost Optimization Strategies

### Pattern 1: Decisions Only

For basic compliance, use only TrustedForm Decisions:
```
1. TrustedForm Decisions (pre-processing)
2. Acceptance criteria validation
3. No Insights step needed
```
Cost: ~$0.01 per lead checked

### Pattern 2: Decisions + Selective Insights

Add Insights only for accepted leads:
```
1. TrustedForm Decisions validates all leads
2. Only accepted leads continue to flow
3. TrustedForm Insights enriches accepted leads only
```
Cost: ~$0.01 per check + ~$0.10 per accepted lead

### Pattern 3: Conditional Insights

Use filters to apply Insights selectively:
```
1. TrustedForm Decisions for all
2. Filter: High-value leads only
3. TrustedForm Insights for filtered leads
4. Store consent text in CRM
```
Cost: ~$0.01 per check + ~$0.10 per high-value lead

## 🎯 Common Implementation Patterns

### The Compliance-First Pattern

```yaml
Purchasing Decisions:
  - TrustedForm Decisions

Acceptance Criteria:
  - trustedform_url is not blank
  - trustedform_decisions.valid is true
  - trustedform_decisions.age_seconds < 5400

Flow Steps:
  1. TrustedForm Insights (enhancement)
  2. Store consent text → CRM custom field
  3. Deliver to buyer
```

### The Cost-Conscious Pattern

```yaml
Purchasing Decisions:
  - TrustedForm Decisions only

Acceptance Criteria:
  - All validation via Decisions data
  - No Insights unless required

Flow Steps:
  1. Direct to delivery (no Insights)
  2. Certificate URL passed to CRM
  3. Manual retention if needed
```

### The High-Volume Pattern

```yaml
Purchasing Decisions:
  - TrustedForm Decisions

Acceptance Criteria:
  - Basic validation only

Flow Steps:
  1. Filter: Random 10% sample
  2. TrustedForm Insights (for sample)
  3. All leads delivered
  4. Sample provides compliance audit
```

## 🔧 Field Mapping for Destinations

### Passing Certificate Data

Map these fields to your destinations:

**From Decisions** (available after acceptance):
```
trustedform_url → CRM Certificate URL field
trustedform_decisions.age_seconds → CRM Certificate Age
trustedform_decisions.domain → CRM Source Domain
```

**From Insights** (if enhancement added):
```
appended.trustedform.consent_text → CRM Consent Language
appended.trustedform.page_url → CRM Form URL
appended.trustedform.created_at → CRM Consent Timestamp
```

## 🚫 Troubleshooting

### "Certificate URL not found"

1. Check field mapping in source configuration
2. Common field names: `xxTrustedFormCertUrl`, `trustedform_cert_url`, `tf_url`
3. Verify vendor is sending the field
4. Check Events for actual field names received

### "Certificate invalid"

1. Check certificate age (90 minutes for submitted, 3 days for visit)
2. Verify certificate hasn't been tampered with
3. Ensure vendor implemented TrustedForm correctly
4. Test certificate URL directly in browser

### "Can't access Decisions data in steps"

Remember: TrustedForm Decisions data is ONLY available in:
- Acceptance criteria rules
- Volume cap rules  
- Pricing rules
- NOT in flow steps - use Insights for step access

### "Costs too high"

1. Use Decisions for validation, Insights only when needed
2. Filter which leads get Insights
3. Consider sampling strategy for auditing
4. Review if you need full certificate data

## 💡 Best Practices

**Always Validate First**: Use Decisions to reject invalid certificates before paying.

**Store Key Data**: At minimum, keep certificate URL and validation timestamp.

**Monitor Age Closely**: Most certificates expire at 90 days, validate much sooner.

**Whitelist Trusted Domains**: Prevent certificate reuse from unauthorized sources.

**Document Your Policy**: Write down retention periods and validation requirements.

## 📚 Related Documentation

- [TrustedForm Basics](./trustedform-basics.md) - Understanding certificates
- [Acceptance Criteria](../flow-management/acceptance-criteria.md) - Rule configuration
- [TrustedForm API Docs](https://api.trustedform.com/docs) - Technical details

---

✅ **Compliance Achieved**: You now have TrustedForm validation protecting your lead flow. Remember: good compliance is invisible when working correctly - it just prevents problems before they happen!