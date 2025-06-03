# LeadConduit Mappings

## Overview

Mappings are the data transformation orchestrators of LeadConduit. They bring together templates and rules to conditionally reshape data as it flows through the system. Think of mappings as smart assignment statements that know when to apply transformations and where to put the results.

Mappings answer a critical question:
**How do I transform data from what I have to what I need?**

Mappings complete the trinity with rules and templates:
- **Templates** compute the values to assign
- **Rules** determine when to apply mappings
- **Mappings** orchestrate the transformation process

## Why Mappings Exist

### The Format Mismatch Problem
Data rarely arrives in the format you need:
- Sources send `fname`, you need `first_name`
- You have separate fields, recipients want combined
- Dates arrive as "MM/DD/YYYY", system needs "YYYY-MM-DD"
- Phone numbers come formatted, you need digits only

Mappings bridge these gaps without custom code.

### The Conditional Transformation Problem
Not all data should be transformed the same way:
- Premium leads need special fields
- Different states require different formatting
- Some buyers want phone numbers, others don't
- Business rules dictate what data to include

Mappings apply transformations selectively based on conditions.

### The Integration Problem
Every system speaks a different language:
- CRMs expect specific field names
- APIs require particular structures
- Partners have unique requirements
- Standards vary by industry

Mappings translate between these languages dynamically.

## Core Concepts

### Mapping Structure

Every mapping has three parts:

1. **Property**: Where to put the value (target)
2. **Value**: What value to assign (using templates)
3. **Rule Set**: When to apply this mapping (optional)

Example:
```
property: "customer_name"
value: "{{lead.first_name}} {{lead.last_name}}"
rule_set: { rules: [{ lhv: "lead.state", op: "is equal to", rhv: "TX" }] }
```

### The Two Faces of Mapping

Mappings serve two distinct purposes in LeadConduit:

#### Inbound Mapping (Source → LeadConduit)
**Purpose**: Rename fields to match LeadConduit standards
**When**: Before the lead object exists
**Context**: Raw submission data

Example: Source sends non-standard names
```
fname → lead.first_name
email_address → lead.email
phone_number → lead.phone_1
```

#### Outbound Mapping (LeadConduit → Recipient)  
**Purpose**: Transform data to match recipient requirements
**When**: After lead processing
**Context**: Full lead object with all enhancements

Example: Recipient needs specific format
```
lead.first_name + lead.last_name → FullName
format(lead.phone) → FormattedPhone
lead.email.domain → EmailDomain
```

### Property Path Power

The property field uses dot notation for complex structures:

**Simple Assignment**:
```
property: "email"
```

**Nested Objects**:
```
property: "contact.primary.email"
Creates: { contact: { primary: { email: "..." } } }
```

**Array Elements**:
```
property: "tags.0"
property: "tags.1"
Creates: { tags: ["first", "second"] }
```

**Numeric Keys**:
```
property: "data{123}.value"
Creates: { data: { "123": { value: "..." } } }
```

## How Mappings Work

### The Mapping Process

1. **Rule Evaluation**: Check if mapping should apply
2. **Template Resolution**: Compute the value
3. **Value Validation**: Ensure value is usable
4. **Property Assignment**: Place value at target path
5. **Success Tracking**: Record what was applied

### Conditional Application

Mappings only apply when their rules pass:

```
// Mapping for Texas residents only
{
  property: "texas_resident",
  value: "true",
  rule_set: {
    rules: [{ 
      lhv: "lead.state", 
      op: "is equal to", 
      rhv: "TX" 
    }]
  }
}
```

Without rules, mappings always apply.

### Value Resolution

Templates in the value field access all available data:

**Simple Access**:
```
value: "{{lead.email}}"
```

**Computed Values**:
```
value: "{{lead.first_name}} {{lead.last_name}}"
```

**Transformed Data**:
```
value: "{{format source_timestamp format='MM/DD/YYYY'}}"
```

**Complex Calculations**:
```
value: "{{math 'base_price * 1.08'}}"
```

## Inbound vs Outbound: Critical Distinctions

### Inbound Mapping Realities

**Context**: You're working with raw submission data BEFORE the lead exists

**Template References**: Use field names directly
```
✅ {{fname}} 
❌ Use lead. prefix (doesn't exist yet during inbound mapping!)
```

**Purpose**: Field renaming, NOT transformation
```
✅ Map "email_addr" to "lead.email"
❌ Don't lowercase - email type handles it
❌ Don't format phones - phone type handles it
```

**Best Practice**: Only map when names don't match
```
If source sends "first_name" → No mapping needed!
If source sends "fname" → Map to "lead.first_name"
```

### Outbound Mapping Realities

**Context**: Full lead object with all type parsing complete

**Template References**: Use full paths
```
✅ {{lead.email}}
✅ {{lead.phone.area}}
✅ {{source.campaign}}
```

**Purpose**: Transform data for recipient needs
```
✅ Combine names: {{lead.first_name}} {{lead.last_name}}
✅ Format phones: ({{lead.phone.area}}) {{lead.phone.exchange}}-{{lead.phone.line}}
✅ Calculate values: {{math "base_price * quantity"}}
```

**Best Practice**: Use type components
```
✅ {{lead.phone.area}} (pre-parsed)
❌ {{substring lead.phone start="1" end="3"}} (re-parsing)
```

## Common Mapping Patterns

