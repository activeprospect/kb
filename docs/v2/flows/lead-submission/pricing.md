---
title: Pricing Configuration
description: Track costs, revenue, and margins automatically with intelligent pricing rules
tags:
  - pricing
  - cost-tracking
  - revenue-management
---

# Pricing Configuration

## Your Financial Intelligence System

Pricing in LeadConduit isn't just about recording costs - it's about building financial intelligence into your lead flow. Every lead carries its complete financial story from source cost through delivery revenue, enabling real-time ROI decisions and optimization.

📍 **You are here**: Configuring automated financial tracking
💰 **What you'll master**: Cost assignment, revenue tracking, and margin optimization
📊 **The outcome**: Complete financial visibility for every lead

## Understanding LeadConduit Pricing

### The Three Financial Pillars

Every lead tracks three key metrics:

**1. Cost** - What you pay the source
**2. Revenue** - What buyers pay you  
**3. Margin** - The difference (Revenue - Cost)

These aren't just fields - they're calculated values that update throughout the lead's journey.

### Where Pricing Lives

Pricing can be configured at multiple levels:

```
Source Level → Default cost for all leads from this source
     ↓
Criteria Rules → Conditional pricing based on lead quality  
     ↓
Lead Level → Specific price for this exact lead
     ↓
Recipient Level → Revenue from delivery
```

### The Last-Match-Wins Rule

Pricing rules work differently from all other rules:

**Normal Rules**: Stop at first match
**Pricing Rules**: Evaluate ALL rules, last match wins

This enables sophisticated pricing strategies:

```yaml
Rule 1: All leads → $10
Rule 2: California leads → $15  
Rule 3: California + Homeowner → $25
Rule 4: California + Homeowner + Credit > 700 → $35

Result: CA homeowner with 750 credit = $35 (last match)
```

## Configuring Source Pricing

### Basic Source Pricing

Set a default cost for all leads:

**Fixed Pricing**:
```yaml
Source: Web Form A
Default Cost: $5.00
Currency: USD
Application: All leads from this source
```

**Percentage-Based**:
```yaml
Source: Affiliate Network B
Cost Type: Percentage of revenue
Percentage: 30%
Calculation: Applied after delivery
```

### Conditional Source Pricing

Different costs for different lead types:

**Geographic Pricing**:
```yaml
Base cost: $10

Rules:
- If state = "CA": $15
- If state = "TX": $12
- If state = "NY": $18
- If state = "FL": $14
```

**Quality-Based Pricing**:
```yaml
Base cost: $20

Rules:
- If email.valid AND phone.valid: $25
- If TrustedForm exists: +$5
- If exclusive = true: +$15
- If age < 35: +$3
```

**Time-Based Pricing**:
```yaml
Base cost: $30

Rules:
- If hour between 9-17: $35 (business hours)
- If day_of_week in (6,7): $25 (weekends)
- If submitted_age < 5 minutes: $40 (real-time)
```

### Volume-Based Pricing

Adjust costs based on volume:

**Tiered Pricing**:
```yaml
Daily volume tiers:
- 1-100 leads: $10 each
- 101-500 leads: $8 each
- 501-1000 leads: $6 each
- 1001+ leads: $5 each
```

**Bulk Discounts**:
```yaml
Monthly commits:
- No commitment: $12/lead
- 1,000 lead commit: $10/lead
- 5,000 lead commit: $8/lead
- 10,000 lead commit: $6/lead
```

## Advanced Pricing Strategies

### Dynamic Pricing

Adjust prices based on real-time conditions:

**Performance-Based**:
```yaml
Base: $25

If 7-day contact rate > 60%: +$5
If 7-day conversion rate > 5%: +$10
If returned by buyer: -$10
```

**Competition-Based**:
```yaml
Check buyer demand:
- If only 1 buyer available: $15
- If 2-3 buyers competing: $25
- If 4+ buyers competing: $35
```

**Scarcity Pricing**:
```yaml
Check daily volume:
- If daily count < 50: $40 (scarce)
- If daily count 50-200: $30 (normal)
- If daily count > 200: $20 (abundant)
```

### Bundle Pricing

Handle package deals:

**Lead Packages**:
```yaml
Package: "Starter Bundle"
Quantity: 100 leads
Package Price: $800
Per-Lead Cost: $8
Billing: Upfront
```

**Hybrid Pricing**:
```yaml
First 100 leads/month: Included in $500 base fee
Additional leads: $7 each
Effective pricing: Blended based on volume
```

### Quality Scoring Impact

Price based on lead score:

```yaml
Calculate lead_score (0-100 scale)

Pricing tiers:
- Score 90-100: $50 (premium)
- Score 70-89: $35 (standard)
- Score 50-69: $20 (basic)
- Score < 50: $10 (marginal)
```

## Revenue Configuration

### Recipient Pricing

Track what buyers pay:

**Fixed Revenue**:
```yaml
Recipient: Insurance Buyer A
Fixed Price: $45
Conditions: All accepted leads
Payment Terms: Net 15
```

**Dynamic Revenue**:
```yaml
Recipient: Solar Buyer B
Base Price: $50
Adjustments:
- If homeowner: +$20
- If credit > 700: +$15
- If exclusive: +$25
```

**Response-Based Revenue**:
```yaml
Buyer returns price in response:
{
  "result": "success",
  "lead_id": "ABC123",
  "price": 65.00
}

LeadConduit captures and tracks automatically
```

### Multi-Buyer Revenue

Track revenue from multiple buyers:

```yaml
Lead sold to multiple buyers:
- Buyer A (exclusive 24h): $75
- Buyer B (after 24h): $25
- Buyer C (after 24h): $25
Total Revenue: $125
Cost: $30
Margin: $95
```

### Ping/Post Pricing

Real-time bidding scenarios:

**Ping Phase**:
```yaml
Send partial data to buyers
Collect bids:
- Buyer A: $45
- Buyer B: $52
- Buyer C: $48
- Buyer D: No bid
```

**Post Phase**:
```yaml
Winner: Buyer B at $52
Revenue: $52
Fallback: If Buyer B rejects, try Buyer C at $48
```

## Margin Optimization

### Automatic Calculation

LeadConduit calculates margins automatically:

```
Simple: Margin = Revenue - Cost

With enhancements:
Total Cost = Source Cost + Enhancement Costs
Net Margin = Revenue - Total Cost
Margin % = (Net Margin / Revenue) × 100
```

### Margin-Based Routing

Route based on profitability:

```yaml
Calculate expected margin for each buyer:
- Buyer A: $45 revenue - $20 cost = $25 margin
- Buyer B: $38 revenue - $20 cost = $18 margin
- Buyer C: $55 revenue - $20 cost = $35 margin

Route to Buyer C (highest margin)
```

### Minimum Margin Rules

Protect profitability:

```yaml
Minimum acceptable margin: $10

If margin < $10:
  - Try alternative buyers
  - Apply margin-based pricing
  - Queue for better conditions
  - Reject if no profitable path
```

## Pricing Reports and Analytics

### Key Metrics to Track

**Cost Analysis**:
- Average cost per lead
- Cost by source
- Cost trends over time
- Cost per accepted lead

**Revenue Analysis**:
- Average revenue per lead
- Revenue by buyer
- Payment performance
- Revenue trends

**Margin Analysis**:
- Gross margin
- Margin by source/buyer combo
- Margin trends
- Negative margin alerts

### Profitability Reports

**Source Profitability**:
```
Source A:
  Leads: 1,000
  Cost: $10,000 ($10/lead)
  Revenue: $35,000
  Margin: $25,000 (71%)
  
Source B:
  Leads: 500
  Cost: $7,500 ($15/lead)
  Revenue: $12,500
  Margin: $5,000 (40%)
```

**Buyer Performance**:
```
Buyer X:
  Leads purchased: 800
  Total revenue: $40,000
  Avg price: $50
  Payment speed: 12 days
  
Buyer Y:
  Leads purchased: 600
  Total revenue: $42,000
  Avg price: $70
  Payment speed: 30 days
```

## Common Pricing Patterns

### For Lead Buyers

**Test and Scale**:
```yaml
New source testing:
Week 1: Pay premium ($15) for small volume
Week 2-3: Standard pricing ($10) if quality good
Week 4+: Volume pricing ($8) for proven sources
```

