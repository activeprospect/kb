---
layout: page
title: Handlebars Templates in LeadConduit
permalink: /FoundationalBuildingBlocks/TemplatesVariablesRules/templates-handlebars
---

# Handlebars Templates in LeadConduit

LeadConduit's Handlebars template system provides powerful dynamic content generation capabilities that enable sophisticated data transformation, conditional logic, and seamless integration across all platform features. Understanding this template system is essential for creating flexible, maintainable, and efficient lead processing flows.

## Template System Overview

### Universal Template Language

**Consistent Syntax Across Platform:**
LeadConduit uses a unified template language based on Handlebars.js that works consistently across all features:
- Rule values and conditions
- Field mappings and transformations
- Integration parameters and configurations
- Feedback processing and routing
- Pricing calculations and logic
- Custom field generation and manipulation

**Core Template Philosophy:**
The template system follows the principle of "learn once, use everywhere"—mastering template syntax in one context immediately enables you to use it throughout the entire platform.

### Template Processing Architecture

**Template Execution Environment:**
```
Template Processing Pipeline:
├── Data Context Assembly:
│   ├── Lead data (all field values and metadata)
│   ├── Submission data (timestamps, processing context)
│   ├── Recipient data (destination system information)
│   ├── System data (current user, organization, environment)
│   └── External data (API responses, lookups, calculations)
├── Template Parsing:
│   ├── Syntax validation and error detection
│   ├── Variable identification and resolution
│   ├── Function call preparation and validation
│   ├── Conditional logic structure analysis
│   └── Performance optimization and caching
├── Expression Evaluation:
│   ├── Variable substitution and value injection
│   ├── Function execution and result processing
│   ├── Conditional logic evaluation and branching
│   ├── Mathematical operations and calculations
│   └── String manipulation and formatting
└── Output Generation:
    ├── Result formatting and type conversion
    ├── Error handling and fallback processing
    ├── Performance monitoring and optimization
    ├── Security validation and sanitization
    └── Final output delivery and integration
```

## Template Syntax and Variables

### Basic Variable Reference

**Simple Field Access:**
```handlebars
{{lead.first_name}}          // Lead's first name
{{lead.email}}               // Lead's email address
{{lead.phone}}               // Lead's phone number
{{lead.state}}               // Lead's state
{{lead.custom_field_name}}   // Custom field value
```

**Submission Context Variables:**
```handlebars
{{submission.timestamp}}               // When the lead was submitted
{{submission.id}}                     // Unique submission identifier
{{submission.ip}}                     // Lead's IP address
{{submission.user_agent}}             // Browser user agent string
{{submission.referer}}                // Referring page URL
{{submission.utm_source}}             // UTM tracking source
{{submission.utm_campaign}}           // UTM tracking campaign
{{submission.landing_page}}           // Landing page URL
```

**Recipient and System Variables:**
```handlebars
{{recipient.name}}                    // Destination system name
{{recipient.id}}                      // Recipient identifier
{{user.name}}                         // Current user name
{{user.email}}                        // Current user email
{{organization.name}}                 // Organization name
{{flow.name}}                         // Current flow name
{{step.name}}                         // Current step name
```

### Advanced Variable Patterns

**Nested Object Access:**
```handlebars
{{lead.address.street}}               // Nested address data
{{lead.contact.preferences.email}}    // Deep nested access
{{submission.geo.city}}               // Geographic data
{{submission.device.mobile}}          // Device information
```

**Array and Collection Access:**
```handlebars
{{lead.tags[0]}}                      // First tag in array
{{lead.products[1].name}}             // Second product name
{{submission.events.length}}          // Number of events
{{recipient.mappings[field_name]}}    // Dynamic mapping access
```

## Template Functions and Operations

### String Manipulation Functions

**Text Processing and Formatting:**
```handlebars
{{lead.first_name.toUpperCase()}}                    // "JOHN"
{{lead.last_name.toLowerCase()}}                     // "smith"
{{lead.email.replace("@old.com", "@new.com")}}      // Email domain replacement
{{lead.phone.replace(/[^\d]/g, "")}}                // Strip non-digits
{{lead.description.substring(0, 100)}}              // First 100 characters
{{lead.city.trim()}}                                 // Remove whitespace
{{lead.name.split(" ")[0]}}                         // First word only
```

