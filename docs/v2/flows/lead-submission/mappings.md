---
title: Field Mappings  
description: Transform vendor chaos into your standardized data model with smart field mappings
tags:
  - mappings
  - field-mapping
  - data-transformation
---

# Field Mappings

## Your Universal Translator

Field mappings are the unsung heroes of lead distribution. They transform the chaos of vendor-specific field names into your clean, standardized data model. Without mappings, you'd be drowning in fields like `fname`, `first`, `firstName`, `FNAME`, and `contact_first` - all meaning the same thing.

📍 **You are here**: Learning to map any vendor format to your standards
🔄 **What you'll master**: Field transformation, naming conventions, and data standardization
🎯 **The goal**: Accept leads from anyone without changing your flow

## Understanding Field Mappings

### The Two Types of Mappings

LeadConduit uses mappings in two distinct places:

**1. Inbound Mappings (Source → Flow)**
- Applied during lead submission
- Simple field renaming only
- No data transformation
- Maps vendor fields to your standard fields

**Example**: Vendor sends `phone_number`, you need `phone_1`

**2. Outbound Mappings (Flow → Recipient)**  
- Applied during delivery
- Full transformation capabilities
- Complex data manipulation
- Formats data for recipient requirements

**Example**: Combine `first_name` + `last_name` → `full_name`

### Why This Distinction Matters

**Inbound = Simple**
```yaml
Their Field → Your Field
fname → first_name
email_addr → email
ph1 → phone_1
```

**Outbound = Powerful**
```yaml
Your Data → Complex Transformation → Their Field
{{first_name}} {{last_name}} → FullName
{{format phone "(###) ###-####"}} → FormattedPhone
{{uppercase state}} → STATE_CODE
```

## Configuring Inbound Mappings

### Basic Field Mapping

When a source sends differently named fields:

**Vendor Sends**:
```json
{
  "fname": "John",
  "lname": "Doe",
  "email_address": "john@example.com",
  "primary_phone": "5551234567",
  "st": "CA"
}
```

**You Configure**:
| Vendor Field | Maps To | 
|--------------|---------|
| fname | first_name |
| lname | last_name |
| email_address | email |
| primary_phone | phone_1 |
| st | state |

**Flow Receives**:
```json
{
  "first_name": "John",
  "last_name": "Doe", 
  "email": "john@example.com",
  "phone_1": "5551234567",
  "state": "CA"
}
```

### Handling Different Structures

**Nested Data**:
```yaml
Vendor: contact.first_name
Maps to: first_name

Vendor: address.state_code  
Maps to: state
```

**Array Data**:
```yaml
Vendor: phones[0]
Maps to: phone_1

Vendor: phones[1]
Maps to: phone_2
```

### Common Mapping Patterns

**Standard Personal Info**:
```yaml
# Names
firstname, fname, first, given_name → first_name
lastname, lname, last, surname → last_name

# Contact
email_address, emailaddress, email_addr → email  
phone, phone_number, telephone, ph → phone_1
mobile, cell, cellphone → phone_1

# Location
state_code, st, province → state
zip, zipcode, postal → postal_code
```

**Business Fields**:
```yaml
# Consent
optin_date, consent_date → opted_in_at
ip, ipaddress, ip_addr → ip_address
url, optin_url, source_url → xxTrustedFormCertUrl

# Tracking
source, lead_source, traffic_source → source_name
campaign, campaign_name, utm_campaign → campaign
```

### Best Practices for Inbound Mapping

**DO:**
- ✅ Keep it simple - just rename fields
- ✅ Map only fields that need renaming
- ✅ Use consistent internal names
- ✅ Document unusual mappings

**DON'T:**
- ❌ Transform data (let types handle that)
- ❌ Combine fields (save for outbound)
- ❌ Add logic (use rules instead)
- ❌ Map fields that already match

**Example - Good Inbound Mapping**:
```yaml
# Simple renaming only
email_addr → email
phone_num → phone_1
state_abbr → state
```

