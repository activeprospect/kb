# Variables System & Custom Fields

LeadConduit's variables system and custom field capabilities provide powerful tools for data transformation, custom business logic implementation, and flexible field management that extends beyond standard lead data to support complex business requirements and industry-specific workflows.

## Variables System Overview

### Purpose and Architecture

**Dynamic Data Management:**
- Variable-based data transformation and manipulation throughout lead processing workflows
- Template-driven value generation and conditional logic implementation
- Real-time data evaluation and dynamic content creation
- Context-aware variable resolution based on lead state and processing stage
- Flexible data structure adaptation for diverse business requirements

**System Integration:**
- Seamless integration with rules engine for complex decision-making logic
- Template system coordination for dynamic content and mapping generation
- Event-driven variable evaluation throughout the lead lifecycle
- Cross-step variable persistence and state management
- Integration with external data sources and enhancement services

**Business Logic Implementation:**
- Custom business rule implementation through variable expressions
- Industry-specific data transformation and validation requirements
- Dynamic pricing, routing, and decision-making based on variable evaluation
- Conditional processing workflows with variable-driven logic
- Advanced data manipulation and calculation capabilities

### Variable Types and Categories

**Core Variable Categories:**
```
LeadConduit Variable System:
├── Lead Variables:
│   ├── Standard Fields: Built-in lead data properties and attributes
│   ├── Custom Fields: User-defined fields with business-specific data
│   ├── Enhanced Fields: Third-party enriched data and validation results
│   ├── Calculated Fields: Derived values from mathematical and logical operations
│   └── Temporal Fields: Date, time, and timestamp-based calculations
├── System Variables:
│   ├── Processing Context: Current step, flow, and processing state information
│   ├── Source Information: Lead source, campaign, and attribution data
│   ├── Recipient Context: Delivery target and routing information
│   ├── Event Data: Processing history and outcome tracking
│   └── Performance Metrics: Real-time processing and quality indicators
├── Custom Variables:
│   ├── Business Logic: Industry and company-specific calculated fields
│   ├── External Integration: API response data and third-party service results
│   ├── Conditional Values: Dynamic content based on business rules
│   ├── Aggregated Data: Summary and statistical calculations
│   └── User-Defined Functions: Custom logic implementation and reusable components
├── Template Variables:
│   ├── Dynamic Content: Template-generated text and structured data
│   ├── Conditional Templates: Logic-based content generation
│   ├── Function Calls: Built-in and custom function execution
│   ├── String Manipulation: Text processing and formatting operations
│   └── Data Formatting: Type conversion and presentation formatting
└── Enhancement Variables:
    ├── Validation Results: Data quality and accuracy assessment
    ├── Enrichment Data: Additional information from external sources
    ├── Compliance Status: Regulatory and policy adherence indicators
    ├── Quality Scores: Lead quality and conversion probability metrics
    └── Risk Assessment: Fraud detection and quality risk indicators
```

## Standard Lead Variables

### Built-in Lead Properties

**Core Lead Data Access:**
```javascript
// Standard lead field access patterns
lead.first_name          // Contact first name
lead.last_name           // Contact last name  
lead.email               // Email address
lead.phone               // Phone number
lead.address             // Street address
lead.city                // City
lead.state               // State/province
lead.postal_code         // ZIP/postal code
lead.country             // Country code

// Extended lead properties
lead.source              // Lead source identifier
lead.campaign            // Campaign attribution
lead.created_at          // Lead creation timestamp
lead.updated_at          // Last modification time
lead.ip_address          // Originating IP address
lead.user_agent          // Browser/device information
```

**Advanced Field Types and Intelligence:**
```javascript
// Field type-specific access with built-in validation
lead.email.is_valid      // Email format validation result
lead.phone.formatted     // Standardized phone number format
lead.phone.is_mobile     // Mobile phone detection
lead.postal_code.is_valid // ZIP code format validation
lead.age.calculated      // Calculated age from birth date

// Geographic intelligence
lead.address.standardized // Address standardization result
lead.state.abbreviation   // Two-letter state code
lead.timezone            // Inferred timezone from location
lead.dma_code           // Designated Market Area code
```

### Data Type Intelligence

