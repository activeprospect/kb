---
title: Fields
description: Your data model - defining what information leads contain
tags:
  - fields-focused
  - reference
  - technical
  - core-concept
  - data-management
---

# Fields

## What are Fields?

Fields define your lead data model in LeadConduit. They specify what information you collect, how it's structured, and what types of data are valid. Think of fields as the columns in your lead database - each field represents a specific piece of information about a lead, from basic contact details to complex business-specific data.

## Why Fields Matter

Without a consistent data model, lead processing becomes chaos. Every vendor sends different field names, every system expects different formats, and data quality suffers. Fields solve this by:

- **Standardizing Data** - Common fields work the same way everywhere
- **Enforcing Types** - Each field knows what kind of data it holds
- **Enabling Validation** - Invalid data is caught and flagged
- **Supporting Intelligence** - Typed fields provide parsed components

## Standard vs Custom Fields

LeadConduit provides two categories of fields:

### Standard Fields

Pre-defined fields for common lead data:

| Category | Examples | Purpose |
|----------|----------|---------|
| **Contact** | Email, Phone 1, Phone 2, Phone 3 | Core contact information |
| **Identity** | First Name, Last Name, Age, Gender | Personal identification |
| **Location** | Address 1, Address 2, City, State, Postal Code | Geographic data |
| **Business** | Company Name, Annual Revenue, Employee Count | B2B information |
| **Intent** | Product Interest, Loan Amount, Insurance Type | What they're looking for |
| **Timing** | Created At, Appointment, Contact After | When to take action |
| **Meta** | IP Address, User Agent, Referring URL | Technical tracking |

Standard fields provide:
- Consistent naming across all flows
- Built-in type validation
- Automatic parsing and components
- No configuration needed

### Custom Fields

Fields you create for your specific needs:
- Industry-specific data
- Proprietary scoring
- Vendor-specific information
- Internal tracking

Custom fields are just as powerful as standard fields - they support all the same types and validation.

## Field Properties

Every field has key properties that define its behavior:

| Property | Description | Example |
|----------|-------------|---------|
| **ID** | Unique identifier | `email`, `phone_1`, `loan_amount` |
| **Name** | Display name | "Email", "Phone 1", "Loan Amount" |
| **Type** | Data type for parsing/validation | `email`, `phone`, `number` |
| **Description** | What this field contains | "Primary contact email address" |
| **Required** | Must be present (flow-specific) | true/false |
| **Aggregate** | Available in reporting | true/false |

## Field Types and Intelligence

The real power of fields comes from their [types](types.md). Each field has a type that determines how data is parsed, validated, and enriched:

### Example: Phone Field
```
Raw Input: "(555) 123-4567 ext 890"

Parsed Result:
- phone_1: "5551234567"
- phone_1.area: "555"
- phone_1.exchange: "123"
- phone_1.line: "4567"
- phone_1.extension: "890"
- phone_1.valid: true
- phone_1.mobile: false
```

### Example: Email Field
```
Raw Input: "JOHN.DOE@EXAMPLE.COM"

Parsed Result:
- email: "john.doe@example.com"
- email.host: "example.com"
- email.domain: "example.com"
- email.name: "john.doe"
- email.valid: true
```

## Using Fields in Flows

Fields interact with several flow components:

### 1. Source Configuration
When configuring a source, you map vendor fields to your standard fields:

| Vendor Sends | Maps To | Result |
|--------------|---------|--------|
| `contact_email` | `email` | Vendor's data fills your email field |
| `primary_phone` | `phone_1` | Vendor's data fills your phone_1 field |
| `loan_amt` | `loan_amount` | Vendor's data fills your loan_amount field |

### 2. Validation Rules
Fields work with [rules](rules.md) for validation:
- "email is valid email"
- "phone_1 is present"
- "loan_amount is between 5000 and 100000"

### 3. Enhancement Results
Enhancement services append data to fields:
- Original: `phone_1 = "5551234567"`
- After enhancement: `appended.phone_intelligence.carrier = "Verizon"`