**Quality Incentives**:
```yaml
Base: $20
Bonuses:
- Valid phone + email: +$5
- TrustedForm under 5 min: +$3
- Exclusive lead: +$10
- Mobile phone: +$2
Max possible: $40
```

### For Lead Sellers

**Buyer Tiers**:
```yaml
Premium Buyers:
- Requirements: Exclusive, verified
- Price: $60-80
- Volume: Limited

Standard Buyers:
- Requirements: Basic validation
- Price: $30-40
- Volume: Moderate

Bulk Buyers:
- Requirements: Minimal
- Price: $10-20
- Volume: High
```

**Geographic Arbitrage**:
```yaml
Buy nationally at average prices:
- CA leads: Cost $12
- TX leads: Cost $10
- FL leads: Cost $8

Sell to regional specialists:
- CA specialist: Revenue $45
- TX specialist: Revenue $35
- FL specialist: Revenue $30
```

## Troubleshooting Pricing

### Common Issues

**"Margins are negative"**

*Causes*:
- Costs higher than revenue
- Hidden enhancement costs
- Rejected deliveries (no revenue)

*Solutions*:
1. Audit all cost sources
2. Review buyer pricing
3. Improve acceptance rates
4. Cut unprofitable sources

**"Pricing rules not applying"**

*Causes*:
- Rule order (remember: last match wins)
- Rule conditions not met
- Syntax errors in rules

*Solutions*:
1. Test rules individually
2. Check rule sequence
3. Verify field values
4. Use simulation mode

**"Revenue not tracking"**

*Causes*:
- Buyer not returning price
- Response parsing issues
- Delivery failures

*Solutions*:
1. Check response format
2. Verify parsing rules
3. Monitor delivery success
4. Set default revenue

### Best Practices

**Pricing Strategy**:

1. **Start Simple**
   - Fixed costs initially
   - Add rules gradually
   - Test each rule
   - Monitor impact

2. **Track Everything**
   - Every lead has a cost
   - Include all expenses
   - Monitor payment timing
   - Calculate true ROI

3. **Optimize Continuously**
   - Weekly margin review
   - Monthly source analysis
   - Quarterly strategy update
   - Annual pricing overhaul

4. **Communicate Clearly**
   - Document pricing rules
   - Share with stakeholders
   - Update regularly
   - Explain changes

## Advanced Pricing Features

### Cost Attribution

Track all costs:

```yaml
Source cost: $10
Enhancements:
  - Phone validation: $0.02
  - TrustedForm check: $0.10
  - Demographic append: $0.15
  - DNC scrub: $0.03
Total cost: $10.30
```

### Payment Terms

Model cash flow:

```yaml
Source: Pays weekly net 7
Buyer: Pays monthly net 30

Cash flow gap: 23-37 days
Finance cost: 2% of revenue
Effective margin: Reduced by finance cost
```

### Currency Handling

Multi-currency support:

```yaml
Account currency: USD
Source A: Pays in USD (direct)
Source B: Pays in EUR (converted at daily rate)
All reporting: Normalized to USD
```

## Your Next Steps

### Essential Reading
1. **[Submission Response](/flows/lead-submission/submission-response)** - Include price in responses
2. **[Volume Caps](/flows/lead-submission/volume-caps)** - Caps and pricing work together
3. **[Financial Reporting](/reporting/financial)** - Analyze your pricing effectiveness

### Quick Actions
1. Audit current pricing rules
2. Check margin reports
3. Identify negative margins
4. Optimize one source today

### Advanced Topics
- **[Dynamic Pricing](/help-guide/advanced/dynamic-pricing)** - Real-time price optimization
- **[Margin Strategies](/help-guide/optimization/margin-strategies)** - Industry-specific approaches
- **[Payment Automation](/help-guide/finance/payment-automation)** - Streamline reconciliation

---

💡 **Remember**: Every lead is a financial transaction. Proper pricing configuration transforms LeadConduit from a router into a profit optimization engine.

*Next: [Submission Response](/flows/lead-submission/submission-response) - Close the loop with intelligent responses to sources.*