**Example - Bad Inbound Mapping**:
```yaml
# Don't do this inbound!
{{lowercase email_addr}} → email  # Don't transform
{{fname}} {{lname}} → full_name   # Don't combine
```

## Understanding Outbound Mappings

### Full Transformation Power

Outbound mappings can do everything:

**Field Combination**:
```yaml
Property: full_name
Value: {{lead.first_name}} {{lead.last_name}}
```

**Formatting**:
```yaml
Property: formatted_phone
Value: {{format lead.phone_1 "(###) ###-####"}}
```

**Conditional Logic**:
```yaml
Property: lead_type
Value: {{#if lead.loan_amount > 100000}}Premium{{else}}Standard{{/if}}
```

**Type Components**:
```yaml
Property: area_code
Value: {{lead.phone_1.area}}

Property: email_domain
Value: {{lead.email.domain}}
```

### Complex Mapping Examples

**Build Nested Objects**:
```yaml
# Create structured data for APIs
Property: applicant.name.first
Value: {{lead.first_name}}

Property: applicant.name.last
Value: {{lead.last_name}}

Property: applicant.contact.email
Value: {{lead.email}}

Property: applicant.contact.phone.primary
Value: {{lead.phone_1}}

# Results in:
{
  "applicant": {
    "name": {
      "first": "John",
      "last": "Doe"
    },
    "contact": {
      "email": "john@example.com",
      "phone": {
        "primary": "5551234567"
      }
    }
  }
}
```

**Create Arrays**:
```yaml
Property: phone_numbers.0
Value: {{lead.phone_1}}

Property: phone_numbers.1
Value: {{lead.phone_2}}

Property: tags.0
Value: web-lead

Property: tags.1
Value: {{lead.state}}

Property: tags.2
Value: {{#if lead.loan_amount > 50000}}high-value{{/if}}
```

**Date Formatting**:
```yaml
Property: submission_date
Value: {{format lead.timestamp "YYYY-MM-DD"}}

Property: submission_time
Value: {{format lead.timestamp "HH:mm:ss"}}

Property: submitted_at_iso
Value: {{lead.timestamp}}
```

## Conditional Mappings

### Rule-Based Application

Only apply mappings when conditions are met:

**Configuration**:
```yaml
Property: premium_flag
Value: true
Rule: loan_amount > 100000 AND state = "CA"
```

**Use Cases**:
- Add flags for high-value leads
- Include special fields for certain states
- Apply partner-specific data
- Time-based field inclusion

### Dynamic Field Selection

Include fields based on recipient:

**For CRM Delivery**:
```yaml
# Always include
first_name → FirstName
last_name → LastName
email → Email

# Only if present
{{#if lead.phone_2}}
  phone_2 → SecondaryPhone
{{/if}}

# Only for certain recipients
{{#if recipient.requires_consent}}
  opted_in_at → ConsentTimestamp
  ip_address → ConsentIP
{{/if}}
```

## Troubleshooting Mappings

### Common Issues

**Data in Wrong Fields**

*Symptom*: Phone number appears in email field
*Cause*: Incorrect mapping configuration
*Solution*:
1. Review source data structure
2. Check mapping configuration
3. Test with sample data
4. Verify in events

**Missing Data**

*Symptom*: Expected fields are empty
*Cause*: Fields not mapped or wrong path
*Solution*:
1. Confirm field exists in source data
2. Check field name spelling
3. Verify nested path syntax
4. Look for array vs object issues

**Type Conflicts**

*Symptom*: Data rejected by type validation
*Cause*: Incompatible data mapped to typed field
*Solution*:
1. Check source data format
2. Ensure correct type selection
3. Consider using text type temporarily
4. Add format transformation if needed

### Debugging Techniques

**1. Use Events**
- Check source.submitted event
- See exact data received
- Verify mapping applied
- Track transformation

**2. Test Mode**
- Submit single test lead
- Use source test panel
- Check field-by-field
- Verify output format

