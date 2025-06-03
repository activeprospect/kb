---
title: Lead Data & Field Types
description: Master the data model that powers intelligent lead processing
tags:
  - field-types
  - data-model
  - types
  - validation
---

# Lead Data & Field Types

## The Foundation of Smart Lead Processing

Field types are what transform LeadConduit from a simple data router into an intelligent lead processing platform. They automatically parse, validate, normalize, and extract components from your lead data - turning messy vendor inputs into clean, structured, actionable information.

📍 **You are here**: Understanding how LeadConduit structures and validates data
🔧 **What you'll master**: Field types, automatic parsing, and data components
✨ **The magic**: Watch "(555) 123-4567 ext 999" become structured phone data

## Understanding Field Types

### What Are Field Types?

Field types are intelligent data handlers that:
- Parse various input formats
- Validate data structure
- Normalize to standards
- Extract useful components
- Enable smart filtering

Think of them as specialized workers who know everything about their data domain.

### The Type Philosophy

LeadConduit types follow key principles:

1. **Be Forgiving** - Accept many formats
2. **Parse Intelligently** - Extract all possible value
3. **Validate Gently** - Mark invalid, don't reject
4. **Normalize Consistently** - Standard output format
5. **Provide Components** - Break into useful parts

## Core Field Types

### Text Type

The simplest type for free-form data:

```yaml
Type: Text
Input Examples:
  - "John"
  - "John William Smith III"
  - "José María"
  - "北京" (Beijing)
  
Storage: UTF-8, up to 65KB
Normalization: Trim whitespace
Components: None

Use for: Names, addresses, comments, descriptions
```

### Email Type

Intelligent email handling:

```yaml
Type: Email
Input Examples:
  - "JOHN.DOE@EXAMPLE.COM"
  - "john+tag@example.com"
  - "admin@company.co.uk"
  - "test@subdomain.example.com"

Parsing Results:
  email: "john.doe@example.com" (normalized)
  email.valid: true
  email.local: "john.doe"
  email.domain: "example.com"
  email.is_free: false (Gmail, Yahoo, etc.)
  email.is_role: false (admin@, info@, etc.)
  email.is_disposable: false (temporary email)

Validation:
  - RFC compliant format
  - Domain has MX records (optional)
  - Not on disposable list (optional)
```

### Phone Type

Comprehensive phone parsing:

```yaml
Type: Phone
Input Examples:
  - "555-123-4567"
  - "(555) 123-4567 ext 999"
  - "15551234567"
  - "+1 555.123.4567"
  - "555.1234" (7-digit)

Parsing Results:
  phone: "5551234567" (normalized to 10 digits)
  phone.valid: true
  phone.number: "5551234567"
  phone.area: "555"
  phone.exchange: "123"
  phone.line: "4567"
  phone.extension: "999" (if provided)
  
With Enhancement:
  phone.type: "mobile" | "landline" | "voip"
  phone.carrier: "Verizon"
  phone.is_tollfree: false
  phone.risk_score: 15
```

### Number Type

Numeric data with precision:

```yaml
Type: Number
Input Examples:
  - "1000"
  - "1,000.00"
  - "$50,000"
  - "75.5%"
  - "negative -100"

Parsing Results:
  loan_amount: 50000 (numeric value)
  interest_rate: 75.5
  age: 35
  
Features:
  - Strip non-numeric characters
  - Handle decimals
  - Support negative numbers
  - Mathematical operations in rules
```

### Boolean Type

True/false handling:

```yaml
Type: Boolean  
Input Examples:
  True values: "true", "yes", "y", "1", "on", "TRUE", "Yes"
  False values: "false", "no", "n", "0", "off", "FALSE", "No"

Parsing Results:
  homeowner: true
  military: false
  opted_in: true

Features:
  - Case insensitive
  - Multiple representations
  - Null = not true or false
```

### Date/Time Type

Intelligent date parsing:

