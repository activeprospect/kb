---
title: 'Lead Pricing Complete Guide'
description: 'Master LeadConduit\'s powerful pricing system for both buying and selling leads with rules-based logic'
sidebar_label: 'Lead Pricing'
sidebar_position: 1
tags:
  - Pricing
  - Finance
  - Revenue
  - Cost Management
  - Rules
  - Billing
---

# Lead Pricing Complete Guide

<div className="you-are-here">

### 📍 You Are Here

**Application**: LeadConduit  
**Section**: Finance & Billing  
**Topic**: Comprehensive Lead Pricing Configuration

</div>

## Overview

LeadConduit provides a sophisticated, rules-based pricing system that handles both sides of lead transactions - what you pay sources (purchase pricing) and what buyers pay you (sale pricing). This guide covers every aspect of the pricing system.

### What You'll Learn

<div className="grid-three-column">

<div className="info-card">

#### 💰 Purchase Pricing
- Source-level pricing
- Flow-level defaults
- Dynamic pricing rules

</div>

<div className="info-card">

#### 💵 Sale Pricing
- Buyer pricing setup
- Revenue optimization
- Margin management

</div>

<div className="info-card">

#### 📊 Advanced Features
- Rules-based pricing
- Performance pricing
- Reporting & analytics

</div>

</div>

## Understanding the Pricing Model

### Pricing Hierarchy

```yaml
Pricing Structure:
  └── Flow Level (Default)
      ├── Source Level (Override)
      │   ├── Rule-Based Pricing
      │   └── Source-Submitted Pricing
      └── Delivery Level
          ├── Rule-Based Pricing
          └── Buyer-Provided Pricing
```

### Key Concepts

<div className="concept-grid">

<div className="concept-card">

#### 🎯 Purchase Price
What you pay the lead source for accepted leads

</div>

<div className="concept-card">

#### 💸 Sale Price  
What the buyer pays you for delivered leads

</div>

<div className="concept-card">

#### 📈 Margin
Difference between sale and purchase price

</div>

<div className="concept-card">

#### 🔄 Dynamic Pricing
Prices that change based on lead attributes

</div>

</div>

## Purchase Pricing Configuration

### Flow-Level Pricing

Set default pricing for all sources:

1. Navigate to **Flow** → **Sources** tab
2. Click **Flow Purchase Price**
3. Configure base pricing:

```yaml
Flow Purchase Price:
  Default Price: $5.00
  Currency: USD
  Apply To: All sources without specific pricing
```

### Source-Level Pricing

Override flow defaults for specific sources:

```yaml
Source Configuration:
  Name: Premium Partner
  Pricing Type: Custom
  Base Price: $8.00
  Override Flow Default: Yes
```

### Rule-Based Purchase Pricing

Create dynamic pricing based on lead attributes:

```javascript
// Example: Tiered pricing by lead quality
{
  "pricing_rules": [
    {
      "name": "High Quality Leads",
      "conditions": {
        "lead_score": { "operator": ">=", "value": 80 },
        "verified_phone": true
      },
      "price": 12.00
    },
    {
      "name": "Medium Quality Leads",
      "conditions": {
        "lead_score": { "operator": "between", "min": 50, "max": 79 }
      },
      "price": 8.00
    },
    {
      "name": "Base Quality Leads",
      "conditions": {
        "default": true
      },
      "price": 5.00
    }
  ]
}
```

### Source-Submitted Pricing

Accept pricing from the source:

```yaml
Source Pricing Configuration:
  Accept Source Price: Yes
  Price Field Name: price
  Validation:
    Minimum: $1.00
    Maximum: $50.00
  Fallback: Use flow default if invalid
```

<div className="warning-box">
<strong>⚠️ Important</strong>: You cannot use both rule-based and source-submitted pricing. Choose one method per source.
</div>

## Sale Pricing Configuration

### Delivery Step Pricing

Configure what buyers pay:

1. Open delivery step configuration
2. Navigate to **Pricing** section
3. Set up sale pricing:

```yaml
Sale Price Configuration:
  Base Price: $15.00
  Pricing Method: Rule-based
  Margin Target: 50%
```

### Dynamic Sale Pricing Rules

