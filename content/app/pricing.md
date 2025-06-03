# LeadConduit Pricing - Complete Documentation

## Overview

Pricing in LeadConduit is your automated financial control center - it calculates what you pay for leads, what you charge for them, and tracks every penny in between. Think of pricing as the CFO of your lead operation, ensuring you know the exact cost of acquisition and revenue from distribution for every single lead that flows through your system.

At its core, pricing answers two fundamental questions: "What am I paying for this lead?" and "What am I charging for this lead?" But it goes beyond simple dollar amounts - pricing can be dynamic based on lead quality, vendor agreements, buyer contracts, time of day, or any other criteria you define. It's a sophisticated system that turns your business agreements into automated financial transactions.

The beauty of LeadConduit's pricing lies in its flexibility and precision. You can set base prices, create conditional pricing rules, integrate with external pricing services, and even allow sources to override prices for special campaigns. Every price is recorded on the relevant events, creating a complete financial audit trail that makes monthly reconciliation, vendor payments, and buyer invoicing straightforward and accurate.

## Why Pricing Exists

### The Manual Calculation Problem
Before automated pricing, lead businesses drowned in spreadsheets. Calculating what to pay dozens of vendors based on varying agreements, quality tiers, and geographic differences was a full-time job. Then doing it again for what to charge buyers, with their own complex pricing matrices, doubled the work. Pricing solves this by automating every calculation based on your configured business rules.

### The Reconciliation Problem
End-of-month reconciliation was a nightmare - matching invoices to actual leads, verifying prices, handling disputes. Without detailed pricing records, you're stuck trusting vendor counts and hoping buyer tallies match. Pricing solves this by recording the exact price on every transaction, making reconciliation as simple as running a report.

### The Margin Management Problem
Understanding profitability requires knowing both costs and revenue for every lead. But with dynamic pricing, quality-based adjustments, and multi-buyer scenarios, calculating margins manually is nearly impossible. Pricing solves this by automatically tracking both purchase price (what you paid) and sale price (what you charged) on every lead, enabling real-time margin analysis.

## Core Concepts

### The Two Types of Pricing

**Purchase Pricing (Cost)**
This is what you pay vendors for leads. It's calculated during lead submission and recorded on the source event. Purchase pricing can be:
- Fixed per vendor
- Dynamic based on lead characteristics
- Determined by external pricing services
- Overridden by the source for special deals

**Sale Pricing (Revenue)**
This is what you charge buyers for leads. It's calculated during delivery and recorded on recipient events. Sale pricing is configured on each recipient step that delivers to a buyer, allowing different prices for different buyers receiving the same lead.

### Pricing Evaluation Layers

LeadConduit evaluates pricing through four distinct layers, with a clear precedence order:

1. **Source Pricing Service** (Highest Priority)
   - External API determines price
   - Used for real-time bidding or dynamic pricing
   - Includes fallback price if service fails

2. **Source Pricing Rules**
   - Configured rules on the specific source
   - Can override flow-level pricing
   - Vendor-specific agreements

3. **Flow Pricing Service**
   - Flow-wide external pricing service
   - Fallback for sources without specific pricing
   - Standardized pricing logic

4. **Flow Pricing Rules** (Lowest Priority)
   - Base pricing for the flow
   - Default when no other pricing applies
   - Simple or complex rule-based pricing

The first layer that returns a price wins - once a price is set, lower layers aren't evaluated.

### How Pricing Rules Work

Pricing rules use the same powerful rule engine as the rest of LeadConduit, but with a special behavior: when multiple prices match, the **last matching price** wins.

**Important Limits**:
- Maximum price: $1,000,000 (system limit)
- Default price when no rules match: $0.00 (not configurable)
- Negative prices: Only via return feedback credits

**Example Configuration:**
```
Price 1: $10.00 (no rules - base price)
Price 2: $15.00 when state equals "CA"
Price 3: $20.00 when state equals "CA" AND insurance_type equals "auto"
Price 4: $25.00 when lead_quality equals "premium"
```

