# LeadConduit Rules

## Overview

Rules are the decision-making engine of LeadConduit. They evaluate conditions against lead data to control flow, filter leads, make routing decisions, and enforce business logic. Think of rules as smart filters that examine your data and return a simple answer: pass or fail (with a reason why).

At their core, rules answer one fundamental question:
**Does this data meet my criteria?**

Rules work hand-in-hand with templates and mappings:
- **Templates** resolve dynamic values within rules
- **Mappings** use rules to conditionally transform data
- **Rules** provide the logic that drives intelligent lead processing

## Why Rules Exist

### The Decision Problem
In lead distribution, you constantly make decisions:
- Should this lead be accepted?
- Which buyer should receive it?
- Does it meet quality standards?
- Should special processing apply?

Without a flexible rule system, these decisions would require custom code for every scenario.

### The Complexity Problem
Business logic is rarely simple:
- "Accept leads from Texas OR California"
- "Reject if email is invalid AND phone is missing"
- "Route to Buyer A if age > 25 AND income > $50k AND state = TX"

Rules handle this complexity through composable logic that non-developers can understand and modify.

### The Flexibility Problem
Conditions change frequently:
- Buyers update their criteria
- Quality standards evolve
- New data fields become available
- Business requirements shift

Rules provide a configuration-based approach that adapts without code changes.

## Core Concepts

### Rule Structure

Every rule has three basic parts:

1. **Left-Hand Value (LHV)**: What you're checking
2. **Operator**: How you're checking it
3. **Right-Hand Value (RHV)**: What you're checking against

Example:
```
state | is equal to | TX
(LHV) | (operator) | (RHV)
```

### Rule Sets

Individual rules combine into rule sets using AND/OR logic:

**AND Rule Set**: All rules must pass
```
state is equal to TX
AND age is greater than 25
AND income is greater than 50000
```

Note: In rules, use field names without the lead. prefix.

**OR Rule Set**: Any rule can pass
```
state is equal to TX
OR state is equal to CA
OR state is equal to NY
```

### Rule Evaluation Flow

Rules follow a specific evaluation pattern:

1. **No Rules = Automatic Pass**: Empty rule sets always pass
2. **AND Uses Short-Circuit Logic**: Stops at first failure
3. **OR Uses Short-Circuit Logic**: Stops at first success
4. **Nested Rules Create Complex Logic**: Rule sets can contain other rule sets

**Important Exception - Pricing Rules**: 
Pricing rules work differently from all other rules:
- They evaluate ALL rules, not stopping at first match
- The LAST matching price wins
- This allows progressive pricing (general → specific)
- See the Pricing documentation for details

### Pass vs Fail

**Pass**: Rules return `null` (nothing wrong)
**Fail**: Rules return a reason string explaining what failed

This design is intentional - a null check is faster than parsing success messages, and failure reasons provide actionable feedback.

## How Rules Work with Data

### Simple Field Access

Rules use dot notation to access data:
```
lead.email
lead.phone.area
company.address.city
```

This works with:
- Simple values: `lead.state` → "TX"
- Nested objects: `phone.area` → "512" (from parsed phone type)
- Type components: `lead.phone.area` → "512"
- Array elements: `interests.0` → "insurance" (custom field array)

### Template Integration

Rules can use templates for dynamic comparisons:

**In Left-Hand Values**:
```
{{format source_timestamp format="YYYY-MM-DD"}} is equal to 2024-01-15
{{uppercase lead.state}} is equal to TX
```

**In Right-Hand Values**:
```
price is greater than {{source.minimum_price}}
lead.state is equal to {{buyer.preferred_state}}
```

**Important**: Simple variable templates like `{{lead.email}}` preserve the original data type, while helper templates return strings.

### Type-Aware Comparisons

Rules understand LeadConduit types:

**Email Validation**:
```
lead.email format is valid
lead.email.is_free is false
lead.email.domain is equal to gmail.com
```

**Phone Analysis**:
```
lead.phone format is valid
lead.phone.is_tollfree is false
lead.phone.area is equal to 512
```

**Date Comparisons**:
```
source_timestamp is greater than 2024-01-01
lead.dob.age is greater than 18
```

## Operator Categories

### Equality Operators
**For exact matching**
- `is equal to` / `is not equal to`: Case-insensitive string comparison
- Arrays are sorted before comparison: `[b,a]` equals `[a,b]`
- Numbers and strings interchangeable: `"123"` equals `123`

### Comparison Operators
**For numeric and date comparisons**
- `is greater than` / `is greater than or equal to`
- `is less than` / `is less than or equal to`
- `is between` / `is not between`: Check if value falls within range
- Work with ranges: "10-20" has average of 15

### Validation Operators
**For data quality checks**
- `format is valid` / `format is invalid`: Checks type validation
- `is blank` / `is not blank`: Detects empty/missing values
- Works with parsed types' `valid` property

### Boolean Operators
**For true/false values**
- `is true` / `is not true`
- `is false` / `is not false`
- String "true" counts as true, "false" as false

