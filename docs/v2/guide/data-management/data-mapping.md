---
tags:
  - buyer-focused
  - intermediate
  - how-to
  - data-management
  - mappings-focused
  - integrations
  - technical
---

# Data Mapping and Transformation

Master the art of transforming lead data between sources and recipients. Learn field mapping, data transformation, and standardization techniques for seamless data flow.

## 📍 You Are Here

You're learning how to map and transform data as it flows through LeadConduit. Proper mapping ensures data arrives at destinations in the correct format, with the right field names, and properly validated.

## 🎯 What You'll Master

- Field mapping fundamentals
- Data transformation techniques
- Value standardization
- Complex mapping scenarios
- Troubleshooting mapping issues

## 🗺️ Understanding Mappings

### What Are Mappings?

Mappings connect data between systems:
- **Source Fields** → **LeadConduit Fields** → **Recipient Fields**
- Transform formats (phone: 555-1234 → 5551234)
- Standardize values (California → CA)
- Combine/split fields
- Apply business logic

### Why Mappings Matter

**Without Proper Mapping**:
- ❌ Data arrives in wrong format
- ❌ Required fields missing
- ❌ Integration failures
- ❌ Manual data cleanup

**With Proper Mapping**:
- ✅ Automatic format conversion
- ✅ Consistent data quality
- ✅ Seamless integrations
- ✅ Zero manual intervention

## 🔧 Basic Mapping Concepts

### Direct Mapping

Simple one-to-one field connections:
```
Source Field    →    Destination Field
─────────────────────────────────────
email           →    email_address
phone           →    contact_phone
first_name      →    fname
last_name       →    lname
```

### Field Naming Strategies

**Source Variations**:
```
Common Email Field Names:
- email
- email_address  
- emailAddress
- Email
- contact_email
- primary_email
```

**Standardize in LeadConduit**:
```
All map to → email
```

### Data Types

Ensure compatible types:
- **String** → String
- **Number** → Number or String
- **Boolean** → Boolean, 1/0, yes/no
- **Date** → Various formats

## 🔄 Transformation Techniques

### Format Transformations

**Phone Formatting**:
```javascript
Input:  (555) 123-4567
Output: 5551234567

Input:  555.123.4567
Output: 5551234567

Input:  +1-555-123-4567
Output: 5551234567
```

**Date Formatting**:
```javascript
Input:  2024-01-15T10:30:00Z
Output: 01/15/2024

Input:  January 15, 2024
Output: 2024-01-15
```

### Value Standardization

**State Codes**:
```javascript
Input:  California, CALIFORNIA, Calif., CA
Output: CA

Input:  New York, NEW YORK, N.Y., NY
Output: NY
```

**Boolean Values**:
```javascript
Input:  true, True, TRUE, 1, yes, Yes
Output: true

Input:  false, False, FALSE, 0, no, No
Output: false
```

### String Manipulation

**Concatenation**:
```javascript
first_name: John
last_name: Doe
full_name: {first_name} {last_name} → "John Doe"
```

**Extraction**:
```javascript
full_email: john.doe@example.com
username: {full_email.split('@')[0]} → "john.doe"
domain: {full_email.split('@')[1]} → "example.com"
```

**Case Conversion**:
```javascript
Input:  JOHN DOE
Output: John Doe (Title Case)

Input:  john doe  
Output: JOHN DOE (Upper Case)
```

## 📝 Advanced Mapping Patterns

### Conditional Mapping

Map based on conditions:
```javascript
// Map lead type based on source
if (source == "Facebook") {
  lead_type = "Social"
} else if (source == "Google") {
  lead_type = "Search"  
} else {
  lead_type = "Direct"
}

// Map priority based on state
if (state in ["CA", "TX", "FL"]) {
  priority = "High"
} else {
  priority = "Normal"
}
```

### Calculated Fields

Create new fields from existing data:
```javascript
// Calculate age from birthdate
age = current_year - birth_year

// Score calculation
lead_score = (email_valid * 25) + 
             (phone_valid * 25) + 
             (state_matches * 50)

// Revenue estimation
estimated_value = base_value * conversion_rate * quality_score
```

### Multi-Field Mapping

Combine multiple fields:
```javascript
// Address compilation
full_address = {street} + ", " + {city} + ", " + {state} + " " + {zip}

// Phone preference
best_phone = {mobile_phone} || {work_phone} || {home_phone}

// Name formatting
display_name = {prefix} + " " + {first_name} + " " + {last_name} + " " + {suffix}
```