**String Building and Concatenation:**
```handlebars
{{lead.first_name + " " + lead.last_name}}          // Full name
{{recipient.name + " - " + lead.email}}             // Composite identifier
{{"Hello " + lead.first_name + ", welcome!"}}       // Greeting message
{{lead.address.street + ", " + lead.address.city}}  // Address line
```

### Mathematical Operations

**Arithmetic and Calculations:**
```handlebars
{{lead.age + 5}}                                     // Age plus 5 years
{{lead.income * 12}}                                 // Annual income calculation
{{lead.score / 100}}                                 // Percentage conversion
{{lead.price - lead.discount}}                      // Net price calculation
{{Math.round(lead.rating * 10) / 10}}               // Round to 1 decimal place
{{Math.max(lead.score1, lead.score2, lead.score3)}} // Maximum score
{{Math.min(lead.budget, 10000)}}                    // Budget cap
```

**Advanced Mathematical Functions:**
```handlebars
{{Math.abs(lead.latitude - 40.7128)}}               // Distance calculation
{{Math.pow(lead.base_score, 2)}}                    // Square calculation
{{Math.sqrt(lead.area)}}                            // Square root
{{Math.floor(lead.percentage * 100)}}               // Round down percentage
{{Math.ceil(lead.estimated_time)}}                  // Round up time
```

### Date and Time Functions

**Date Formatting and Manipulation:**
```handlebars
{{submission.timestamp.format('YYYY-MM-DD')}}                    // "2024-01-15"
{{submission.timestamp.format('MM/DD/YYYY HH:mm:ss')}}          // "01/15/2024 14:30:25"
{{submission.timestamp.format('dddd, MMMM Do YYYY')}}           // "Monday, January 15th 2024"
{{submission.timestamp.add(30, 'days').format('YYYY-MM-DD')}}   // 30 days later
{{submission.timestamp.subtract(1, 'hour').format('HH:mm')}}    // 1 hour earlier
{{new Date().format('YYYY-MM-DD HH:mm:ss')}}                    // Current timestamp
```

**Time Zone and Regional Formatting:**
```handlebars
{{submission.timestamp.tz('America/New_York').format('YYYY-MM-DD HH:mm:ss')}}     // EST/EDT time
{{submission.timestamp.tz('Europe/London').format('DD/MM/YYYY')}}                 // UK format
{{submission.timestamp.utc().format('YYYY-MM-DD[T]HH:mm:ss[Z]')}}                // UTC ISO format
{{submission.timestamp.local().format('h:mm A')}}                                 // Local 12-hour format
```

### Conditional Logic and Control Flow

**Simple Conditional Expressions:**
```handlebars
{{lead.state == 'CA' ? 'California' : 'Other State'}}              // Ternary operator
{{lead.age >= 18 ? 'Adult' : 'Minor'}}                             // Age classification
{{lead.income > 50000 ? 'Premium' : 'Standard'}}                   // Tier assignment
{{lead.email.includes('@gmail.com') ? 'Gmail' : 'Other'}}          // Email provider
{{lead.phone ? lead.phone : 'No phone provided'}}                  // Default values
```

**Complex Conditional Logic:**
```handlebars
{{lead.state == 'CA' || lead.state == 'NY' ? 'High Value' : 
  lead.state == 'TX' || lead.state == 'FL' ? 'Medium Value' : 'Standard'}}

{{lead.age >= 65 ? 'Senior' : 
  lead.age >= 30 ? 'Adult' : 
  lead.age >= 18 ? 'Young Adult' : 'Minor'}}

{{lead.income > 100000 && lead.credit_score > 750 ? 'Premium Plus' :
  lead.income > 50000 && lead.credit_score > 650 ? 'Premium' : 'Standard'}}
```

**Boolean and Logical Operations:**
```handlebars
{{lead.email && lead.phone}}                                       // Both fields present
{{lead.first_name || lead.company_name}}                          // Either field present
{{!lead.do_not_call}}                                             // Not opted out
{{lead.age >= 18 && lead.state != 'CA'}}                          // Multiple conditions
{{lead.tags.includes('vip') || lead.score > 90}}                  // VIP or high score
```

## Advanced Template Patterns

### Data Validation and Quality

**Field Validation Templates:**
```handlebars
{{lead.email.match(/^[^\s@]+@[^\s@]+\.[^\s@]+$/) ? 'Valid' : 'Invalid'}}        // Email validation
{{lead.phone.replace(/[^\d]/g, '').length >= 10 ? 'Valid' : 'Invalid'}}         // Phone validation
{{lead.zip_code.match(/^\d{5}(-\d{4})?$/) ? 'Valid' : 'Invalid'}}               // ZIP code validation
{{lead.age >= 18 && lead.age <= 120 ? 'Valid' : 'Invalid'}}                     // Age range validation
```

