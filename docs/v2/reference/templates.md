---
title: Templates
description: The dynamic data engine that brings your lead information to life
tags:
  - templates-focused
  - reference
  - technical
  - core-concept
  - data-access
---

# Templates

## What are Templates?

Templates are LeadConduit's dynamic data access engine. They're the bridge between static configuration and live data, allowing you to reference, transform, and compute values on the fly. Think of templates as smart placeholders that come alive with each lead, pulling the right data at the right moment and presenting it exactly how you need it.

Templates power everything dynamic in LeadConduit - from simple field references in mappings to complex conditional logic in delivery configurations. They're what make your flows intelligent and adaptive.

## Why Templates Matter

Static configurations can't handle dynamic needs:
- Every lead has different data
- Recipients need specific formats
- Business logic requires calculations
- Conditional content depends on context

Without templates, you'd need hardcoded values for every scenario. With templates, you write the pattern once and let LeadConduit fill in the specifics for each lead.

## How Templates Work

### The Mustache Foundation

LeadConduit uses Handlebars templates (Mustache-compatible with extras):

**Basic Syntax:**
```
{{variable}}              - Simple reference
{{helper parameter}}      - Helper function
{{#block}}...{{/block}}   - Block helper
```

**Key Features:**
- Double curly braces mark dynamic content
- Automatic HTML escaping for safety
- Dot notation for nested access
- Helpers for transformation

### Variable References

Access any data in the lead context:

**Simple Fields:**
```
{{lead.email}}           → "john@example.com"
{{lead.first_name}}      → "John"
{{loan_amount}}          → "50000"
```

**Nested Data:**
```
{{lead.phone.area}}      → "512" (from parsed phone)
{{source.name}}          → "Web Form A"
{{appended.trustedform.cert_id}} → "abc123..."
```

**Array Access:**
```
{{interests.0}}          → "insurance" (first interest)
{{phones.1.number}}      → "5555551235" (second phone)
```

## Template Contexts

Templates have access to different data depending on where they're used:

### Lead Context
The primary context with all lead data:
```
{{lead.*}}               - All lead fields
{{source.*}}             - Source information
{{outcome.*}}            - Processing results
{{appended.*}}           - Enhancement data
```

### Special Contexts

**In Mappings:**
- Inbound: Raw submission data (no `lead.` prefix yet)
- Outbound: Full lead object with all processing

**In Rules:**
- Left-hand values can use templates
- Right-hand values can use templates
- Access to full lead context

**In Delivery:**
- All lead data
- Previous step results
- System variables

## Built-in Helpers

### Formatting Helpers

Transform data presentation:

**format** - Universal formatter
```
{{format phone "(###) ###-####"}}      → "(512) 555-1234"
{{format date "YYYY-MM-DD"}}           → "2024-01-15"
{{format ssn "###-##-####"}}           → "123-45-6789"
```

**case transformations**
```
{{lowercase email}}                     → "john@example.com"
{{uppercase state}}                     → "TX"
{{capitalize first_name}}               → "John"
```

### Logical Helpers

Control flow and conditions:

**if/else** - Conditional content
```
{{#if lead.phone_2}}
  Secondary: {{lead.phone_2}}
{{else}}
  No secondary phone
{{/if}}
```

**unless** - Negative conditions
```
{{#unless email.valid}}
  Invalid email provided
{{/unless}}
```

**each** - Iterate arrays
```
{{#each interests}}
  - {{this}}
{{/each}}
```

### Comparison Helpers

For complex logic:

**Basic comparisons**
```
{{#compare age ">" 25}}
  Eligible for premium
{{/compare}}

{{#compare state "==" "TX"}}
  Texas resident
{{/compare}}
```

**includes** - Check membership
```
{{#includes state "TX,CA,NY"}}
  In target states
{{/includes}}
```

### Data Helpers

Extract and compute:

**join** - Combine arrays
```
{{join phones ", "}}                    → "555-1234, 555-5678"
```

**default** - Fallback values
```
{{default phone_2 "Not provided"}}     → "Not provided" (if empty)
```

**now** - Current timestamp
```
{{now "YYYY-MM-DD HH:mm:ss"}}         → "2024-01-15 14:30:00"
```

## Common Template Patterns

### Safe Data Access

Handle missing data gracefully:

```
Name: {{default lead.first_name "Friend"}}
Phone: {{default lead.phone "No phone provided"}}
```

### Conditional Formatting

Format based on conditions:

```
{{#if lead.phone.valid}}
  {{format lead.phone "(###) ###-####"}}
{{else}}
  {{lead.phone}} (unverified)
{{/if}}
```

### Building URLs

Construct dynamic links:

```
https://crm.example.com/leads/{{lead.id}}?source={{source.name}}&date={{format timestamp "YYYY-MM-DD"}}
```

### Complex Objects

Build structured data:

```
{
  "name": "{{lead.first_name}} {{lead.last_name}}",
  "contact": {
    "email": "{{lead.email}}",
    "phone": "{{lead.phone}}"
  },
  "metadata": {
    "source": "{{source.name}}",
    "timestamp": "{{timestamp}}",
    "premium": {{#compare loan_amount ">" 50000}}true{{else}}false{{/compare}}
  }
}
```

### List Building

Create dynamic lists:

```
Contact Methods:
{{#if lead.email}}- Email: {{lead.email}}{{/if}}
{{#if lead.phone}}- Phone: {{lead.phone}}{{/if}}
{{#if lead.phone_2}}- Alt Phone: {{lead.phone_2}}{{/if}}
```

## Advanced Techniques

### Nested Helpers

Combine helpers for complex operations:

```
{{uppercase (default lead.state "XX")}}
{{format (now) "MM/DD/YYYY"}}
```

### Type Component Access

Use parsed data intelligently:

```
Email domain: {{lead.email.domain}}
Phone area code: {{lead.phone.area}}
Age from DOB: {{lead.dob.age}}
```

### Template Fragments

Reuse common patterns:

```
{{#*inline "address"}}
  {{lead.address}}, {{lead.city}}, {{lead.state}} {{lead.postal_code}}
{{/inline}}

Shipping: {{> address}}
Billing: {{> address}}
```

## Template Limitations

### What Templates CAN'T Do

1. **Complex string manipulation** - No split/slice
2. **Mathematical operations** - No arithmetic 
3. **Array filtering** - No selecting subsets
4. **Custom functions** - No user-defined helpers
5. **External data access** - Only context data

### Working Around Limitations

**Need string parts?** Use type components:
```
Don't: Try to split email
Do: Use {{email.local}} and {{email.domain}}
```

**Need calculations?** Pre-compute in rules:
```
Don't: Try {{price * quantity}}
Do: Create computed field, reference it
```

**Need filtering?** Use conditional blocks:
```
Don't: Try to filter array
Do: Use {{#each}} with {{#if}} inside
```

## Performance Considerations

### Fast Operations
- Simple variable access: `{{lead.email}}`
- Type components: `{{phone.area}}`
- Basic helpers: `{{lowercase name}}`

### Slower Operations
- Multiple nested blocks
- Large iterations
- Complex conditionals
- Many format operations

### Best Practices
1. Use type components over parsing
2. Minimize template complexity
3. Pre-compute when possible
4. Cache formatted values

## Common Use Cases

### In Source Mappings
```
Rename fields on input:
property: "first_name"
value: "{{fname}}"
```

### In Recipient Mappings
```
Transform for delivery:
property: "full_name"
value: "{{lead.first_name}} {{lead.last_name}}"
```

### In Rules
```
Dynamic comparisons:
{{format timestamp "HH"}} is between "09-17"
```

### In Delivery Bodies
```
Build API payloads:
{
  "lead_id": "{{lead.id}}",
  "submitted": "{{format timestamp 'ISO'}}",
  "data": {
    "email": "{{lead.email}}",
    "phone": "{{format lead.phone '+1##########'}}"
  }
}
```

## Integration with Other Concepts

### Templates + Types
Types provide parsed components for templates:
```
{{email.domain}}        - From email type
{{phone.is_mobile}}     - From phone type  
{{postal_code.state}}   - From postal type
```

### Templates + Rules
Templates make rules dynamic:
```
Rule LHV: {{format timestamp "YYYY-MM-DD"}}
Rule RHV: {{source.start_date}}
```

### Templates + Mappings
Templates power mapping transformations:
```
Simple: {{lead.email}}
Complex: {{#if premium}}VIP-{{/if}}{{lead.id}}
```

## Error Handling

### Missing Variables
- Return empty string (not error)
- Use `{{default}}` for fallbacks
- Check with `{{#if}}` first

### Invalid Templates
- Caught at configuration time
- Clear error messages
- Won't break at runtime

### Type Mismatches
- Automatic string conversion
- Numbers become strings
- Booleans become "true"/"false"

## Best Practices

### Clarity
1. Use meaningful variable names
2. Add comments in complex templates
3. Break complex logic into steps
4. Document special handling

### Safety
1. Always escape HTML (automatic)
2. Validate before using
3. Handle missing data
4. Test edge cases

### Performance
1. Prefer simple references
2. Use type components
3. Minimize nesting
4. Avoid redundant formatting

### Maintenance
1. Consistent formatting style
2. Reuse common patterns
3. Document assumptions
4. Version control templates

## Related Concepts

- **[Types](types.md)** - Provide parsed components for templates
- **[Mappings](mappings.md)** - Primary users of template functionality
- **[Rules](rules.md)** - Use templates for dynamic conditions
- **[Integrations](integrations.md)** - Templates format data for delivery

---

*Templates are the soul of dynamic configuration in LeadConduit. They transform static patterns into living, breathing data flows that adapt to each lead's unique characteristics. Master templates, and you'll unlock the full power of intelligent lead processing.*