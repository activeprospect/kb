---
title: Pricing
description: The financial intelligence engine that tracks costs and revenue throughout your lead flow
tags:
  - pricing-focused
  - reference
  - technical
  - core-concept
  - financial
---

# Pricing

## What is Pricing?

Pricing is LeadConduit's financial tracking system that monitors the monetary flow of every lead. It calculates what you pay sources, what buyers pay you, and tracks the margin in between. Think of pricing as your lead flow's CFO - constantly watching the money, calculating profitability, and ensuring every transaction is properly accounted for.

Unlike simple price fields, LeadConduit's pricing system understands the complex financial relationships in lead distribution: volume discounts, conditional pricing, revenue sharing, and multi-buyer scenarios.

## Why Pricing Matters

Lead distribution is a business, and every business needs to track money:
- Sources charge different rates for different lead types
- Buyers pay based on quality and exclusivity  
- Margins vary by source, buyer, and lead characteristics
- Profitability requires real-time financial visibility

Without proper pricing, you're flying blind. With LeadConduit's pricing system, every lead carries its complete financial story.

## How Pricing Works

### The Three Pillars

LeadConduit tracks three financial metrics for every lead:

1. **Cost** - What you pay the source
2. **Revenue** - What the buyer pays you  
3. **Margin** - The difference (Revenue - Cost)

These aren't just fields - they're calculated values that update throughout processing.

### Pricing Flow

```
Lead Arrives → Source Pricing → Processing → Buyer Pricing → Margin Calculation
     ↓              ↓                           ↓                ↓
   Lead ID      Cost: $5.00                Revenue: $25.00   Margin: $20.00
```

### Where Pricing Lives

Pricing can be configured at multiple levels:

| Level | Purpose | Example |
|-------|---------|---------|
| **Source** | Default cost for all leads | "All leads from Source A cost $10" |
| **Source + Rules** | Conditional source pricing | "California leads cost $15" |
| **Flow** | Processing fees/markups | "Add $2 handling fee" |
| **Recipient** | Buyer payment | "Buyer B pays $50" |
| **Recipient + Rules** | Conditional buyer pricing | "Exclusive leads pay $75" |

## Pricing Rules

### The Last-Match-Wins Principle

Pricing rules work differently from all other rules:

**Normal Rules:** Stop at first match (short-circuit)
**Pricing Rules:** Evaluate ALL rules, last match wins

This enables progressive pricing:

```
Rule 1: All leads         → $25
Rule 2: California leads  → $30  
Rule 3: Exclusive CA      → $50

Exclusive CA lead matches all three, pays $50 (last match)
```

### Why Last-Match-Wins?

This pattern supports common pricing strategies:
1. **Base pricing** - Default for all leads
2. **Geographic premiums** - Higher for certain states
3. **Quality bonuses** - More for verified data
4. **Special cases** - Maximum for perfect matches

Order your rules from general to specific.

## Common Pricing Patterns

### Tiered Source Pricing

Different costs based on lead characteristics:

```
Base cost: $10
├── Rule: state = "CA" → $15
├── Rule: state = "NY" → $18
└── Rule: exclusive = true → +$10 (added to state price)
```

### Volume-Based Pricing

Adjust pricing based on volume:

```
Standard rate: $25
├── Rule: daily_count > 100 → $23
├── Rule: daily_count > 500 → $20
└── Rule: daily_count > 1000 → $18
```

### Quality-Based Pricing

Pay more for better data:

```
Basic lead: $30
├── Rule: email.valid AND phone.valid → $35
├── Rule: age < 65 AND income > 50000 → $40
└── Rule: trustedform.present = true → +$5
```

### Time-Based Pricing

Different rates for different times:

```
Regular hours: $25
├── Rule: {{format timestamp "HH"}} < "09" → $20
├── Rule: {{format timestamp "HH"}} > "17" → $20
└── Rule: {{format timestamp "u"}} = "6" OR "0" → $15 (weekends)
```

## External Pricing

### Vendor-Provided Pricing

Sources can include their price in the lead:

**In submission:**
```json
{
  "email": "john@example.com",
  "source_price": "12.50"
}
```

**In configuration:**
- Map `source_price` to standard field
- LeadConduit uses for cost calculation
- Overrides default source pricing

### Dynamic Buyer Pricing

Buyers can return their price:

**Buyer response:**
```json
{
  "accepted": true,
  "lead_id": "ABC123",
  "price": 45.00
}
```