**Data Standardization Templates:**
```handlebars
{{lead.state.toUpperCase().substring(0, 2)}}                                     // State abbreviation
{{lead.phone.replace(/[^\d]/g, '').replace(/(\d{3})(\d{3})(\d{4})/, '($1) $2-$3')}}  // Phone formatting
{{lead.email.toLowerCase().trim()}}                                              // Email normalization
{{lead.name.split(' ').map(word => word.charAt(0).toUpperCase() + word.slice(1).toLowerCase()).join(' ')}}  // Title case
```

### Business Logic Implementation

**Lead Scoring Templates:**
```handlebars
{{(lead.income / 1000) + 
  (lead.age * 0.5) + 
  (lead.credit_score / 10) + 
  (lead.state == 'CA' ? 20 : 0) + 
  (lead.email.includes('@gmail.com') ? 5 : 0)}}                                 // Composite lead score

{{lead.page_views * 2 + 
  lead.time_on_site / 60 + 
  (lead.form_completions * 10) + 
  (lead.download_count * 5)}}                                                   // Engagement score
```

**Dynamic Routing Templates:**
```handlebars
{{lead.state == 'CA' ? 'west-coast-team' : 
  lead.state == 'NY' || lead.state == 'NJ' ? 'east-coast-team' : 
  lead.state == 'TX' ? 'south-team' : 'central-team'}}                         // Geographic routing

{{lead.budget > 100000 ? 'enterprise-sales' :
  lead.budget > 25000 ? 'mid-market-sales' :
  lead.budget > 5000 ? 'small-business-sales' : 'inside-sales'}}               // Budget-based routing
```

### Integration and API Templates

**API Parameter Building:**
```handlebars
{{"first_name=" + encodeURIComponent(lead.first_name) + 
  "&last_name=" + encodeURIComponent(lead.last_name) + 
  "&email=" + encodeURIComponent(lead.email)}}                                 // URL parameters

{{"Bearer " + recipient.api_token}}                                             // Authorization header
{{"application/json; charset=utf-8"}}                                          // Content type header
{{submission.id + "-" + Date.now()}}                                           // Unique request ID
```

**Dynamic JSON Construction:**
```handlebars
{{"{ \"contact\": { \"firstName\": \"" + lead.first_name + 
  "\", \"lastName\": \"" + lead.last_name + 
  "\", \"email\": \"" + lead.email + 
  "\", \"customScore\": " + (lead.score || 0) + " } }"}}                       // JSON payload

{{"{ \"lead_data\": " + JSON.stringify({
    name: lead.first_name + " " + lead.last_name,
    contact: lead.email,
    score: lead.calculated_score,
    timestamp: submission.timestamp.format()
  }) + "}"}}                                                                    // Complex JSON
```

## Template Usage Contexts

### Rules and Acceptance Criteria

**Rule Value Templates:**
```handlebars
// Left-hand rule values (what you're testing)
{{lead.calculated_score}}                                                       // Dynamic score calculation
{{lead.age + lead.experience_years}}                                            // Combined metrics
{{submission.timestamp.format('HH')}}                                           // Hour of submission
{{lead.email.split('@')[1]}}                                                    // Email domain extraction

// Right-hand rule values (what you're testing against)
{{recipient.minimum_score}}                                                     // Dynamic threshold
{{Math.floor(lead.income / 12)}}                                               // Monthly income calculation
{{new Date().subtract(30, 'days').format('YYYY-MM-DD')}}                      // 30 days ago
```

**Complex Rule Expressions:**
```handlebars
{{(lead.credit_score * 0.4) + (lead.income / 1000 * 0.3) + (lead.age * 0.3)}} // Weighted scoring
{{lead.utm_source == 'google' && lead.utm_medium == 'cpc' ? 100 : 50}}        // Campaign-based scoring
{{lead.phone ? 10 : 0) + (lead.email ? 15 : 0) + (lead.address ? 5 : 0)}}     // Contact completeness score
```

### Field Mappings and Transformations

