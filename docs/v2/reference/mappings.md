---
title: Mappings
description: The data transformation engine that reshapes information between systems
tags:
  - mappings-focused
  - reference
  - technical
  - core-concept
  - data-management
  - source-configuration
  - delivery
  - integrations
  - templates
  - rules
  - data-transformation
  - field-mapping
---

# Mappings

## What are Mappings?

Mappings are LeadConduit's data transformation orchestrators. They bridge the gap between how data arrives and how it needs to be delivered, handling everything from simple field renaming to complex conditional transformations. Think of mappings as smart translators that know not just what to transform, but when and how to transform it.

## Why Mappings Matter

Every system speaks a different language:
- Vendors send `fname`, your CRM expects `First_Name__c`
- You have separate fields, buyers want them combined
- Some recipients need phone numbers formatted, others want digits only
- Business rules dictate which fields to include when

Without mappings, you'd need custom code for every connection. With mappings, you configure once and let LeadConduit handle the translation.

## The Two Faces of Mappings

Mappings serve two distinct purposes:

### Inbound Mappings (Source → LeadConduit)

**Purpose:** Rename vendor fields to match your standard fields

**When used:** During lead submission, before the lead object exists

**What they do:**
- Simple field renaming
- NO data transformation (let types handle that)
- Map vendor's names to your names

**Example:**
```
Vendor sends: fname → Your field: first_name
Vendor sends: email_addr → Your field: email  
Vendor sends: primary_phone → Your field: phone_1
```

### Outbound Mappings (LeadConduit → Recipient)

**Purpose:** Transform your data to match recipient requirements

**When used:** During delivery, after all processing is complete

**What they do:**
- Complex transformations
- Field combinations
- Conditional inclusion
- Format adjustments

**Example:**
```
Your data: first_name + last_name → Their field: FullName
Your data: phone (normalized) → Their field: FormattedPhone
Your data: Various fields → Their structure: Complex nested object
```

## How Mappings Work

Every mapping has three parts:

### 1. Property (WHERE)
The destination field name:
- Simple: `email`
- Nested: `contact.primary.email`
- Array: `interests.0`

### 2. Value (WHAT)
The data to assign, using [templates](templates.md):
- Direct: `{{lead.email}}`
- Combined: `{{first_name}} {{last_name}}`
- Transformed: `{{format phone "(###) ###-####"}}`

### 3. Rules (WHEN) - Optional
Conditions for applying the mapping:
- Always apply if no rules
- Apply only when rules match
- Enable conditional transformations

## Mapping Patterns

### Basic Field Renaming (Inbound)

When vendors use different field names:

| Vendor Sends | Maps To | Configuration |
|--------------|---------|---------------|
| `contact_email` | `email` | `property: "email", value: "{{contact_email}}"` |
| `fname` | `first_name` | `property: "first_name", value: "{{fname}}"` |
| `phone_num` | `phone_1` | `property: "phone_1", value: "{{phone_num}}"` |

**Important:** Don't transform data during inbound mapping. If vendor sends `EMAIL@EXAMPLE.COM`, just map it - the email type will lowercase it automatically.

### Field Combination (Outbound)

When recipients want consolidated data:

```
Combine names:
property: "full_name"
value: "{{lead.first_name}} {{lead.last_name}}"

Format address:
property: "complete_address"  
value: "{{lead.address_1}}, {{lead.city}}, {{lead.state}} {{lead.postal_code}}"

Build description:
property: "lead_summary"
value: "{{lead.product_interest}} lead from {{lead.state}} - ${{loan_amount}}"
```

### Conditional Fields

Include fields based on conditions:

**Premium Lead Flag:**
```
property: "is_premium"
value: "true"
rule: loan_amount > 100000
```

**State-Specific Field:**
```
property: "california_resident"
value: "yes"
rule: state equals "CA"
```

**Quality Indicator:**
```
property: "verified_lead"
value: "true"  
rule: email.valid is true AND phone_1.valid is true
```

### Nested Object Building

Create complex structures for APIs:

```
Build applicant object:
├── property: "applicant.name.first" = "{{lead.first_name}}"
├── property: "applicant.name.last" = "{{lead.last_name}}"
├── property: "applicant.contact.email" = "{{lead.email}}"
├── property: "applicant.contact.phone" = "{{lead.phone_1}}"
└── property: "applicant.location.state" = "{{lead.state}}"

Results in:
{
  "applicant": {
    "name": {
      "first": "John",
      "last": "Doe"
    },
    "contact": {
      "email": "john@example.com",
      "phone": "5551234567"
    },
    "location": {
      "state": "CA"
    }
  }
}
```

### Array Construction

Build lists dynamically:

```
Static array:
├── property: "phone_numbers.0" = "{{lead.phone_1}}"
├── property: "phone_numbers.1" = "{{lead.phone_2}}"
└── property: "phone_numbers.2" = "{{lead.phone_3}}"

Conditional array:
├── property: "tags.0" = "web-lead"
├── property: "tags.1" = "premium" (if loan_amount > 50000)
└── property: "tags.2" = "urgent" (if timeframe = "immediately")
```

## Best Practices

### For Inbound Mappings

**DO:**
- Map only when field names differ
- Use simple variable references: `{{fieldname}}`
- Trust types to handle formatting
- Keep mappings minimal

**DON'T:**
- Transform data (no lowercasing, formatting, etc.)
- Use complex templates
- Add lead. prefix (it doesn't exist yet!)
- Map fields that already match

### For Outbound Mappings

**DO:**
- Use parsed components: `{{lead.phone.area}}`
- Format data to match recipient needs
- Build required structures
- Document complex mappings

**DON'T:**
- Re-parse already parsed data
- Use substring when components exist
- Ignore recipient requirements
- Over-complicate simple mappings

### Performance Tips

1. **Order matters** - Mappings apply sequentially
2. **Simple is fast** - Direct references outperform complex templates
3. **Rules add overhead** - Only use when needed
4. **Batch related** - Group similar mappings together

## Common Use Cases

### CRM Integration
```
Salesforce mapping:
├── "FirstName" = "{{lead.first_name}}"
├── "LastName" = "{{lead.last_name}}"
├── "Email" = "{{lead.email}}"
├── "Phone" = "{{lead.phone_1}}"
├── "Lead_Source__c" = "{{source.name}}"
└── "UTM_Campaign__c" = "{{source.utm_campaign}}"
```

### Buyer Delivery
```
Buyer's required format:
├── "contact_name" = "{{lead.first_name}} {{lead.last_name}}"
├── "contact_phone" = "{{format lead.phone_1 '(###) ###-####'}}"
├── "contact_email" = "{{lead.email}}"
├── "loan_amount_requested" = "{{loan_amount}}"
├── "state_code" = "{{lead.state}}"
└── "exclusive_lead" = "true" (if source = "exclusive-campaign")
```

### Email Service Provider
```
ESP requirements:
├── "email_address" = "{{lead.email}}"
├── "merge_fields.FNAME" = "{{lead.first_name}}"
├── "merge_fields.LNAME" = "{{lead.last_name}}"
├── "merge_fields.PHONE" = "{{lead.phone_1}}"
├── "tags.0" = "{{product_interest}}"
└── "tags.1" = "leadconduit"
```

## Technical Details

### Processing Order

1. **Rule evaluation** - Should this mapping apply?
2. **Template resolution** - Calculate the value
3. **Value validation** - Ensure value is usable
4. **Property assignment** - Place at destination
5. **Success tracking** - Record application

### Empty Value Handling

- Template results that are empty (after trimming) are skipped
- Explicit empty strings (`""`) ARE applied
- Whitespace is automatically trimmed
- `null` and `undefined` are skipped

### Type Preservation

Simple variable templates preserve types:
```
{{lead.age}} → Number (42)
{{lead.interests}} → Array (["golf", "tennis"])
{{lead.verified}} → Boolean (true)

But concatenation creates strings:
"Age: {{lead.age}}" → String ("Age: 42")
```

### Error Handling

- Individual mapping failures don't stop processing
- Errors are logged for debugging
- Other mappings continue to apply
- Partial success is possible

## Working with Other Concepts

### With Templates
[Templates](templates.md) provide the computational power:
- Variable access: `{{lead.email}}`
- Formatting: `{{format date 'MM/DD/YYYY'}}`
- Logic: `{{#if premium}}VIP{{else}}Standard{{/if}}`
- Helpers: All template capabilities available

### With Rules
[Rules](rules.md) control when mappings apply:
- Simple conditions: `state equals "CA"`
- Complex logic: Multiple conditions with AND/OR
- Business rules: Premium lead detection
- Data quality: Only map if valid

### With Types
[Types](types.md) have already parsed your data:
- Use components: `{{lead.email.domain}}`
- Trust normalization: Email already lowercased
- Access validity: `{{lead.phone.valid}}`
- Leverage intelligence: Pre-extracted values

## Key Takeaways

1. **Two purposes** - Inbound (renaming) vs Outbound (transformation)
2. **Three parts** - Property (where) + Value (what) + Rules (when)
3. **Inbound is simple** - Just rename, don't transform
4. **Outbound is powerful** - Full transformation capabilities
5. **Order matters** - Sequential processing allows overwrites
6. **Conditional logic** - Rules make mappings smart
7. **Type-aware** - Use pre-parsed components
8. **Template-powered** - Full computational abilities
9. **Error-resilient** - Failures don't break flows
10. **Integration-ready** - Essential for data exchange

---

*Mappings are the universal translators of LeadConduit, ensuring data flows seamlessly between systems regardless of format differences. Master mappings, and you'll never worry about integration incompatibilities again.*