---
layout: page
title: Pricing (Rule-Based)
permalink: /LeadsAndEvents/Ping/pricing-rules
---

# Pricing (Rule-Based)

Rule-based pricing in LeadConduit's ping system enables dynamic, intelligent bid optimization that maximizes ROI while maintaining competitive market position. This sophisticated pricing engine adapts to market conditions, lead quality, and business objectives in real-time.

## Understanding Rule-Based Pricing

### Purpose and Benefits

**Strategic Pricing Control:**
- Optimize bid prices based on lead quality and market value
- Implement sophisticated pricing strategies automatically
- Balance cost control with competitive positioning
- Maximize return on investment through intelligent bidding

**Market Responsiveness:**
- Adapt pricing to real-time market conditions
- Respond to competitive pressure dynamically
- Capitalize on market opportunities automatically
- Maintain price leadership in target segments

**Quality-Based Optimization:**
- Pay premium prices for high-quality leads
- Reduce costs for lower-quality opportunities
- Implement performance-based pricing strategies
- Optimize conversion rates through strategic pricing

### Pricing Framework Architecture

**Comprehensive Pricing System:**
```
Rule-Based Pricing Framework:
├── Pricing Hierarchy:
│   ├── Account-Level Defaults (Global pricing strategy)
│   ├── Flow-Level Pricing (Campaign-specific rules)
│   ├── Source-Level Overrides (Vendor-specific adjustments)
│   └── Dynamic Adjustments (Real-time optimizations)
├── Rule Types:
│   ├── Fixed Pricing (Static rate structures)
│   ├── Conditional Pricing (Rule-based adjustments)
│   ├── Dynamic Pricing (Market-responsive rates)
│   ├── Tiered Pricing (Volume-based structures)
│   └── Competitive Pricing (Auction-based strategies)
├── Data Integration:
│   ├── Lead Quality Metrics (Score-based pricing)
│   ├── Market Intelligence (Competitive positioning)
│   ├── Historical Performance (ROI-based optimization)
│   ├── External Data Sources (Enhanced qualification)
│   └── Real-Time Analytics (Performance monitoring)
└── Optimization Engine:
    ├── Machine Learning Models (Predictive pricing)
    ├── A/B Testing Framework (Strategy validation)
    ├── Performance Analytics (ROI measurement)
    ├── Market Adaptation (Competitive response)
    └── Continuous Learning (Strategy evolution)
```

## Fixed Pricing Strategies

### Static Rate Configuration

**Base Pricing Structure:**
```
Fixed Pricing Examples:
├── Geographic Pricing:
│   ├── California: $25.00 (High-value market)
│   ├── Texas: $20.00 (Standard market)
│   ├── New York: $30.00 (Premium market)
│   ├── Florida: $22.00 (Growth market)
│   └── Default: $15.00 (Standard rate)
├── Product-Based Pricing:
│   ├── Mortgage Refinance: $45.00
│   ├── Auto Insurance: $35.00
│   ├── Personal Loan: $25.00
│   ├── Credit Card: $20.00
│   └── Home Insurance: $30.00
├── Quality-Tier Pricing:
│   ├── Premium (Score 9-10): $35.00
│   ├── High (Score 7-8): $25.00
│   ├── Standard (Score 5-6): $15.00
│   ├── Basic (Score 3-4): $10.00
│   └── Minimum (Score 1-2): $5.00
└── Time-Based Pricing:
    ├── Business Hours (9 AM - 6 PM): $20.00
    ├── Extended Hours (6 PM - 9 PM): $25.00
    ├── Evening Hours (9 PM - 12 AM): $15.00
    └── Off Hours (12 AM - 9 AM): $10.00
```

**Implementation Configuration:**
```
Fixed Pricing Rule Examples:
├── Simple Geographic Rule:
│   ├── Condition: lead.state == 'CA'
│   ├── Action: price = 25.00
│   ├── Fallback: price = 15.00
│   └── Logic: if (lead.state == 'CA') return 25.00; else return 15.00;
├── Multi-Condition Rule:
│   ├── Condition: lead.state == 'NY' && lead.credit_score >= 700
│   ├── Action: price = 35.00
│   ├── Alternative: lead.state == 'NY' && lead.credit_score >= 600
│   ├── Action: price = 25.00
│   └── Fallback: price = 15.00
├── Quality-Based Rule:
│   ├── Condition: lead.score >= 8.5
│   ├── Action: price = 30.00
│   ├── Alternative: lead.score >= 6.5
│   ├── Action: price = 20.00
│   └── Fallback: price = 10.00
└── Time-Sensitive Rule:
    ├── Condition: hour_of_day >= 9 && hour_of_day <= 17
    ├── Action: price = 25.00
    ├── Alternative: hour_of_day >= 18 && hour_of_day <= 21
    ├── Action: price = 30.00
    └── Fallback: price = 15.00
```