For a premium auto insurance lead from California:
- Price 1 matches (always matches - no rules)
- Price 2 matches (state is CA)
- Price 3 matches (CA + auto insurance)
- Price 4 matches (premium quality)
- **Final price: $25.00** (last match wins)

This "last match wins" approach lets you build pricing from general to specific, with more specific prices overriding general ones.

### Pricing Services

External pricing services enable dynamic, real-time pricing based on:
- Current market conditions
- Buyer demand
- Lead quality scores
- Auction results
- Custom algorithms

Services return a price and optionally a reason. If the service fails or returns no price, the configured fallback price is used. This ensures pricing never blocks lead processing.

### Override Pricing

Sometimes standard pricing needs exceptions:
- Special campaign rates
- Negotiated deals
- Test leads
- Make-good credits

Override pricing lets sources specify their own price, bypassing normal calculation. This is configured per source and typically used sparingly for special circumstances.

## Purchase Pricing in Detail

### Where Purchase Pricing Happens

Purchase pricing is calculated during the lead submission process, after type parsing and field mapping but before acceptance criteria. This ensures you know the cost before deciding whether to accept the lead.

### Setting Up Vendor Pricing

**Scenario 1: Fixed Price Per Vendor**
```
Source: "Premium Insurance Leads"
Pricing: $25.00 (no rules)
Result: Every lead costs $25.00
```

**Scenario 2: Geographic Pricing**
```
Source: "National Lead Network"
Base Price: $10.00
Price 2: $15.00 when state in ["CA", "NY", "FL"]
Price 3: $20.00 when state equals "TX"
Result: Varies by state, with TX highest priority
```

**Scenario 3: Quality-Based Pricing**
```
Source: "Quality Leads Inc"
Base Price: $5.00
Price 2: $10.00 when phone.valid is true
Price 3: $15.00 when email.valid is true
Price 4: $20.00 when phone.valid is true AND email.valid is true
Price 5: $25.00 when trustedform_decisions.valid is true
Result: Higher price for better data quality and valid consent
```

Note: TrustedForm Decisions data is available in pricing rules, allowing you to pay more for leads with verified consent.

### Using Pricing Services for Purchase

For dynamic vendor pricing, configure a pricing service:

```
Source Pricing Service:
- Service: "Market Rate Calculator"
- Fallback: $10.00
- Timeout: 2 seconds

The service receives:
- All lead data
- Source information
- Flow context

Returns:
- price: 18.50
- reason: "Market rate for auto insurance in urban California"
```

### Purchase Price Recording

The purchase price is recorded on the source event:
- Enables vendor reconciliation
- Tracks cost per accepted lead
- Supports margin calculation
- Creates audit trail

## Sale Pricing in Detail

### Where Sale Pricing Happens

Sale pricing is configured on each recipient step that delivers to a buyer. This happens during step processing, after the lead has been accepted. Each buyer can have different pricing for the same lead.

### Setting Up Buyer Pricing

**Scenario 1: Single Buyer, Fixed Price**
```
Recipient Step: "Deliver to Acme Insurance"
Pricing: $45.00 (no rules)
Result: Every delivered lead generates $45.00
```

**Scenario 2: Tiered Buyer Pricing**
```
Recipient Step: "Deliver to Premium Buyer"
Base Price: $30.00
Price 2: $40.00 when loan_amount > 100000
Price 3: $50.00 when loan_amount > 250000
Price 4: $75.00 when credit_score > 750 AND loan_amount > 250000
Result: Higher value leads command higher prices
```

Note: loan_amount and credit_score are custom fields specific to lending - they don't have a lead. prefix.

**Scenario 3: Multi-Buyer with Different Prices**
```
Step 1 - "Exclusive Buyer": $100.00 (gets first look)
Step 2 - "Buyer Pool A": $25.00 (if exclusive passes)
Step 3 - "Buyer Pool B": $25.00 (shared lead)
Result: Same lead can generate multiple revenue streams
```

