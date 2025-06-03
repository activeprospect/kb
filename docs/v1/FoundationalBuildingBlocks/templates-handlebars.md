---
layout: page
title: Templates & Handlebars
permalink: /FoundationalBuildingBlocks/templates-handlebars
---

# Templates & Handlebars

LeadConduit's templating system powered by Handlebars provides dynamic content generation, conditional logic implementation, and flexible data transformation capabilities that enable sophisticated business logic and personalized content creation throughout lead processing workflows.

## Handlebars Templating Overview

### Purpose and Architecture

**Dynamic Content Generation:**
- Template-driven content creation with real-time data integration
- Conditional logic implementation for business rule execution
- Dynamic value calculation and transformation throughout lead processing
- Personalized content generation based on lead attributes and context
- Flexible string manipulation and formatting capabilities

**Business Logic Implementation:**
- Complex decision-making through template expressions
- Multi-conditional logic with nested evaluation capabilities
- Mathematical calculations and data transformations
- Integration with LeadConduit's variable system and rules engine
- Custom function execution and built-in utility access

**System Integration:**
- Seamless integration with lead data and custom fields
- Context-aware template evaluation based on processing state
- Cross-step template sharing and reusable component patterns
- External data integration and API response templating
- Real-time template compilation and performance optimization

### Template Expression Language

**Core Handlebars Syntax:**
```handlebars
{% raw %}
<!-- Basic variable access -->
{{lead.first_name}}              <!-- Simple field interpolation -->
{{lead.email}}                   <!-- Email field value -->
{{lead.custom_field_12345}}      <!-- Custom field access -->
{{source.name}}                  <!-- Source context information -->

<!-- Nested object access -->
{{lead.address.street}}          <!-- Nested property access -->
{{event.processing.timestamp}}   <!-- Event context data -->
{{flow.configuration.settings}}  <!-- Flow-level information -->

<!-- Array and list access -->
{{lead.phone_numbers.[0]}}       <!-- First element access -->
{{lead.tags.[last]}}             <!-- Last element access -->
{{lead.history.length}}          <!-- Array length property -->
{% endraw %}
```

**String Interpolation and Concatenation:**
```handlebars
<!-- String building and concatenation -->
Hello {{lead.first_name}} {{lead.last_name}}, welcome to {{company.name}}!

<!-- Complex string construction -->
{{lead.first_name}} {{lead.last_name}} - {{lead.email}} - {{format_phone(lead.phone)}}

<!-- Dynamic URL construction -->
https://{{domain.name}}/profile/{{lead.id}}?source={{source.id}}&campaign={{campaign.name}}

<!-- Email subject line generation -->
{{lead.first_name}}, your {{lead.product_interest}} quote is ready!
```

### Conditional Logic and Decision Making

**Ternary Conditional Operators:**
```handlebars
<!-- Basic conditional logic -->
{{lead.age >= 18 ? 'Adult' : 'Minor'}}

<!-- Multi-condition evaluation -->
{{lead.income >= 100000 ? 'High Income' : 
  lead.income >= 50000 ? 'Medium Income' : 'Low Income'}}

<!-- Null and empty value handling -->
{{lead.middle_name ? lead.middle_name : 'N/A'}}
{{lead.phone || 'No phone provided'}}

<!-- Complex business logic -->
{{lead.credit_score >= 700 && lead.income >= 50000 ? 'Approved' : 
  lead.credit_score >= 650 && lead.income >= 40000 ? 'Review Required' : 
  'Declined'}}
```

**Boolean Logic and Comparisons:**
```handlebars
<!-- Comparison operators -->
{{lead.age > 25}}                    <!-- Greater than -->
{{lead.income <= 75000}}             <!-- Less than or equal -->
{{lead.state == 'CA'}}               <!-- Equality -->
{{lead.credit_score != null}}        <!-- Not equal -->

<!-- Boolean logic operators -->
{{lead.age >= 18 && lead.age <= 65}} <!-- AND logic -->
{{lead.state == 'CA' || lead.state == 'NY'}} <!-- OR logic -->
{{!(lead.phone == null)}}            <!-- NOT logic -->

<!-- Complex conditional chains -->
{{(lead.age >= 21 && lead.income >= 50000) && 
  (lead.credit_score >= 650 || lead.employment_length >= 24)}}
```

### Built-in Functions and Utilities

