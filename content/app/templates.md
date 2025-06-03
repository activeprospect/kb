# LeadConduit Templates

## Overview

Templates are the dynamic value engine of LeadConduit. They transform static configurations into intelligent, adaptive systems by resolving variables, computing values, and manipulating data at runtime. Think of templates as smart placeholders that know how to fetch and transform data when needed.

Templates answer a fundamental question:
**How do I get the right value at the right time?**

Templates work seamlessly with rules and mappings:
- **Rules** use templates for dynamic comparisons
- **Mappings** use templates to compute values
- **Templates** provide the bridge between configuration and runtime data

## Why Templates Exist

### The Static Configuration Problem
Without templates, every value would be hard-coded:
- Phone format: "(512) 789-1111" for everyone
- Greeting: "Hello Customer" instead of personalized
- Dates: Fixed instead of calculated
- Prices: Static instead of computed

Templates make configurations come alive with actual data.

### The Data Access Problem
Lead data has complex structures:
- Nested objects: `address_1`, `city`
- Array elements: `tags[0]`
- Type components: `phone.area`
- Calculated values: `price * tax_rate`

Templates provide a consistent way to access any data, anywhere.

### The Transformation Problem
Raw data rarely matches what you need:
- Dates need formatting
- Names need case changes
- Numbers need calculations
- Strings need manipulation

Templates include helpers that transform data on the fly.

## Core Concepts

### Three Evaluation Modes

Templates operate in three distinct modes, automatically detected:

1. **Literal Mode**: No `{{}}` → returns as-is
   ```
   "Hello World" → "Hello World"
   Detection: indexOf('{{') === -1
   ```

2. **Simple Variable Mode**: EXACTLY `{{variable}}` → returns actual value
   ```
   "{{lead.email}}" → Email object (not string)
   "{{lead.age}}" → Number 25 (not "25")
   "{{items}}" → Array [1, 2, 3] (not string)
   Detection: Matches /^{{\s*([^}\s]+)\s*}}$/ (entire template is one variable)
   ```

3. **Handlebars Mode**: Contains `{{}}` but not simple variable pattern
   ```
   "{{uppercase first_name}}" → "JOHN" (string)
   "Hello {{name}}" → "Hello John" (string)
   "{{price}} {{currency}}" → "25 USD" (string, not preserved)
   Detection: Has {{ and }} but doesn't match simple pattern
   ```

### The Power of Simple Variable Mode

When a template is exactly `{{variable}}`, it returns the actual value, preserving its type:
- Objects remain objects
- Numbers remain numbers
- Booleans remain booleans
- Arrays remain arrays

This is crucial for rules and integrations that need typed data, not strings.

### Template Syntax

Templates use Handlebars-style double curly braces:
```
{{variable}}
{{helper parameter option="value"}}
{{helper (nested helper)}}
```

Variables use dot notation for nested access:
```
{{lead.email}}
{{company.address.city}}
{{order.items.0.name}}
```

## Template Helpers

### Format Helper
**Transform dates and numbers for display**

Date formatting:
```
{{format source_timestamp format="MMMM Do, YYYY"}}
→ "January 15th, 2024"

{{format source_timestamp format="YYYY-MM-DD" timezone="America/New_York"}}
→ "2024-01-15"
```

Number formatting:
```
{{format price format="$0,0.00"}}
→ "$1,234.56"

{{format percentage format="0.00%"}}
→ "45.50%"
```

Date arithmetic:
```
{{format date format="YYYY-MM-DD" operator="subtract" days="30"}}
→ Date 30 days ago
```

### Math Helper
**Perform calculations with variables**

Basic math:
```
{{math "price * tax_rate"}}
{{math "subtotal + shipping"}}
{{math "(min + max) / 2"}}
```

Conditional calculations:
```
{{math "age >= 65 ? 'Senior' : 'Adult'"}}  → Returns null (math only returns numbers)
{{math "price > 100 ? price * 0.9 : price"}} → Applies 10% discount if over $100
```

Functions available:
- Basic: `+`, `-`, `*`, `/`, `%`, `^`
- Comparison: `>`, `<`, `>=`, `<=`, `==`, `!=`
- Logic: `&&`, `||`, `?:`
- Math: `abs`, `ceil`, `floor`, `round`, `sqrt`, `min`, `max`
- Special: `rand()` (not `random()`)

