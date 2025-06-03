---
title: Custom Fields Advanced Guide
sidebar_label: Custom Fields Advanced
description: Comprehensive guide to creating and managing custom fields in LeadConduit when standard fields don't meet your needs
---

# Custom Fields Advanced Guide

LeadConduit provides hundreds of Standard Fields with built-in type verification, but sometimes you need fields unique to your business requirements. This guide covers everything you need to know about creating and managing custom fields effectively.

## When to Use Custom Fields

### Standard Fields vs Custom Fields

**Use Standard Fields when:**
- The data type already exists (email, phone, zip code, etc.)
- You need built-in validation
- You want consistent formatting across flows
- The field is commonly used in lead processing

**Use Custom Fields when:**
- Your data doesn't fit any standard field type
- You need industry-specific fields
- You have unique business requirements
- You're tracking proprietary information

### Common Custom Field Use Cases

1. **Industry-Specific Data**
   - Insurance: Policy types, coverage amounts, deductibles
   - Solar: Roof type, shade percentage, panel preferences
   - Education: Degree interests, enrollment timeline, financial aid needs
   - Mortgage: Property type, down payment amount, refinance purpose

2. **Internal Tracking**
   - Campaign identifiers
   - A/B test variants
   - Lead quality scores
   - Custom source codes

3. **Partner Requirements**
   - Vendor-specific IDs
   - Custom tracking parameters
   - Proprietary data points
   - Integration-specific fields

## Creating Custom Fields

### Prerequisites

1. **Define a Custom Suffix**
   - Required for all custom fields in your account
   - Must be unique to your organization
   - Used in all custom field parameter names
   - Cannot be changed once set

2. **Plan Your Fields**
   - Document field purposes
   - Define validation requirements
   - Establish naming conventions
   - Consider data types

### Step-by-Step Creation Process

1. **Navigate to Custom Fields**
   ```
   Account Settings → Custom Fields → Add Custom Field
   ```

2. **Configure Basic Settings**
   - **Field Name**: Descriptive, following your naming convention
   - **Parameter Name**: Automatically generated with your suffix
   - **Description**: Clear explanation of the field's purpose
   - **Field Type**: Select appropriate type for validation

3. **Set Validation Rules**
   - Required/Optional
   - Min/Max length
   - Pattern matching (regex)
   - Default values

### Field Configuration Example

```json
{
  "field_name": "Lead Temperature",
  "parameter_name": "lead_temperature_abc123",
  "description": "Sales qualification score from initial contact",
  "type": "string",
  "validation": {
    "required": true,
    "pattern": "^(hot|warm|cold)$",
    "default": "warm"
  }
}
```

## Naming Conventions

### Best Practices

1. **Be Descriptive**
   - ❌ Bad: `cf1`, `data`, `misc`
   - ✅ Good: `insurance_type`, `solar_roof_angle`, `lead_quality_score`

2. **Use Consistent Format**
   - Choose one: `snake_case`, `camelCase`, or `kebab-case`
   - Stick to it across all custom fields
   - Document your choice

3. **Include Context**
   - Prefix with category: `billing_`, `tracking_`, `qualification_`
   - Suffix with type if needed: `_date`, `_amount`, `_flag`

4. **Avoid Reserved Words**
   - Don't use: `id`, `type`, `status`, `class`
   - Check against standard field names
   - Verify against system reserved terms

### Naming Convention Examples

```
Category_Specific_Descriptor_Type

Examples:
- mortgage_loan_amount_usd
- insurance_policy_type_code
- solar_system_size_kw
- education_program_start_date
- tracking_campaign_source_id
```

## Type Selection Guide

### Available Field Types

1. **String**
   - General text data
   - Codes and identifiers
   - Names and descriptions
   - No format validation

2. **Number**
   - Integers or decimals
   - Calculations possible
   - Range validation
   - Format: `12345.67`

3. **Date/DateTime**
   - Date: `YYYY-MM-DD`
   - DateTime: `YYYY-MM-DD HH:MM:SS`
   - Timezone considerations
   - Age calculations

4. **Boolean**
   - True/False values
   - Yes/No questions
   - Flags and switches
   - Format: `true`, `false`, `1`, `0`

5. **Email**
   - Email validation
   - Domain extraction
   - Format checking

6. **Phone**
   - Phone number validation
   - Country code support
   - Extension handling

7. **URL**
   - URL validation
   - Protocol checking
   - Domain extraction

### Type Selection Matrix

| Data Type | Use When | Example Fields |
|-----------|----------|----------------|
| String | Flexible text needed | `product_interest`, `comments` |
| Number | Mathematical operations | `loan_amount`, `credit_score` |
| Date | Time-based data | `birth_date`, `policy_start` |
| Boolean | Binary choices | `has_insurance`, `is_homeowner` |
| Email | Email with validation | `secondary_email`, `work_email` |
| Phone | Phone with validation | `alternate_phone`, `business_phone` |
| URL | Web addresses | `landing_page`, `referrer_url` |