**Dynamic Field Mapping:**
```handlebars
{{lead.first_name + " " + lead.last_name}}                                     // Full name creation
{{lead.company_name || lead.first_name + " " + lead.last_name}}                // Company or personal name
{{submission.utm_source + "/" + submission.utm_medium + "/" + submission.utm_campaign}}  // Campaign tracking
{{lead.address.street + ", " + lead.address.city + ", " + lead.address.state + " " + lead.address.zip}}  // Full address
```

**Conditional Mapping Values:**
```handlebars
{{lead.mobile_phone || lead.home_phone || lead.work_phone}}                    // Phone priority fallback
{{lead.email_work && lead.email_work.includes('@') ? lead.email_work : lead.email_personal}}  // Email preference
{{lead.state == 'CA' ? lead.timezone || 'PST' : lead.timezone || 'EST'}}      // Regional timezone default
```

### Pricing and Financial Calculations

**Dynamic Pricing Templates:**
```handlebars
{{lead.estimated_value * 0.15}}                                                // Percentage-based pricing
{{lead.state == 'CA' ? 25.00 : lead.state == 'NY' ? 22.50 : 20.00}}          // Geographic pricing
{{Math.min(lead.calculated_value, 100.00)}}                                    // Price ceiling
{{lead.quality_score >= 80 ? 30.00 : lead.quality_score >= 60 ? 20.00 : 10.00}}  // Tiered pricing
```

**Revenue Optimization Templates:**
```handlebars
{{(lead.lifetime_value * 0.1) + (lead.urgency_score * 0.5)}}                  // Value + urgency pricing
{{lead.competitor_offers.length > 0 ? lead.max_competitor_price * 1.05 : lead.base_price}}  // Competitive pricing
{{lead.referral_source == 'partner' ? lead.base_price * 0.85 : lead.base_price}}  // Partner discount
```

## Performance Optimization

### Template Efficiency Best Practices

**Optimization Strategies:**
- Cache frequently calculated values using custom fields
- Minimize complex nested function calls in high-volume templates
- Use simple boolean logic instead of complex conditional chains when possible
- Avoid redundant calculations by storing intermediate results
- Leverage built-in functions rather than complex custom logic

**High-Performance Template Patterns:**
```handlebars
// Efficient: Single calculation stored in custom field
{{lead.cached_composite_score}}

// Less efficient: Repeated complex calculation
{{(lead.income / 1000) + (lead.age * 0.5) + (lead.credit_score / 10)}}

// Efficient: Simple boolean logic
{{lead.premium_qualified}}

// Less efficient: Complex conditional evaluation
{{lead.income > 100000 && lead.credit_score > 750 && lead.age >= 30}}
```

### Error Handling and Fallbacks

**Defensive Template Programming:**
```handlebars
{{lead.phone || "Phone not provided"}}                                         // Null handling
{{lead.income ? lead.income : 0}}                                              // Default numeric values
{{lead.tags && lead.tags.length > 0 ? lead.tags[0] : "No tags"}}              // Array safety
{{lead.address && lead.address.state ? lead.address.state : "Unknown"}}        // Nested object safety
```

**Template Error Recovery:**
```handlebars
{{try(lead.complex_calculation, lead.fallback_value, "Default")}}              // Error fallback chain
{{lead.api_response && lead.api_response.success ? lead.api_response.data : lead.local_data}}  // API fallback
{{isValid(lead.email) ? lead.email : lead.backup_contact}}                     // Validation-based fallback
```

## Debugging and Troubleshooting

### Template Testing Strategies

**Template Validation Approaches:**
1. **Start Simple**: Begin with basic variable references before adding complexity
2. **Test Incrementally**: Add one function or condition at a time
3. **Use Static Test Data**: Verify template logic with known input values
4. **Check Data Availability**: Ensure referenced fields exist and contain expected data types
5. **Validate Syntax**: Verify proper parentheses, quotes, and operator usage

**Common Template Issues:**
```handlebars
// Problem: Undefined variable reference
{{lead.nonexistent_field}}                    // Returns empty/null

// Solution: Add existence check
{{lead.nonexistent_field || "Default value"}}

// Problem: Type mismatch in operations
{{lead.text_field + 5}}                       // May cause unexpected results

// Solution: Explicit type conversion
{{parseInt(lead.text_field) + 5}}

// Problem: Complex nested conditions
{{lead.a == 'x' ? lead.b == 'y' ? 'result1' : 'result2' : 'result3'}}

// Solution: Simplified logic structure
{{(lead.a == 'x' && lead.b == 'y') ? 'result1' : 
  (lead.a == 'x') ? 'result2' : 'result3'}}
```