Implement sophisticated pricing logic:

```javascript
// Complex sale pricing example
{
  "sale_pricing": {
    "rules": [
      {
        "name": "Exclusive Leads",
        "conditions": {
          "exclusive": true,
          "deliveries_count": 0
        },
        "price": 25.00
      },
      {
        "name": "Semi-Exclusive",
        "conditions": {
          "deliveries_count": { "operator": "<", "value": 3 }
        },
        "price": 18.00
      },
      {
        "name": "Geographic Premium",
        "conditions": {
          "state": { "operator": "in", "value": ["CA", "NY", "TX"] }
        },
        "price": 20.00
      },
      {
        "name": "Time-Based Pricing",
        "conditions": {
          "age_minutes": { "operator": "<", "value": 5 }
        },
        "price": 22.00
      }
    ],
    "default_price": 15.00
  }
}
```

### Buyer-Provided Pricing

Accept pricing from buyer responses:

```javascript
// Buyer response with pricing
{
  "response": {
    "accepted": true,
    "price": 18.50,
    "lead_id": "abc123"
  }
}

// Configuration to accept buyer pricing
{
  "accept_buyer_price": true,
  "price_field": "price",
  "validate_price": {
    "min": 10.00,
    "max": 50.00
  }
}
```

## Advanced Pricing Strategies

### Strategy 1: Margin-Based Pricing

Maintain consistent profit margins:

```javascript
// Automatic margin calculation
{
  "margin_pricing": {
    "enabled": true,
    "target_margin_percent": 40,
    "calculation": "sale_price = purchase_price * (1 + margin)",
    "constraints": {
      "min_sale_price": 10.00,
      "max_sale_price": 100.00
    }
  }
}
```

### Strategy 2: Volume-Based Pricing

Reward high-volume partners:

```javascript
// Volume tiers
{
  "volume_pricing": {
    "period": "monthly",
    "tiers": [
      {
        "min_volume": 0,
        "max_volume": 1000,
        "purchase_price": 5.00,
        "sale_price": 12.00
      },
      {
        "min_volume": 1001,
        "max_volume": 5000,
        "purchase_price": 6.00,
        "sale_price": 13.00
      },
      {
        "min_volume": 5001,
        "max_volume": null,
        "purchase_price": 7.00,
        "sale_price": 14.00
      }
    ]
  }
}
```

### Strategy 3: Performance-Based Pricing

Price based on quality metrics:

```javascript
// Performance pricing
{
  "performance_pricing": {
    "metric": "conversion_rate",
    "lookback_days": 30,
    "tiers": [
      {
        "min_rate": 0,
        "max_rate": 0.05,
        "price_multiplier": 0.8
      },
      {
        "min_rate": 0.05,
        "max_rate": 0.10,
        "price_multiplier": 1.0
      },
      {
        "min_rate": 0.10,
        "max_rate": 1.0,
        "price_multiplier": 1.2
      }
    ]
  }
}
```

## Nested Pricing Rules

Create complex pricing logic with nested conditions:

```javascript
// Sophisticated nested pricing
{
  "pricing_rules": [
    {
      "name": "Premium California Leads",
      "conditions": {
        "AND": [
          { "field": "state", "equals": "CA" },
          {
            "OR": [
              { "field": "income", "greater_than": 100000 },
              { "field": "home_value", "greater_than": 500000 }
            ]
          }
        ]
      },
      "purchase_price": 15.00,
      "sale_price": 35.00
    },
    {
      "name": "Business Hours Premium",
      "conditions": {
        "AND": [
          { "field": "business_hours", "equals": true },
          { "field": "lead_type", "equals": "live_transfer" }
        ]
      },
      "price_adjustment": {
        "type": "percentage",
        "value": 20
      }
    }
  ]
}
```

## Pricing Fields and Variables

### Available Pricing Variables

Use these fields in pricing rules:

<div className="variable-grid">

<div className="variable-card">

#### 📍 Geographic
- `state`
- `city`
- `postal_code`
- `county`
- `metro_area`

</div>

<div className="variable-card">

#### 👤 Demographic
- `age`
- `income`
- `education`
- `home_owner`
- `credit_range`

</div>