**Type-Aware Variable Resolution:**
```
Field Type Intelligence System:
├── Email Fields:
│   ├── Format Validation: RFC 5322 compliance checking
│   ├── Domain Validation: MX record and deliverability verification
│   ├── Disposable Detection: Temporary email service identification
│   ├── Business Classification: Personal vs. business email detection
│   └── Risk Assessment: Fraud and quality risk scoring
├── Phone Fields:
│   ├── Format Standardization: E.164 international format normalization
│   ├── Type Detection: Mobile, landline, VoIP classification
│   ├── Carrier Information: Service provider identification
│   ├── Geographic Location: Area code and region mapping
│   └── Validation Status: Active number verification
├── Address Fields:
│   ├── Standardization: USPS and international postal format
│   ├── Geocoding: Latitude and longitude coordinate assignment
│   ├── Completeness: Required component validation
│   ├── Deliverability: Mailing address verification
│   └── Risk Assessment: Address quality and fraud indicators
├── Date Fields:
│   ├── Format Normalization: ISO 8601 standard formatting
│   ├── Validation: Date range and logical consistency checking
│   ├── Calculation: Age, duration, and relative date computation
│   ├── Timezone Handling: UTC conversion and local time adjustment
│   └── Business Logic: Working days, holidays, and scheduling calculations
└── Numeric Fields:
    ├── Range Validation: Minimum and maximum value constraints
    ├── Format Normalization: Currency, percentage, and unit standardization
    ├── Mathematical Operations: Arithmetic and statistical calculations
    ├── Comparison Logic: Greater than, less than, and equality operations
    └── Business Rules: Custom validation and transformation logic
```

## Custom Field Creation and Management

### Custom Field Definition

**Account-Specific Field Creation:**
```javascript
// Custom field naming convention with account suffix
lead.custom_field_12345    // Account-specific custom field
lead.industry_12345        // Industry classification field
lead.lead_score_12345      // Custom lead scoring field
lead.budget_range_12345    // Budget range classification
lead.decision_timeline_12345 // Purchase timeline indicator

// Custom field with type inheritance
lead.custom_email_12345    // Custom email field with email intelligence
lead.custom_phone_12345    // Custom phone field with phone validation
lead.custom_date_12345     // Custom date field with date intelligence
lead.custom_address_12345  // Custom address field with address validation
```

**Field Type Designation and Intelligence:**
- **Email Type:** Inherits email validation, deliverability checking, and domain analysis
- **Phone Type:** Provides format standardization, carrier detection, and validation
- **Address Type:** Enables geocoding, standardization, and deliverability verification
- **Date Type:** Supports date arithmetic, validation, and timezone handling
- **Numeric Type:** Enables mathematical operations and range validation

### Custom Field Implementation

**Business Logic Integration:**
```javascript
// Industry-specific custom fields
lead.loan_amount_12345         // Mortgage/lending industry
lead.coverage_type_12345       // Insurance industry
lead.service_needed_12345      // Home services industry
lead.vehicle_year_12345        // Automotive industry
lead.education_level_12345     // Education/training industry

// Business process custom fields
lead.qualification_status_12345 // Lead qualification workflow
lead.follow_up_date_12345      // Sales process management
lead.priority_level_12345      // Lead prioritization system
lead.referral_source_12345     // Attribution tracking
lead.communication_pref_12345  // Contact preference management
```

**Advanced Custom Field Patterns:**
```javascript
// Calculated custom fields with business logic
lead.lifetime_value_calc_12345 = function() {
  return lead.purchase_amount_12345 * lead.retention_probability_12345;
}

// Conditional custom field values
lead.territory_assignment_12345 = 
  lead.state == 'CA' ? 'West Coast' :
  lead.state == 'NY' ? 'East Coast' :
  lead.state == 'TX' ? 'South Central' : 'Other';

// Multi-field custom calculations
lead.qualification_score_12345 = 
  (lead.budget_range_12345 * 0.4) + 
  (lead.decision_timeline_12345 * 0.3) + 
  (lead.authority_level_12345 * 0.3);
```

## Variable Expression Syntax

### Template Expression Language

**Basic Variable Access:**
```handlebars
{{lead.first_name}}           <!-- Simple field access -->
{{lead.email}}                <!-- Email field value -->
{{lead.custom_field_12345}}   <!-- Custom field access -->
{{source.name}}               <!-- Source information -->
{{recipient.id}}              <!-- Recipient context -->
```