## 🎯 Mapping Configuration

### Source Mapping

Configure how incoming data maps to LeadConduit:

```yaml
Source Configuration:
  Field Mappings:
    - Source: "EmailAddress"
      LeadConduit: "email"
      Required: true
    
    - Source: "PhoneNumber"  
      LeadConduit: "phone_1"
      Transform: "digits_only"
      
    - Source: "FirstName"
      LeadConduit: "first_name"
      Transform: "title_case"
```

### Recipient Mapping

Configure outbound field mapping:

```yaml
Recipient Configuration:
  Field Mappings:
    - LeadConduit: "email"
      Destination: "contact_email"
      
    - LeadConduit: "phone_1"
      Destination: "primary_phone"
      Format: "+1{value}"
      
    - LeadConduit: "state"
      Destination: "mailing_state_code"
      Transform: "uppercase"
```

## 🔍 Common Mapping Scenarios

### E-commerce Lead Mapping

```javascript
// Source Fields → LeadConduit → Shopify
email → email → customer_email
phone → phone_1 → customer_phone
cart_value → purchase_amount → total_spent
items → product_interest → tags
```

### Real Estate Lead Mapping

```javascript
// Zillow → LeadConduit → CRM
property_interest → property_type → lead_property_type
price_range → budget → estimated_budget
timeline → purchase_timeline → urgency_score
area → target_location → search_area
```

### Insurance Lead Mapping

```javascript
// Form → LeadConduit → Carrier
dob → birth_date → applicant_age (calculated)
coverage_amount → requested_coverage → policy_amount
health_conditions → medical_history → risk_category
smoker → tobacco_use → rate_class
```

## 🚧 Troubleshooting Mappings

### "Field Not Mapped"

**Symptoms**: Data missing at destination

**Check**:
1. Source field name exact match
2. Mapping configuration saved
3. Field contains data
4. No typos in field names

### "Invalid Format"

**Symptoms**: Data rejected by recipient

**Solutions**:
1. Add format transformation
2. Verify expected format
3. Check data type compatibility
4. Test with sample data

### "Mapping Not Working"

**Debug Steps**:
1. Check Events for raw data
2. Verify field appears in flow
3. Test transformation logic
4. Review recipient requirements

## 💡 Best Practices

### Naming Conventions

**Use Clear Names**:
```
Good:
- email_address
- mobile_phone
- purchase_date

Bad:
- field1
- data
- misc
```

### Documentation

**Document Complex Mappings**:
```javascript
// Map timezone based on state
// Uses ET for eastern states, CT for central, etc.
// Default to PT if state unknown
timezone = state_to_timezone_map[state] || "PT"
```

### Validation

**Validate Before Mapping**:
1. Check data exists
2. Verify format
3. Ensure type compatibility
4. Handle edge cases

### Performance

**Optimize Transformations**:
- Cache repeated calculations
- Minimize complex operations
- Use built-in functions
- Batch similar transformations

## 📊 Mapping Patterns Library

### Phone Number Patterns

```javascript
// Remove all non-digits
phone.replace(/\D/g, '')

// Format as (XXX) XXX-XXXX
phone.replace(/(\d{3})(\d{3})(\d{4})/, '($1) $2-$3')

// Add country code
'+1' + phone
```

### Email Patterns

```javascript
// Lowercase all emails
email.toLowerCase()

// Extract domain
email.split('@')[1]

// Validate format
/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)
```

### Name Patterns

```javascript
// Title case
name.replace(/\w\S*/g, txt => 
  txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase()
)

// Remove extra spaces
name.trim().replace(/\s+/g, ' ')

// Extract initials
name.split(' ').map(n => n[0]).join('')
```

## 📋 Mapping Checklist

Before activating flow:
- [ ] All required fields mapped
- [ ] Transformations tested
- [ ] Edge cases handled
- [ ] Documentation added
- [ ] Sample data validates
- [ ] Recipient format confirmed
- [ ] Error handling configured
- [ ] Performance acceptable

## 📚 Related Documentation

- [Field Configuration](./field-configuration.md) - Field setup and validation
- [Types Reference](../../reference/types.md) - Data type details
- [Mappings Reference](../../reference/mappings.md) - Technical specifications

---

🔄 **Mapping Mastery**: Proper data mapping is the bridge between systems. Take time to understand requirements, test thoroughly, and document complex transformations for maintainable integrations!