**String Manipulation Functions:**
```handlebars
{% raw %}
<!-- Case conversion -->
{{upper(lead.first_name)}}           <!-- Uppercase conversion -->
{{lower(lead.email)}}                <!-- Lowercase conversion -->
{{proper(lead.company_name)}}        <!-- Title case conversion -->

<!-- String operations -->
{{substr(lead.phone, 0, 3)}}         <!-- Substring extraction -->
{{replace(lead.address, 'Street', 'St')}} <!-- String replacement -->
{{trim(lead.company_name)}}          <!-- Whitespace removal -->
{{length(lead.email)}}               <!-- String length -->

<!-- String validation -->
{{contains(lead.email, '@')}}        <!-- Contains check -->
{{starts_with(lead.phone, '+1')}}    <!-- Starts with validation -->
{{ends_with(lead.email, '.com')}}    <!-- Ends with validation -->
{{matches(lead.phone, '^\\d{10}$')}} <!-- Regex pattern matching -->
{% endraw %}
```

**Mathematical Functions:**
```handlebars
{% raw %}
<!-- Basic arithmetic -->
{{add(lead.base_price, lead.taxes)}} <!-- Addition -->
{{subtract(lead.budget, lead.down_payment)}} <!-- Subtraction -->
{{multiply(lead.rate, lead.term)}}   <!-- Multiplication -->
{{divide(lead.total, lead.quantity)}} <!-- Division -->

<!-- Advanced mathematical operations -->
{{round(lead.loan_amount / 1000, 2)}} <!-- Rounding with precision -->
{{abs(lead.credit_score - 650)}}     <!-- Absolute value -->
{{max(lead.income, 25000)}}          <!-- Maximum value -->
{{min(lead.debt_ratio, 0.43)}}       <!-- Minimum value -->
{{pow(lead.growth_rate, lead.years)}} <!-- Exponentiation -->

<!-- Statistical functions -->
{{avg(lead.monthly_income, lead.spouse_income)}} <!-- Average -->
{{sum(lead.expense1, lead.expense2, lead.expense3)}} <!-- Sum -->
{% endraw %}
```

**Date and Time Functions:**
```handlebars
{% raw %}
<!-- Current date and time -->
{{now()}}                            <!-- Current timestamp -->
{{today()}}                          <!-- Current date -->
{{format_date(now(), 'YYYY-MM-DD')}} <!-- Date formatting -->

<!-- Date arithmetic -->
{{add_days(lead.created_at, 30)}}    <!-- Add days to date -->
{{subtract_months(now(), 6)}}        <!-- Subtract months -->
{{add_years(lead.birth_date, 18)}}   <!-- Add years -->

<!-- Date formatting and conversion -->
{{format_date(lead.created_at, 'MM/DD/YYYY')}} <!-- US date format -->
{{format_date(lead.created_at, 'DD-MM-YYYY')}} <!-- European format -->
{{format_time(now(), 'HH:mm:ss')}}   <!-- Time formatting -->
{{timezone_convert(now(), 'PST')}}   <!-- Timezone conversion -->

<!-- Date calculations -->
{{days_between(lead.created_at, now())}} <!-- Days difference -->
{{age_from_birthdate(lead.birth_date)}}  <!-- Age calculation -->
{{business_days_add(now(), 5)}}          <!-- Business day calculation -->
{% endraw %}
```

## Advanced Template Patterns

### Complex Business Logic Implementation

**Multi-Step Decision Trees:**
```handlebars
<!-- Loan approval logic -->
{{
  lead.credit_score >= 740 ? 
    (lead.debt_to_income <= 0.28 ? 'Prime Rate' : 'Standard Rate') :
  lead.credit_score >= 680 ?
    (lead.debt_to_income <= 0.36 && lead.down_payment >= 0.20 ? 'Standard Rate' : 'Subprime Rate') :
  lead.credit_score >= 620 ?
    (lead.debt_to_income <= 0.43 && lead.down_payment >= 0.25 ? 'Subprime Rate' : 'Manual Review') :
    'Declined'
}}

<!-- Territory assignment logic -->
{{
  lead.state == 'CA' ? 
    (lead.city == 'Los Angeles' || lead.city == 'San Francisco' ? 'West Coast Premium' : 'West Coast Standard') :
  lead.state == 'NY' ?
    (lead.postal_code >= '10001' && lead.postal_code <= '10299' ? 'Manhattan' : 'New York Metro') :
  lead.state == 'TX' ?
    (lead.city == 'Austin' || lead.city == 'Dallas' || lead.city == 'Houston' ? 'Texas Major Markets' : 'Texas General') :
    'National'
}}
```

