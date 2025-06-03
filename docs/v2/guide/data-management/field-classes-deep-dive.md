---
tags:
  - fields-focused
  - intermediate
  - technical
  - data-management
  - types-focused
  - validation
  - field-configuration
---

# Field Classes Deep Dive

Master LeadConduit's powerful field class system to automatically parse, validate, and transform lead data. This comprehensive guide explores each field class, their components, formatting options, and practical applications.

## 📍 You Are Here

You're diving deep into LeadConduit's field classes - the specialized data types that intelligently parse incoming data, break it into components, validate formats, and enable powerful transformations. Understanding field classes is key to building robust, data-driven flows.

## 🎯 What You'll Achieve

- Master all 15+ field classes and their behaviors
- Access and use field components effectively
- Transform data between formats
- Build powerful validation rules
- Optimize data quality automatically
- Create sophisticated mappings

## 📋 Prerequisites

Before starting, you should understand:

- [Field Configuration Basics](./field-configuration.md)
- [Data Types Overview](../../reference/app/types.md)
- [Rules Engine](../flow-management/acceptance-criteria.md)
- [Mapping Concepts](./data-mapping.md)

## 🎓 Understanding Field Classes

### What Are Field Classes?

Field classes are specialized data types that:
- **Parse** raw input into structured data
- **Validate** format and content
- **Normalize** to standard formats
- **Expose** components for granular access
- **Transform** between output formats

### Key Concepts

**Normalization**: Converting various input formats to a standard format
```
Input: "(555) 123-4567" → Normalized: "5551234567"
Input: "JOHN@GMAIL.COM" → Normalized: "john@gmail.com"
```

**Components**: Sub-parts of structured data
```
Email: john.doe@company.com
- User: john.doe
- Domain: company.com
- Host: company
- TLD: com
```

**Format Options**: Different output representations
```
Phone: 5551234567
- Standard: 5551234567
- Formatted: (555) 123-4567
- International: +1-555-123-4567
```

## 📧 Email Class

### Overview
Validates email addresses and provides component access for domain-based logic.

### Normalization
- Converts to lowercase
- Trims whitespace
- Validates format

### Components
```javascript
// Input: John.Doe@Example.COM
email           // john.doe@example.com (normalized)
email.raw       // John.Doe@Example.COM (as submitted)
email.user      // john.doe
email.domain    // example.com
email.host      // example
email.tld       // com
email.valid     // true/false
```

### Use Cases

**Domain Filtering**:
```
Rule: email.domain is not one of gmail.com, yahoo.com, hotmail.com
Action: Route to B2B flow
```

**Corporate Email Detection**:
```
Rule: email.tld is one of com, org, net
      AND email.domain is not in [free_email_list]
Result: Likely business email
```

## ☎️ Phone Class

### Overview
Handles North American phone numbers with intelligent parsing and validation.

### Accepted Formats
- (555) 123-4567
- 555-123-4567
- 555.123.4567
- 5551234567
- +1-555-123-4567
- 555-123-4567 x123

### Components
```javascript
// Input: (555) 123-4567 x890
phone.raw       // "(555) 123-4567 x890"
phone           // "5551234567" (normalized)
phone.area      // "555"
phone.exchange  // "123"
phone.line      // "4567"
phone.number    // "1234567" (without area)
phone.extension // "890"
phone.country_code // "1"
phone.is_tollfree // false
phone.valid     // true/false
```

### Format Options
Access via gear icon in mappings:
- Standard: 5551234567
- Dashed: 555-123-4567
- Parentheses: (555) 123-4567
- Dots: 555.123.4567
- International: +1-555-123-4567

### Advanced Usage

**Toll-Free Detection**:
```
Rule: phone.is_tollfree is true
Action: Route to toll-free handler
```

**Area Code Routing**:
```
Rule: phone.area is one of 212, 646, 917
Action: Route to NYC team
```

## 📅 Date & Time Classes

### Date Class

**Accepted Formats**:
- 2024-03-15
- 03/15/2024
- March 15, 2024
- 15-Mar-24

**Standard Format**: yyyy-mm-dd

