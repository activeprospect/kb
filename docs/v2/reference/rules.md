---
title: Rules  
description: The decision engine that evaluates conditions to control lead flow and business logic
tags:
  - rules-focused
  - reference
  - technical
  - core-concept
  - business-logic
  - mappings
  - volume-caps
  - pricing
  - filter-steps
  - acceptance-criteria
  - routing
  - validation
---

# Rules

## What are Rules?

Rules are LeadConduit's decision-making engine. They evaluate conditions against your lead data to answer one simple question: does this data meet my criteria? Rules power everything from basic field validation to complex business logic, making intelligent decisions about every lead that flows through your system.

Think of rules as smart filters that examine your data and return either "yes, this passes" or "no, and here's why." They're the brains behind acceptance criteria, routing decisions, conditional mappings, and quality gates.

## Why Rules Matter

Every lead requires decisions:
- Should I accept this lead?
- Which buyer should receive it?
- Does it meet quality standards?
- What special handling applies?

Without rules, these decisions would require custom code for every scenario. With rules, you configure business logic that non-developers can understand and modify as requirements change.

## How Rules Work

### Basic Structure

Every rule has three parts:

```
state | is equal to | TX
 ↑         ↑          ↑
LHV    Operator      RHV

LHV = Left-Hand Value (what you're checking)
Operator = How you're comparing
RHV = Right-Hand Value (what you're comparing against)
```

### Combining Rules

Individual rules combine using AND/OR logic:

**AND Logic - All must pass:**
```
state is equal to "TX"
AND age is greater than 25  
AND income is greater than 50000
```

**OR Logic - Any can pass:**
```
state is equal to "TX"
OR state is equal to "CA"
OR state is equal to "NY"
```

### Pass vs Fail

Rules have a unique design:
- **Pass** = Return `null` (nothing wrong)
- **Fail** = Return reason string (what failed)

This makes success checks fast while providing detailed failure feedback.

## Rule Operators

### Equality Operators

For exact matching:

| Operator | Use Case | Example |
|----------|----------|---------|
| `is equal to` | Match value | `state is equal to "TX"` |
| `is not equal to` | Exclude value | `source is not equal to "test"` |

**Special behaviors:**
- Case-insensitive for strings
- Arrays sorted before comparison
- Numbers/strings interchangeable

### Comparison Operators

For numeric and date comparisons:

| Operator | Use Case | Example |
|----------|----------|---------|
| `is greater than` | Minimum threshold | `age is greater than 18` |
| `is less than` | Maximum threshold | `price is less than 100` |
| `is between` | Range check | `credit_score is between 600-750` |

### Validation Operators

For data quality:

| Operator | Use Case | Example |
|----------|----------|---------|
| `format is valid` | Type validation | `email format is valid` |
| `is blank` | Missing data | `phone_2 is blank` |
| `is not blank` | Required fields | `first_name is not blank` |

### String Operators

For text analysis:

| Operator | Use Case | Example |
|----------|----------|---------|
| `includes` | Contains substring | `email includes "@gmail"` |
| `is included in` | List membership | `state is included in "TX,CA,NY"` |
| `matches pattern` | Regex/glob match | `phone matches pattern "512*"` |

### Boolean Operators

For true/false values:

| Operator | Use Case | Example |
|----------|----------|---------|
| `is true` | Check boolean | `email.valid is true` |
| `is false` | Check boolean | `phone.is_tollfree is false` |

## Common Rule Patterns

### Required Field Validation
```
Ensure core data exists:
├── first_name is not blank
├── last_name is not blank  
└── email is not blank OR phone_1 is not blank
```

### Geographic Filtering
```
Accept specific locations:
├── state is included in "TX,CA,NY,FL"
└── OR postal_code is between "90000-99999"
```

### Quality Standards
```
Minimum data quality:
├── email format is valid
├── AND phone_1 format is valid
└── AND age is greater than or equal to 18
```

### Business Logic
```
Premium lead detection:
├── loan_amount is greater than 100000
├── AND credit_score is greater than 700
└── AND state is included in "CA,NY"
```