<div className="variable-card">

#### 📊 Lead Quality
- `lead_score`
- `verified`
- `tcpa_compliant`
- `exclusive`
- `age_minutes`

</div>

<div className="variable-card">

#### 🔧 Technical
- `source_id`
- `campaign`
- `delivery_count`
- `previous_outcomes`
- `metadata.*`

</div>

</div>

## Pricing Reports and Analytics

### Default Pricing Reports

LeadConduit provides built-in pricing reports:

```yaml
Stats Report by Source and Purchase Price:
  Columns:
    - Source Name
    - Lead Count
    - Total Cost
    - Average Price
    - Acceptance Rate
  Grouping: By Source, By Price
  Period: Customizable
```

### Custom Pricing Analytics

Build advanced pricing reports:

```sql
-- Margin Analysis Report
SELECT 
  DATE(created_at) as date,
  source_name,
  buyer_name,
  COUNT(*) as lead_count,
  AVG(purchase_price) as avg_cost,
  AVG(sale_price) as avg_revenue,
  AVG(sale_price - purchase_price) as avg_margin,
  (AVG(sale_price - purchase_price) / AVG(purchase_price) * 100) as margin_percent
FROM leads
WHERE 
  delivery_outcome = 'success'
  AND created_at >= CURRENT_DATE - INTERVAL '30 days'
GROUP BY date, source_name, buyer_name
ORDER BY date DESC, margin_percent DESC;
```

### Key Pricing Metrics

Monitor these essential metrics:

<div className="metrics-grid">

<div className="metric-card">

#### 💰 Average Purchase Price
```
Formula: SUM(purchase_price) / COUNT(leads)
Target: Market competitive
Trend: Monitor monthly
```

</div>

<div className="metric-card">

#### 💵 Average Sale Price
```
Formula: SUM(sale_price) / COUNT(sold_leads)
Target: > Purchase + overhead
Trend: Increase over time
```

</div>

<div className="metric-card">

#### 📈 Gross Margin
```
Formula: (Sale - Purchase) / Sale * 100
Target: > 30%
Alert: < 20%
```

</div>

<div className="metric-card">

#### 🎯 Price Variance
```
Formula: STDDEV(price) / AVG(price)
Target: < 25%
Review: High variance sources
```

</div>

</div>

## Troubleshooting Pricing Issues

### Common Problems and Solutions

<div className="troubleshooting-section">

**Problem**: Prices not applying correctly

**Solutions**:
1. Check rule priority order
2. Verify field names match exactly
3. Test with lead data to see rule evaluation
4. Review source/flow hierarchy

</div>

<div className="troubleshooting-section">

**Problem**: Negative margins appearing

**Solutions**:
1. Audit purchase vs. sale prices
2. Check for buyer price overrides
3. Review pricing rules for conflicts
4. Set minimum margin constraints

</div>

<div className="troubleshooting-section">

**Problem**: Source-submitted prices rejected

**Solutions**:
1. Verify price field name
2. Check min/max validation
3. Ensure numeric format
4. Review fallback settings

</div>

## Best Practices

### 1. Pricing Strategy

```yaml
Strategic Guidelines:
  - Start with simple rules, add complexity gradually
  - Monitor margins daily
  - A/B test pricing changes
  - Document all pricing logic
  - Regular competitive analysis
```

### 2. Rule Organization

```yaml
Rule Structure:
  - Order rules from most to least specific
  - Use clear, descriptive names
  - Group related conditions
  - Always include a default/fallback price
  - Test edge cases
```

### 3. Margin Protection

```yaml
Margin Safety:
  - Set minimum acceptable margins
  - Alert on margin erosion
  - Review unprofitable sources
  - Negotiate better rates
  - Optimize delivery costs
```

## Integration with Billing

### How Pricing Affects Billing

```yaml
Billing Integration:
  Purchase Prices → Accounts Payable
  Sale Prices → Accounts Receivable
  Net Margin → Gross Profit
  Volume × Price → Revenue
```

### Reconciliation Process

Ensure accurate billing:

1. **Daily Reconciliation**
   - Match delivered leads to invoices
   - Verify pricing applied correctly
   - Flag discrepancies

