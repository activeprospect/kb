---
layout: page
title: Using Lead Data
---

# Using Lead Data

Lead qualification in LeadConduit transforms raw lead information into actionable intelligence through sophisticated data analysis, validation, and enhancement. Understanding how to leverage existing lead data effectively is fundamental to building high-performing lead processing workflows.

## Lead Data Fundamentals

### Data Structure and Availability

**Submitted Data:**
- Original information provided by the lead source
- Form field values and user inputs
- Source-specific metadata and tracking
- Timestamp and submission context

**Appended Data:**
- Information added during flow processing
- Enhancement service results
- Calculated fields and scores
- Cross-reference and validation results

**System Data:**
- LeadConduit-generated information
- Processing timestamps and durations
- Flow execution context
- Source and recipient identifiers

### Data Access Patterns

**Template-Based Access:**
```
lead.first_name          // Direct field access
lead.email               // Standard field reference
submission.timestamp     // System timestamp
source.name             // Source information
```

**Conditional Data Usage:**
```
lead.phone_1.area_code   // Phone component access
lead.address.state       // Address components
lead.custom_field        // Custom field values
```

## Field Types and Components

### Standard Field Intelligence

**Phone Field Components:**
- `area_code`: Three-digit area code
- `exchange`: Three-digit exchange
- `line_number`: Four-digit line number
- `extension`: Extension number if provided
- `formatted`: Standardized phone format

**Address Field Components:**
- `street`: Street address
- `city`: City name
- `state`: State abbreviation
- `zip`: ZIP code
- `country`: Country code

**Email Field Intelligence:**
- Domain extraction and validation
- Deliverability assessment
- Format standardization
- Fraud pattern detection

### Custom Field Utilization

**Business-Specific Data:**
- Lead scoring components
- Industry-specific qualifiers
- Custom demographic information
- Behavioral tracking data

**Calculated Fields:**
- Derived values from multiple inputs
- Cross-field validation results
- Time-based calculations
- Geographic analysis results

## Rules-Based Qualification

### Understanding Rule Logic

**Rule Structure:**
Every rule follows the pattern: `left-hand value` `operator` `right-hand value`

**Template Integration:**
- Left-hand values support full template syntax
- Right-hand values can use templates or constants
- Dynamic evaluation based on current lead state
- Cross-field comparison capabilities

### Common Qualification Patterns

**Geographic Qualification:**
```
Rule: lead.state
Operator: is equal to
Value: CA

Rule: lead.zip
Operator: starts with
Value: 9
```

**Contact Quality Assessment:**
```
Rule: lead.email
Operator: is not blank
Value: (none)

Rule: lead.phone_1.area_code
Operator: is not equal to
Value: 000
```

**Demographic Filtering:**
```
Rule: lead.age
Operator: is greater than or equal to
Value: 18

Rule: lead.income
Operator: is greater than
Value: 35000
```

**Lead Scoring Integration:**
```
Rule: lead.lead_score
Operator: is greater than or equal to
Value: 7.5

Rule: lead.quality_grade
Operator: is in the list
Value: A,B
```

### Complex Rule Sets

**Multiple Condition Logic:**
- **ALL conditions** must be true (AND logic)
- **ANY condition** must be true (OR logic)
- **Nested rule sets** for complex scenarios
- **Rule prioritization** for efficiency

**Rule Set Examples:**
```
High-Value Lead Qualification:
├── ALL of the following:
│   ├── lead.state in ['CA', 'TX', 'NY']
│   ├── lead.age >= 25
│   └── lead.income >= 50000
└── ANY of the following:
    ├── lead.homeowner == 'yes'
    └── lead.credit_score >= 650
```

## Data Validation Techniques

### Format Validation

**Email Validation:**
- Syntax checking (RFC compliance)
- Domain validation
- MX record verification
- Deliverability assessment

**Phone Validation:**
- Number format standardization
- Area code validity checking
- Carrier identification
- Line type detection (mobile, landline)

**Address Validation:**
- ZIP code format verification
- State/ZIP correlation checking
- Address standardization
- Deliverability confirmation

### Data Completeness Scoring

**Completeness Metrics:**
```
Data Completeness Score:
├── Required fields (40% weight)
├── Recommended fields (35% weight)
├── Enhancement fields (15% weight)
└── Custom fields (10% weight)
```

**Quality Indicators:**
- Field population percentage
- Data consistency checks
- Format compliance rates
- Validation success rates

### Cross-Field Validation

**Logical Consistency:**
- Age and birth date correlation
- Income and employment validation
- Geographic consistency checking
- Contact method verification

**Fraud Detection Patterns:**
- Suspicious data combinations
- Pattern recognition algorithms
- Anomaly detection
- Historical comparison analysis

## Template-Powered Data Manipulation

### Template Syntax in Rules

**Basic Field Reference:**
```
{{lead.first_name}}          // Simple field access
{{lead.phone_1.formatted}}   // Component access
{{submission.timestamp}}     // System data access
```

