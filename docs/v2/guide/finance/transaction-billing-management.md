---
tags:
  - pricing
  - intermediate
  - how-to
  - finance
  - billing
  - reconciliation
  - cost-management
  - revenue-tracking
---

# Transaction & Billing Management Guide

Master LeadConduit's financial features to track costs, manage revenue, handle reconciliation, and optimize margins. This comprehensive guide covers pricing configuration, transaction tracking, billing workflows, and financial reporting.

## 📍 You Are Here

You're setting up LeadConduit's financial management system to automatically track what you pay vendors (purchase pricing) and what you charge buyers (sale pricing). This creates a complete financial audit trail for every lead, enabling accurate reconciliation and margin analysis.

## 🎯 What You'll Achieve

- Automated cost and revenue calculation
- Dynamic pricing based on lead attributes
- Complete transaction audit trails
- Streamlined monthly reconciliation
- Real-time margin tracking
- Return credit handling
- Financial reporting and analytics

## 📋 Prerequisites

Before starting, ensure you:

### Business Requirements
- Clear vendor pricing agreements
- Defined buyer rate cards
- Understanding of margin targets
- Reconciliation processes in place

### Technical Requirements
- LeadConduit account with appropriate permissions
- Flows configured with sources and recipients
- Basic understanding of [Rules](../flow-management/acceptance-criteria.md)
- Familiarity with [Events](../analytics/understanding-events.md)

## 💰 Understanding LeadConduit Pricing

### Core Concepts

**Purchase Pricing**: What you pay vendors for leads
- Calculated during submission
- Recorded on source events
- Per-vendor configuration

**Sale Pricing**: What you charge buyers for leads
- Calculated during delivery
- Recorded on recipient events
- Per-buyer configuration

### Pricing Evaluation Order

LeadConduit evaluates pricing through four layers (first match wins):

1. **Source/Recipient Pricing Service** (Highest Priority)
   - External API determines price
   - Real-time dynamic pricing
   
2. **Source/Recipient Pricing Rules**
   - Configured on specific source/recipient
   - Vendor/buyer-specific agreements

3. **Flow Pricing Service**
   - Flow-wide external pricing
   - Fallback for sources without pricing

4. **Flow Pricing Rules** (Lowest Priority)
   - Base pricing for the flow
   - Default when no other pricing applies

## 🚀 Step 1: Configure Purchase Pricing

### Basic Vendor Pricing

1. **Navigate to Sources**
   - Open your flow
   - Click **Sources** tab
   - Select a source

2. **Set Fixed Pricing**
   ```
   Purchase Price: $25.00
   Description: Standard rate for premium leads
   ```

### Rule-Based Vendor Pricing

3. **Add Pricing Rules**
   Click **Add Price** for each tier:
   
   ```
   Base Price: $10.00 (no rules)
   
   Price 2: $15.00
   Rules: state is one of CA, NY, FL
   
   Price 3: $20.00
   Rules: state is TX
   
   Price 4: $25.00
   Rules: phone.valid is true AND email.valid is true
   ```

   ⚠️ **Important**: Last matching price wins!

### Dynamic Pricing Example

For a lead from Texas with valid phone and email:
- Base price matches: $10.00 ✓
- Price 3 matches (TX): $20.00 ✓
- Price 4 matches (valid data): $25.00 ✓
- **Final price: $25.00** (last match)

## 💵 Step 2: Configure Sale Pricing

### Basic Buyer Pricing

1. **Navigate to Recipient Step**
   - Find your delivery step
   - Click **Edit**
   - Expand **Pricing** section

2. **Set Buyer Rates**
   ```
   Sale Price: $45.00
   Description: Contract rate for exclusive leads
   ```

### Tiered Buyer Pricing

3. **Configure Value-Based Pricing**
   ```
   Base Price: $30.00
   
   Price 2: $40.00
   Rules: loan_amount > 100000
   
   Price 3: $50.00
   Rules: loan_amount > 250000
   
   Price 4: $75.00
   Rules: credit_score > 750 AND loan_amount > 250000
   ```

### Multi-Buyer Scenarios

Different prices for different buyers:

```
Step 1 - Exclusive Buyer:
  Price: $100.00
  Rules: exclusive_lead is true

Step 2 - Buyer Pool A:
  Price: $25.00
  Rules: exclusive_lead is false

Step 3 - Buyer Pool B:
  Price: $25.00
  Rules: Always (shared lead)
```

## 🔄 Step 3: Advanced Pricing Patterns

### Time-Based Pricing

Adjust rates by time of day:

```javascript
Base: $20.00

Business Hours Premium:
Price: $25.00
Rules: hour >= 9 AND hour < 17

Weekend Premium:
Price: $30.00
Rules: day_of_week is one of Saturday, Sunday

Night Discount:
Price: $15.00
Rules: hour >= 22 OR hour < 6
```

### Quality Incentive Pricing

Pay more for better data:

```javascript
Base: $10.00

With Consent:
Price: $12.00
Rules: trustedform_cert_url is not blank

Fully Validated:
Price: $20.00
Rules: trustedform_cert_url is not blank 
       AND phone.valid is true 
       AND email.valid is true
```

### Margin-Based Pricing

Ensure profitability:

```javascript
// External pricing service logic
function calculatePurchasePrice(lead, buyerDemand) {
  const expectedSalePrice = buyerDemand.maxPrice;
  const targetMargin = 0.40; // 40% margin
  const maxPurchasePrice = expectedSalePrice * (1 - targetMargin);
  
  return {
    price: Math.min(maxPurchasePrice, 50), // Cap at $50
    reason: `Ensuring ${targetMargin * 100}% margin`
  };
}
```

## 💳 Step 4: External Pricing Services

### Configure Pricing Service

1. **Add Service Integration**
   ```
   Service: Market Rate Calculator
   Endpoint: https://api.yourservice.com/pricing
   Timeout: 2000ms
   Fallback Price: $15.00
   ```

2. **Service Request Format**
   Your service receives:
   ```json
   {
     "lead": {
       "email": "test@example.com",
       "state": "CA",
       "insurance_type": "auto"
     },
     "source": {
       "name": "Premium Leads Inc",
       "id": "abc123"
     },
     "flow": {
       "id": "flow_123",
       "name": "Insurance Flow"
     }
   }
   ```

3. **Service Response Format**
   Service should return:
   ```json
   {
     "price": 22.50,
     "reason": "Premium rate for auto insurance in CA"
   }
   ```

## 📊 Step 5: Transaction Tracking

### Understanding Events

Each lead creates multiple events with pricing data:

**Source Event** (Purchase):
```json
{
  "outcome": "success",
  "purchase_price": 25.00,
  "pricing": {
    "type": "rules",
    "matched_rule": "Price 4"
  }
}
```

**Recipient Events** (Sale):
```json
{
  "outcome": "success",
  "sale_price": 45.00,
  "recipient": "Acme Insurance",
  "pricing": {
    "type": "fixed",
    "configuration": "Contract rate"
  }
}
```

### Monitoring Transactions

Use Events tab to track:
- Real-time pricing application
- Which rules matched
- Service responses
- Failed deliveries (no revenue)

## 💰 Step 6: Monthly Reconciliation

### Vendor Payment Reconciliation

1. **Generate Vendor Report**
   ```
   Report Type: Source Events
   Date Range: Last Month
   Filters: 
   - Source: [Select Vendor]
   - Outcome: success
   
   Columns:
   - Source
   - Count
   - Sum(purchase_price)
   - Avg(purchase_price)
   ```

2. **Export for Accounts Payable**
   - Download CSV
   - Match against vendor invoice
   - Identify discrepancies

### Buyer Invoice Generation

3. **Generate Buyer Report**
   ```
   Report Type: Recipient Events
   Date Range: Last Month
   Filters:
   - Recipient: [Select Buyer]
   - Outcome: success
   
   Columns:
   - Recipient
   - Count
   - Sum(sale_price)
   - Delivery Success Rate
   ```

4. **Create Invoices**
   - Export detailed lead list
   - Include lead IDs for reference
   - Apply contract terms

## 🔄 Step 7: Return Credits & Adjustments

### Handling Return Feedback

When buyers report issues:

1. **Buyer Sends Return Feedback**
   ```json
   {
     "lead_id": "123456",
     "reason": "bad_phone",
     "credit_amount": 25.00
   }
   ```

