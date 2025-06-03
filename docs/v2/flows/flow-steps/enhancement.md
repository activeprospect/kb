---
title: Enhancement Steps
description: Enrich your leads with valuable data from external services
tags:
  - enhancement
  - data-append
  - integrations
---

# Enhancement Steps

## Adding Intelligence to Your Leads

Enhancement steps transform basic lead data into rich, actionable intelligence. They reach out to external services to validate phone numbers, verify addresses, append demographics, check compliance, score quality, and much more. While filters make decisions on existing data, enhancements add new data that enables better decisions downstream.

📍 **You are here**: Learning to enhance leads with external data
🔍 **What you'll master**: Data append strategies, cost optimization, and service selection
💎 **The value**: Turn $10 leads into $50 leads through intelligent enhancement

## Understanding Enhancement Steps

### What Are Enhancements?

Enhancement steps:
- Call external services via API
- Append returned data to your lead
- Enable richer filtering and routing
- Add cost but increase value
- Take time but provide intelligence

Think of them as hiring specialists to investigate and enrich each lead.

### The Enhancement Model

```
Lead Data → Enhancement Service → Returned Data → Appended to Lead
    ↓              ↓                   ↓               ↓
Phone number   Validate/Lookup    Carrier, type    lead.phone.carrier
Email         Verify/Analyze     Deliverable      lead.email.score
Address       Standardize        Corrected        lead.address.corrected
```

### Enhancement Economics

Every enhancement has a cost/benefit equation:

```yaml
Phone Validation:
  Cost: $0.01 per lookup
  Value: 15% higher contact rate
  ROI: $0.01 cost vs $3.00 increased value
  Decision: Always enhance

Full Demographic Append:
  Cost: $0.50 per lookup
  Value: Better routing for some leads
  ROI: $0.50 cost vs $0.75 increased value  
  Decision: Only for high-value leads
```

## Common Enhancement Types

### Contact Validation

Ensure you can reach your leads:

**Phone Intelligence**:
```yaml
Service: Phone Validator Pro
Appends:
  - phone.valid: true/false
  - phone.type: mobile/landline/voip
  - phone.carrier: "Verizon"
  - phone.prepaid: true/false
  - phone.risk_score: 0-100

Use for:
  - Filter non-contactable numbers
  - Route by carrier
  - Prioritize mobile over landline
  - Avoid high-risk numbers
```

**Email Verification**:
```yaml
Service: Email Verify Plus
Appends:
  - email.deliverable: true/false
  - email.risk_score: "low"
  - email.domain_age_days: 3650
  - email.mx_found: true
  - email.role_account: false
  - email.disposable: false

Use for:
  - Remove undeliverable emails
  - Identify temporary addresses
  - Score email quality
  - Detect business emails
```

### Identity Verification

Confirm lead identity:

**Identity Matching**:
```yaml
Service: ID Verify Pro
Appends:
  - identity.verified: true/false
  - identity.confidence: 95
  - identity.name_match: true
  - identity.address_match: true
  - identity.age_range: "35-44"
  - identity.deceased: false

Use for:
  - Verify real person
  - Confirm contact ownership
  - Meet compliance requirements
  - Reduce fraud
```

### Demographic Enhancement

Add valuable marketing data:

**Consumer Demographics**:
```yaml
Service: Data Append Pro
Appends:
  - demographics.income_range: "$75k-100k"
  - demographics.home_owner: true
  - demographics.home_value: "$350,000"
  - demographics.marital_status: "Married"
  - demographics.presence_of_children: true
  - demographics.education: "Bachelor's"
  - demographics.occupation: "Professional"

Use for:
  - Qualify for products
  - Calculate lead scores
  - Route to appropriate buyers
  - Personalize messaging
```

### Compliance & Risk

Ensure legal compliance:

**TrustedForm Verification**:
```yaml
Service: TrustedForm
Appends:
  - trustedform.cert_id: "abc123..."
  - trustedform.created_at: "2024-01-15T10:30:45Z"
  - trustedform.age_seconds: 45
  - trustedform.page_url: "https://..."
  - trustedform.consent_text: "I agree to..."
  - trustedform.score: 95

Use for:
  - Prove consent
  - Verify lead age
  - Check consent language
  - Meet TCPA requirements
```

