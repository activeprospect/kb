# LeadConduit Types - Complete Documentation

## Overview

Types are the data standardization engine of LeadConduit. They transform the messy, inconsistent data that arrives from various sources into clean, structured, and predictable formats that systems can reliably process. Think of types as intelligent parsers that not only validate data but also extract meaningful components and metadata.

At their core, types solve three fundamental problems:
1. **Data Chaos**: Lead data arrives in countless formats
2. **Validation Confusion**: What makes data "valid" varies by context
3. **Component Extraction**: Valuable data is often buried within strings

## Why Types Exist

### The Format Problem
Lead data comes from everywhere, and everyone formats it differently:
- Phone numbers: "(512) 789-1111" vs "512-789-1111" vs "5127891111"
- Dates: "6/2/2014" vs "June 2, 2014" vs "2014-06-02"
- Booleans: "yes" vs "y" vs "1" vs "true"
- States: "TX" vs "Texas" vs "tx" vs "texas"

Without standardization, every integration would need custom parsing logic, leading to inconsistency and errors.

### The Validation Problem
Traditional systems often reject data that doesn't match exact formats. But in lead distribution:
- You can't always control the input format
- Rejecting leads means lost revenue
- Some "invalid" data is still valuable
- Different buyers have different validation requirements

Types solve this by separating parsing from flow control. Invalid data doesn't stop processing - it's just marked as invalid for you to handle as needed.

### The Component Problem
Valuable data is often embedded within larger strings:
- Area codes within phone numbers
- Domains within email addresses
- ZIP codes within postal codes
- Age calculations from dates of birth

Types automatically extract these components, making them available as separate fields without complex string manipulation.

## Core Concepts

### The Parse-Normalize-Use Pattern

Every type follows a three-step pattern:

1. **Parse**: Accept input in various formats and extract structure
2. **Normalize**: Convert to a consistent format for storage
3. **Use**: Access standardized data and components in flows

Example with phone numbers:
```
Input: "(512) 789-1111" 
  ↓ Parse
Parsed: String object with area: "512", exchange: "789", line: "1111"
  ↓ Normalize  
Normalized: { normal: "5127891111", area: "512", exchange: "789", line: "1111", valid: true }
  ↓ Use
In flows: phone.area equals "512", phone.valid is true
```

### The `valid` Property: A Field, Not a Gate

**Critical Understanding**: The `valid` property is just another field value, like `email.domain` or `phone.area`. It does NOT:
- Stop lead processing
- Reject leads automatically
- Prevent data from flowing through the system

Instead, `valid` is a field you can use in rules:
- Route invalid emails differently
- Tag leads with invalid phones
- Apply different pricing for invalid data
- Track data quality metrics

This design philosophy is fundamental to LeadConduit: data quality issues shouldn't stop business processes, they should inform them.

### Components: The Hidden Value

Types don't just validate - they extract valuable components:

**Phone Number Components:**
- `area`: Area code (e.g., "512")
- `exchange`: Exchange code (e.g., "789")
- `line`: Line number (e.g., "1111")
- `extension`: Extension if present
- `type`: Phone type (home/work/mobile)
- `is_tollfree`: Boolean for toll-free numbers
- `country_code`: Two-letter country code

**Email Components:**
- `user`: Username before @
- `domain`: Full domain after @
- `host`: Domain without TLD
- `tld`: Top-level domain
- `is_free`: Is it a free email provider?
- `is_disposable`: Is it a temporary email?

These components enable sophisticated business logic without string manipulation.

### Normalization: Creating Consistency

Normalization transforms parsed objects into plain JavaScript objects suitable for storage and serialization. This is crucial because:

1. **Databases need plain objects**, not extended String/Number objects
2. **JSON serialization** works properly with normalized data
3. **External systems** can reliably consume the data
4. **Consistency** across all data types

Example:
```javascript
// Before normalization: Extended String object
phone = String {"5127891111"} with methods and properties

// After normalization: Plain object
phone = {
  normal: "5127891111",
  raw: "(512) 789-1111",
  area: "512",
  exchange: "789",
  line: "1111",
  valid: true
}
```

## Type Categories

### Identity Types
Types that identify people and organizations:
- **First Name**: Simple string for given names
- **Last Name**: Simple string for family names
- **Gender**: Male/Female/Other with abbreviations
- **DOB**: Date of birth with age calculation
- **SSN**: Social Security Number (with masking)

