---
title: Enhancement with Add-ons & Integrations
description: Enrich your leads with third-party data to increase value and improve routing decisions
tags:
  - enhancement
  - integrations
  - add-ons
  - data-append
---

# Enhancement with Add-ons & Integrations

## Transform Basic Leads into Information Goldmines

Enhancement is the secret sauce that turns a simple name and phone number into a complete customer profile. By appending third-party data, validating contact information, and scoring lead quality, you can make smarter routing decisions and command higher prices from buyers.

📍 **You are here**: Learning to enhance leads with external data
🔧 **What you'll master**: Integration configuration and data append strategies
💎 **The outcome**: Higher quality leads that buyers love

## Understanding Enhancement

### What Is Enhancement?

Enhancement adds value by:
- Validating existing data
- Appending missing information
- Scoring lead quality
- Verifying identity
- Checking compliance

Think of it as due diligence meets data enrichment.

### The Enhancement Flow

How enhancement fits in:

```
Lead Accepted
    ↓
Enhancement Step(s)
    ↓
Data Appended to Lead
    ↓
Enhanced Data Available for:
  - Routing decisions
  - Pricing rules
  - Buyer delivery
  - Quality scoring
```

## Types of Enhancements

### Contact Validation

Verify phones and emails:

```yaml
Phone Validation:
  Service: TrustedForm Phone Intelligence
  
  Appends:
    phone.type: "mobile"
    phone.carrier: "Verizon"
    phone.status: "active"
    phone.risk_score: 15
    phone.line_type: "wireless"
    
  Use Cases:
    - Route only mobile to SMS buyers
    - Reject disconnected numbers
    - Price based on risk score
```

```yaml
Email Validation:
  Service: Email Verification Pro
  
  Appends:
    email.deliverable: true
    email.risk_score: 10
    email.inbox_full: false
    email.role_account: false
    email.corporate: true
    
  Use Cases:
    - Reject undeliverable emails
    - Premium price for corporate emails
    - Avoid role accounts (info@, admin@)
```

### Identity Verification

Know your lead:

```yaml
Identity Check:
  Service: ID Verify Plus
  
  Inputs:
    - first_name + last_name
    - email or phone
    - address (optional)
    
  Appends:
    identity.verified: true
    identity.confidence: 85
    identity.age: 34
    identity.financial_stability: "good"
    
  Use Cases:
    - Ensure real person
    - Verify age requirements
    - Assess financial capacity
```

### Demographic Append

Add consumer insights:

```yaml
Demographics:
  Service: Consumer Intel
  
  Appends:
    demographics.income_range: "75000-100000"
    demographics.home_owner: true
    demographics.marital_status: "married"
    demographics.education: "bachelors"
    demographics.occupation: "professional"
    demographics.household_size: 4
    
  Use Cases:
    - Target by income
    - Route homeowners differently
    - Customize offerings
```

### Geographic Enhancement

Location intelligence:

```yaml
Geo Data:
  Service: Location IQ
  
  From: IP Address or Postal Code
  
  Appends:
    geo.city: "San Francisco"
    geo.state: "CA"
    geo.metro: "San Francisco-Oakland-Hayward"
    geo.timezone: "America/Los_Angeles"
    geo.urban_rural: "urban"
    
  Use Cases:
    - Regional routing
    - Time zone handling
    - Urban vs rural strategies
```

### Credit & Financial

Financial indicators:

```yaml
Credit Indicators:
  Service: Credit Qualifier
  
  Appends:
    credit.estimated_score: "700-750"
    credit.debt_to_income: "low"
    credit.recent_inquiries: 2
    credit.bankruptcy: false
    credit.homeowner: true
    
  Use Cases:
    - Pre-qualify for offers
    - Risk-based pricing
    - Buyer requirements
```

### Compliance & DNC

Stay compliant:

```yaml
DNC Check:
  Service: National DNC Registry
  
  Appends:
    dnc.registered: false
    dnc.wireless: true
    dnc.state_dnc: false
    tcpa.consent_required: true
    
  Use Cases:
    - Skip DNC registered
    - TCPA compliance
    - State law compliance
```

## Configuring Enhancements

### Basic Setup

Add enhancement to flow:

```yaml
Step: Enhance with Phone Validation
Type: Enhancement
Service: PhoneLookup Pro

Configuration:
  API Key: {{settings.phone_lookup_key}}
  Timeout: 3 seconds
  
Input Mapping:
  phone_number: {{lead.phone}}
  
Output Mapping:
  phone_type: {{response.line_type}}
  phone_valid: {{response.status == 'active'}}
  phone_risk: {{response.risk_score}}
```