## Dynamic Pricing Strategies

### Market-Responsive Pricing

**Real-Time Market Adaptation:**
```
Dynamic Pricing Framework:
├── Market Demand Pricing:
│   ├── High Demand (>90% acceptance): base_price * 1.2
│   ├── Medium Demand (70-90% acceptance): base_price * 1.0
│   ├── Low Demand (50-70% acceptance): base_price * 0.9
│   └── Very Low Demand (<50% acceptance): base_price * 0.8
├── Competitive Positioning:
│   ├── Market Leader: competitor_max_bid * 1.05
│   ├── Price Matcher: competitor_avg_bid * 1.0
│   ├── Value Player: competitor_min_bid * 1.1
│   └── Cost Leader: market_floor_price * 1.05
├── Performance-Based Adjustment:
│   ├── High ROI Sources (>25%): increase_price(15%)
│   ├── Medium ROI Sources (15-25%): maintain_price()
│   ├── Low ROI Sources (5-15%): decrease_price(10%)
│   └── Negative ROI Sources (<5%): minimize_bid()
└── Time-Decay Pricing:
    ├── Fresh Leads (0-5 min): premium_price * 1.0
    ├── Recent Leads (5-15 min): premium_price * 0.95
    ├── Aging Leads (15-30 min): premium_price * 0.85
    └── Stale Leads (>30 min): premium_price * 0.7
```

**Template-Based Dynamic Pricing:**
```
Advanced Dynamic Rules:
├── Market Intelligence Template:
│   ├── Rule: price = {{base_price * market_multiplier[state][hour]}}
│   ├── Variables: Real-time market demand data
│   ├── Update: Every 15 minutes
│   └── Fallback: base_price if data unavailable
├── Performance Optimization Template:
│   ├── Rule: price = {{roi_optimized_price[source_id][quality_tier]}}
│   ├── Variables: Historical conversion and ROI data
│   ├── Update: Daily recalculation
│   └── Fallback: quality_tier_price if no history
├── Competitive Response Template:
│   ├── Rule: price = {{competitor_response[market_segment]}}
│   ├── Variables: Real-time competitive intelligence
│   ├── Update: Hourly market analysis
│   └── Fallback: standard_competitive_price
└── Seasonal Adjustment Template:
    ├── Rule: price = {{seasonal_price[month][product][geography]}}
    ├── Variables: Historical seasonal performance
    ├── Update: Monthly pattern analysis
    └── Fallback: annual_average_price
```

### External Pricing Services

**Third-Party Pricing Integration:**
```
External Pricing Service Configuration:
├── API Integration Setup:
│   ├── Endpoint Configuration: https://pricing-api.company.com/evaluate
│   ├── Authentication: API key and security tokens
│   ├── Request Format: JSON with lead data payload
│   ├── Response Processing: Price extraction and validation
│   └── Timeout Handling: Fallback pricing on delays
├── Data Payload Structure:
│   ├── Lead Information: All available lead fields
│   ├── Market Context: Geographic and temporal data
│   ├── Historical Performance: Source and quality metrics
│   ├── Competitive Intelligence: Market positioning data
│   └── Business Rules: Account-specific parameters
├── Response Processing:
│   ├── Price Validation: Range and logic checks
│   ├── Business Rule Application: Policy compliance
│   ├── Fallback Logic: Default pricing on failures
│   ├── Logging and Monitoring: Performance tracking
│   └── A/B Testing: Strategy comparison
└── Performance Optimization:
    ├── Caching: Response caching for performance
    ├── Load Balancing: Multiple endpoint support
    ├── Circuit Breaker: Failure protection
    ├── Monitoring: API health and performance
    └── Analytics: Pricing strategy effectiveness
```