### 4. Recipient Mapping
When delivering, your fields map to recipient requirements:

| Your Field | Recipient Expects | Result |
|------------|-------------------|--------|
| `email` | `Email_Address__c` | Your email becomes their Email_Address__c |
| `phone_1` | `PrimaryPhone` | Your phone_1 becomes their PrimaryPhone |

## Field Namespaces

Fields exist in different namespaces depending on context:

| Namespace | Contains | Example |
|-----------|----------|---------|
| (no prefix) | Custom fields | `loan_type`, `credit_score` |
| `lead.*` | Parsed standard fields | `lead.email`, `lead.phone_1.valid` |
| `appended.*` | Enhancement data | `appended.demographics.income` |
| `source.*` | Source metadata | `source.ip_address` |

## Common Field Patterns

### Contact Fields
The three phone number fields follow a pattern:
- `phone_1` - Primary phone
- `phone_2` - Secondary phone  
- `phone_3` - Tertiary phone

Each has the same parsing and validation capabilities.

### Address Fields
Work together to form complete addresses:
- `address_1` - Street address
- `address_2` - Apartment/suite
- `city` - City name
- `state` - State/province
- `postal_code` - ZIP/postal code

### Metadata Fields
Capture submission context:
- `ip_address` - Submitter's IP
- `user_agent` - Browser information
- `referring_url` - Traffic source
- `created_at` - Submission timestamp

### Business Intent Fields
Common across industries:
- `product_interest` - What they want
- `timeframe` - When they need it
- `budget` - What they can spend

## Best Practices

### Choosing Fields

**Do:**
- Use standard fields when they fit your needs
- Create custom fields for unique data
- Use descriptive names for custom fields
- Include units in field names when relevant (e.g., `loan_amount_usd`)

**Don't:**
- Duplicate standard fields with custom versions
- Use generic names like `field1`, `custom1`
- Store multiple values in one field
- Ignore field types - use the right type for your data

### Field Naming

For custom fields:
- Use lowercase with underscores: `annual_income`
- Be specific: `auto_insurance_type` not just `type`
- Include context: `preferred_contact_time` not just `time`
- Consider grouping: `vehicle.make`, `vehicle.model`, `vehicle.year`

### Required Fields

Mark fields as required when:
- Your business can't function without them
- Downstream systems require them
- They're part of your purchase agreement

Remember: Required fields that are missing cause lead rejection.

## Field Configuration Examples

### Basic Contact Form
```
Standard Fields Used:
- first_name (string)
- last_name (string)
- email (email)
- phone_1 (phone)
- state (state)
- product_interest (string)
```

### Insurance Lead Form
```
Standard Fields:
- All contact fields above
- date_of_birth (date)
- gender (gender)
- zip (postal_code)

Custom Fields:
- insurance_type (string)
- current_carrier (string)
- policy_expiration (date)
- coverage_amount (number)
```

### B2B Lead Form
```
Standard Fields:
- company_name (string)
- annual_revenue (number)
- employee_count (number)
- industry (string)

Custom Fields:
- decision_timeframe (string)
- current_solution (string)
- pain_points (string)
```

## Technical Details

### Field Definition Structure
```json
{
  "id": "email",
  "name": "Email",
  "type": "email",
  "description": "Primary contact email address",
  "standard": true,
  "aggregate": true
}
```

### Type Assignment
- Each field must have exactly one type
- Types determine parsing behavior
- Types provide validation
- Types generate components

### Field Visibility
- Standard fields appear in all accounts
- Custom fields are account-specific
- Deprecated fields remain for compatibility
- New standard fields are added periodically

## Related Concepts

- **[Types](types.md)** - How fields parse and validate data
- **[Mappings](mappings.md)** - How fields transform between systems
- **[Rules](rules.md)** - How fields are used in business logic
- **[Templates](templates.md)** - How to access field values dynamically

---

*Fields are the foundation of your lead data model. They define what you collect, ensure data quality through types, and enable consistent processing across all your flows.*