**In integration:**
- Parse price from response
- Updates revenue automatically
- Supports real-time bidding

## Margin Calculation

### Automatic Computation

LeadConduit automatically calculates:
```
Margin = Revenue - Cost
```

This happens:
- After source pricing (cost established)
- After each buyer response (revenue updated)
- In real-time for reporting

### Multi-Buyer Scenarios

When selling to multiple buyers:

```
Lead Cost: $10
├── Buyer A pays: $25 (margin: $15)
├── Buyer B pays: $30 (margin: $20)
└── Total Revenue: $55 (total margin: $45)
```

Each delivery tracks its own revenue/margin.

## Pricing in Reports

### Financial Metrics

Standard reports include:
- Total cost
- Total revenue  
- Total margin
- Average margin per lead
- Margin percentage

### Grouping Options

Analyze pricing by:
- Source (which sources are profitable?)
- Buyer (which buyers pay most?)
- Time period (daily/weekly/monthly)
- Lead characteristics (state, quality, etc.)

### Profitability Analysis

Identify:
- Most profitable source/buyer combinations
- Negative margin leads
- Pricing rule effectiveness
- Volume vs margin tradeoffs

## Currency and Precision

### Currency Handling

- All pricing in account currency (usually USD)
- No currency conversion
- Consistent decimal precision

### Decimal Precision

- Supports fractional cents: $10.555
- Rounds at final calculation
- Maintains precision during processing

## Special Pricing Scenarios

### Bidding Systems

For ping/post with bidding:

```
1. Ping includes lead subset
2. Multiple buyers bid
3. Highest bid wins
4. Post includes price
5. Revenue = winning bid
```

### Revenue Sharing

When sharing revenue:

```
Total Revenue: $50
├── Partner share (30%): $15
├── Your share (70%): $35
└── Track both in reporting
```

### Bundled Pricing

For package deals:

```
Bundle of 5 leads: $200
├── Allocate per lead: $40 each
├── Track individually
└── Report on bundle performance
```

## Best Practices

### Rule Design

1. **Order matters** - General to specific
2. **Test thoroughly** - Verify rule matches
3. **Document logic** - Explain pricing strategy
4. **Monitor results** - Check margin reports

### Margin Protection

1. **Set minimums** - Reject if margin too low
2. **Alert on negatives** - Catch pricing errors
3. **Regular reviews** - Adjust as market changes
4. **Test changes** - Use staging first

### Transparency

1. **Track everything** - Cost and revenue
2. **Share appropriately** - Partners see their data
3. **Audit regularly** - Verify accuracy
4. **Document agreements** - Match configuration

## Common Pitfalls

### Rule Ordering
❌ Specific rules before general
✅ General base price, then specific overrides

### Missing Prices
❌ Assuming default prices
✅ Explicitly configure all scenarios

### Calculation Timing
❌ Expecting immediate margin
✅ Margin calculated after buyer response

### Currency Mix-ups
❌ Mixing currencies
✅ Consistent currency throughout

## Integration with Other Systems

### With Source Entities

Sources define base pricing:
- Default cost per lead
- Conditional pricing rules
- External price acceptance

### With Recipient Steps

Recipients determine revenue:
- Buyer-specific pricing
- Response-based pricing
- Dynamic/bid pricing

### With Rules Engine

Pricing rules use full rule capabilities:
- Field comparisons
- Complex conditions
- Template support

### With Reporting

All pricing data available in reports:
- Real-time margin tracking
- Historical analysis
- Profitability insights

## Technical Details

### Pricing Evaluation

1. Source rules evaluate (all rules, last wins)
2. Cost established
3. Lead processes through flow
4. Buyer rules evaluate (all rules, last wins)
5. Revenue established
6. Margin calculated

### Storage and Precision

- Stored as decimal values
- Full precision maintained
- Rounding at display time
- Consistent calculation

### Performance Impact

- Pricing rules add minimal overhead
- Calculations are fast
- No impact on lead flow speed
- Real-time margin updates

## Related Concepts

- **[Entities](entities.md)** - Sources and buyers define pricing
- **[Rules](rules.md)** - Power conditional pricing logic
- **[Templates](templates.md)** - Enable dynamic pricing rules
- **[Reporting](reporting.md)** - Analyze financial performance

---

*Pricing is the financial heartbeat of your lead distribution business. It transforms LeadConduit from a technical platform into a business intelligence system, ensuring every lead's journey is not just tracked, but profitable.*