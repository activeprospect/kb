---
layout: page
title: Mapping & Normalizing Lead Data
permalink: /LeadsAndEvents/DeliveringLeads/mapping-normalizing-lead-data
---

# Mapping & Normalizing Lead Data

Data mapping and normalization in LeadConduit ensures accurate, consistent lead information delivery to recipient systems. This process transforms diverse source data formats into standardized, recipient-specific formats while maintaining data integrity and improving delivery success rates.

## Data Mapping Overview

### Purpose of Data Mapping

**Format Standardization:**
- Convert diverse source data formats into consistent structures
- Ensure compatibility with recipient system requirements
- Maintain data integrity during transformation processes
- Support multiple output formats for different recipients

**Business Rule Application:**
- Apply data validation and quality rules
- Implement business logic during transformation
- Ensure compliance with industry standards
- Support custom data processing requirements

**Integration Efficiency:**
- Reduce recipient system integration complexity
- Minimize data processing errors and rejections
- Optimize delivery performance and success rates
- Enable automated processing and workflow integration

### Common Mapping Scenarios

**Source-to-Recipient Mapping:**
```
Mapping Examples:
├── lead.firstName → recipient.first_name
├── lead.phoneNumber → recipient.primary_phone
├── lead.emailAddress → recipient.email
├── submission.timestamp → recipient.created_date
└── source.campaign → recipient.campaign_id
```

**Field Format Conversion:**
- Phone number formatting (e.g., (555) 123-4567 → 5551234567)
- Date format standardization (e.g., MM/DD/YYYY → YYYY-MM-DD)
- State code normalization (e.g., California → CA)
- Boolean value conversion (e.g., yes/no → true/false)

## Field Mapping Configuration

### Direct Field Mapping

**Simple Assignment:**
- Map source fields directly to recipient fields
- One-to-one field correspondence
- Maintain original data values and formats
- Minimal transformation processing

**Mapping Configuration:**
```
Direct Mapping Examples:
└── Source Field → Recipient Field
    ├── first_name → firstName
    ├── last_name → lastName
    ├── email → emailAddress
    ├── phone → phoneNumber
    └── state → stateCode
```

**Field Selection and Filtering:**
- Include only required fields for specific recipients
- Exclude sensitive or unnecessary data
- Support conditional field inclusion
- Optimize payload size and processing

### Template-Based Mapping

**Dynamic Value Generation:**
- Combine multiple source fields into single output
- Apply business logic and calculations
- Generate computed values from source data
- Support conditional value assignment

**Template Syntax:**
```
Template Mapping Examples:
├── Full Name: "{% raw %}{{lead.first_name}} {{lead.last_name}}{% endraw %}"
├── Address: "{% raw %}{{lead.address}}, {{lead.city}}, {{lead.state}} {{lead.zip}}{% endraw %}"
├── Lead Score: "{% raw %}{{lead.quality_score + lead.value_score}}{% endraw %}"
├── Campaign ID: "{% raw %}{{source.name}}_{{submission.date.format('YYYYMM')}}{% endraw %}"
└── Priority: "{% raw %}{{lead.value >= 1000 ? 'High' : 'Standard'}}{% endraw %}"
```

**Conditional Logic:**
```
Conditional Mapping Examples:
├── if lead.state == 'CA' then territory = 'West'
├── if lead.age >= 65 then segment = 'Senior'
├── if lead.income > 100000 then tier = 'Premium'
├── if source.type == 'organic' then cost = 0
└── if lead.email.isValid() then contact_method = 'email'
```

### Advanced Mapping Patterns

**Multi-Field Aggregation:**
- Combine data from multiple sources into single field
- Apply mathematical operations and calculations
- Implement complex business logic
- Support data enrichment and enhancement

**Nested Object Mapping:**
```json
Nested Object Example:
{
  "contact": {
    "name": "{% raw %}{{lead.first_name}} {{lead.last_name}}{% endraw %}",
    "email": "{% raw %}{{lead.email}}{% endraw %}",
    "phone": "{% raw %}{{lead.phone}}{% endraw %}"
  },
  "location": {
    "address": "{% raw %}{{lead.address}}{% endraw %}",
    "city": "{% raw %}{{lead.city}}{% endraw %}",
    "state": "{% raw %}{{lead.state}}{% endraw %}",
    "zip": "{% raw %}{{lead.zip}}{% endraw %}"
  },
  "metadata": {
    "source": "{% raw %}{{source.name}}{% endraw %}",
    "campaign": "{% raw %}{{source.campaign}}{% endraw %}",
    "created": "{% raw %}{{submission.timestamp}}{% endraw %}"
  }
}
```

**Array and List Handling:**
- Map single values to array structures
- Split delimited data into arrays
- Handle multiple value fields
- Support list-based recipient requirements