## Advanced Pricing Rules

### Multi-Dimensional Pricing

**Complex Pricing Logic:**
```
Advanced Pricing Scenarios:
├── Geographic + Demographic Pricing:
│   ├── Rule: (state == 'CA' && income >= 75000) ? 35.00 :
│   │        (state == 'TX' && age <= 45) ? 25.00 :
│   │        (state == 'NY' && credit_score >= 700) ? 40.00 : 15.00
│   ├── Logic: Multi-factor geographic optimization
│   ├── Benefit: Precision targeting for maximum ROI
│   └── Update: Monthly performance review
├── Quality + Time + Source Pricing:
│   ├── Rule: base_price * quality_multiplier[lead_score] * 
│   │        time_factor[hour] * source_modifier[source_id]
│   ├── Example: 20.00 * 1.2 * 1.1 * 0.95 = $25.08
│   ├── Components: Independent factor multiplication
│   └── Optimization: Individual component tuning
├── Performance + Market + Competitive Pricing:
│   ├── Rule: max(min_profitable_price, 
│   │        min(max_budget_price, competitive_price * strategy_factor))
│   ├── Logic: Bounded competitive pricing with profitability
│   ├── Parameters: Dynamic market positioning
│   └── Strategy: Adaptive competitive response
└── Machine Learning Enhanced Pricing:
    ├── Model: Gradient boosting regression on conversion probability
    ├── Features: 50+ lead, market, and context variables
    ├── Output: Optimized price for maximum expected ROI
    ├── Training: Weekly model updates with new data
    └── Validation: A/B testing against rule-based pricing
```

### Conditional Pricing Logic

**Business Rule Integration:**
```
Conditional Pricing Examples:
├── Volume-Based Pricing:
│   ├── Rule: monthly_volume < 500 ? base_price : 
│   │        monthly_volume < 1000 ? base_price * 0.95 : 
│   │        base_price * 0.9
│   ├── Benefit: Volume incentives for large sources
│   ├── Reset: Monthly volume counter reset
│   └── Tracking: Real-time volume monitoring
├── Quality Threshold Pricing:
│   ├── Rule: lead_score >= 8.0 ? premium_price :
│   │        lead_score >= 6.0 ? standard_price :
│   │        lead_score >= 4.0 ? discount_price : reject
│   ├── Thresholds: Quality-based price tiers
│   ├── Validation: Score accuracy monitoring
│   └── Adjustment: Threshold optimization
├── Time-Window Pricing:
│   ├── Rule: lead_age <= 5_minutes ? fresh_price :
│   │        lead_age <= 30_minutes ? standard_price :
│   │        lead_age <= 60_minutes ? aged_price : reject
│   ├── Strategy: Time-sensitive value capture
│   ├── Monitoring: Age distribution analysis
│   └── Optimization: Time threshold adjustment
└── Source Performance Pricing:
    ├── Rule: source_conversion_rate >= 20% ? premium_price :
    │        source_conversion_rate >= 15% ? standard_price :
    │        source_conversion_rate >= 10% ? discount_price : 
    │        penalty_price
    ├── Calculation: Rolling 30-day conversion rates
    ├── Update: Daily performance recalculation
    └── Incentive: Performance improvement motivation
```

## Pricing Optimization

### Performance Analytics

**Pricing Effectiveness Measurement:**
```
Pricing Performance Metrics:
├── Financial Performance:
│   ├── Cost Per Lead (CPL): Average acquisition cost
│   ├── Return on Investment (ROI): Revenue vs. cost ratio
│   ├── Profit Margin: Revenue minus cost analysis
│   ├── Cost Per Conversion: Acquisition cost per sale
│   └── Customer Lifetime Value (CLV): Long-term value assessment
├── Market Performance:
│   ├── Win Rate: Percentage of successful bids
│   ├── Market Share: Volume relative to competitors
│   ├── Competitive Position: Price ranking in market
│   ├── Bid Density: Frequency of bid participation
│   └── Market Penetration: Geographic coverage analysis
├── Quality Performance:
│   ├── Quality vs. Price Correlation: Value optimization
│   ├── Conversion Rate by Price Tier: Effectiveness analysis
│   ├── Lead Score Distribution: Quality mix analysis
│   ├── Source Performance: Vendor value assessment
│   └── Time-to-Conversion: Sales velocity measurement
└── Operational Performance:
    ├── Pricing Rule Effectiveness: Individual rule performance
    ├── Response Time: Bid calculation speed
    ├── System Reliability: Pricing engine uptime
    ├── Data Quality: Input data accuracy
    └── Exception Handling: Error rate and resolution
```