### Time-Based Rules
```
Business hours check:
├── {{format timestamp format="HH"}} is between "09-17"
└── AND {{format timestamp format="d"}} is not included in "0,6"
```

## Where Rules Are Used

### Acceptance Criteria
Determine if leads should be accepted:
- Rules pass → Lead accepted
- Rules fail → Lead rejected with reason

### Filter Steps
Control flow through processing:
- Rules pass → Continue to next step
- Rules fail → Skip or stop

### Volume Caps
Conditional limits:
- Apply caps only to specific leads
- Different limits for different criteria

### Pricing Rules
Calculate conditional pricing:
- **Special behavior**: Last match wins
- Allows progressive pricing tiers

### Mappings
Conditional data transformation:
- Rules pass → Apply mapping
- Rules fail → Skip mapping

## Working with Data

### Field Access

Rules use simple dot notation:
```
Simple fields:
├── email
├── state
└── loan_amount

Nested data:
├── phone.area (parsed component)
├── email.domain (type component)
└── appended.service.result (enhancement data)
```

### Type Intelligence

Rules understand [type](types.md) components:

**Email Components:**
```
email.valid is true
email.domain is equal to "gmail.com"
email.is_free is false
```

**Phone Components:**
```
phone.valid is true
phone.area is equal to "512"
phone.is_tollfree is false
```

### Template Integration

Rules can use [templates](templates.md) for dynamic values:

**In Left-Hand Values:**
```
{{format timestamp format="YYYY-MM-DD"}} is equal to "2024-01-15"
{{uppercase state}} is equal to "TX"
```

**In Right-Hand Values:**
```
price is greater than {{minimum_price}}
state is equal to {{preferred_state}}
```

## Advanced Features

### Nested Rule Sets

Create complex logic:
```
Premium West Coast:
├── (state is "CA" AND income > 100000)
└── OR (state is "WA" AND income > 80000)
```

### Short-Circuit Evaluation

For performance:
- **AND sets**: Stop at first failure
- **OR sets**: Stop at first success
- Order rules strategically

### Rule Set After Rule

Chain conditions:
```
email format is valid
  └── THEN: email.is_free is false
```

## Best Practices

### Design Clear Logic
1. **Group related rules** - Organize by purpose
2. **Name meaningfully** - Self-documenting
3. **Test edge cases** - Empty values, extremes
4. **Document complexity** - Add descriptions

### Optimize Performance
1. **Order strategically** - Most likely to fail/pass first
2. **Use type components** - Pre-parsed data
3. **Avoid expensive ops** - Complex regex, obscenity
4. **Leverage short-circuit** - Structure for efficiency

### Maintain Flexibility
1. **Parameterize values** - Use variables not hardcoded
2. **Plan for changes** - Business rules evolve
3. **Keep simple** - Complexity = fragility
4. **Test thoroughly** - Validate all paths

## Common Pitfalls

### Over-Complication
❌ Complex regex when simple operators work
✅ Use built-in operators and type components

### Inefficient Ordering
❌ Expensive checks first
✅ Quick validations before complex logic

### Missing Edge Cases
❌ Assuming data is always present
✅ Handle blank/invalid values explicitly

### Type Confusion
❌ String operations on parsed types
✅ Use type components directly

## Technical Details

### Evaluation Flow
1. Template resolution (if used)
2. Value comparison
3. Short-circuit logic
4. Result aggregation
5. Reason generation (on failure)

### Performance Characteristics
- Simple comparisons: Microseconds
- Template resolution: Milliseconds
- Complex regex: Can be slow
- Type components: Pre-computed, fast

### Error Handling
- Missing fields: Treated as blank
- Invalid templates: Rule skipped (non-strict)
- Type mismatches: Automatic conversion

## Related Concepts

- **[Templates](templates.md)** - Provide dynamic values for rules
- **[Mappings](mappings.md)** - Use rules for conditional application
- **[Types](types.md)** - Provide validated components for rules
- **[Flows](flows.md)** - Where rules control business logic

---

*Rules are the decision-makers of LeadConduit. They transform business requirements into executable logic, enabling sophisticated lead processing without programming. Master rules, and you control the intelligence of your lead flows.*