## Data Normalization Techniques

### Format Standardization

**Phone Number Normalization:**
- Remove formatting characters (spaces, hyphens, parentheses)
- Standardize to 10-digit format for US numbers
- Add country codes for international numbers
- Validate phone number formats and patterns

**Phone Normalization Examples:**
```
Input → Output:
├── (555) 123-4567 → 5551234567
├── 555-123-4567 → 5551234567
├── 555.123.4567 → 5551234567
├── +1 555 123 4567 → 15551234567
└── 555 123 4567 → 5551234567
```

**Email Address Normalization:**
- Convert to lowercase for consistency
- Trim whitespace and special characters
- Validate email format and domain
- Handle plus-addressing and aliases

**Date and Time Standardization:**
- Convert to ISO 8601 format (YYYY-MM-DDTHH:MM:SSZ)
- Handle timezone conversion and normalization
- Support multiple input date formats
- Validate date ranges and business logic

### Data Validation and Cleansing

**Required Field Validation:**
- Ensure all mandatory fields contain valid data
- Reject or flag incomplete submissions
- Provide default values where appropriate
- Support conditional required field logic

**Data Quality Checks:**
```
Validation Rules:
├── Email: Valid format and domain
├── Phone: Valid number format and length
├── Zip: Valid postal code for state/country
├── State: Valid state code or name
├── Age: Reasonable age range (18-120)
├── Income: Realistic income ranges
└── Name: No test patterns or invalid characters
```

**Data Cleansing Operations:**
- Remove leading/trailing whitespace
- Standardize capitalization (Title Case, UPPER, lower)
- Remove special characters and formatting
- Correct common data entry errors

### Value Transformation

**State Code Conversion:**
```
State Normalization:
├── California → CA
├── New York → NY
├── Texas → TX
├── Florida → FL
└── Illinois → IL
```

**Boolean Value Standardization:**
```
Boolean Conversion:
├── yes/no → true/false
├── Y/N → true/false
├── 1/0 → true/false
├── on/off → true/false
└── checked/unchecked → true/false
```

**Numeric Value Processing:**
- Convert strings to appropriate numeric types
- Handle currency formatting and conversion
- Apply rounding and precision rules
- Validate numeric ranges and business logic

## Recipient-Specific Configuration

### CRM System Integration

**Salesforce Mapping:**
- Map to standard Salesforce field names
- Handle custom field mapping requirements
- Support Salesforce data types and validation
- Configure picklist value mapping

**HubSpot Integration:**
- Map to HubSpot contact property names
- Handle HubSpot-specific field requirements
- Support custom property mapping
- Configure lifecycle stage assignment

**Generic CRM Mapping:**
- Support common CRM field patterns
- Handle various CRM data requirements
- Provide flexible mapping configuration
- Support multiple CRM platform integration

### Marketing Platform Integration

**Email Marketing Platforms:**
- Map contact information and preferences
- Handle segmentation and list assignment
- Support custom field and tag mapping
- Configure subscription and opt-in status

**Marketing Automation:**
- Map lead scoring and qualification data
- Handle campaign and source attribution
- Support behavioral tracking integration
- Configure nurture workflow assignment

### Custom Integration Requirements

**API-Specific Formatting:**
- Handle unique API field requirements
- Support custom data structures
- Implement API-specific validation rules
- Configure authentication and security data

**Database Integration:**
- Map to specific database schemas
- Handle primary key and relationship data
- Support database-specific data types
- Configure transaction and batch processing

## Template Engine and Functions

### Handlebars Template Syntax

**Basic Variable Substitution:**
```
Template Examples:
├── {% raw %}{{lead.first_name}}{% endraw %} - Simple field reference
├── {% raw %}{{lead.email | lower}}{% endraw %} - Apply filter function
├── {% raw %}{{#if lead.phone}}{{lead.phone}}{{/if}}{% endraw %} - Conditional output
└── {% raw %}{{submission.timestamp | date 'MM/DD/YYYY'}}{% endraw %} - Date formatting
```

**Built-in Helper Functions:**
- **String Functions:** upper, lower, trim, substring, replace
- **Date Functions:** format, add, subtract, timezone conversion
- **Math Functions:** add, subtract, multiply, divide, round
- **Conditional Functions:** if, unless, equals, contains

### Custom Template Functions

**Data Transformation Functions:**
```
Custom Function Examples:
├── {% raw %}{{lead.phone | formatPhone}}{% endraw %} - Custom phone formatting
├── {% raw %}{{lead.name | titleCase}}{% endraw %} - Custom capitalization
├── {% raw %}{{lead.state | stateCode}}{% endraw %} - State name to code conversion
├── {% raw %}{{lead.income | formatCurrency}}{% endraw %} - Currency formatting
└── {% raw %}{{submission.timestamp | businessHours}}{% endraw %} - Business time check
```