### Contact Types
Types for reaching people:
- **Email**: Full parsing with domain analysis
- **Phone**: Comprehensive parsing with type detection
- **Street**: Address parsing with number extraction
- **City**: Simple string for city names
- **State**: US state normalization with provinces
- **Postal Code**: Multi-country postal code parsing
- **IP**: IPv4 and IPv6 address parsing

### Temporal Types
Types dealing with time:
- **Date**: Multi-format date parsing
- **Time**: Natural language datetime parsing
- **DOB**: Special date type with age calculation

### Data Types
Basic data representation:
- **String**: Universal string type
- **Number**: Numeric parsing with validation
- **Boolean**: Multiple representation parsing
- **Range**: Numeric range parsing

### Credential Types
Security-focused types:
- **Credential**: Password and API key type (maskable)
- **URL**: General URL parsing
- **TrustedForm URL**: Specialized consent certificate parsing

## How Types Work in Practice

### Automatic Normalization - No Manual Work Needed

Types automatically normalize data - you don't need to:
- **Email**: Automatically lowercased (never use {{lowercase email}})
- **Phone**: Automatically normalized to 10 digits
- **State**: Automatically converted to 2-letter abbreviation
- **Postal Code**: Automatically formatted
- **Names**: Automatically trimmed of whitespace

The type system handles ALL normalization - just pass the raw data!

### Standardization in Action

Types accept chaotic input and produce consistent output:

**Phone Number Standardization:**
```
"(512) 789-1111" → "5127891111"
"512-789-1111"   → "5127891111"  
"512.789.1111"   → "5127891111"
"5127891111"     → "5127891111"
"+1 512 789 1111" → "5127891111"
```

All produce the same normalized format with identical components.

**Date Standardization:**
```
"6/2/2014"      → "2014-06-02"
"June 2, 2014"  → "2014-06-02"
"2014-06-02"    → "2014-06-02"
"06-02-2014"    → "2014-06-02"
"20140602"      → "2014-06-02"
```

All produce ISO format dates.

### Validation Without Rejection

When types encounter invalid data:

1. **Parsing continues**: The system doesn't stop
2. **`valid` is set to false**: Marking the data quality issue
3. **`raw` preserves input**: Original data is never lost
4. **Components may be empty**: But the structure remains
5. **Flows continue**: You decide how to handle invalid data

Example:
```javascript
// Invalid phone number
Input: "not a phone"
Result: {
  normal: "notaphone",  // Non-digits removed
  raw: "not a phone",   // Original preserved
  valid: false,         // Marked as invalid
  // No components extracted
}
// Lead continues processing!
```

### Component Usage Best Practices

**Always prefer components over string manipulation:**

✅ **Good - Using Components:**
```javascript
// Check area code
lead.phone.area equals "512"

// Check email domain
lead.email.domain equals "gmail.com"

// Check ZIP code
lead.postal_code.zip equals "78701"
```

❌ **Bad - String Manipulation:**
```javascript
// Don't do this!
substring(lead.phone, 0, 3) equals "512"
split(lead.email, "@")[1] equals "gmail.com"
substring(lead.postal_code, 0, 5) equals "78701"
```

Components are:
- Already parsed and validated
- More efficient (no runtime parsing)
- More reliable (handle edge cases)
- Clearer in intent

## Special Type Behaviors

### Maskable Types

Some types contain sensitive data that can be masked:
- **SSN**: Social Security Numbers
- **DOB**: Dates of birth (year preserved)
- **Credential**: Passwords and API keys

Masking replaces sensitive characters with asterisks while preserving structure.

### Types with Special Validation

**TrustedForm URL**:
- Must be HTTPS
- Must be from valid TrustedForm domain
- Certificate must not be older than 90 days
- Environment must match (production/staging)

**Email**:
- Detects free providers (Gmail, Yahoo, etc.)
- Identifies disposable/temporary emails
- Normalizes to lowercase

**Phone**:
- Supports type hints (h=home, w=work, m=mobile)
- Detects toll-free numbers
- Handles extensions
- Recognizes masked numbers

### Always-Valid Types

Some types never return `valid: false`:
- **String**: Any text is valid
- **City**: Any city name is valid
- **State**: Any locality is valid
- **First/Last Name**: Any name is valid
- **Credential**: Any credential is valid

These types accept any string input because there's no universal format to validate against.

## Type Selection Guide

### When to Use Each Type