```yaml
Type: Date/Time
Input Examples:
  - "2024-01-15"
  - "01/15/2024"
  - "January 15, 2024"
  - "2024-01-15T10:30:45Z"
  - "15-Jan-24"

Parsing Results:
  opted_in_at: "2024-01-15T10:30:45Z" (ISO 8601)
  opted_in_at.age_days: 7
  opted_in_at.age_hours: 168
  opted_in_at.day_of_week: "Monday"
  opted_in_at.hour: 10
  
For Birthdates:
  birth_date: "1985-06-15"
  birth_date.age: 38 (calculated)
```

### US State Type

State standardization:

```yaml
Type: US State
Input Examples:
  - "CA", "California", "calif", "Calif."
  - "TX", "Texas", "tex"
  - "NY", "New York", "new york", "N.Y."

Parsing Results:
  state: "CA" (always 2-letter code)
  state.valid: true
  state.name: "California"
  
Features:
  - Accepts names or codes
  - Case insensitive
  - Validates against all 50 states + DC + territories
```

### Postal Code Type

ZIP code intelligence:

```yaml
Type: Postal Code
Input Examples:
  - "90210"
  - "90210-1234"
  - "902101234"

Parsing Results:
  postal_code: "90210" (5-digit normalized)
  postal_code.valid: true
  postal_code.plus4: "1234" (if provided)
  postal_code.state: "CA" (derived)
  postal_code.city: "Beverly Hills" (with enhancement)
  
Features:
  - Validates format
  - Extracts ZIP+4
  - Can derive state
```

### Range Type

Numeric ranges:

```yaml
Type: Range
Input Examples:
  - "100-200"
  - "50000 to 75000"
  - ">100000"
  - "650+"

Parsing Results:
  income_range: "50000-75000"
  income_range.min: 50000
  income_range.max: 75000
  income_range.avg: 62500
  
Features:
  - Multiple formats accepted
  - Extracts bounds
  - Calculates midpoint
```

## Custom Field Types

### Creating Custom Fields

Define fields specific to your business:

```yaml
Field: product_interest
Type: Text
Allowed Values:
  - "auto"
  - "home" 
  - "life"
  - "health"
Default: "auto"
Required: true
```

### Composite Fields

Build complex data structures:

```yaml
Field: address
Type: Composite
Components:
  - address_1 (Text)
  - address_2 (Text)
  - city (Text)
  - state (US State)
  - postal_code (Postal Code)
  
Usage:
  Full: {{address.address_1}}, {{address.city}}, {{address.state}}
  Parts: address.state = "CA"
```

### Array Fields

Handle multiple values:

```yaml
Field: interests
Type: Array[Text]
Examples:
  - ["solar", "battery", "ev"]
  - ["insurance", "investment"]
  
Access:
  First: interests.0 = "solar"
  Count: interests.length = 3
  Contains: "solar" IN interests
```

## Working with Parsed Components

### Accessing Components

Use dot notation everywhere:

**In Rules**:
```yaml
email.valid is true
AND email.is_free is false
AND phone.type equals "mobile"
AND postal_code.state equals "CA"
```

**In Templates**:
```yaml
Email domain: {{lead.email.domain}}
Phone area: {{lead.phone.area}}
Age: {{lead.birth_date.age}} years
```

**In Mappings**:
```yaml
email_address: {{lead.email}}
email_domain: {{lead.email.domain}}
is_mobile: {{lead.phone.type == "mobile"}}
```

### Component Reference

Common components by type:

**Email Components**:
- `.valid` - Passes validation
- `.local` - Part before @
- `.domain` - Part after @
- `.is_free` - Gmail, Yahoo, etc.
- `.is_disposable` - Temporary email
- `.is_role` - admin@, info@, etc.

**Phone Components**:
- `.valid` - Proper format
- `.area` - Area code
- `.exchange` - Middle 3 digits
- `.line` - Last 4 digits
- `.type` - mobile/landline/voip
- `.carrier` - Network operator

**Date Components**:
- `.age` - For birthdates
- `.age_days` - Days since date
- `.age_hours` - Hours since date
- `.day_of_week` - Monday, Tuesday...
- `.hour` - 0-23

## Validation Strategies

### Type Validation vs Business Rules

Understand the difference:

**Type Validation** (Automatic):
```yaml
email: "not-an-email"
Result: 
  - email.valid = false
  - Lead continues processing
  - You decide what to do
```

**Business Rules** (Your Logic):
```yaml
Rule: email.valid is true
Action: Stop flow if false
Reason: "Valid email required"
```

### Validation Patterns

Common validation approaches:

**Strict Validation**:
```yaml
Requirements:
  - email.valid is true
  - phone.valid is true
  - state.valid is true
  
Use when: Data quality crucial
```

**Flexible Validation**:
```yaml
Requirements:
  - (email.valid is true OR phone.valid is true)
  - state is not blank
  
Use when: Some contact method needed
```

**Progressive Validation**:
```yaml
Layer 1: Has contact info
Layer 2: Contact info valid
Layer 3: Contact info high quality
  - Not free email
  - Mobile phone
  - Fresh consent
```

## Data Quality Best Practices

### Input Handling

Accept messy data gracefully:

**Phone Numbers**:
```yaml
Accepts all of:
  - (555) 123-4567
  - 555.123.4567
  - 5551234567
  - 1-555-123-4567
  
All become: 5551234567
```

**Names**:
```yaml
Handle:
  - Extra spaces
  - Mixed case
  - Special characters
  - International names
```

### Normalization

Consistent data throughout:

**Standard Formats**:
- Phones: 10 digits
- Emails: Lowercase
- States: 2-letter codes
- Dates: ISO 8601
- Booleans: true/false

### Enhancement Integration

Types work with enhancements:

```yaml
Base parsing gives:
  - phone.valid = true
  - phone.area = "555"

Enhancement adds:
  - phone.type = "mobile"
  - phone.carrier = "AT&T"
  - phone.risk_score = 10
```

## Common Patterns

### Contact Validation

Ensure reachability:

```yaml
Valid Contact:
  (email.valid is true AND email.is_disposable is false)
  OR
  (phone.valid is true AND phone.type in ["mobile", "landline"])
```

### Geographic Validation

Location accuracy:

```yaml
Valid Location:
  state.valid is true
  AND (
    postal_code.valid is true
    AND postal_code.state equals state
  )
```

### Identity Validation

Verify person details:

```yaml
age >= 18 (from birth_date.age)
AND first_name is not blank
AND last_name is not blank
AND (email matches "{{first_name}}" OR email matches "{{last_name}}")
```

## Performance Considerations

### Parsing Speed

Types are optimized for speed:

- Text: < 1ms
- Email: < 5ms  
- Phone: < 5ms
- Date: < 10ms
- All parsing: < 50ms total

### Memory Usage

Efficient storage:

- Only store normalized value + components
- Share common components
- Compress long text
- Index frequently queried

## Troubleshooting Types

### Common Issues

**"Valid data marked invalid"**

Check:
- Input format matches examples
- No extra characters
- Encoding issues (UTF-8)
- Type selection correct

**"Components missing"**

Verify:
- Field has correct type
- Parsing succeeded
- Using correct path
- Component exists for type

**"Normalization unexpected"**

Understand:
- Types have opinions
- Consistency over preference
- Check type documentation
- Consider custom fields

## Your Next Steps

### Essential Reading
1. **[Types Reference](/reference/types)** - Complete type documentation
2. **[Validation Rules](/flows/lead-submission/acceptance-criteria)** - Using types in rules
3. **[Data Mapping](/flows/lead-submission/mappings)** - Transform typed data

### Practice Exercises
1. Submit leads with various formats
2. Check parsed components
3. Build validation rules
4. Create custom fields

### Advanced Topics
- **[Custom Types](/help-guide/advanced/custom-types)** - Build your own
- **[Type Performance](/help-guide/optimization/type-performance)** - Speed tips
- **[International Types](/help-guide/features/international-types)** - Global support

---

✨ **Remember**: Types are your data quality foundation. They turn chaos into structure, variety into consistency, and questions into components. Let types do the heavy lifting, so you can focus on business logic.

*Next: Explore [Firehose](/leads/firehose) for real-time access to your typed, structured lead data.*