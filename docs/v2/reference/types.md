---
title: Types
description: The intelligent parsers that transform messy data into structured, validated information
tags:
  - types-focused
  - reference
  - technical
  - core-concept
  - data-management
  - fields-focused
  - rules-focused
  - validation
  - quality-control
  - universal
  - intermediate
  - data-transformation
---

# Types

## What are Types?

Types are LeadConduit's data parsing and validation engine. They transform the chaotic data that arrives from various sources - phone numbers in a dozen formats, dates in every possible style, yes/no/true/false/1/0 booleans - into clean, structured data your systems can reliably use.

But types do more than just validate. They extract valuable components (like area codes from phone numbers), normalize formats (like lowercasing emails), and provide metadata (like detecting free email providers). Think of them as intelligent parsers that understand data, not just check it.

## Why Types Matter

Without types, you'd face three major problems:

1. **Format Chaos** - Every source sends data differently
2. **Validation Confusion** - What's "valid" varies by context  
3. **Hidden Value** - Useful data buried in strings

Types solve all three by parsing intelligently, validating flexibly, and extracting every bit of value from your data.

## The Type Philosophy: Validate Without Blocking

Here's the key insight that makes LeadConduit different: **the `valid` property is just another field, not a gate**.

When a type encounters invalid data:
- Processing continues normally
- The data is marked with `valid: false`
- You decide what to do with it

This means a lead with an invalid phone number can still convert if they have a valid email. A typo doesn't destroy value.

## How Types Work

Every type follows a three-step pattern:

### 1. Parse: Accept Chaos
Types accept input in virtually any format:
```
Phone inputs:
"(555) 123-4567" 
"555.123.4567"
"555-123-4567"
"+1 555 123 4567"
"5551234567"
```

### 2. Normalize: Create Order
All inputs normalize to a consistent format:
```
All become: "5551234567"
```

### 3. Extract: Reveal Value
Components are automatically extracted:
```
phone.number: "5551234567"
phone.area: "555"
phone.exchange: "123"
phone.line: "4567"
phone.valid: true
```

## Common Types

### Contact Types

| Type | Purpose | Components | Normalization |
|------|---------|------------|---------------|
| **email** | Email addresses | `user`, `domain`, `host`, `tld` | Lowercase |
| **phone** | Phone numbers | `area`, `exchange`, `line`, `extension` | 10 digits |
| **street** | Street addresses | `number`, `name` | Trimmed |
| **state** | US states/provinces | `abbr` | 2-letter code |
| **postal_code** | ZIP/postal codes | `zip`, `plus4`, `country_code` | Formatted |

### Identity Types

| Type | Purpose | Special Features |
|------|---------|------------------|
| **first_name** | Given names | Always valid |
| **last_name** | Family names | Always valid |
| **gender** | Gender identity | Accepts M/F/Male/Female/Other |
| **ssn** | Social Security | Maskable, validates format |
| **dob** | Date of birth | Calculates age, maskable |

### Data Types

| Type | Purpose | Examples |
|------|---------|----------|
| **string** | Generic text | Any text (always valid) |
| **number** | Numeric values | Integers, decimals |
| **boolean** | True/false | yes/y/1/true → true |
| **date** | Calendar dates | Multiple formats → ISO |
| **time** | Date + time | Natural language parsing |
| **range** | Numeric ranges | "50-100", "50 to 100" |

### Special Types

| Type | Purpose | Validation |
|------|---------|------------|
| **url** | Web addresses | Protocol required |
| **trustedform_url** | Consent certificates | HTTPS, valid domain, <90 days |
| **credential** | Passwords/API keys | Maskable, always valid |
| **ip** | IP addresses | IPv4 and IPv6 |

## Using Types Effectively

### Automatic Normalization

Types handle ALL normalization automatically. Never do this manually:

❌ **Don't:**
```
{{lowercase email}}  // Types already lowercase emails
{{replace phone "-" ""}}  // Types already normalize phones
```