2. **Monthly Close**
   - Generate source payment reports
   - Create buyer invoices
   - Calculate net revenue

3. **Audit Trail**
   - Track all price changes
   - Document rule modifications
   - Maintain pricing history

## Advanced Pricing Scenarios

### Scenario 1: Ping/Post Pricing

Different prices for ping vs. post:

```javascript
{
  "ping_post_pricing": {
    "ping": {
      "price": 0.10,
      "conditions": ["initial_interest"]
    },
    "post": {
      "price": 15.00,
      "conditions": ["ping_accepted", "full_data_provided"]
    }
  }
}
```

### Scenario 2: Exclusive vs. Shared

Premium for exclusive leads:

```javascript
{
  "exclusivity_pricing": {
    "exclusive": {
      "multiplier": 2.5,
      "max_deliveries": 1
    },
    "semi_exclusive": {
      "multiplier": 1.5,
      "max_deliveries": 3
    },
    "shared": {
      "multiplier": 1.0,
      "max_deliveries": null
    }
  }
}
```

### Scenario 3: Real-Time Bidding

Dynamic auction-based pricing:

```javascript
{
  "rtb_pricing": {
    "auction_type": "second_price",
    "reserve_price": 5.00,
    "bid_timeout": 100,  // milliseconds
    "accept_highest": true
  }
}
```

## Pricing Optimization

### A/B Testing Prices

Test pricing strategies:

```yaml
Price Test Configuration:
  Test Name: Q4 Pricing Optimization
  Variants:
    A: Current pricing (control)
    B: 10% increase
    C: Volume discounts
  Split: 33/33/34
  Duration: 2 weeks
  Success Metric: Total margin
```

### Price Elasticity Analysis

Understand price sensitivity:

```sql
-- Price elasticity calculation
WITH price_changes AS (
  SELECT 
    source_name,
    DATE(changed_at) as change_date,
    old_price,
    new_price,
    (new_price - old_price) / old_price * 100 as price_change_percent
  FROM pricing_history
),
volume_changes AS (
  SELECT 
    source_name,
    DATE(created_at) as date,
    COUNT(*) as daily_volume
  FROM leads
  GROUP BY source_name, date
)
SELECT 
  pc.source_name,
  pc.price_change_percent,
  AVG(vc_before.daily_volume) as volume_before,
  AVG(vc_after.daily_volume) as volume_after,
  (AVG(vc_after.daily_volume) - AVG(vc_before.daily_volume)) / AVG(vc_before.daily_volume) * 100 as volume_change_percent
FROM price_changes pc
JOIN volume_changes vc_before ON 
  vc_before.source_name = pc.source_name 
  AND vc_before.date < pc.change_date
  AND vc_before.date >= pc.change_date - INTERVAL '7 days'
JOIN volume_changes vc_after ON 
  vc_after.source_name = pc.source_name 
  AND vc_after.date > pc.change_date
  AND vc_after.date <= pc.change_date + INTERVAL '7 days'
GROUP BY pc.source_name, pc.price_change_percent;
```

## Next Steps

<div className="next-steps-grid">

<a href="/docs/v2/guide/finance/billing-management" className="next-step-card">
<h4>Billing Management</h4>
<p>Invoice and payment handling</p>
</a>

<a href="/docs/v2/guide/analytics/roi-tracking" className="next-step-card">
<h4>ROI Tracking</h4>
<p>Measure pricing effectiveness</p>
</a>

<a href="/docs/v2/reference/pricing/api" className="next-step-card">
<h4>Pricing API Reference</h4>
<p>Programmatic pricing control</p>
</a>

</div>

## Additional Resources

- [Pricing Calculator Tool](/tools/pricing-calculator)
- [Margin Analysis Template](/templates/margin-analysis.xlsx)
- [Video: Advanced Pricing Strategies](https://www.youtube.com/watch?v=pricing)
- [Community Forum: Pricing Discussion](https://community.activeprospect.com/c/pricing)

---

<div className="feedback-section">

### 📝 Feedback

**Was this guide helpful?** [Yes](#) | [No](#) | [Report an Issue](#)

**Need help?** Contact our [Billing Support Team](mailto:billing@activeprospect.com)

</div>