**Conditional Logic Expressions:**
```handlebars
<!-- Ternary conditional operator -->
{{lead.state == 'CA' ? 'Pacific' : 'Other'}}

<!-- Multi-condition logic -->
{{lead.age >= 18 && lead.age <= 65 ? 'Target' : 'Non-Target'}}

<!-- Null/empty value handling -->
{{lead.middle_name || 'N/A'}}

<!-- Complex conditional chains -->
{{lead.income >= 100000 ? 'High' : 
  lead.income >= 50000 ? 'Medium' : 'Low'}}
```

**Function Calls and String Manipulation:**
```handlebars
<!-- Built-in function usage -->
{{upper(lead.first_name)}}              <!-- Uppercase conversion -->
{{lower(lead.email)}}                   <!-- Lowercase conversion -->
{{substr(lead.phone, 0, 3)}}            <!-- String substring -->
{{replace(lead.address, 'Street', 'St')}} <!-- String replacement -->

<!-- Date and time functions -->
{{now()}}                               <!-- Current timestamp -->
{{format_date(lead.created_at, 'YYYY-MM-DD')}} <!-- Date formatting -->
{{add_days(now(), 30)}}                 <!-- Date arithmetic -->

<!-- Mathematical functions -->
{{round(lead.loan_amount / 1000, 2)}}   <!-- Rounding operations -->
{{abs(lead.credit_score - 650)}}        <!-- Absolute value -->
{{max(lead.income, 25000)}}             <!-- Maximum value selection -->
```

### Advanced Expression Patterns

**Complex Business Logic Implementation:**
```handlebars
<!-- Multi-field calculation with business rules -->
{{
  lead.age >= 18 && lead.age <= 65 && 
  lead.income >= 50000 && 
  lead.credit_score >= 650 ? 
    (lead.loan_amount <= lead.income * 5 ? 'Approved' : 'Review') : 
    'Declined'
}}

<!-- Dynamic content generation -->
{{
  'Dear ' + (lead.title ? lead.title + ' ' : '') + 
  lead.first_name + ' ' + lead.last_name + 
  ', thank you for your interest in our ' + 
  lead.product_interest + ' services.'
}}

<!-- Advanced conditional formatting -->
{{
  lead.communication_preference == 'email' ? 
    'Email: ' + lead.email :
  lead.communication_preference == 'phone' ? 
    'Phone: ' + format_phone(lead.phone) :
  lead.communication_preference == 'text' ? 
    'Text: ' + lead.mobile_phone : 
    'Mail: ' + format_address(lead.address)
}}
```

## System and Context Variables

### Processing Context Access

**Flow and Step Information:**
```javascript
// Current processing context
flow.id                    // Current flow identifier
flow.name                  // Flow display name
step.id                    // Current step identifier  
step.name                  // Step display name
step.type                  // Step type (source, recipient, filter, etc.)
step.position              // Step sequence position

// Processing state information
event.id                   // Current event identifier
event.timestamp            // Processing timestamp
event.outcome              // Step processing result
event.duration             // Processing time duration
```

**Source and Attribution Context:**
```javascript
// Lead source information
source.id                  // Source identifier
source.name                // Source display name
source.type                // Source type classification
source.campaign            // Campaign attribution
source.cost                // Cost per lead information

// Attribution and tracking
lead.referrer_url          // Referring URL
lead.landing_page          // Landing page URL
lead.utm_source            // UTM source parameter
lead.utm_medium            // UTM medium parameter
lead.utm_campaign          // UTM campaign parameter
lead.utm_term              // UTM term parameter
lead.utm_content           // UTM content parameter
```

### Performance and Quality Variables

**Real-Time Metrics:**
```javascript
// Lead quality indicators
lead.quality_score         // Composite quality assessment
lead.fraud_risk            // Fraud probability score
lead.conversion_probability // Likelihood of conversion
lead.engagement_score      // Interaction and engagement level

// Processing performance
step.processing_time       // Individual step duration
flow.total_processing_time // Complete flow processing time
step.success_rate          // Step success rate statistics
flow.conversion_rate       // Flow conversion rate metrics
```

## Variable Scope and Persistence

### Variable Lifecycle Management