### String Manipulation Helpers

**Uppercase/Lowercase**:
```
{{uppercase company_name}} → "ACME CORP"
{{lowercase custom_code}} → "abc123"
```

Note: Don't use lowercase on email fields - the email type already normalizes to lowercase automatically.

**Replace**:
```
{{replace phone pattern="-" replace=""}}
→ "5127891111" from "512-789-1111"

{{replace email pattern="@" replace=" at "}}
→ "user at example.com"
```

**Substring** (1-based indexing):
```
{{substring phone start="1" end="3"}}
→ "512" (first 3 characters)

{{substring text start="5"}}
→ Everything from position 5 onward
```

**Extract** (regex pattern matching):
```
{{extract "Order #12345" pattern="#(\d+)"}}
→ "12345"

{{extract email pattern="@(.+)$"}}
→ "example.com"
```

### Hash Helpers
**Generate secure hashes**

Available algorithms: `md5`, `sha1`, `sha256`, `sha384`, `sha512`

```
{{md5 lead.email}}
→ "5d41402abc4b2a76b9719d911017c592"

{{sha256 order_id created_at salt="secret"}}
→ Combines values with salt before hashing
```

## How Templates Work

### Variable Resolution

Templates access data through dot notation:

1. **Simple Objects**:
   ```
   Context: { lead: { first_name: "John" } }
   Template: {{lead.first_name}}
   Result: "John"
   ```

2. **Nested Objects**:
   ```
   Context: { user: { address: { city: "Austin" } } }
   Template: {{user.address.city}}
   Result: "Austin"
   ```

3. **Array Access**:
   ```
   Context: { items: ["first", "second", "third"] }
   Template: {{items.0}} or {{items[0]}}
   Result: "first"
   ```

4. **Type Components**:
   ```
   Context: { phone: ParsedPhoneObject }
   Template: {{phone.area}}
   Result: "512"
   ```

### Type Preservation

Understanding when types are preserved vs converted to strings:

**Preserved (Simple Variable Mode)**:
```
{{lead}} → Lead object
{{interests}} → Array of interests
{{lead.age}} → Number 25
{{is_verified}} → Boolean true
```

**Converted to String (Handlebars Mode)**:
```
{{uppercase first_name}} → "JOHN" (string)
{{format age}} → "25" (string)
{{lead.age }} → "25" (space triggers Handlebars)
```

**Special Case - Math**:
```
{{math "1 + 1"}} → 2 (number)
{{math "1 + 1" dataType="String"}} → "2" (forced string)
```

### Template in Rules

Templates enable dynamic rule comparisons:

**Left-Hand Value Templates**:
```
{{format dob format="YYYY"}} is equal to 2024
{{uppercase state}} is equal to TX
{{math "price * 1.08"}} is greater than 100
```

**Right-Hand Value Templates**:
```
price is greater than {{source.min_price}}
source_timestamp is greater than {{format now operator="subtract" days="30"}}
```

### Templates in Mappings

Templates compute values for data transformation:

**Simple Value Access**:
```
property: "customer_email"
value: "{{lead.email}}"
```

**Computed Values**:
```
property: "full_name"
value: "{{lead.first_name}} {{lead.last_name}}"
```

**Formatted Output**:
```
property: "formatted_phone"
value: "({{phone.area}}) {{phone.exchange}}-{{phone.line}}"
```

## Best Practices

### Use Type Components

**Do This** (using parsed components):
```
{{lead.phone.area}}
{{lead.email.domain}}
{{lead.postal_code.zip}}
{{lead.dob.age}}
```

**Not This** (manual parsing):
```
{{substring lead.phone start="1" end="3"}}
{{extract lead.email pattern="@(.+)$"}}
{{substring lead.postal_code start="1" end="5"}}
```

Type components are:
- Pre-validated
- More efficient
- More reliable
- Self-documenting

### Choose the Right Mode

**For preserving types**:
```
{{variable}} ← No spaces, no helpers
```

**For string output**:
```
{{helper variable option="value"}}
Any template with spaces or helpers
```