**String**: Default for text without specific format requirements
- Custom fields
- Comments
- Descriptions
- Generic text data

**Number**: Numeric data for calculations or comparisons
- Prices
- Quantities  
- Scores
- IDs

**Boolean**: Yes/no decisions
- Opt-ins
- Preferences
- Flags
- Consent

**Email**: Contact emails requiring validation
- Primary contact
- Marketing emails
- Account emails

**Phone**: Phone numbers needing standardization
- Contact numbers
- SMS numbers
- Call tracking

**Date/Time**: Temporal data
- Submission dates
- Appointment times
- Deadlines

**DOB**: Special handling for birth dates
- Age verification
- Age-based routing
- Demographics

**Postal Code**: Location-based routing
- Geographic targeting
- Shipping addresses
- Tax determination

**SSN**: Highly sensitive identification
- Credit checks
- Identity verification
- Compliance requirements

## Common Patterns

### Multi-Format Input Handling
Types gracefully handle various input formats:
```
Boolean: "yes", "y", "1", "true" → true
State: "TX", "Texas", "tx", "texas" → "TX"
Phone: Multiple formats → Single standard
```

### Progressive Enhancement
Types extract as much value as possible:
```
Valid email → All components extracted
Invalid email → Still preserves raw, domain might be partial
Valid phone → All components available
Invalid phone → Raw preserved, some components may exist
```

### Business Logic Enablement
Types enable sophisticated rules without complexity:
```
IF email.is_free is true THEN route to "free email flow"
IF phone.is_tollfree is true THEN reject "No toll-free numbers"
IF dob.age is less than 18 THEN reject "Must be 18+"
IF postal_code.country_code equals "US" THEN continue
```

## Integration with LeadConduit

### Field Type Assignment
In flow configuration:
1. Each field can be assigned a type
2. Types are applied during lead processing
3. Parsed data replaces raw input
4. Components become available immediately

### Rule Evaluation
Types integrate with the rules engine:
- Use `valid` property in conditions
- Access components directly
- Compare normalized values
- Apply type-specific operators

### Data Flow
1. **Input arrives** in various formats
2. **Types parse** based on field configuration
3. **Normalization** prepares for storage
4. **Components** available in rules/mappings
5. **Storage** uses normalized format
6. **Delivery** can use any component

### Analytics and Aggregation
Types support analytics through aggregation:
- Email domains for provider analysis
- Phone area codes for geographic insights
- Date components for temporal analysis
- Postal codes for location analytics

## Best Practices

### Type Selection
1. **Be specific**: Use email type, not string, for emails
2. **Consider components**: Will you need parsed parts?
3. **Think about validation**: Do you need format checking?
4. **Plan for analytics**: What aggregations do you need?

### Data Quality Handling
1. **Don't assume valid**: Always consider invalid data scenarios
2. **Use rules wisely**: Route or tag based on validity
3. **Preserve raw data**: Sometimes "invalid" data has value
4. **Monitor quality**: Track validation rates

### Performance Optimization
1. **Parse once**: Types parse during flow processing
2. **Use components**: Avoid re-parsing with string functions
3. **Normalize for storage**: Consistent format improves queries
4. **Aggregate thoughtfully**: Only extract needed analytics data

## Common Misconceptions

### "Invalid data stops processing"
**Reality**: Invalid data continues through flows. The `valid: false` flag is just information you can use in rules.

### "Types change my data"
**Reality**: Types create structured representations. The original data is always preserved in the `raw` property.

### "I need string manipulation for components"
**Reality**: Types extract components automatically. Using `email.domain` is better than parsing the string yourself.

### "Types are just validators"
**Reality**: Types are parsers that extract structure, components, and metadata. Validation is just one feature.

## Key Takeaways

1. **Types Create Order from Chaos**: Multiple input formats → Single normalized output
2. **`valid` is a Field, Not a Fence**: Invalid data flows through, marked for handling
3. **Components Are Pre-Extracted**: No string manipulation needed
4. **Normalization Enables Consistency**: Databases and APIs get clean data
5. **Raw Data Is Preserved**: Original input always available
6. **Types Enable Business Logic**: Components power sophisticated rules
7. **Format Flexibility**: Accept data how it arrives, process it how you need
8. **Validation Without Rejection**: Data quality issues inform, don't block
9. **Rich Metadata**: Beyond validation - free email detection, age calculation, etc.
10. **Parse Once, Use Everywhere**: Efficiency through centralized parsing