**Scope Hierarchy:**
```
Variable Scope System:
├── Lead Scope:
│   ├── Persistent: Values maintained throughout lead lifecycle
│   ├── Inherited: Values passed between processing steps
│   ├── Calculated: Dynamic values computed at access time
│   ├── Cached: Performance-optimized value storage
│   └── Versioned: Historical value tracking and audit trail
├── Step Scope:
│   ├── Local Variables: Step-specific temporary values
│   ├── Input Parameters: Values received from previous steps
│   ├── Output Values: Results generated by current step
│   ├── Error Context: Exception and failure information
│   └── Performance Metrics: Step execution statistics
├── Flow Scope:
│   ├── Flow Configuration: Flow-level settings and parameters
│   ├── Global Variables: Flow-wide accessible values
│   ├── Shared State: Cross-step communication mechanisms
│   ├── Aggregated Metrics: Flow-level performance statistics
│   └── Business Rules: Flow-level decision logic
├── Session Scope:
│   ├── Processing Session: Current execution context
│   ├── User Context: Processing user and permission information
│   ├── System State: Platform and infrastructure information
│   ├── External Context: API and integration session data
│   └── Temporary Storage: Short-term value caching
└── System Scope:
    ├── Configuration: Platform-wide settings and parameters
    ├── Performance Data: System-level metrics and statistics
    ├── Security Context: Authentication and authorization information
    ├── Integration State: External system connectivity status
    └── Operational Metrics: Platform health and performance indicators
```

### State Management and Persistence

**Value Persistence Patterns:**
```javascript
// Persistent lead-level values
lead.persistent_score = calculated_value;  // Maintained across steps
lead.processing_history.append(event);     // Historical tracking

// Step-level temporary values
step.temp_calculation = intermediate_value; // Step scope only
step.validation_result = check_data();      // Processing result

// Flow-level shared state
flow.shared_data.customer_tier = tier_calc; // Cross-step sharing
flow.metrics.total_processing_time += duration; // Aggregated metrics
```

## Integration with Rules Engine

### Variable-Driven Rule Logic

**Rule Condition Variables:**
```javascript
// Rules using variable expressions
Rule: lead.age >= 18 && lead.income >= 50000
Rule: lead.credit_score > flow.minimum_credit_score
Rule: lead.state in ['CA', 'NY', 'TX', 'FL']
Rule: lead.lead_score_12345 >= source.quality_threshold

// Complex multi-variable rules
Rule: (lead.loan_amount / lead.income) <= 0.28 && 
      lead.debt_to_income <= 0.36 && 
      lead.employment_length >= 24

// Dynamic threshold rules
Rule: lead.conversion_probability >= 
      flow.acceptance_threshold * source.quality_multiplier
```

**Variable-Based Rule Actions:**
```javascript
// Variable assignment actions
Action: lead.territory = determine_territory(lead.state, lead.postal_code)
Action: lead.priority = calculate_priority(lead.lead_score, lead.source_quality)
Action: lead.routing_destination = select_recipient(lead.geography, lead.product)

// Complex calculation actions
Action: lead.lifetime_value_estimate = 
        lead.purchase_probability * 
        lead.average_order_value * 
        lead.retention_factor
```

## Best Practices

### Variable System Optimization

**Performance Best Practices:**
- **Cache calculated values** to avoid repeated computation
- **Use appropriate variable scope** to minimize memory usage
- **Optimize complex expressions** for processing efficiency
- **Implement lazy evaluation** for expensive calculations
- **Monitor variable processing performance** and optimize bottlenecks

**Data Quality and Validation:**
- **Validate custom field data types** to ensure proper intelligence inheritance
- **Implement null value handling** in variable expressions
- **Use type-appropriate field configurations** for maximum system intelligence
- **Test variable expressions thoroughly** before production deployment
- **Document custom field business logic** for maintenance and troubleshooting

### Custom Field Management

**Implementation Guidelines:**
- **Use descriptive naming conventions** with account suffix identification
- **Choose appropriate field types** to inherit system intelligence
- **Implement consistent validation patterns** across related custom fields
- **Document custom field business logic** and calculation methods
- **Regular review and cleanup** of unused or obsolete custom fields

LeadConduit's variables system provides powerful tools for implementing complex business logic, custom data transformation, and flexible field management that adapts to diverse industry requirements and sophisticated business workflows.