## Validation Patterns

### Common Regex Patterns

```javascript
// US ZIP Code
^\d{5}(-\d{4})?$

// Social Security Number (masked)
^\d{3}-\d{2}-\d{4}$

// Policy Number (alphanumeric)
^[A-Z]{2}\d{6}$

// Currency Amount
^\$?\d{1,3}(,\d{3})*(\.\d{2})?$

// Product SKU
^[A-Z]{3}-\d{4}-[A-Z0-9]{2}$
```

### Validation Rules Examples

1. **Credit Score Range**
   ```json
   {
     "type": "number",
     "min": 300,
     "max": 850,
     "required": true
   }
   ```

2. **State Code**
   ```json
   {
     "type": "string",
     "pattern": "^[A-Z]{2}$",
     "required": true
   }
   ```

3. **Loan Amount**
   ```json
   {
     "type": "number",
     "min": 1000,
     "max": 1000000,
     "decimal_places": 2
   }
   ```

## Best Practices

### Field Management

1. **Documentation**
   - Maintain a field dictionary
   - Document validation rules
   - Track field usage across flows
   - Note deprecation plans

2. **Versioning**
   - Don't delete fields in use
   - Create new versions when changing
   - Maintain backwards compatibility
   - Document migration paths

3. **Performance**
   - Limit total custom fields
   - Use appropriate field types
   - Avoid complex regex when possible
   - Index frequently searched fields

### Security Considerations

1. **Sensitive Data**
   - Don't store full SSN
   - Mask credit card numbers
   - Encrypt where required
   - Follow compliance requirements

2. **Access Control**
   - Limit who can create fields
   - Control field visibility
   - Audit field usage
   - Monitor data access

### Integration Guidelines

1. **Standardization**
   - Match partner field names
   - Use consistent formats
   - Document mappings
   - Test thoroughly

2. **Flexibility**
   - Plan for changes
   - Use generic names when appropriate
   - Consider future requirements
   - Build in extensibility

## Advanced Techniques

### Dynamic Field Creation

```javascript
// Via API
POST /api/custom-fields
{
  "name": "Dynamic Score",
  "type": "number",
  "validation": {
    "min": 0,
    "max": 100
  }
}
```

### Calculated Fields

Use mappings to create calculated custom fields:

```javascript
// Lifetime Value Calculation
if (monthly_payment && contract_months) {
  ltv_amount = monthly_payment * contract_months;
}
```

### Field Dependencies

Create conditional field requirements:

```javascript
// If loan_type is "mortgage", require property_value
if (lead.loan_type === "mortgage") {
  required_fields.push("property_value");
}
```

## Troubleshooting

### Common Issues

1. **"Field not found" Errors**
   - Verify exact parameter name
   - Check custom suffix
   - Ensure field is created
   - Confirm field permissions

2. **Validation Failures**
   - Test regex patterns
   - Check data types
   - Verify required fields
   - Review error messages

3. **Integration Problems**
   - Match field formats
   - Check character limits
   - Verify data types
   - Test edge cases

### Debugging Steps

1. Test with sample data
2. Check field configuration
3. Review validation rules
4. Examine error logs
5. Verify integrations

## Migration Guide

### Moving from Standard to Custom

1. **Plan the Migration**
   - Identify affected flows
   - Document current usage
   - Create migration timeline
   - Notify stakeholders

2. **Create New Fields**
   - Set up custom fields
   - Test thoroughly
   - Verify validation
   - Document differences

3. **Update Flows**
   - Add field mappings
   - Update integrations
   - Test all paths
   - Monitor results

4. **Deprecate Old Fields**
   - Gradual transition
   - Maintain both temporarily
   - Complete migration
   - Remove old references

## Examples by Industry

### Insurance
```
policy_type_ins
coverage_amount_ins
deductible_amount_ins
previous_carrier_ins
claim_history_ins
```

### Solar
```
roof_type_solar
shade_percentage_solar
system_size_kw_solar
monthly_bill_solar
utility_company_solar
```

### Education
```
degree_level_edu
program_interest_edu
start_term_edu
financial_aid_edu
campus_preference_edu
```

### Mortgage
```
property_type_mtg
purchase_price_mtg
down_payment_mtg
credit_score_mtg
income_annual_mtg
```

---

## See Also

- [Field Types Reference](/docs/v2/reference/field-types)
- [Validation Rules Guide](/docs/v2/guide/data-management/validation)
- [Integration Mapping](/docs/v2/guide/integrations/mapping)
- [Complete Glossary](/docs/v2/reference/complete-glossary)