**Format Options**:
- ISO: 2024-03-15
- US: 03/15/2024
- European: 15/03/2024
- Long: March 15, 2024

### Time Class (Timestamp)

**Accepted Formats**:
- 2024-03-15T14:30:00Z
- 03/15/2024 2:30 PM
- 2024-03-15 14:30:00 -0500

**Standard Format**: yyyy-mm-ddThh:mm:ss.sssZ (UTC)

**Components**:
```javascript
timestamp        // Full UTC timestamp
timestamp.raw    // As submitted
```

**Format Options with Timezone**:
- UTC
- US Eastern
- US Central  
- US Mountain
- US Pacific

### Usage Examples

**Business Hours Check**:
```javascript
// Using timestamp with timezone conversion
Rule: timestamp[format="h:mm A", timezone="US/Eastern"] 
      matches "9:* AM" through "5:* PM"
Action: Route to live agents
```

## 📍 Address Fields

### Street Class

**Components**:
```javascript
// Input: "123 Main Street Apt 4B"
address_1         // "123 Main Street Apt 4B"
address_1.raw     // As submitted
address_1.number  // "123"
address_1.name    // "Main Street Apt 4B"
```

### State Class

**Accepted Formats**:
- Full name: California, New York
- Abbreviation: CA, NY
- Case insensitive

**Standard Format**: Two-letter code (uppercase)

**Components**:
```javascript
state        // "CA" (normalized)
state.raw    // "california" (as submitted)
state.name   // "California" (full name)
state.valid  // true/false
```

### Postal Code Class

**US Format**:
```javascript
// Input: "90210-1234"
postal_code         // "90210" (5-digit)
postal_code.raw     // "90210-1234"
postal_code.zip     // "90210"
postal_code.plus4   // "1234"
postal_code.country // "US"
```

**Canadian Format**:
```javascript
// Input: "K1A 0B1"
postal_code         // "K1A 0B1"
postal_code.fsa     // "K1A" (Forward Sort Area)
postal_code.ldu     // "0B1" (Local Delivery Unit)
postal_code.country // "CA"
```

## 🔢 Numeric Classes

### Number Class

**Accepted Formats**:
- Integer: 1000
- Decimal: 1000.50
- Currency: $1,000.50
- Scientific: 1.5e3

**Normalized**: Floating point number

### Range Class

**Special Numeric Type** for flexible numeric inputs:

```javascript
// Single value
Input: "25000"
range.raw    // "25000"
range        // "25000"
range.min    // 25000
range.max    // 25000
range.avg    // 25000
range.mid    // 25000

// Range value
Input: "25000-35000"
range.raw    // "25000-35000"
range        // "25000-35000"
range.min    // 25000
range.max    // 35000
range.avg    // 30000
range.mid    // 30000

// Open-ended
Input: "50000+"
range.raw    // "50000+"
range        // "50000+"
range.min    // 50000
range.max    // null
range.avg    // null
range.mid    // null
```

### Use Cases

**Income Qualification**:
```
Rule: income.min >= 50000
Action: Qualify for premium products
```

**Age Targeting**:
```
Rule: age.min >= 25 AND age.max <= 54
Action: Target demographic match
```

## 🌐 Web Classes

### URL Class

**Components**:
```javascript
// Input: "https://example.com:8080/path/page?query=1"
url.raw      // As submitted
url.protocol // "https"
url.host     // "example.com"
url.port     // "8080"
url.path     // "/path/page?query=1"
url.valid    // true/false
```

### TrustedFormURL Class

**Extended URL class** with certificate-specific components:

```javascript
trustedform_cert_url.raw        // Full URL
trustedform_cert_url.protocol   // "https"
trustedform_cert_url.host       // "cert.trustedform.com"
trustedform_cert_url.age        // Age in seconds
trustedform_cert_url.is_expired // true/false
trustedform_cert_url.type       // "web", "mobile", "facebook", "masked"
trustedform_cert_url.valid      // true/false
```

**Age Checking**:
```
Rule: trustedform_cert_url.age <= 300
Action: Certificate less than 5 minutes old
```

## 🔤 Other Field Classes

### Boolean Class