### String Operators
**For text analysis**
- `includes` / `does not include`: Substring search
- `is included in` / `is not included in`: List membership (supports CSV)
- `matches pattern` / `does not match pattern`: Regex or glob patterns
- `is obscene` / `is not obscene`: Content filtering

## Common Rule Patterns

### Quality Validation
Ensure data meets minimum standards:
```
Email is valid AND (Phone is valid OR Phone 2 is valid)
```

### Geographic Filtering
Accept leads from specific locations:
```
State is included in "TX,CA,NY,FL"
OR Postal Code is between "10000-19999"
```

### Business Hours
Route based on time:
```
{{format source_timestamp format="HH"}} is between "09-17"
```

### Value Thresholds
Filter by numeric criteria:
```
Loan Amount is greater than 5000
AND Credit Score is greater than 650
```

### Data Completeness
Check required fields:
```
First Name is not blank
AND Last Name is not blank
AND (Email is not blank OR Phone is not blank)
```

## Rules in Action

### In Acceptance Criteria
Determines if a lead should be accepted:
- Rules pass (`null`) → Lead accepted
- Rules fail (reason) → Lead rejected with specific reason

### In Filters
Controls lead flow through processing:
- Rules pass → Lead continues
- Rules fail → Lead is filtered out

### In Routers
Directs leads to different destinations:
- First matching rule set determines routing
- No matches → Default routing or rejection

### In Mappings
Conditionally transforms data:
- Rules pass → Mapping applied
- Rules fail → Mapping skipped

## Advanced Concepts

### Nested Rule Sets

Create complex logic by nesting:
```
(State is TX AND Age > 25)
OR
(State is CA AND Age > 21)
```

### Rule Set After Rule

Individual rules can have attached rule sets that only evaluate if the rule passes:
```
Email format is valid
  → THEN CHECK: Email.is_free is false
```

This creates implicit AND conditions without deep nesting.

### Non-Strict Mode

When `strict = false`:
- Rules with missing template variables are skipped
- Useful for partial evaluation scenarios
- Prevents failures due to incomplete data

### Short-Circuit Evaluation

**AND Rule Sets**: Stop at first failure for efficiency
**OR Rule Sets**: Evaluate all to build complete failure message

This optimization significantly improves performance for large rule sets.

## Best Practices

### Rule Design

1. **Order Matters in AND Sets**: Put most likely to fail first
2. **Order Matters in OR Sets**: Put most likely to pass first
3. **Use Specific Operators**: `format is valid` not complex patterns
4. **Leverage Type Components**: `phone.area` not substring operations

### Clear Logic Structure

Break complex logic into understandable pieces:
```
Basic Eligibility (AND)
├── Age >= 18
├── State in approved list
└── Either email OR phone valid
    ├── Email format valid
    └── Phone format valid
```

### Performance Optimization

1. **Avoid Expensive Operations**: Obscenity checks, complex regex
2. **Use Type Components**: Pre-parsed and validated
3. **Minimize Template Complexity**: Simple references over helpers
4. **Structure for Short-Circuit**: Take advantage of evaluation order

### Maintenance

1. **Document Complex Rules**: Add descriptions
2. **Test Edge Cases**: Empty values, invalid formats
3. **Use Consistent Naming**: Clear variable names
4. **Group Related Rules**: Organize by purpose

## Common Misconceptions

### "Rules stop lead processing"
**Reality**: Failed rules return a reason but don't throw errors. The system decides what to do with failures.

### "Complex rules need code"
**Reality**: Nested rule sets handle very complex logic without programming.

### "Rules are just for filtering"
**Reality**: Rules drive routing, validation, conditional mapping, and business logic throughout LeadConduit.

### "Template limitations restrict rules"
**Reality**: While templates can't split strings, type components provide the parsed data you need.

## Integration with Templates and Mappings

### Rules + Templates
Templates provide dynamic values for rules:
- Format dates for comparison
- Transform text for matching
- Calculate values for thresholds
- Access nested data dynamically

### Rules + Mappings
Mappings use rules for conditional application:
- Apply mapping only if rules pass
- Different mappings for different conditions
- Transform data based on lead characteristics
- Route-specific data preparation

### The Complete Picture
1. **Templates** compute the values
2. **Rules** make the decisions  
3. **Mappings** apply the changes

This separation of concerns creates a flexible, maintainable system.

## Key Takeaways

1. **Rules Return Null or Reasons**: Pass = null, Fail = descriptive string
2. **Three Parts**: LHV (what) + Operator (how) + RHV (compare to)
3. **Composable Logic**: Individual rules combine with AND/OR
4. **Type-Aware**: Understand validated data, components, formats
5. **Template Enabled**: Both LHV and RHV support dynamic values
6. **Efficient Evaluation**: Short-circuit for performance
7. **Descriptive Failures**: Know exactly why rules failed
8. **Not Just Filtering**: Drive routing, validation, and logic
9. **Configuration Over Code**: Business logic without programming
10. **Works with System**: Integrates with types, templates, and mappings