### Delivery-Based Pricing

Sale pricing only applies to successful deliveries:
- Failed deliveries (outcome = failure) generate no revenue
- Error deliveries might be retried
- Skipped steps generate no revenue
- Only outcome = success counts as revenue

### Revenue Aggregation

When multiple buyers receive the same lead:
- Each successful delivery adds to total revenue
- Revenue is summed across all recipient events
- Failed deliveries don't reduce revenue
- Total revenue appears on the source event

## Advanced Pricing Patterns

### The Margin-Based Pricing Pattern

Ensure profitability on every lead:
```
Flow Pricing: Use external service
Service Logic:
1. Check current buyer demand
2. Calculate minimum acceptable margin
3. Return price that ensures 40% margin
4. Fallback to base price if calculation fails
```

### The Time-Based Pricing Pattern

Adjust prices based on when leads arrive:
```
Flow Pricing Rules:
Base: $20.00
Price 2: $25.00 when hour >= 9 AND hour < 17 (business hours)
Price 3: $30.00 when day_of_week in ["Saturday", "Sunday"] (weekend premium)
Price 4: $15.00 when hour >= 22 OR hour < 6 (late night discount)
```

### The Quality Incentive Pattern

Pay more for better data:
```
Source Pricing Rules:
Base: $10.00
Price 2: $12.00 when trustedform_url is not blank
Price 3: $15.00 when trustedform_url is not blank AND phone.valid is true
Price 4: $20.00 when all_fields_valid is true
Result: Vendors earn more for complete, validated data
```

### The Exclusive vs Shared Pattern

Different prices for different distribution:
```
Recipient Step 1 (Exclusive): $100.00 when exclusive_flag is true
Recipient Step 2 (Shared): $25.00 when exclusive_flag is false
Result: Premium pricing for exclusive leads
```

### The Return Feedback Credit Pattern

Handle credits through return feedback:
```
When: Buyer reports lead quality issue via return feedback
Feedback contains: return reason and credit amount
System action: Creates negative pricing entry
Result: Credits appear in vendor reconciliation
Use case: Quality-based refunds and make-goods
```

Note: Negative pricing (credits) only occurs through the return feedback mechanism, not through regular lead submission. This ensures proper tracking and prevents abuse.

## Pricing in Reports and Analytics

### Key Pricing Metrics

**For Purchase (Cost) Analysis:**
- Total spend by vendor
- Average cost per lead by source
- Cost trends over time
- Cost by lead type or quality

**For Sale (Revenue) Analysis:**
- Total revenue by buyer
- Revenue per successful delivery
- Failed delivery opportunity cost
- Revenue by lead characteristics

**For Margin Analysis:**
- Revenue minus cost per lead
- Margin percentage by flow
- Profitability by vendor/buyer pair
- ROI by lead type

### Monthly Reconciliation

LeadConduit makes reconciliation simple:

**Vendor Payments:**
1. Run source event report for the month
2. Filter by vendor (source)
3. Sum purchase_price for accepted leads
4. Export for accounts payable

**Buyer Invoicing:**
1. Run recipient event report for the month
2. Filter by buyer and outcome = success
3. Sum sale_price for delivered leads
4. Export for accounts receivable

### Dispute Resolution

When pricing disputes arise:
1. Find the specific event (source or recipient)
2. Check the `pricing` field showing configuration
3. Review the `vars` to see what data was evaluated
4. Verify which rule matched
5. Share the audit trail with vendor/buyer

## Common Pricing Scenarios

### Scenario 1: Lead Arbitrage

**Setup:**
- Purchase from vendors at market rate
- Sell to buyers at premium prices
- Track margins in real-time

**Configuration:**
- Source pricing: $10-30 based on quality
- Recipient pricing: $50-100 based on buyer contracts
- Reports: Daily margin analysis

### Scenario 2: Revenue Share Model