### Optimization Strategies

**Continuous Improvement Framework:**
```
Pricing Optimization Process:
├── Data-Driven Analysis:
│   ├── A/B Testing: Pricing strategy comparison
│   ├── Statistical Analysis: Performance significance testing
│   ├── Correlation Analysis: Factor impact assessment
│   ├── Regression Modeling: Predictive price optimization
│   └── Machine Learning: Pattern recognition and prediction
├── Market Intelligence:
│   ├── Competitive Analysis: Relative positioning assessment
│   ├── Market Trend Analysis: Industry pattern recognition
│   ├── Customer Behavior: Purchase pattern analysis
│   ├── Economic Indicators: External factor integration
│   └── Seasonal Patterns: Cyclical behavior optimization
├── Strategy Development:
│   ├── Rule Refinement: Continuous rule improvement
│   ├── Threshold Optimization: Decision point tuning
│   ├── Market Positioning: Competitive strategy adjustment
│   ├── Risk Management: Profitability protection
│   └── Innovation Integration: New pricing model adoption
└── Implementation Management:
    ├── Change Control: Systematic pricing updates
    ├── Performance Monitoring: Real-time effectiveness tracking
    ├── Exception Management: Issue identification and resolution
    ├── Stakeholder Communication: Strategy transparency
    └── Success Measurement: ROI and objective achievement
```

## Integration with TrustedForm Data

### Enhanced Pricing Intelligence

**TrustedForm-Enhanced Pricing:**
```
TrustedForm Data Integration:
├── Behavioral Pricing Factors:
│   ├── Form Completion Time: 
│   │   ├── Fast (< 30 sec): -$2.00 (possible bot)
│   │   ├── Normal (30-120 sec): $0.00 (baseline)
│   │   ├── Careful (120-300 sec): +$3.00 (deliberate)
│   │   └── Slow (> 300 sec): +$1.00 (considered)
│   ├── Typing Speed Analysis:
│   │   ├── Too Fast (> 80 WPM): -$3.00 (bot indicator)
│   │   ├── Human Normal (20-80 WPM): +$2.00 (authentic)
│   │   ├── Hunt-Peck (< 20 WPM): +$1.00 (genuine effort)
│   │   └── Inconsistent: -$1.00 (possible automation)
│   ├── Mouse Movement Patterns:
│   │   ├── Natural Movement: +$2.00 (human behavior)
│   │   ├── Linear Movement: -$2.00 (bot behavior)
│   │   ├── No Movement: -$3.00 (keyboard-only/bot)
│   │   └── Erratic Movement: -$1.00 (suspicious activity)
│   └── Interaction Depth:
│       ├── Single Page: -$1.00 (low engagement)
│       ├── Multi-Page: +$1.00 (normal engagement)
│       ├── Extended Session: +$3.00 (high engagement)
│       └── Return Visitor: +$2.00 (genuine interest)
├── Source Quality Factors:
│   ├── Referring URL Quality:
│   │   ├── Direct Traffic: +$2.00 (high intent)
│   │   ├── Organic Search: +$3.00 (natural discovery)
│   │   ├── Paid Search: +$1.00 (targeted traffic)
│   │   ├── Social Media: +$0.50 (social discovery)
│   │   ├── Unknown/Masked: -$2.00 (quality concern)
│   │   └── Suspicious Domain: -$5.00 (fraud risk)
│   ├── Geographic Consistency:
│   │   ├── IP/Form Match: +$1.00 (location verified)
│   │   ├── Reasonable Distance: +$0.50 (nearby location)
│   │   ├── Different State: -$1.00 (location mismatch)
│   │   ├── Different Country: -$3.00 (major mismatch)
│   │   └── VPN/Proxy Detected: -$5.00 (masking location)
│   ├── Device Intelligence:
│   │   ├── Known Device: +$1.00 (repeat customer)
│   │   ├── Mobile Device: +$0.50 (mobile preference)
│   │   ├── Desktop Device: +$1.00 (serious consideration)
│   │   ├── Tablet Device: +$0.50 (leisure browsing)
│   │   └── Suspicious Device: -$3.00 (fraud indicator)
│   └── Browser and OS Analysis:
│       ├── Current Browser: +$1.00 (up-to-date user)
│       ├── Outdated Browser: -$0.50 (technical lag)
│       ├── Common OS: +$0.50 (mainstream user)
│       ├── Enterprise OS: +$1.00 (business user)
│       └── Unusual Configuration: -$1.00 (potential bot)
└── Compliance and Risk Factors:
    ├── Consent Quality:
    │   ├── Clear Consent: +$2.00 (compliant lead)
    │   ├── Implied Consent: +$0.50 (acceptable consent)
    │   ├── Unclear Consent: -$2.00 (compliance risk)
    │   └── No Consent: reject (non-compliant)
    ├── TCPA Compliance:
    │   ├── Full Compliance: +$1.00 (legal protection)
    │   ├── Partial Compliance: -$1.00 (risk present)
    │   ├── Non-Compliant: -$5.00 (high legal risk)
    │   └── Unknown Status: -$2.00 (compliance uncertainty)
    ├── Age Verification:
    │   ├── Age Verified: +$1.00 (compliance confirmed)
    │   ├── Age Estimated: +$0.50 (reasonable confidence)
    │   ├── Age Questionable: -$2.00 (compliance risk)
    │   └── Underage Detected: reject (legal protection)
    └── Historical Patterns:
        ├── First Submission: +$0.50 (new prospect)
        ├── Repeat Submission: -$1.00 (possible duplicate)
        ├── Frequent Submitter: -$3.00 (professional form filler)
        └── Complaint History: -$10.00 (high-risk individual)
```

