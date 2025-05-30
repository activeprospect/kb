---
layout: page
title: Acceptance Criteria (Rule-Based)
permalink: /LeadsAndEvents/Ping/acceptance-criteria
---

# Acceptance Criteria (Rule-Based)

Acceptance criteria in LeadConduit's ping system determine which leads qualify for bidding and purchase. These rule-based filters allow precise control over lead quality, ensuring you only pay for leads that meet your specific business requirements.

## Understanding Acceptance Criteria

### Purpose and Benefits

**Quality Control:**
- Filter out leads that don't meet minimum requirements
- Ensure consistent data quality across all purchases
- Prevent wasted spend on non-qualifying leads
- Maintain high conversion rates through selective acceptance

**Business Logic Implementation:**
- Encode complex business rules into automated decisions
- Support geographic, demographic, and behavioral targeting
- Enable compliance with regulatory requirements
- Integrate with external data sources for enhanced qualification

**Cost Optimization:**
- Reject leads before payment commitment
- Focus budget on highest-value opportunities
- Prevent fraud and low-quality lead purchases
- Optimize return on investment through strategic filtering

### Rule Evaluation Process

**Three-Tier Evaluation System:**
```
Acceptance Criteria Hierarchy:
├── Flow-Level Criteria (Universal Requirements)
│   ├── Must pass first for any lead consideration
│   ├── Applied to all sources uniformly
│   ├── Defines minimum acceptable standards
│   └── Immediate rejection if criteria fail
├── Source-Level Criteria (Source-Specific Rules)
│   ├── Evaluated after flow criteria pass
│   ├── Customized for individual lead sources
│   ├── Override or enhance flow-level rules
│   └── Enable source-specific optimization
└── Real-Time Data Enhancement
    ├── TrustedForm certification validation
    ├── SuppressionList checking
    ├── External data source integration
    └── Dynamic quality assessment
```

## Flow-Level Acceptance Criteria

### Universal Requirements Configuration

**Core Data Quality Standards:**
```
Required Field Validation:
├── Contact Information:
│   ├── first_name is_present
│   ├── last_name is_present  
│   ├── email is_valid_email
│   ├── phone is_valid_phone
│   └── zip is_valid_postal_code
├── Demographic Requirements:
│   ├── age >= 18 && age <= 85
│   ├── state in ['CA', 'TX', 'NY', 'FL', 'IL']
│   ├── income >= 25000
│   └── credit_score >= 500
├── Lead Quality Metrics:
│   ├── lead_score >= 6.0
│   ├── source_rating >= 'B'
│   ├── duplicate_check == 'unique'
│   └── fraud_score <= 3.0
└── Compliance Validation:
    ├── consent_given == true
    ├── tcpa_compliant == true
    ├── dnd_checked == 'clear'
    └── opt_in_timestamp is_present
```

**Geographic Targeting:**
```
Geographic Acceptance Rules:
├── Include States:
│   ├── state in ['CA', 'TX', 'NY', 'FL']
│   ├── Reason: High-conversion markets
│   └── Action: Accept for bidding
├── Exclude States:
│   ├── state not_in ['AK', 'HI', 'MT', 'WY']
│   ├── Reason: Low volume, high cost
│   └── Action: Automatic rejection
├── Metro Area Targeting:
│   ├── metro_area in ['Los Angeles', 'New York', 'Chicago']
│   ├── Reason: Urban market focus
│   └── Action: Premium pricing tier
└── Rural Area Handling:
    ├── population_density >= 500
    ├── Reason: Service availability
    └── Action: Standard processing
```

### Advanced Flow Criteria

**TrustedForm Integration:**
```
TrustedForm Acceptance Criteria:
├── Certificate Validation:
│   ├── trustedform_cert_url is_present
│   ├── cert_age <= 72_hours
│   ├── cert_status == 'valid'
│   └── page_scan_score >= 85
├── Behavioral Analysis:
│   ├── form_time >= 30_seconds
│   ├── typing_speed >= 20_wpm
│   ├── keystroke_pattern == 'human'
│   └── mouse_movement == 'natural'
├── Source Verification:
│   ├── referring_url is_whitelisted
│   ├── traffic_source != 'bot'
│   ├── geo_consistency == true
│   └── device_fingerprint == 'unique'
└── Consent Validation:
    ├── consent_language_approved == true
    ├── opt_in_method == 'checkbox'
    ├── consent_timestamp is_present
    └── tcpa_disclosure == 'clear'
```