### Advanced Configuration

Complex enhancement logic:

```yaml
Step: Smart Enhancement
Type: Enhancement

Conditional Logic:
  # Only enhance if needed
  Run When: 
    lead.phone exists
    AND lead.phone_type not exists
    
Service Selection:
  If lead.value > 50:
    Use: Premium Phone Service
  Else:
    Use: Basic Phone Service
    
Error Handling:
  On Timeout: Continue (don't block)
  On Error: Use defaults
  
Caching:
  Enable: Yes
  Duration: 24 hours
  Key: {{lead.phone}}
```

### Multi-Service Enhancement

Chain multiple services:

```yaml
Enhancement Pipeline:
  
1. Phone Validation
   → Append phone data
   
2. If phone.type = "mobile":
   → SMS Compliance Check
   
3. If phone.valid = true:
   → Identity Verification
   
4. If identity.verified = true:
   → Demographics Append
   
Result: Fully enhanced lead
```

## Enhancement Strategies

### Cost vs Value

Balance enhancement costs:

```yaml
Enhancement Tiers:

Basic (All Leads):
  - Phone validation ($0.01)
  - Email validation ($0.01)
  Cost: $0.02 per lead
  
Standard (Qualified Leads):
  - Basic + Identity ($0.10)
  - Basic + Demographics ($0.15)
  Cost: $0.27 per lead
  
Premium (High-Value Leads):
  - All enhancements
  - Credit indicators ($0.50)
  Cost: $0.77 per lead
  
ROI Calculation:
  Basic → Standard: +$2.00 revenue
  Standard → Premium: +$5.00 revenue
```

### Conditional Enhancement

Enhance intelligently:

```yaml
Rules for Enhancement:

High Value States:
  If state in ['CA', 'TX', 'FL']:
    → Run full enhancement
    
Quality Indicators:
  If email.corporate = true:
    → Add demographics
    → Add financial data
    
Buyer Requirements:
  If buyer.requires_income_data:
    → Run income append
    → Otherwise skip
    
Time-Based:
  Business Hours:
    → Real-time enhancement
  After Hours:
    → Batch enhancement
```

### Enhancement Waterfalls

Failover strategies:

```yaml
Phone Validation Waterfall:

1. Primary Service (Premium)
   - Most accurate
   - Most expensive
   - 2 second timeout
   
2. Secondary Service (Standard)
   - Good accuracy
   - Moderate cost
   - 3 second timeout
   
3. Basic Validation (Fallback)
   - Format check only
   - Free
   - Instant

Result: Always get some validation
```

## Using Enhanced Data

### In Routing Rules

Make smart decisions:

```yaml
Routing by Enhancement:

Premium Buyer Route:
  phone.type = "mobile"
  AND phone.risk_score < 20
  AND identity.verified = true
  AND demographics.income > 75000
  
Standard Buyer Route:
  phone.valid = true
  AND identity.confidence > 50
  
Reject Route:
  phone.status = "disconnected"
  OR identity.verified = false
  OR dnc.registered = true
```

### In Pricing

Value-based pricing:

```yaml
Dynamic Pricing:

Base Price: $10

Adjustments:
  If phone.type = "mobile": +$5
  If email.corporate = true: +$3
  If demographics.homeowner = true: +$7
  If credit.score > 700: +$10
  If identity.verified = true: +$2
  
Max Price: $37 (all factors)
Min Price: $10 (no factors)
```

### In Delivery

Send enhanced data:

```yaml
Delivery Mapping:

Standard Fields:
  first_name: {{lead.first_name}}
  email: {{lead.email}}
  phone: {{lead.phone}}
  
Enhanced Fields:
  phone_type: {{lead.phone.type}}
  phone_carrier: {{lead.phone.carrier}}
  verified_age: {{lead.identity.age}}
  income_range: {{lead.demographics.income_range}}
  homeowner: {{lead.demographics.home_owner}}
  
Conditional Fields:
  {{#if lead.credit.estimated_score}}
  credit_range: {{lead.credit.estimated_score}}
  {{/if}}
```

## Performance Optimization

### Speed Strategies

Keep enhancement fast:

```yaml
Parallel Processing:
  Run Simultaneously:
    - Phone validation
    - Email validation
    - IP geolocation
  
  Total Time: Max of all (not sum)
  
Sequential When Needed:
  1. Identity verify (requires phone/email)
  2. Then demographics (requires identity)
```

### Caching

Reduce costs and latency:

```yaml
Cache Strategy:

Phone Validation:
  Key: phone_number
  Duration: 30 days
  Hit Rate: ~40%
  
Identity Data:
  Key: email + phone
  Duration: 7 days
  Hit Rate: ~20%
  
Demographics:
  Key: identity_id
  Duration: 90 days
  Hit Rate: ~60%
  
Benefits:
  - Faster processing
  - Lower costs
  - Consistent data
```

### Timeout Handling

Don't let enhancement block:

```yaml
Timeout Configuration:

Aggressive (Speed Priority):
  Phone: 1 second
  Email: 1 second
  Identity: 2 seconds
  Total Max: 3 seconds
  
Balanced:
  Phone: 2 seconds
  Email: 2 seconds
  Identity: 3 seconds
  Total Max: 5 seconds
  
Conservative (Data Priority):
  Phone: 3 seconds
  Email: 3 seconds
  Identity: 5 seconds
  Total Max: 8 seconds
```

## Monitoring Enhancement

### Key Metrics

Track enhancement health:

```yaml
Performance Metrics:
  - Enhancement rate (target: >95%)
  - Average latency (target: <2s)
  - Cache hit rate (target: >30%)
  - Error rate (target: <2%)
  
Business Metrics:
  - Cost per lead enhanced
  - Revenue lift from enhancement
  - ROI by enhancement type
  - Quality score improvement
```

### Cost Management

Control enhancement spend:

```yaml
Budget Controls:

Daily Limits:
  Phone validation: $500/day
  Demographics: $300/day
  Credit data: $200/day
  
Smart Limiting:
  If daily_spend > 80% of limit:
    → Enhance only high-value leads
    
  If daily_spend > 95% of limit:
    → Stop non-critical enhancement
    
Monthly Reconciliation:
  Track actual vs budgeted
  Analyze ROI by service
  Optimize service mix
```

## Common Patterns

### The Quality Ladder

Progressive enhancement:

```yaml
Level 1 - Basic Validation:
  - Phone format check
  - Email syntax check
  Cost: ~$0.02
  
Level 2 - Contact Verification:
  - Phone line type
  - Email deliverability
  Cost: ~$0.05
  
Level 3 - Identity Verification:
  - Name/address match
  - Age verification
  Cost: ~$0.15
  
Level 4 - Full Enhancement:
  - Demographics
  - Financial indicators
  Cost: ~$0.50
  
Apply based on lead value!
```

### Buyer-Specific Enhancement

Enhance for buyer needs:

```yaml
Buyer A Requirements:
  - Mobile phones only
  - Income data required
  Enhancement: Phone type + Demographics
  
Buyer B Requirements:
  - Verified identity
  - No DNC numbers
  Enhancement: Identity + DNC check
  
Buyer C Requirements:
  - Credit qualified
  - Homeowners only
  Enhancement: Credit + Property data
```

### Real-Time vs Batch

Choose the right mode:

```yaml
Real-Time Enhancement:
  When: Lead value > $20
  Services: Critical only
  Timeout: 3 seconds
  Use: Immediate routing
  
Batch Enhancement:
  When: Lead value < $20
  Services: All available
  Timing: Every 15 minutes
  Use: Maximize data
```

## Troubleshooting

### Common Issues

**"Enhancement timing out"**
- Check service status
- Reduce timeout threshold
- Use cache more aggressively
- Consider failover service

**"Costs too high"**
- Review enhancement rules
- Check cache hit rates
- Audit service usage
- Optimize conditionals

**"Data not appending"**
- Verify field mappings
- Check response parsing
- Review service documentation
- Test with sample data

## Best Practices

1. **Start Simple**
   - One enhancement at a time
   - Measure impact
   - Add gradually
   - Monitor costs

2. **Cache Aggressively**
   - Reduce costs
   - Improve speed
   - Maintain consistency
   - Update intelligently

3. **Fail Gracefully**
   - Don't block on enhancement
   - Use defaults wisely
   - Log failures
   - Have fallbacks

4. **Measure Everything**
   - Cost per enhancement
   - Revenue impact
   - Speed metrics
   - Quality improvement

## Your Next Steps

### Essential Reading
1. **[Integration Reference](/reference/integrations)** - Available services
2. **[Caching Strategies](/help-guide/performance/caching)** - Optimize costs
3. **[ROI Calculator](/help-guide/tools/enhancement-roi)** - Measure value

### Common Tasks
- Set up phone validation
- Configure identity verification
- Add demographic append
- Optimize enhancement costs

---

💎 **Remember**: Enhancement is about adding value, not just data. Every append should either increase lead value, improve routing decisions, or ensure compliance. Enhance strategically, measure religiously, and optimize constantly.

*Next: Learn about [Custom API Integrations](/flows/flow-steps/custom-integrations) for unique enhancement needs.*