**Suppression Checks**:
```yaml
Service: DNC Registry Plus
Appends:
  - dnc.registered: false
  - dnc.registration_date: null
  - litigation.history: false
  - complaints.count: 0

Use for:
  - Avoid DNC violations
  - Skip litigious consumers
  - Reduce compliance risk
```

### Business Intelligence

Add business context:

**Company Append** (B2B):
```yaml
Service: Business Data Pro
Appends:
  - company.name: "Acme Corp"
  - company.size: "50-200 employees"
  - company.revenue: "$10M-50M"
  - company.industry: "Technology"
  - company.years_in_business: 15

Use for:
  - B2B lead qualification
  - Size-based routing
  - Industry targeting
```

## Enhancement Configuration

### Basic Setup

Configure each enhancement:

```yaml
Step Name: "Phone Intelligence"
Service: "Telesign"
Integration: "telesign.score"

Settings:
  API Key: "${TELESIGN_API_KEY}"
  Timeout: 3000ms
  Cache: 24 hours

Field Mapping:
  Input:
    phone_number: {{lead.phone_1}}
  Output:
    Map all returned fields to appended.*
```

### Conditional Enhancement

Only enhance when beneficial:

**Value-Based Enhancement**:
```yaml
Name: "Premium Data Append"
Execute When: 
  - loan_amount > 100000
  - OR lead_score > 80
  - OR source.type = "exclusive"

Why: Enhancement costs $0.50, only worthwhile for high-value leads
```

**Progressive Enhancement**:
```yaml
Step 1: "Basic Phone Check" ($0.01)
  Always run

Step 2: "Carrier Lookup" ($0.05)
  Only if: phone.valid = true

Step 3: "Phone Reputation" ($0.10)
  Only if: phone.carrier != "voip"
```

### Error Handling

Gracefully handle service issues:

```yaml
On Error:
  Timeout: Continue without enhancement
  Rate Limit: Queue and retry (max 5 min)
  Invalid Response: Log and continue
  Auth Failure: Alert and stop flow

Default Values:
  If enhancement fails, append:
    - service.enhanced: false
    - service.error: "{{error_message}}"
```

## Enhancement Strategies

### Cost Optimization

Minimize enhancement costs:

**1. Filter First**:
```yaml
Bad Order:
Phone Enhancement ($0.10) → Filter Invalid → Delivery

Good Order:
Filter Obviously Bad → Phone Enhancement ($0.10) → Delivery
(Save $0.10 on every filtered lead)
```

**2. Cache Results**:
```yaml
Phone Enhancement Settings:
  Cache Duration: 7 days
  Cache Key: phone_number
  
Benefit: Same phone submitted twice = one enhancement charge
```

**3. Batch When Possible**:
```yaml
Instead of: Enhance immediately per lead
Consider: Batch every 100 leads for bulk rate
Savings: $0.10/lead → $0.06/lead
```

### Quality Strategies

Maximize enhancement value:

**Layer Enhancements**:
```yaml
Layer 1: Contact Validation
  - Phone valid?
  - Email deliverable?
  
Layer 2: Identity (if Layer 1 passes)
  - Name matches phone?
  - Address current?
  
Layer 3: Demographics (if Layer 2 passes)
  - Income/assets
  - Lifestyle data
```

**Use Enhancement Data**:
```yaml
Don't just append - act on it:

After Phone Enhancement:
  If carrier = "Sprint" → Route to Sprint-friendly buyer
  If type = "landline" → Schedule calls for daytime
  If risk > 80 → Send to manual review
```

### Performance Strategies

Keep flows fast:

**Parallel Enhancement**:
```yaml
Sequential (Slow - 1500ms total):
Phone Check → Email Check → Address Check
   500ms        500ms         500ms

Parallel (Fast - 500ms total):
Phone Check ─┐
Email Check  ├→ Continue
Address Check┘
```

**Timeout Management**:
```yaml
Critical Enhancement:
  Timeout: 5000ms
  On Timeout: Retry once

Nice-to-Have Enhancement:
  Timeout: 1000ms  
  On Timeout: Continue without
```

## Common Enhancement Patterns

### The Validation Stack

Essential for lead buyers:

```yaml
1. TrustedForm Check
   Purpose: Verify consent
   Cost: $0.10
   Required: Yes

2. Phone Validation
   Purpose: Ensure contactable
   Cost: $0.01
   Required: Yes

3. Email Verification  
   Purpose: Deliverability
   Cost: $0.005
   Required: If primary contact

4. DNC Check
   Purpose: Compliance
   Cost: $0.02
   Required: Yes
```

### The Value Stack

For maximizing lead value:

```yaml
1. Identity Verification
   Purpose: Confirm real person
   When: High-value leads
   
2. Demographic Append
   Purpose: Qualify and route
   When: Verified identity
   
3. Property Data
   Purpose: Net worth indicator
   When: Homeowner products
   
4. Credit Indicator
   Purpose: Financial qualification
   When: Finance products
```

### The Risk Stack

For reducing bad outcomes:

```yaml
1. Fraud Score
   Purpose: Identify suspicious patterns
   Action: Reject high risk
   
2. Litigation History
   Purpose: Avoid problem customers
   Action: Flag for review
   
3. Previous Customer Check
   Purpose: Prevent recycling
   Action: Route differently
```

## Enhancement Analytics

### ROI Tracking

Measure enhancement value:

```yaml
Phone Enhancement ROI:
  Cost: $10,000/month
  Leads Enhanced: 100,000
  Contact Rate Increase: 15%
  Additional Sales: 150
  Revenue per Sale: $100
  Additional Revenue: $15,000
  ROI: 150%
```

### Performance Monitoring

Track service health:

**Key Metrics**:
- Average response time
- Error rate
- Timeout frequency
- Match rate
- Cache hit rate

**Alerts**:
```yaml
Alert if:
  - Error rate > 5%
  - Response time > 2000ms (p95)
  - Match rate < 70%
  - Monthly cost > budget + 10%
```

## Troubleshooting Enhancements

### Common Issues

**"Enhancement timing out"**
- Check service status
- Increase timeout carefully
- Consider caching
- Add circuit breaker

**"Low match rates"**
- Verify input format
- Check data quality
- Try different service
- Review service documentation

**"Costs too high"**
- Add more filtering
- Increase cache duration
- Conditional enhancement
- Negotiate bulk rates

### Testing Enhancements

Always test thoroughly:

**Test Cases**:
1. Valid data → Expected append
2. Invalid data → Graceful handling
3. Service down → Proper fallback
4. Rate limited → Queue behavior
5. Timeout → Continue flow

## Best Practices

### Enhancement Design

1. **Purpose-Driven**
   - Know why you're enhancing
   - Measure the value added
   - Use the data downstream

2. **Cost-Conscious**
   - Filter before enhancing
   - Cache when possible
   - Monitor spend closely

3. **Performance-Aware**
   - Set reasonable timeouts
   - Use parallel when possible
   - Have fallback plans

4. **Quality-Focused**
   - Choose reliable services
   - Monitor match rates
   - Validate returned data

### Service Selection

**Evaluate Services By**:
- Coverage (match rate)
- Accuracy (data quality)
- Speed (response time)
- Reliability (uptime)
- Cost (per lookup + monthly)
- Support (documentation + help)

## Your Next Steps

### Essential Reading
1. **[Recipient Steps](/flows/flow-steps/recipient-steps)** - Deliver enhanced leads
2. **[Integrations Reference](/reference/integrations)** - Available services
3. **[ROI Tracking](/help-guide/analytics/enhancement-roi)** - Measure value

### Quick Wins
1. Add phone validation to every flow
2. Implement TrustedForm checking
3. Set up enhancement caching
4. Track enhancement ROI

### Advanced Topics
- **[Custom Enhancements](/help-guide/development/custom-enhancements)** - Build your own
- **[Enhancement Strategies](/help-guide/patterns/enhancement-patterns)** - Industry patterns
- **[Cost Optimization](/help-guide/optimization/enhancement-costs)** - Reduce spend

---

💡 **Remember**: Enhancements are investments. Each one should either increase lead value, reduce risk, or improve deliverability by more than its cost. Measure everything.

*Next: [Recipient Steps](/flows/flow-steps/recipient-steps) - Deliver your validated, enhanced leads to eager buyers.*