**SuppressionList Integration:**
```
SuppressionList Checking:
├── Email Suppression:
│   ├── email not_in suppression_list('email')
│   ├── email not_in litigation_list
│   ├── domain not_in blocked_domains
│   └── email_hash not_in historical_complaints
├── Phone Suppression:
│   ├── phone not_in suppression_list('phone')
│   ├── phone not_in dnd_registry
│   ├── carrier_type != 'voip_suspicious'
│   └── phone_score >= 7.0
├── Identity Suppression:
│   ├── full_name not_in litigant_list
│   ├── address not_in problem_addresses
│   ├── ip_address not_in fraud_list
│   └── device_id not_in blocked_devices
└── Behavioral Suppression:
    ├── click_pattern != 'bot_signature'
    ├── session_duration >= 15_seconds
    ├── page_views >= 2
    └── engagement_score >= 5.0
```

## Source-Level Acceptance Criteria

### Source-Specific Configuration

**Premium Source Criteria:**
```
High-Quality Source Rules:
├── Enhanced Requirements:
│   ├── lead_score >= 8.0 (higher than flow minimum)
│   ├── contact_attempts == 0 (fresh leads only)
│   ├── source_verification == 'verified'
│   └── historical_conversion >= 15%
├── Expanded Data Requirements:
│   ├── employer is_present
│   ├── income_verified == true
│   ├── home_ownership is_present
│   └── credit_check_authorized == true
├── Time-Based Restrictions:
│   ├── lead_age <= 5_minutes
│   ├── submission_time between 9am_and_6pm
│   ├── weekday == true
│   └── timezone_adjusted == 'business_hours'
└── Volume Considerations:
    ├── daily_source_volume <= 500
    ├── hourly_rate <= 50
    ├── duplicate_rate <= 2%
    └── quality_trend == 'improving'
```

**Testing Source Criteria:**
```
New Source Validation:
├── Conservative Requirements:
│   ├── lead_score >= 7.5 (above flow minimum)
│   ├── required_fields == 100% (all fields required)
│   ├── verification_level == 'enhanced'
│   └── manual_review == 'required'
├── Limited Volume:
│   ├── daily_limit <= 25
│   ├── hourly_limit <= 5
│   ├── test_period <= 30_days
│   └── escalation_trigger == 10_leads
├── Enhanced Monitoring:
│   ├── quality_tracking == 'real_time'
│   ├── conversion_monitoring == 'enabled'
│   ├── feedback_required == true
│   └── performance_review == 'weekly'
└── Graduation Criteria:
    ├── conversion_rate >= 12%
    ├── complaint_rate <= 1%
    ├── data_quality >= 95%
    └── volume_consistency == 'stable'
```

### Dynamic Source Adjustment

**Performance-Based Criteria Updates:**
```
Adaptive Source Management:
├── High Performers (Conversion >= 20%):
│   ├── Relaxed criteria (lead_score >= 6.5)
│   ├── Increased volume limits
│   ├── Premium pricing access
│   └── Priority processing
├── Average Performers (Conversion 10-20%):
│   ├── Standard criteria maintained
│   ├── Regular volume limits
│   ├── Standard pricing
│   └── Normal processing
├── Low Performers (Conversion < 10%):
│   ├── Tightened criteria (lead_score >= 8.5)
│   ├── Reduced volume limits
│   ├── Penalty pricing
│   └── Enhanced monitoring
└── Problem Sources (Conversion < 5%):
    ├── Severe restrictions
    ├── Volume suspension
    ├── Quality improvement plan
    └── Potential termination
```

## Advanced Rule Configuration

### Complex Rule Logic

**Multi-Condition Rules:**
```
Advanced Acceptance Scenarios:
├── Geographic + Demographic:
│   ├── (state == 'CA' && income >= 75000) ||
│   ├── (state == 'TX' && age <= 45) ||
│   ├── (state == 'NY' && credit_score >= 700)
│   └── Default: Reject
├── Time-Based + Quality:
│   ├── business_hours && lead_score >= 7.0 ||
│   ├── after_hours && lead_score >= 8.5 ||
│   ├── weekend && lead_score >= 9.0
│   └── Default: Queue for review
├── Source + Performance:
│   ├── premium_source && lead_score >= 6.0 ||
│   ├── standard_source && lead_score >= 7.5 ||
│   ├── testing_source && lead_score >= 8.5
│   └── Default: Enhanced validation
└── Seasonal + Market:
    ├── peak_season && demand_high ||
    ├── off_season && quality_premium ||
    ├── market_shift && strategic_value
    └── Default: Standard processing
```