### Template Performance Monitoring

**Performance Indicators:**
- Template execution time in processing logs
- Memory usage during complex template evaluation
- Error rates in template processing
- Cache hit rates for template-generated values
- Overall flow processing throughput

**Optimization Guidelines:**
- Limit template complexity in high-volume processing steps
- Use custom fields to pre-calculate complex values
- Monitor template execution time in flow performance reports
- Consider rule-based alternatives for simple conditional logic
- Implement template result caching for frequently accessed calculations

## Advanced Template Applications

### Machine Learning Integration

**Score Normalization Templates:**
```handlebars
{{(lead.ml_score - recipient.score_min) / (recipient.score_max - recipient.score_min) * 100}}  // Score normalization
{{Math.max(0, Math.min(100, lead.raw_ml_score * recipient.score_multiplier))}}                  // Bounded score scaling
{{lead.model_confidence > 0.8 ? lead.ml_prediction : lead.fallback_score}}                     // Confidence-based scoring
```

**A/B Testing Templates:**
```handlebars
{{submission.id % 2 == 0 ? 'variant_a' : 'variant_b'}}                                         // Simple A/B split
{{Math.abs(lead.email.hashCode()) % 100 < 25 ? 'test_group' : 'control_group'}}                // 25% test allocation
{{lead.signup_date >= '2024-01-01' ? 'new_flow' : 'legacy_flow'}}                             // Date-based routing
```

### Real-Time Personalization

**Dynamic Content Generation:**
```handlebars
{{"Hello " + (lead.first_name || "there") + "! Based on your interest in " + 
  (lead.product_category || "our services") + ", we have special offers in " + 
  (lead.state || "your area") + "."}}                                                          // Personalized messaging

{{lead.previous_purchases.length > 0 ? 
  "Welcome back! Your last purchase was " + lead.previous_purchases[0].product_name :
  "Welcome! Discover our " + lead.interests[0] + " solutions."}}                               // Purchase history personalization
```

**Behavioral Targeting Templates:**
```handlebars
{{lead.page_views > 10 ? 'highly_engaged' : 
  lead.page_views > 3 ? 'moderately_engaged' : 'low_engagement'}}                             // Engagement classification

{{lead.session_duration > 300 ? 'deep_researcher' :
  lead.bounce_rate < 0.3 ? 'interested_browser' : 'casual_visitor'}}                          // Visitor behavior analysis
```

## Integration Patterns

### CRM Integration Templates

**Salesforce Integration:**
```handlebars
{{lead.source_detail || lead.utm_source || "Unknown"}}                                        // Campaign source mapping
{{lead.lead_score >= 80 ? "Hot" : lead.lead_score >= 60 ? "Warm" : "Cold"}}                  // Lead temperature
{{submission.timestamp.format("YYYY-MM-DD[T]HH:mm:ss[Z]")}}                                   // ISO timestamp format
{{lead.annual_revenue ? "Enterprise" : "SMB"}}                                                // Company size classification
```

**HubSpot Integration:**
```handlebars
{{"lifecyclestage=" + (lead.customer_type || "lead")}}                                        // Lifecycle stage mapping
{{"lead_source=" + encodeURIComponent(lead.original_source || "Direct")}}                     // Source attribution
{{lead.contact_preference == 'email' ? lead.email : lead.phone}}                             // Preferred contact method
```

### Marketing Automation Templates

**Email Marketing Integration:**
```handlebars
{{lead.segmentation_tags.join(",")}}                                                          // Tag concatenation
{{lead.purchase_intent > 70 ? "high_intent" : "nurture"}}                                    // List assignment
{{lead.email_frequency_preference || "weekly"}}                                               // Communication cadence
{{lead.industry + "_" + lead.company_size + "_template"}}                                     // Dynamic template selection
```

**Analytics Integration:**
```handlebars
{{"event_category=lead_generation&event_action=form_submit&event_label=" + lead.form_name}}    // Google Analytics events
{{lead.conversion_value || lead.estimated_value || 0}}                                        // Conversion tracking
{{submission.utm_source + "|" + submission.utm_medium + "|" + submission.utm_campaign}}      // Campaign attribution
```

The Handlebars template system in LeadConduit provides powerful capabilities for creating dynamic, intelligent lead processing flows that adapt to data conditions, optimize for business outcomes, and integrate seamlessly with external systems. Mastering these template patterns enables sophisticated lead processing automation that drives measurable business results while maintaining flexibility and maintainability.