✅ **Do:**
```
{{email}}  // Already normalized
{{phone}}  // Already normalized
```

### Component Access

Always use pre-extracted components:

✅ **Good - Using components:**
```
email.domain equals "gmail.com"
phone.area equals "512"
postal_code.zip equals "78701"
```

❌ **Bad - String manipulation:**
```
split(email, "@")[1] equals "gmail.com"
substring(phone, 0, 3) equals "512"
substring(postal_code, 0, 5) equals "78701"
```

### Validation Patterns

Use the `valid` property in your business logic:

**Route by validity:**
```
IF email.valid is false THEN route to "Phone Only Flow"
IF phone.valid is false THEN tag as "Email Only Lead"
```

**Price by quality:**
```
IF email.valid AND phone.valid THEN price = $10
IF email.valid OR phone.valid THEN price = $5
ELSE price = $2
```

**Require validity:**
```
Acceptance Criteria:
- email.valid is true
- phone.valid is true
```

## Type Intelligence

Types don't just validate - they understand data:

### Email Intelligence
- `is_free`: Detects Gmail, Yahoo, Hotmail, etc.
- `is_disposable`: Identifies temporary email services
- `domain`: Enables domain-based routing

### Phone Intelligence
- `is_tollfree`: Identifies 800/888/877 numbers
- `type`: Detects mobile/landline when specified
- `country_code`: International support

### Temporal Intelligence
- `age`: Calculated from date of birth
- `day_of_week`: Extracted from dates
- Timezone-aware parsing

### Geographic Intelligence
- `country_code`: From postal codes
- `plus4`: From ZIP+4 codes
- State abbreviation normalization

## Common Patterns

### Multi-Format Acceptance
```
Boolean accepts:
"yes" → true
"y" → true  
"1" → true
"true" → true
"no" → false
"n" → false
"0" → false
"false" → false
```

### Progressive Enhancement
Even invalid data provides value:
```
Invalid email: "john@"
- email.valid: false
- email.user: "john"  // Still extracted!
- email.domain: null
```

### Flexible Validation
Some types never return invalid:
- **string** - Any text is valid
- **first_name/last_name** - Any name is valid
- **credential** - Any credential is valid

Because there's no universal "correct" format.

## Best Practices

### Type Selection

1. **Be specific** - Use `email` not `string` for emails
2. **Consider components** - Will you need parsed parts?
3. **Think about validation** - Do you need format checking?
4. **Plan for intelligence** - Will you use metadata?

### Data Quality

1. **Expect invalid data** - Plan for `valid: false`
2. **Use validation wisely** - Route, don't reject
3. **Monitor quality** - Track validation rates
4. **Value partial data** - Invalid doesn't mean worthless

### Performance

1. **Parse once** - Types parse during processing
2. **Use components** - Don't re-parse with functions
3. **Trust normalization** - It's already optimized
4. **Leverage intelligence** - Use built-in detection

## Technical Details

### Type Assignment
- Each field has exactly one type
- Types are assigned in field configuration
- Standard fields have default types
- Custom fields need type selection

### Processing Flow
1. Raw data arrives at field
2. Type parses based on field configuration
3. Normalization creates consistent format
4. Components become available
5. Original preserved in `raw` property

### Storage Format
Types produce plain JavaScript objects:
```javascript
{
  normal: "5551234567",    // Normalized value
  raw: "(555) 123-4567",   // Original input
  area: "555",             // Extracted component
  exchange: "123",         // Extracted component
  line: "4567",           // Extracted component
  valid: true             // Validation result
}
```

## Related Concepts

- **[Fields](fields.md)** - Define what data you collect and assign types
- **[Mappings](mappings.md)** - Transform typed data between systems
- **[Rules](rules.md)** - Use type properties and components in logic
- **[Templates](templates.md)** - Access normalized data and components

---

*Types are what make LeadConduit intelligent about data. They transform chaos into structure, extract hidden value, and enable sophisticated business logic - all while ensuring that imperfect data doesn't mean lost opportunities.*