**Template-Based Dynamic Rules:**
```
Dynamic Rule Examples:
├── Market-Responsive Pricing:
│   ├── Template: {% raw %}{{market_demand >= 'high' ? 6.5 : 7.5}}{% endraw %}
│   ├── Variable: lead_score >= {{calculated_threshold}}
│   ├── Context: Real-time market conditions
│   └── Update: Every 15 minutes
├── Geographic Optimization:
│   ├── Template: {{geo_performance[state].min_score}}
│   ├── Variable: lead_score >= {{state_threshold}}
│   ├── Context: State-specific performance data
│   └── Update: Daily recalculation
├── Seasonal Adjustment:
│   ├── Template: {{seasonal_modifier[month][product]}}
│   ├── Variable: acceptance_score >= {{adjusted_minimum}}
│   ├── Context: Historical seasonal patterns
│   └── Update: Monthly optimization
└── Source Performance:
    ├── Template: {{source_quality[source_id].threshold}}
    ├── Variable: lead_score >= {{source_minimum}}
    ├── Context: Source historical performance
    └── Update: Real-time adjustment
```

### External Data Integration

**Third-Party Data Enhancement:**
```
External Data Validation:
├── Credit Bureau Integration:
│   ├── Real-time credit score verification
│   ├── Identity validation and fraud detection
│   ├── Financial capacity assessment
│   └── Risk scoring and categorization
├── Marketing Database Enrichment:
│   ├── Demographic profile enhancement
│   ├── Purchase behavior analysis
│   ├── Interest and intent scoring
│   └── Lifecycle stage identification
├── Social Media Validation:
│   ├── Profile authenticity verification
│   ├── Social engagement scoring
│   ├── Interest and affinity analysis
│   └── Influence and reach assessment
└── Device and Location Intelligence:
    ├── Device fingerprinting and validation
    ├── Geolocation accuracy verification
    ├── Network and carrier analysis
    └── Fraud and bot detection
```

## Performance Monitoring

### Acceptance Rate Analytics

**Key Performance Indicators:**
```
Acceptance Criteria Metrics:
├── Overall Performance:
│   ├── Acceptance Rate: 65-85% target range
│   ├── Rejection Reasons: Categorized analysis
│   ├── Quality Score Distribution: Performance trending
│   └── Cost Per Accepted Lead: Efficiency measurement
├── Rule Effectiveness:
│   ├── Individual Rule Performance: Success/failure rates
│   ├── Rule Combination Analysis: Optimal rule sets
│   ├── False Positive Rate: Over-restrictive identification
│   └── False Negative Rate: Quality leak detection
├── Source Performance:
│   ├── Source-Specific Acceptance Rates: Comparative analysis
│   ├── Quality Trend Analysis: Performance improvement/decline
│   ├── Volume vs. Quality Balance: Optimization opportunities
│   └── Competitive Positioning: Market share analysis
└── Business Impact:
    ├── Conversion Rate by Criteria: ROI optimization
    ├── Revenue Attribution: Criteria contribution analysis
    ├── Customer Lifetime Value: Long-term impact assessment
    └── Market Share Growth: Competitive advantage measurement
```

### Optimization Strategies

**Continuous Improvement Process:**
```
Criteria Optimization Framework:
├── Data-Driven Analysis:
│   ├── A/B testing of rule variations
│   ├── Statistical significance validation
│   ├── Performance correlation analysis
│   └── Predictive modeling integration
├── Market Adaptation:
│   ├── Competitive intelligence incorporation
│   ├── Market trend responsiveness
│   ├── Seasonal pattern optimization
│   └── Economic indicator integration
├── Quality Enhancement:
│   ├── False positive reduction strategies
│   ├── Quality score calibration
│   ├── Feedback loop implementation
│   └── Machine learning model training
└── Operational Excellence:
    ├── Rule maintenance scheduling
    ├── Performance review procedures
    ├── Exception handling protocols
    └── Escalation and approval workflows
```

## Best Practices

### Implementation Guidelines

**Strategic Approach:**
- Start with conservative criteria and gradually optimize
- Implement comprehensive testing before production deployment
- Monitor performance continuously and adjust based on data
- Maintain balance between quality and volume requirements

**Technical Excellence:**
- Use clear, maintainable rule logic
- Document all criteria and their business rationale
- Implement proper error handling and fallback procedures
- Ensure real-time monitoring and alerting capabilities

### Operational Management

**Quality Assurance:**
- Regular review and validation of acceptance criteria
- Performance benchmarking against industry standards
- Compliance verification with regulatory requirements
- Stakeholder feedback integration and response

**Continuous Optimization:**
- Data-driven decision making for criteria adjustments
- Market responsiveness and competitive positioning
- ROI optimization through strategic rule refinement
- Innovation integration for enhanced qualification capabilities

Acceptance criteria provide the foundation for successful ping-based lead acquisition, ensuring quality, compliance, and profitability while maintaining competitive market position and operational efficiency.