### Field Renaming (Inbound)
Source uses different names than LeadConduit:
```
[
  { property: "lead.first_name", value: "{{fname}}" },
  { property: "lead.last_name", value: "{{lname}}" },
  { property: "lead.email", value: "{{contact_email}}" }
]
```

### Field Combining (Outbound)
Recipient wants consolidated fields:
```
{
  property: "full_name",
  value: "{{lead.first_name}} {{lead.last_name}}"
}
```

### Conditional Fields
Include data based on criteria:
```
{
  property: "premium_lead",
  value: "true",
  rule_set: {
    rules: [
      { lhv: "loan_amount", op: "is greater than", rhv: "100000" }
    ]
  }
}
```

### Nested Structure Building
Create complex objects:
```
[
  { property: "applicant.name.first", value: "{{lead.first_name}}" },
  { property: "applicant.name.last", value: "{{lead.last_name}}" },
  { property: "applicant.contact.email", value: "{{lead.email}}" },
  { property: "applicant.contact.phone", value: "{{lead.phone_1}}" }
]
```

### Array Construction
Build lists dynamically:
```
[
  { property: "interests.0", value: "{{product_interest}}" },
  { property: "interests.1", value: "{{secondary_interest}}" },
  { 
    property: "interests.2", 
    value: "premium",
    rule_set: {
      rules: [{ lhv: "annual_salary", op: "is greater than", rhv: "100000" }]
    }
  }
]
```

### Default Value Pattern
Provide fallbacks for missing data:
```
[
  {
    property: "phone",
    value: "{{lead.phone_1}}",
    rule_set: {
      rules: [{ lhv: "lead.phone_1", op: "is not blank" }]
    }
  },
  {
    property: "phone",
    value: "{{lead.phone_2}}",
    rule_set: {
      rules: [
        { lhv: "lead.phone_1", op: "is blank" },
        { lhv: "lead.phone_2", op: "is not blank" }
      ]
    }
  }
]
```

## Special Behaviors

### Sequential Processing
Mappings apply in order, allowing overwrites:
```
[
  { property: "status", value: "pending" },     // Sets status
  { property: "status", value: "verified" }     // Overwrites with verified
]
```

### Empty String Handling
- Template results that are empty (after trimming) are skipped
- Explicit empty strings (`value: ""`) ARE applied
- Whitespace is trimmed from template results

### Type Preservation
When using simple variable templates:
```
value: "{{lead.age}}"        → Number preserved
value: "{{interests}}"       → Array preserved  
value: "Age: {{lead.age}}"   → Converted to string
```

### Error Resilience
- Individual mapping failures don't stop processing
- Errors are logged but processing continues
- Applied mappings are tracked for reporting

## Best Practices

### Inbound Mapping Guidelines

1. **Minimal Touch**: Only map when field names differ
2. **No Transformation**: Let types handle normalization
3. **Direct References**: Use `{{fieldname}}` without prefixes
4. **Trust the System**: Don't lowercase emails or clean phones

### Outbound Mapping Guidelines

1. **Use Components**: `{{lead.phone.area}}` over substring
2. **Format Appropriately**: Match recipient expectations
3. **Combine Thoughtfully**: Create needed structures
4. **Document Requirements**: Comment complex mappings

### Performance Optimization

1. **Order Rules Wisely**: Most likely conditions first
2. **Minimize Templates**: Simple references are faster
3. **Avoid Deep Nesting**: Flatter structures perform better
4. **Batch Related Mappings**: Group by purpose

### Maintenance

1. **Clear Property Names**: Self-documenting paths
2. **Consistent Patterns**: Similar mappings should look similar
3. **Test Edge Cases**: Empty values, missing data
4. **Version Carefully**: Changes affect live flows

## Common Misconceptions

### "Inbound mappings transform data"
**Reality**: Inbound is for field renaming. Types handle transformation automatically.

### "All fields need mapping"
**Reality**: Only map when names don't match. If source sends "email", no mapping needed for "lead.email".

### "Complex logic belongs in mappings"
**Reality**: Complex conditions belong in rules. Mappings apply the results.

### "Mappings create new data"
**Reality**: Mappings reshape existing data. Use integrations for data enhancement.

## Integration with Rules and Templates

### Mappings + Templates
Templates provide the values:
- Access any data via dot notation
- Transform with helpers
- Calculate new values
- Format for output

### Mappings + Rules  
Rules control when mappings apply:
- Filter by lead characteristics
- Apply business logic
- Route-specific transformations
- Conditional field inclusion

### The Complete System
1. **Rules** decide IF a mapping applies
2. **Templates** determine WHAT value to use
3. **Mappings** specify WHERE to put it

This separation creates maintainable, flexible data transformation.

## Key Takeaways

1. **Three Parts**: Property (where) + Value (what) + Rules (when)
2. **Two Purposes**: Inbound (field naming) vs Outbound (transformation)  
3. **Inbound is Simple**: Just rename fields, don't transform
4. **Outbound is Powerful**: Full transformation capabilities
5. **Sequential Processing**: Order matters for overwrites
6. **Conditional Logic**: Rules make mappings smart
7. **Type Aware**: Leverage parsed components
8. **Error Resilient**: Failures don't stop processing
9. **Template Powered**: Full access to template helpers
10. **Integration Ready**: Works seamlessly with types, rules, and templates