**3. Logging**
- Enable detailed logging
- Capture raw payloads
- Track mapping process
- Identify failures

## Advanced Mapping Techniques

### Template Functions

Use Handlebars helpers in outbound mappings:

**String Manipulation**:
```yaml
# Concatenation
{{lead.first_name}} {{lead.last_name}}

# Substring (first 3 chars)
{{substr lead.postal_code 0 3}}

# Replace
{{replace lead.phone "-" ""}}
```

**Conditional Content**:
```yaml
# If/else
{{#if lead.email}}{{lead.email}}{{else}}noemail@example.com{{/if}}

# Switch-like
{{#compare lead.state "==" "CA"}}California{{/compare}}
{{#compare lead.state "==" "TX"}}Texas{{/compare}}
```

**Formatting**:
```yaml
# Numbers
{{format lead.loan_amount "$#,###"}}

# Dates
{{format lead.timestamp "MMM DD, YYYY"}}

# Phone
{{format lead.phone "+1 (###) ###-####"}}
```

### Performance Optimization

**For Inbound**:
- Map only necessary fields
- Avoid complex paths
- Skip matching names
- Batch similar mappings

**For Outbound**:
- Minimize template complexity
- Cache repeated calculations
- Use type components
- Order efficiently

### Mapping Patterns Library

**E-commerce Lead**:
```yaml
# Inbound
product_interest → product
purchase_timeframe → timeframe
budget_range → budget

# Outbound  
Property: lead_score
Value: {{#compare budget ">" "5000"}}high{{else}}standard{{/compare}}

Property: urgency
Value: {{#compare timeframe "==" "immediate"}}hot{{else}}warm{{/compare}}
```

**Insurance Lead**:
```yaml
# Inbound
coverage_type → insurance_type
current_carrier → carrier
policy_expires → expiration_date

# Outbound
Property: days_until_expiration  
Value: {{datediff expiration_date timestamp "days"}}

Property: shopping_window
Value: {{#compare days_until_expiration "<" "30"}}active{{else}}future{{/compare}}
```

## Mapping Strategy

### Design Principles

**1. Standardize Internally**
- Pick consistent field names
- Document your standards
- Use across all flows
- Train your team

**2. Accommodate Externally**
- Accept any vendor format
- Deliver any buyer format
- Never force partners to change
- Be the universal adapter

**3. Keep It Maintainable**
- Document complex mappings
- Use descriptive names
- Group related mappings
- Review regularly

### Migration Approach

Moving from chaos to order:

**Phase 1: Inventory**
- List all current sources
- Document field variations
- Identify common patterns
- Plan standard names

**Phase 2: Standardize**
- Define internal schema
- Create mapping library
- Update source configs
- Test thoroughly

**Phase 3: Optimize**
- Remove redundant mappings
- Consolidate similar fields
- Add helpful documentation
- Monitor usage

## Your Next Steps

### Essential Reading
1. **[Templates](/reference/templates)** - Power up your outbound mappings
2. **[Types](/reference/types)** - Understand data parsing
3. **[Acceptance Criteria](/flows/lead-submission/acceptance-criteria)** - Use mapped fields effectively

### Practice Exercises
1. Map a vendor's test payload
2. Create nested object structure  
3. Add conditional mappings
4. Debug with events

### Advanced Topics
- **[Dynamic Mappings](/help-guide/advanced/dynamic-mappings)** - Rule-based transformation
- **[Mapping Libraries](/help-guide/patterns/mapping-libraries)** - Reusable patterns
- **[Performance Tuning](/help-guide/optimization/mapping-performance)** - Speed matters

---

🎯 **Remember**: Good mappings are invisible - data just flows. Invest in clear, consistent mappings, and you'll never worry about field names again.

*Next: [Acceptance Criteria](/flows/lead-submission/acceptance-criteria) - Now that your fields are mapped, let's ensure only quality leads get through.*