**Dynamic Content Generation:**
```handlebars
<!-- Personalized email content -->
Dear {{lead.title ? lead.title + ' ' : ''}}{{lead.first_name}} {{lead.last_name}},

Thank you for your interest in our {{lead.product_interest}} services. 
Based on your {{lead.property_type}} in {{lead.city}}, {{lead.state}}, 
we have identified {{lead.estimated_savings ? '$' + lead.estimated_savings : 'significant'}} 
potential savings opportunities.

{{lead.urgency_level == 'High' ? 
  'Given your timeline of ' + lead.decision_timeline + ', we recommend scheduling a consultation within the next 48 hours.' :
  'We would be happy to schedule a consultation at your convenience.'
}}

Best regards,
{{agent.name}}
{{agent.title}}
{{company.name}}

<!-- Dynamic pricing presentation -->
Based on your profile, here are your available options:

{{lead.credit_tier == 'Excellent' ? 
  'Premium Package: $' + calculate_premium_price(lead.loan_amount) + ' (Best Rate Available)' :
  lead.credit_tier == 'Good' ? 
    'Standard Package: $' + calculate_standard_price(lead.loan_amount) + ' (Competitive Rate)' :
    'Value Package: $' + calculate_value_price(lead.loan_amount) + ' (Affordable Option)'
}}
```

### Template Composition and Reusability

**Modular Template Components:**
```handlebars
<!-- Reusable address formatting template -->
{{define 'format_address'}}
{{lead.address}}{{lead.address2 ? ', ' + lead.address2 : ''}}
{{lead.city}}, {{lead.state}} {{lead.postal_code}}
{{lead.country ? lead.country : 'United States'}}
{{/define}}

<!-- Reusable contact formatting template -->
{{define 'format_contact'}}
{{lead.first_name}} {{lead.last_name}}
{{lead.email}}
{{format_phone(lead.phone)}}
{{> format_address}}
{{/define}}

<!-- Reusable qualification summary template -->
{{define 'qualification_summary'}}
Qualification Summary:
- Credit Score: {{lead.credit_score}} ({{credit_tier(lead.credit_score)}})
- Income: ${{format_currency(lead.income)}} annually
- Debt-to-Income: {{round(lead.debt_to_income * 100, 1)}}%
- Employment: {{lead.employment_length}} months
- Status: {{qualification_status(lead)}}
{{/define}}
```

**Template Inheritance and Extension:**
```handlebars
<!-- Base email template -->
{{define 'base_email'}}
<!DOCTYPE html>
<html>
<head>
    <title>{{email.subject}}</title>
    <style>{{> email_styles}}</style>
</head>
<body>
    <div class="header">{{> email_header}}</div>
    <div class="content">{{> email_content}}</div>
    <div class="footer">{{> email_footer}}</div>
</body>
</html>
{{/define}}

<!-- Welcome email extending base template -->
{{extend 'base_email'}}
{{define 'email_content'}}
<h1>Welcome, {{lead.first_name}}!</h1>
<p>Thank you for joining {{company.name}}. Your account has been created successfully.</p>
{{> account_details}}
{{> next_steps}}
{{/define}}
```

## Integration with LeadConduit Features

### Rules Engine Integration

**Template-Driven Rule Conditions:**
```javascript
// Rules using template expressions
Rule: {{lead.calculated_score}} >= {{flow.minimum_threshold}}
Rule: {{territory_assignment(lead.state, lead.postal_code)}} == "Priority Market"
Rule: {{qualification_status(lead)}} in ["Approved", "Conditional"]

// Complex template-based acceptance criteria
Rule: {{
  (lead.credit_score >= 650 && lead.income >= 50000) &&
  (lead.debt_to_income <= 0.43) &&
  (days_between(lead.employment_start, now()) >= 730)
}}
```

**Dynamic Rule Action Templates:**
```javascript
// Template-based field mapping
Mapping: lead.routing_code = {{determine_routing(lead.state, lead.product_type)}}
Mapping: lead.priority_score = {{calculate_priority(lead.lead_score, lead.source_quality)}}
Mapping: lead.follow_up_date = {{add_business_days(now(), lead.urgency_factor)}}

// Complex transformation actions
Action: lead.personalized_message = {{generate_message(lead.product_interest, lead.timeline, lead.budget_range)}}
```

### Field Mapping and Transformation