**Validation Functions:**
- Email validation and verification
- Phone number validation and formatting
- Address validation and standardization
- Data quality scoring and assessment

### Advanced Template Patterns

**Conditional Data Assignment:**
```
Advanced Conditional Examples:
├── {% raw %}{{#if (gte lead.age 65)}}Senior{{else}}Standard{{/if}}{% endraw %}
├── {% raw %}{{#switch lead.state}}{{#case 'CA'}}West{{/case}}{{#case 'NY'}}East{{/case}}{{/switch}}{% endraw %}
├── {% raw %}{{#unless lead.phone}}Email Only{{/unless}}{% endraw %}
└── {% raw %}{{#with lead.address}}{{street}}, {{city}}, {{state}}{{/with}}{% endraw %}
```

**Data Aggregation:**
- Sum multiple numeric fields
- Concatenate multiple text fields
- Calculate derived values and scores
- Implement complex business logic

## Error Handling and Validation

### Mapping Error Detection

**Common Mapping Errors:**
- Missing required source fields
- Invalid template syntax
- Data type conversion failures
- Field length or format violations

**Error Classification:**
```
Mapping Error Types:
├── Template Syntax Errors: Invalid handlebars syntax
├── Missing Field Errors: Required source field unavailable
├── Type Conversion Errors: String to number conversion failure
├── Validation Errors: Data fails validation rules
└── Size Limit Errors: Output exceeds field length limits
```

### Error Resolution Strategies

**Automatic Error Handling:**
- Provide default values for missing fields
- Skip invalid data with logging
- Apply fallback mapping rules
- Continue processing with partial data

**Manual Error Resolution:**
- Queue failed mappings for review
- Provide error details and context
- Enable manual mapping override
- Support reprocessing after correction

### Data Quality Monitoring

**Quality Metrics Tracking:**
- Mapping success and failure rates
- Data completeness and accuracy metrics
- Validation error frequency and patterns
- Performance and processing timing

**Quality Improvement:**
```
Quality Monitoring:
├── Field completion rates by source
├── Validation error frequency analysis
├── Mapping performance optimization
├── Data quality trend analysis
└── Partner-specific quality metrics
```

## Testing and Validation

### Mapping Testing Strategies

**Unit Testing:**
- Test individual field mappings
- Validate template syntax and output
- Test error handling and edge cases
- Verify data type conversion accuracy

**Integration Testing:**
- Test complete mapping configurations
- Validate end-to-end data flow
- Test with realistic data volumes
- Verify recipient system compatibility

### Test Data Management

**Test Data Creation:**
- Create representative test data sets
- Include edge cases and boundary conditions
- Test with various data quality levels
- Simulate real-world data variations

**Validation Procedures:**
```
Testing Checklist:
├── Required field mapping validation
├── Optional field handling verification
├── Data format conversion accuracy
├── Template syntax and logic testing
├── Error handling and fallback testing
├── Performance and scalability validation
└── Recipient system compatibility check
```

## Performance Optimization

### Mapping Performance

**Optimization Strategies:**
- Minimize complex template calculations
- Cache frequently used transformation results
- Optimize database field access patterns
- Use efficient data processing algorithms

**Resource Management:**
- Monitor memory usage during mapping
- Optimize CPU usage for large volumes
- Manage database connection pooling
- Balance processing speed with accuracy

### Scalability Considerations

**High-Volume Processing:**
- Batch processing for large data sets
- Parallel processing for independent mappings
- Queue management for processing load
- Resource scaling for peak demand

**Cost Optimization:**
- Minimize processing overhead
- Optimize storage and bandwidth usage
- Balance speed with resource consumption
- Monitor and optimize operational costs

## Best Practices

### Configuration Management

**Mapping Documentation:**
- Document all mapping rules and logic
- Maintain version control for configurations
- Provide clear field mapping specifications
- Support change management processes

**Testing and Quality Assurance:**
- Regular testing of mapping configurations
- Validation with partner systems
- Continuous monitoring of data quality
- Performance optimization and tuning

### Data Governance

**Privacy and Compliance:**
- Ensure data handling compliance (GDPR, CCPA)
- Implement data minimization principles
- Support data retention and deletion requirements
- Maintain audit trails for data processing

**Security Considerations:**
- Protect sensitive data during transformation
- Implement secure data handling practices
- Monitor for data leakage or exposure
- Ensure encrypted data transmission

Data mapping and normalization provide the foundation for successful lead delivery, ensuring data quality, recipient compatibility, and operational efficiency. Proper implementation enables seamless integration while maintaining data integrity and business rule compliance.