2. **System Creates Credit**
   - Negative pricing entry created
   - Appears in reconciliation
   - Maintains audit trail

### Common Return Reasons

Configure standard reasons:
- Bad phone number
- Wrong geography
- Duplicate customer
- No consent/Missing TrustedForm
- Invalid data

### Credit Workflows

```
Original Purchase: $25.00
Return Feedback: "bad_phone"
Credit Applied: -$25.00
Net Cost: $0.00
```

## 📈 Step 8: Margin Analysis

### Real-Time Margin Tracking

Create margin report:

```sql
Revenue (Sum of sale_price)
- Cost (Sum of purchase_price)
= Gross Profit

Margin % = (Gross Profit / Revenue) × 100
```

### Margin by Segment

Analyze profitability:
- By source/buyer pair
- By lead type
- By geography
- By time period

### Margin Optimization

Identify opportunities:
1. Low-margin sources → Renegotiate or remove
2. High-margin buyers → Increase volume
3. Failed deliveries → Fix integration issues
4. Time patterns → Adjust staffing

## 🚫 Troubleshooting

### "Wrong Price Applied"

**Check evaluation order**:
1. View event details
2. Check `pricing` field
3. Identify which layer set price
4. Review rule logic

### "Missing Revenue"

**Verify delivery success**:
1. Check recipient outcome
2. Only "success" generates revenue
3. Review failure reasons
4. Fix delivery issues

### "Reconciliation Mismatch"

**Audit trail investigation**:
1. Export all events
2. Match against vendor records
3. Check for credits/adjustments
4. Verify date ranges

### "Pricing Service Failures"

**Ensure reliability**:
1. Check fallback price
2. Review timeout settings
3. Monitor service health
4. Log service errors

## 💡 Best Practices

### Pricing Strategy

1. **Start Simple**: Fixed prices → Add rules gradually
2. **Document Logic**: Clear descriptions on each price
3. **Test Thoroughly**: Verify before production
4. **Regular Reviews**: Monthly pricing audits
5. **Version Control**: Track pricing changes

### Financial Controls

1. **Price Limits**: Set reasonable maximums
2. **Approval Workflows**: For pricing changes
3. **Audit Trails**: Document all adjustments
4. **Access Control**: Limit who can modify pricing
5. **Change Notifications**: Alert on pricing updates

### Reconciliation Process

1. **Daily Monitoring**: Check key metrics
2. **Weekly Reviews**: Identify anomalies
3. **Monthly Close**: Full reconciliation
4. **Dispute Process**: Clear escalation path
5. **Archive Records**: Maintain history

## 📊 Success Metrics

Track these KPIs:

| Metric | Target | Calculation |
|--------|--------|-------------|
| Gross Margin | >40% | (Revenue - Cost) / Revenue |
| Collection Rate | >95% | Delivered / Accepted |
| Credit Rate | <2% | Credits / Revenue |
| Reconciliation Time | <2 days | Monthly close speed |
| Pricing Accuracy | >99% | Correct prices / Total |

## 🎯 Common Scenarios

### Scenario 1: Performance-Based Pricing

Pay vendors based on quality:
```
Base: $5.00
Connected Call: $15.00
Appointment Set: $50.00
Closed Deal: $200.00
```

### Scenario 2: Revenue Share Model

Split revenue with partners:
```
Purchase Price: External service calculates 70% of sale price
Sale Price: Based on buyer bid
Result: Automatic revenue sharing
```

### Scenario 3: Bundled Pricing

Volume discounts:
```
1-100 leads: $25.00 each
101-500 leads: $20.00 each
500+ leads: $15.00 each
Track with custom counter field
```

## 📚 Related Documentation

- [Pricing Model Deep Dive](../../reference/app/pricing.md) - Technical details
- [Events & Analytics](../analytics/understanding-events.md) - Transaction tracking
- [Custom Reports](../analytics/custom-reports.md) - Financial reporting
- [Rules Engine](../flow-management/acceptance-criteria.md) - Pricing rule logic

---

💵 **Financial Control Achieved**: Your LeadConduit system now automatically tracks every penny, from vendor costs to buyer revenue. With complete transaction visibility and automated reconciliation, you can focus on optimizing margins rather than chasing spreadsheets!