**For calculations**:
```
{{math "expression"}} ← Returns numbers
```

### Handle Missing Data

**Check existence in rules**:
```
Rule: lead.phone is not blank
Then use: {{lead.phone.area}}
```

**Provide defaults in mappings**:
```
{{#if lead.phone}}{{lead.phone}}{{else}}N/A{{/if}}
```

### Performance Considerations

1. **Simple is faster**: `{{variable}}` beats `{{helper variable}}`
2. **Avoid complex regex**: Use built-in helpers when possible
3. **Minimize nesting**: `{{helper1 (helper2 (helper3))}}` is slow
4. **Use type components**: Already parsed and ready

## Common Patterns

### Name Formatting
```
Full name: {{lead.first_name}} {{lead.last_name}}
Formal: {{uppercase lead.last_name}}, {{lead.first_name}}
Initial: {{substring lead.first_name start="1" end="1"}}.
```

### Date Handling
```
Today: {{format now format="YYYY-MM-DD"}}
30 days ago: {{format now format="YYYY-MM-DD" operator="subtract" days="30"}}
Next week: {{format now format="MMM Do" operator="add" weeks="1"}}
```

### Phone Formatting
```
Standard: ({{phone.area}}) {{phone.exchange}}-{{phone.line}}
International: +{{phone.country_code}} {{phone.area}} {{phone.number}}
Masked: {{phone.area}}-XXX-{{substring phone.line start="3"}}
```

### Conditional Values
```
Price with tax: {{math "price * 1.08"}}
Bulk discount: {{math "quantity > 10 ? price * 0.9 : price"}}
```

### Data Masking
```
Email: {{replace email pattern="regexp(^(.{3}).*(@.*)" replace="$1***$2"}}
SSN: XXX-XX-{{substring ssn start="8"}}
```

## Template Limitations

### No String Splitting
Templates cannot split strings:
```
❌ {{split full_name delimiter=" "}}  ← Doesn't exist
✅ Handle in source system or use separate fields
```

### Math Returns Numbers Only
Math helper cannot return strings:
```
❌ {{math "age >= 18 ? 'Adult' : 'Minor'"}} → null
✅ Use rules for conditional logic
```

### No Array Manipulation
Cannot filter or map arrays:
```
❌ {{filter items where="active"}}
✅ Use rules to check array contents
```

### Limited Conditionals
Only basic if/else, no complex logic:
```
✅ {{#if value}}...{{else}}...{{/if}}
❌ {{#if value > 10}}...{{/if}}  ← Use rules for this
```

## Common Misconceptions

### "Templates always return strings"
**Reality**: Simple variable mode preserves types. Only Handlebars mode stringifies.

### "Spaces don't matter"
**Reality**: `{{variable}}` vs `{{variable }}` behave differently. Spaces trigger Handlebars mode.

### "Math helper is for any calculation"
**Reality**: Math only returns numbers. Use it for numeric calculations only.

### "Templates can do everything"
**Reality**: Templates have specific helpers. Complex logic belongs in rules.

## Integration with Rules and Mappings

### Templates → Rules
Templates provide dynamic values for rule evaluation:
- Format data for comparison
- Access nested properties
- Calculate thresholds
- Transform for matching

### Templates → Mappings
Templates compute values for property assignment:
- Combine multiple fields
- Format for output
- Calculate new values
- Access complex paths

### The Processing Triangle
1. **Templates** resolve values
2. **Rules** make decisions based on those values
3. **Mappings** use templates to transform data when rules pass

## Key Takeaways

1. **Three Modes**: Literal (no processing), Simple Variable (preserves types), Handlebars (returns strings)
2. **Type Preservation**: `{{variable}}` returns actual value, not string
3. **Rich Helpers**: Format, math, string manipulation, hashing
4. **Dot Notation**: Access any nested data with simple syntax
5. **Template Everywhere**: Works in rules, mappings, and integrations
6. **Performance Matters**: Simple templates are faster
7. **Use Components**: Type components beat string manipulation
8. **Math for Numbers**: Math helper only returns numeric values
9. **Missing Data Safe**: Templates handle undefined gracefully
10. **Powers Flexibility**: Makes static config dynamic