**Setup:**
- Vendors paid percentage of sale price
- Price determined by buyer demand
- Settlement after successful delivery

**Configuration:**
- Source pricing service: "Calculate 70% of expected sale price"
- Recipient pricing: Based on buyer agreements
- Reports: Monthly vendor revenue share

### Scenario 3: Cost-Plus Pricing

**Setup:**
- Charge buyers your cost plus fixed margin
- Transparent pricing model
- Automatic price adjustments

**Configuration:**
- Purchase pricing: Vendor agreements
- Sale pricing service: "Add 40% to purchase price"
- Reports: Margin consistency tracking

### Scenario 4: Return Feedback Credits

**Setup:**
- Handle quality issues through return feedback
- Buyers report problems with specific leads
- System automatically processes credits
- Maintains audit trail for disputes

**How it Works:**
- Buyer sends return feedback with reason
- System creates feedback-received event
- Negative pricing entry created
- Credit appears in vendor reconciliation
- Original purchase price adjusted

**Common Return Reasons:**
- Bad phone number (disconnected)
- Wrong geography (outside service area)
- Duplicate customer (already in CRM)
- No consent (missing TrustedForm)

## Troubleshooting Pricing Issues

### "Wrong price on my leads"

1. Check which pricing layer set the price:
   - Look at source event `pricing` field
   - See if service or rules determined price
2. Review the matching rules:
   - What data was evaluated?
   - Which rule matched last?
3. Verify the configuration:
   - Is the rule logic correct?
   - Are prices in the right order?

### "Pricing service failures"

1. Check the fallback price configuration
2. Review service timeout settings
3. Look for error events from the service
4. Verify service credentials and endpoint
5. Test with known good data

### "Revenue not calculating correctly"

1. Verify recipient step has pricing configured
2. Check that deliveries were successful
3. Review recipient event outcomes
4. Confirm buyer entity type is correct
5. Look for skipped or failed deliveries

### "Margin reports don't match"

1. Ensure both purchase and sale prices are set
2. Check for leads with zero prices
3. Verify no manual price overrides
4. Review the report filters
5. Confirm time zones for date ranges

## Best Practices

### Pricing Strategy

1. **Start Simple**: Begin with fixed prices, add rules over time
2. **Document Agreements**: Note pricing logic in descriptions
3. **Test Thoroughly**: Verify prices before going live
4. **Monitor Margins**: Set up alerts for low-margin leads
5. **Regular Reviews**: Audit pricing monthly

### Rule Design

1. **Order Matters**: Remember last match wins
2. **Be Specific**: More specific rules should come last
3. **Use Comments**: Document why prices are set
4. **Test Edge Cases**: Verify unusual combinations
5. **Keep It Readable**: Complex logic should be in services

### Service Integration

1. **Always Set Fallbacks**: Never let pricing block leads
2. **Monitor Performance**: Track service response times
3. **Handle Errors Gracefully**: Log issues for review
4. **Cache When Possible**: Reduce redundant calls
5. **Version Your APIs**: Maintain pricing service compatibility

## Key Takeaways

- Pricing in LeadConduit handles both purchase costs (what you pay vendors) and sale prices (what you charge buyers)
- Four pricing layers provide flexibility: source service, source rules, flow service, flow rules - first match wins
- Pricing rules use "last match wins" logic, allowing general-to-specific price structures
- Purchase pricing happens during submission and is recorded on source events
- Sale pricing happens during delivery and is recorded on recipient events - one lead can have multiple sale prices
- Only successful deliveries generate revenue - failed deliveries don't count
- Pricing services enable dynamic, real-time pricing based on external factors
- Override pricing allows special deals and credits outside normal rules
- Every price is recorded on events, creating a complete audit trail for reconciliation
- Reports make it easy to calculate vendor payments, buyer invoices, and margins
- Negative pricing (credits) only occurs through return feedback, ensuring proper tracking and preventing abuse
- Pricing never blocks lead flow - there's always a fallback to ensure processing continues