## SuppressionList Integration

### Risk-Adjusted Pricing

**SuppressionList-Enhanced Pricing:**
```
SuppressionList Pricing Adjustments:
├── Email Suppression Impact:
│   ├── Clean Email: +$1.00 (marketable contact)
│   ├── Complaint History: -$5.00 (high risk contact)
│   ├── Litigation List: reject (legal protection)
│   ├── Bounced Emails: -$2.00 (deliverability issue)
│   └── Spam Trap: reject (sender reputation protection)
├── Phone Suppression Impact:
│   ├── Clean Phone: +$1.00 (contactable lead)
│   ├── DNC Registry: -$3.00 (limited contact options)
│   ├── Complaint History: -$5.00 (high risk number)
│   ├── Disconnected Number: -$2.00 (contact difficulty)
│   └── Litigation Risk: reject (legal protection)
├── Identity Suppression Impact:
│   ├── Clean Identity: +$0.50 (low risk individual)
│   ├── Multiple Complaints: -$3.00 (problem customer)
│   ├── Litigious History: -$10.00 (extreme legal risk)
│   ├── Fraud Indicator: reject (fraud protection)
│   └── Professional Complainer: reject (business protection)
└── Business Rules Integration:
    ├── Risk Score Calculation: Combined suppression impact
    ├── Threshold Management: Acceptable risk levels
    ├── Cost-Benefit Analysis: Risk vs. reward assessment
    ├── Legal Protection: Compliance-first approach
    └── Business Continuity: Reputation protection focus
```

## Best Practices

### Implementation Guidelines

**Strategic Pricing Approach:**
- Start with simple rules and gradually increase complexity
- Implement comprehensive testing before production deployment
- Monitor performance continuously and optimize based on data
- Balance profitability goals with market competitiveness

**Technical Excellence:**
- Use clear, maintainable pricing logic
- Implement proper error handling and fallback mechanisms
- Ensure real-time performance and scalability
- Maintain comprehensive logging and monitoring

### Operational Management

**Performance Optimization:**
- Regular pricing strategy review and adjustment
- Market intelligence integration and competitive analysis
- ROI optimization through data-driven decision making
- Stakeholder feedback integration and response

**Risk Management:**
- Profitability protection through minimum price floors
- Market volatility response and stability maintenance
- Legal compliance verification and risk mitigation
- Business continuity planning and protection

Rule-based pricing provides powerful capabilities for optimizing lead acquisition costs while maintaining competitive market position and achieving business objectives through intelligent, automated bidding strategies.