**Accepted Values**:
- True: true, TRUE, True, T, t, 1, yes, YES
- False: false, FALSE, False, F, f, 0, no, NO

**Normalized**: true or false (lowercase)

### Gender Class

**Accepted Values**:
- Male: male, MALE, m, M
- Female: female, FEMALE, f, F
- Other: other, OTHER, o, O

**Components**:
```javascript
gender       // "male", "female", or "other"
gender.raw   // As submitted
gender.abbr  // "M", "F", or "O"
```

### IP Address Class

**Validates**:
- IPv4 addresses
- IPv6 addresses
- Rejects private/reserved ranges

### String Class

**Basic text field** with no special parsing or validation.

## 🎯 Practical Applications

### Smart Data Validation

**Multi-Field Validation**:
```javascript
// Ensure complete contact info
Rule: email.valid is true 
      AND phone.valid is true
      AND (phone.is_tollfree is false OR company is not blank)
Action: Accept lead
```

### Geographic Intelligence

**Regional Routing**:
```javascript
// Route by timezone
Rule: state.name is one of "California", "Oregon", "Washington"
      OR timezone equals "US/Pacific"
Action: Route to West Coast team
```

### Data Quality Scoring

**Component-Based Scoring**:
```javascript
score = 0
if (email.valid) score += 25
if (phone.valid) score += 25
if (phone.extension exists) score += 10  // Business number
if (email.domain != common_free_domains) score += 20
if (address_1.number exists) score += 20
```

## 💡 Best Practices

### Field Selection

1. **Use Appropriate Classes**: Don't use string for structured data
2. **Leverage Components**: Access sub-parts instead of parsing
3. **Consider Validation**: Field classes validate automatically
4. **Plan for Flexibility**: Range fields for numeric inputs
5. **Think About Output**: Consider formatting needs

### Component Usage

1. **Dot Notation**: Access components with field.component
2. **Null Safety**: Components may be null if parsing fails
3. **Raw Access**: Use .raw for original input
4. **Valid Checks**: Test .valid before using components
5. **Default Values**: Plan for missing components

### Format Configuration

1. **Output Requirements**: Match recipient expectations
2. **Timezone Handling**: Convert times appropriately
3. **Phone Formats**: Use standard format for storage
4. **Date Consistency**: Stick to one date format
5. **Testing**: Verify format outputs

## 🚫 Common Pitfalls

### "Components Not Available"

**Issue**: Trying to access components on string fields
**Solution**: Change field type to appropriate class

### "Validation Too Strict"

**Issue**: Valid data rejected by field class
**Solution**: Use string type with custom validation rules

### "Format Not Preserved"

**Issue**: Original format lost after normalization
**Solution**: Use .raw component for original value

### "Timezone Confusion"

**Issue**: Times showing in wrong timezone
**Solution**: Explicitly set timezone in format options

## 📊 Field Class Reference Table

| Class | Normalizes | Components | Format Options | Best For |
|-------|------------|------------|----------------|----------|
| String | No | None | No | Unstructured text |
| Email | Yes (lowercase) | user, domain, host, tld | No | Email validation |
| Phone | Yes (digits) | area, exchange, line, etc | Yes | Phone numbers |
| Date | Yes (yyyy-mm-dd) | None | Yes | Date only |
| Time | Yes (UTC) | None | Yes + TZ | Date & time |
| State | Yes (2-letter) | name | No | US/CA states |
| Postal Code | Yes | zip, plus4, fsa, ldu | No | US/CA postal |
| Number | Yes (float) | None | No | Numeric values |
| Range | No | min, max, avg, mid | No | Flexible numbers |
| Boolean | Yes | None | No | True/false |
| URL | No | protocol, host, port, path | No | Web addresses |
| Gender | Yes | abbr | No | Gender data |
| IP | No | None | No | IP addresses |
| Street | No | number, name | No | Street addresses |
| TrustedFormURL | No | age, type, is_expired | No | Certificates |

---

🎯 **Field Class Mastery**: You now understand how LeadConduit's field classes automatically parse, validate, and transform your data. Use these powerful tools to build more intelligent flows that handle real-world data with ease!