**Dynamic Field Mapping:**
```handlebars
<!-- CRM field mapping with data transformation -->
crm.contact.first_name = {{proper(trim(lead.first_name))}}
crm.contact.last_name = {{proper(trim(lead.last_name))}}
crm.contact.email = {{lower(trim(lead.email))}}
crm.contact.phone = {{format_phone(lead.phone, 'E164')}}

<!-- Address standardization mapping -->
crm.address.street1 = {{standardize_address(lead.address).street}}
crm.address.street2 = {{standardize_address(lead.address).unit}}
crm.address.city = {{standardize_address(lead.address).city}}
crm.address.state = {{standardize_address(lead.address).state_code}}
crm.address.zip = {{standardize_address(lead.address).postal_code}}

<!-- Custom field transformation -->
crm.custom.lead_source = {{source.name}} - {{campaign.name}}
crm.custom.lead_score = {{calculate_composite_score(lead)}}
crm.custom.qualification_date = {{format_date(now(), 'YYYY-MM-DD')}}
```

**Conditional Field Population:**
```handlebars
<!-- Conditional field mapping based on data availability -->
crm.contact.mobile_phone = {{lead.mobile_phone ? format_phone(lead.mobile_phone) : format_phone(lead.phone)}}
crm.contact.work_phone = {{lead.work_phone ? format_phone(lead.work_phone) : ''}}
crm.contact.preferred_contact = {{lead.contact_preference || 'email'}}

<!-- Business logic-driven field assignment -->
crm.opportunity.priority = {{
  lead.budget >= 100000 ? 'High' :
  lead.budget >= 50000 ? 'Medium' : 'Low'
}}

crm.opportunity.close_date = {{
  lead.timeline == 'Immediate' ? add_days(now(), 30) :
  lead.timeline == 'Soon' ? add_days(now(), 60) :
  lead.timeline == 'Later' ? add_days(now(), 120) :
  add_days(now(), 180)
}}
```

## Performance and Optimization

### Template Compilation and Caching

**Compilation Optimization:**
```
Template Performance Strategy:
├── Compile-Time Optimization:
│   ├── Template Pre-compilation: Static template compilation for performance
│   ├── Syntax Validation: Template syntax verification before deployment
│   ├── Dependency Analysis: Template variable and function dependency mapping
│   ├── Optimization Hints: Performance optimization recommendations
│   └── Error Detection: Compile-time error identification and reporting
├── Runtime Optimization:
│   ├── Template Caching: Compiled template storage and reuse
│   ├── Variable Resolution: Efficient variable lookup and resolution
│   ├── Function Call Optimization: Built-in function performance enhancement
│   ├── Memory Management: Template execution memory optimization
│   └── Garbage Collection: Efficient cleanup of template execution context
├── Expression Evaluation:
│   ├── Lazy Evaluation: On-demand expression computation
│   ├── Short-Circuit Logic: Boolean expression optimization
│   ├── Constant Folding: Static expression pre-computation
│   ├── Common Subexpression: Shared calculation optimization
│   └── Result Caching: Expensive calculation result storage
├── Data Access Optimization:
│   ├── Variable Prefetching: Anticipated variable pre-loading
│   ├── Batch Operations: Multiple variable resolution optimization
│   ├── Index Utilization: Efficient data structure access
│   ├── Memory Layout: Optimal data organization for access patterns
│   └── Cache Locality: Memory access pattern optimization
└── Monitoring and Profiling:
    ├── Performance Metrics: Template execution time and resource usage
    ├── Bottleneck Identification: Performance constraint discovery
    ├── Usage Analytics: Template utilization pattern analysis
    ├── Optimization Opportunities: Performance improvement identification
    └── Capacity Planning: Resource requirement forecasting
```

### Best Practices and Guidelines

**Template Design Principles:**
- **Keep expressions readable** with clear variable names and logical structure
- **Use appropriate function calls** for data type-specific operations
- **Implement error handling** for null values and edge cases
- **Optimize complex logic** by breaking into simpler, testable components
- **Document template logic** for maintenance and troubleshooting

**Performance Optimization:**
- **Minimize nested conditional logic** to reduce evaluation complexity
- **Cache expensive calculations** using intermediate variables
- **Use appropriate data types** for mathematical and comparison operations
- **Test template performance** with realistic data volumes
- **Monitor template execution times** and optimize bottlenecks

**Maintainability Guidelines:**
- **Use descriptive variable names** and clear expression structure
- **Implement consistent formatting** across all template expressions
- **Create reusable template components** for common business logic
- **Version control template changes** with clear documentation
- **Test templates thoroughly** before production deployment

LeadConduit's Handlebars templating system provides powerful tools for implementing dynamic content generation, complex business logic, and flexible data transformation that adapts to sophisticated business requirements and enables personalized, context-aware lead processing workflows.