**Conditional Logic:**
```
{{lead.state == 'CA' ? 'West Coast' : 'Other'}}
{{lead.age >= 65 ? 'Senior' : 'Standard'}}
{{lead.income > 100000 ? 'Premium' : 'Standard'}}
```

**String Manipulation:**
```
{{lead.first_name.toUpperCase()}}
{{lead.email.split('@')[1]}}
{{lead.phone_1.replace(/\D/g, '')}}
```

**Mathematical Operations:**
```
{{lead.monthly_income * 12}}
{{(lead.age - 18) / 10}}
{{lead.score1 + lead.score2}}
```

### Advanced Template Functions

**Date and Time Functions:**
```
{{submission.timestamp.format('YYYY-MM-DD')}}
{{lead.birth_date.age()}}
{{now().format('HH:mm:ss')}}
```

**String Functions:**
```
{{lead.name.trim()}}
{{lead.state.toLowerCase()}}
{{lead.phone.length}}
```

**Validation Functions:**
```
{{lead.email.isValidEmail()}}
{{lead.phone.isValidPhone()}}
{{lead.zip.isValidZip()}}
```

## Lead Scoring Methodologies

### Scoring Framework

**Multi-Factor Scoring:**
- Contact quality assessment
- Demographic value calculation
- Behavioral indicator analysis
- Historical performance correlation

**Weighted Scoring Model:**
```
Lead Score Calculation:
├── Contact Quality (25%)
│   ├── Email deliverability
│   ├── Phone validity
│   └── Address completeness
├── Demographics (35%)
│   ├── Age appropriateness
│   ├── Income qualification
│   └── Geographic value
├── Intent Indicators (25%)
│   ├── Form completion quality
│   ├── Response speed
│   └── Information accuracy
└── External Validation (15%)
    ├── Third-party verification
    ├── Credit assessment
    └── Fraud detection
```

### Dynamic Scoring Rules

**Rule-Based Score Adjustment:**
```
Base Score Modifications:
├── High-value geography: +2 points
├── Premium age range: +1.5 points
├── Income verification: +1 point
├── Mobile phone: +0.5 points
├── Suspicious patterns: -5 points
└── Incomplete data: -1 point
```

**Conditional Scoring:**
```
if lead.state in ['CA', 'NY', 'TX'] then
  score += 2
else if lead.state in ['FL', 'WA', 'IL'] then
  score += 1
end

if lead.age >= 25 && lead.age <= 55 then
  score += 1.5
end
```

## Performance Optimization

### Efficient Rule Design

**Rule Ordering Strategy:**
1. **Most Selective Rules First** - Eliminate maximum leads quickly
2. **Fastest Rules First** - Simple comparisons before complex calculations
3. **Required Fields First** - Check essential data availability
4. **Expensive Operations Last** - External validations at the end

**Optimization Techniques:**
- Cache frequently accessed values
- Use early termination logic
- Minimize template complexity
- Leverage field components efficiently

### Data Processing Efficiency

**Template Optimization:**
- Pre-calculate complex values
- Avoid redundant calculations
- Use efficient operators
- Minimize string manipulations

**Rule Set Optimization:**
- Group related conditions
- Use appropriate logical operators
- Eliminate redundant rules
- Test rule performance impact

## Integration with Enhancement Services

### Data Enrichment Preparation

**Pre-Enhancement Validation:**
- Ensure minimum data quality for enhancement
- Validate required fields for external services
- Check data format compliance
- Assess cost-benefit of enhancement

**Post-Enhancement Processing:**
- Incorporate appended data into qualification
- Update lead scores based on new information
- Apply enhanced validation rules
- Trigger conditional processing paths

### External Data Integration

**Third-Party Data Sources:**
- Credit scoring services
- Address validation systems
- Phone verification services
- Email deliverability checkers

**Data Correlation:**
- Cross-reference submitted vs. verified data
- Identify discrepancies and patterns
- Build confidence scores
- Flag potential fraud indicators

## Best Practices for Lead Data Utilization

### Data Quality Management

**Continuous Monitoring:**
- Track field completion rates
- Monitor validation success rates
- Analyze rejection patterns
- Identify data quality trends

**Quality Improvement:**
- Regular rule performance review
- Acceptance criteria optimization
- Field requirement assessment
- Source quality feedback

### Rule Maintenance

**Regular Review Process:**
- Monthly rule performance analysis
- Quarterly acceptance criteria updates
- Annual scoring model review
- Continuous optimization based on results

**Testing and Validation:**
- A/B testing of rule changes
- Historical data analysis
- Performance impact assessment
- ROI measurement of rule modifications

### Privacy and Compliance

**Data Handling Standards:**
- PII protection protocols
- Consent management integration
- Data retention compliance
- Right to deletion support

**Audit Trail Maintenance:**
- Complete processing history
- Rule evaluation logging
- Data transformation tracking
- Compliance reporting capabilities

Effective use of lead data transforms raw information into qualified prospects through systematic validation, scoring, and enhancement. Understanding these techniques enables optimization of lead quality while maintaining processing efficiency and compliance standards.