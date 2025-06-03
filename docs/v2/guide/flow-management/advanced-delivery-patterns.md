---
title: 'Advanced Delivery Patterns Guide'
description: 'Master complex lead distribution strategies including round-robin, weighted distribution, and pixel tracking'
sidebar_label: 'Advanced Delivery Patterns'
sidebar_position: 7
tags:
  - Flow Management
  - Delivery
  - Round Robin
  - Distribution
  - Pixel Tracking
  - Advanced
---

# Advanced Delivery Patterns Guide

<div className="you-are-here">

### 📍 You Are Here

**Application**: LeadConduit  
**Section**: Flow Management  
**Topic**: Advanced Lead Delivery Patterns

</div>

## Overview

This guide covers sophisticated lead delivery patterns that go beyond basic routing, enabling complex distribution strategies, load balancing, and advanced tracking mechanisms.

### What You'll Learn

<div className="grid-three-column">

<div className="info-card">

#### 🔄 Distribution Methods
- Round-robin delivery
- Weighted distribution
- Capacity-based routing

</div>

<div className="info-card">

#### 📊 Advanced Routing
- A/B testing splits
- Time-based routing
- Performance-based distribution

</div>

<div className="info-card">

#### 🎯 Tracking Systems
- Pixel tracking
- Conversion tracking
- Multi-touch attribution

</div>

</div>

## Round-Robin Distribution

### Basic Round-Robin Using Random Numbers

LeadConduit generates a random number (1-100) for each lead, enabling distribution logic:

```yaml
Round-Robin Setup:
  Recipients: 2
  Distribution: Equal (50/50)
  Method: Random Number Range
```

#### Implementation

<div className="grid-two-column">

<div className="code-example">

#### Recipient A Configuration
```yaml
Step Criteria:
  Field: random
  Operator: less than or equal to
  Value: 50
```

</div>

<div className="code-example">

#### Recipient B Configuration  
```yaml
Step Criteria:
  Field: random
  Operator: greater than
  Value: 50
```

</div>

</div>

<div className="tip-box">
<strong>💡 Pro Tip</strong>: While not a perfect 50/50 split for small volumes, this method achieves near-perfect distribution over larger lead volumes (1000+).
</div>

### Multi-Recipient Round-Robin

For three or more recipients:

```javascript
// 3-way split (33.33% each)
Recipient A: random <= 33
Recipient B: random > 33 AND random <= 66
Recipient C: random > 66

// 4-way split (25% each)
Recipient A: random <= 25
Recipient B: random > 25 AND random <= 50
Recipient C: random > 50 AND random <= 75
Recipient D: random > 75
```

### Weighted Distribution

Distribute leads based on capacity or performance:

```javascript
// 60/30/10 weighted distribution
{
  "recipients": [
    {
      "name": "Premium Buyer",
      "range": "1-60",     // 60% of leads
      "criteria": "random <= 60"
    },
    {
      "name": "Standard Buyer", 
      "range": "61-90",    // 30% of leads
      "criteria": "random > 60 AND random <= 90"
    },
    {
      "name": "Budget Buyer",
      "range": "91-100",   // 10% of leads
      "criteria": "random > 90"
    }
  ]
}
```

## Advanced Routing Patterns

### Pattern 1: Time-Based Routing

Route leads based on business hours and timezone:

```javascript
// Day parting configuration
{
  "routing_rules": [
    {
      "name": "East Coast Team",
      "hours": "9:00 AM - 6:00 PM EST",
      "days": ["Mon", "Tue", "Wed", "Thu", "Fri"],
      "criteria": "{{#if_business_hours 'EST'}}true{{/if}}"
    },
    {
      "name": "West Coast Team",
      "hours": "9:00 AM - 6:00 PM PST",
      "days": ["Mon", "Tue", "Wed", "Thu", "Fri"],
      "criteria": "{{#if_business_hours 'PST'}}true{{/if}}"
    },
    {
      "name": "After Hours Queue",
      "criteria": "{{#if_not_business_hours}}true{{/if}}"
    }
  ]
}
```

### Pattern 2: Performance-Based Distribution

Route more leads to better-performing recipients:

```javascript
// Dynamic weighting based on conversion rates
{
  "performance_routing": {
    "metric": "conversion_rate",
    "period": "last_7_days",
    "algorithm": "proportional",
    "minimum_weight": 10,
    "maximum_weight": 50,
    "update_frequency": "hourly"
  }
}
```

### Pattern 3: Capacity-Based Routing

Respect daily/hourly caps:

```javascript
// Cap management
{
  "capacity_rules": [
    {
      "recipient": "Buyer A",
      "daily_cap": 1000,
      "hourly_cap": 100,
      "overflow": "Buyer B"
    },
    {
      "recipient": "Buyer B",
      "daily_cap": 500,
      "hourly_cap": 50,
      "overflow": "Hold Queue"
    }
  ]
}
```

## A/B Testing Implementation

### Split Testing Delivery Methods

Test different delivery endpoints or formats:

```yaml
A/B Test Configuration:
  Test Name: JSON vs XML Delivery
  Split: 50/50
  Duration: 2 weeks
  Success Metric: Acceptance Rate
```

<div className="grid-two-column">

<div className="code-example">

#### Variant A: JSON Delivery
```javascript
{
  "format": "json",
  "endpoint": "https://api.buyer.com/leads",
  "criteria": "random <= 50"
}
```

</div>

<div className="code-example">

#### Variant B: XML Delivery
```xml
<delivery>
  <format>xml</format>
  <endpoint>https://api.buyer.com/leads.xml</endpoint>
  <criteria>random > 50</criteria>
</delivery>
```

</div>

</div>

### Multi-Variant Testing

Test multiple options simultaneously:

```javascript
// 4-way split test
{
  "variants": [
    {
      "name": "Control",
      "percentage": 40,
      "criteria": "random <= 40"
    },
    {
      "name": "Variant A",
      "percentage": 20,
      "criteria": "random > 40 AND random <= 60"
    },
    {
      "name": "Variant B",
      "percentage": 20,
      "criteria": "random > 60 AND random <= 80"
    },
    {
      "name": "Variant C",
      "percentage": 20,
      "criteria": "random > 80"
    }
  ]
}
```

## Pixel Tracking Implementation

### Basic Pixel Tracking

Fire tracking pixels for third-party analytics:

```yaml
Pixel Tracker Configuration:
  Integration: Pixel Tracker
  Position: After successful delivery
```

#### Google Analytics Example

```javascript
// Base configuration
{
  "url": "https://www.google-analytics.com/collect",
  "method": "GET",
  "parameters": {
    "v": "1",                          // Version
    "tid": "UA-XXXXXX-Y",             // Tracking ID
    "cid": "{{lead.id}}",             // Client ID
    "t": "event",                      // Hit type
    "ec": "Lead",                      // Event category
    "ea": "Delivered",                 // Event action
    "el": "{{recipient.name}}",        // Event label
    "ev": "{{lead.value}}"            // Event value
  }
}
```

### Advanced Pixel Implementations

#### HasOffers/TUNE Tracking

```javascript
{
  "url": "https://tracking.hasoffers.com/pixel",
  "parameters": {
    "adv_id": "1234",
    "adv_sub": "{{lead.id}}",
    "amount": "{{lead.payout}}",
    "transaction_id": "{{delivery.transaction_id}}"
  }
}
```

#### Facebook Conversion Tracking

```javascript
{
  "url": "https://www.facebook.com/tr",
  "parameters": {
    "id": "YOUR_PIXEL_ID",
    "ev": "Lead",
    "cd[content_name]": "{{lead.product}}",
    "cd[content_category]": "{{lead.category}}",
    "cd[value]": "{{lead.value}}",
    "cd[currency]": "USD"
  }
}
```

### Multi-Pixel Firing

Fire multiple tracking pixels in sequence:

```javascript
// Pixel array configuration
{
  "pixels": [
    {
      "name": "Google Analytics",
      "url": "https://www.google-analytics.com/collect",
      "condition": "always"
    },
    {
      "name": "Facebook Pixel",
      "url": "https://www.facebook.com/tr",
      "condition": "{{#if lead.source == 'facebook'}}true{{/if}}"
    },
    {
      "name": "Partner Postback",
      "url": "{{partner.postback_url}}",
      "condition": "{{#if delivery.success}}true{{/if}}"
    }
  ]
}
```

## Failover and Redundancy

### Primary/Backup Delivery

Implement automatic failover:

```yaml
Failover Configuration:
  Primary: 
    Name: Main API Endpoint
    Timeout: 5000ms
    Retry: 2 times
  Backup:
    Name: Backup Endpoint
    Trigger: Primary failure
    Timeout: 10000ms
```

### Cascade Delivery Pattern

Try multiple buyers in sequence:

```javascript
// Waterfall delivery
{
  "cascade": [
    {
      "recipient": "Premium Buyer",
      "criteria": "lead_score >= 80",
      "stop_on_success": true
    },
    {
      "recipient": "Standard Buyer",
      "criteria": "lead_score >= 50",
      "stop_on_success": true
    },
    {
      "recipient": "Catch-all Buyer",
      "criteria": "true",
      "stop_on_success": true
    }
  ]
}
```

## Queue Management

### Delayed Delivery

Implement delivery delays and queuing:

```javascript
// Time-delayed delivery
{
  "delay_rules": [
    {
      "condition": "lead.priority == 'low'",
      "delay": "5 minutes"
    },
    {
      "condition": "recipient.throttle_active",
      "delay": "exponential_backoff",
      "initial": "1 second",
      "maximum": "5 minutes"
    }
  ]
}
```

### Batch Processing

Accumulate and send in batches:

```yaml
Batch Configuration:
  Trigger: Time or count based
  Maximum Size: 100 leads
  Maximum Wait: 5 minutes
  Format: CSV or JSON array
```

## Performance Optimization

### Parallel Delivery

Send to multiple recipients simultaneously:

```javascript
{
  "parallel_delivery": {
    "enabled": true,
    "max_concurrent": 5,
    "timeout": 3000,
    "accept_first": false  // Wait for all responses
  }
}
```

### Connection Pooling

Optimize for high-volume delivery:

```yaml
Connection Settings:
  Pool Size: 10
  Keep Alive: true
  Reuse Connections: true
  DNS Cache: 300 seconds
```

## Monitoring and Analytics

### Delivery Performance Metrics

Track key performance indicators:

<div className="metrics-grid">

<div className="metric-card">

#### 🎯 Delivery Rate
```
Formula: Successful / Attempted
Target: > 95%
Alert: < 90%
```

</div>

<div className="metric-card">

#### ⏱️ Response Time
```
Average: < 500ms
P95: < 1000ms
P99: < 2000ms
```

</div>

<div className="metric-card">

#### 🔄 Distribution Accuracy
```
Formula: Actual % / Target %
Target: Within 2%
Review: Monthly
```

</div>

</div>

### Creating Distribution Reports

Monitor round-robin effectiveness:

```sql
-- Distribution Analysis
SELECT 
  recipient_name,
  COUNT(*) as lead_count,
  (COUNT(*) * 100.0 / SUM(COUNT(*)) OVER()) as percentage,
  AVG(response_time) as avg_response_time,
  SUM(CASE WHEN outcome = 'success' THEN 1 ELSE 0 END) as successes
FROM deliveries
WHERE date >= CURRENT_DATE - INTERVAL '7 days'
GROUP BY recipient_name
ORDER BY lead_count DESC;
```

## Troubleshooting Common Issues

### Uneven Distribution

<div className="troubleshooting-section">

**Problem**: Leads not distributing evenly

**Solutions**:
1. Check step criteria logic
2. Verify no overlapping conditions
3. Ensure sufficient lead volume
4. Review any additional filters

</div>

### Pixel Firing Failures

<div className="troubleshooting-section">

**Problem**: Tracking pixels not firing

**Solutions**:
1. Verify URL encoding
2. Check parameter mapping
3. Test with browser tools
4. Review firewall rules

</div>

### Performance Degradation

<div className="troubleshooting-section">

**Problem**: Slow delivery times

**Solutions**:
1. Implement connection pooling
2. Add caching where appropriate
3. Use parallel delivery
4. Optimize payload size

</div>

## Best Practices

### 1. Testing Distribution Logic

Always test your distribution setup:

```javascript
// Test configuration
{
  "test_mode": true,
  "test_volume": 1000,
  "expected_distribution": {
    "Recipient A": 500,
    "Recipient B": 500
  },
  "tolerance": 2  // percentage
}
```

### 2. Monitoring and Alerts

Set up proactive monitoring:

```yaml
Monitoring Rules:
  - Alert: Distribution skew > 5%
  - Alert: Delivery failure rate > 10%
  - Alert: Average response time > 1 second
  - Alert: Queue depth > 1000 leads
```

### 3. Documentation

Document your routing logic:

```markdown
## Lead Distribution Logic

### Round-Robin Rules
- Recipients: A (50%), B (50%)
- Method: Random number (1-100)
- Overflow: Queue for next business day

### Business Hours
- Monday-Friday: 9 AM - 6 PM EST
- Saturday: 10 AM - 2 PM EST
- Sunday: Closed (queue all leads)
```

## Advanced Patterns Reference

### Pattern Library

<div className="pattern-grid">

<div className="pattern-card">

#### 🎲 Pure Random
```javascript
random <= 50 ? 'A' : 'B'
```
Best for: Equal distribution

</div>

<div className="pattern-card">

#### ⚖️ Weighted Random
```javascript
random <= 70 ? 'Premium' : 'Standard'
```
Best for: Capacity matching

</div>

<div className="pattern-card">

#### 🏆 Performance-Based
```javascript
score >= 80 ? 'Top' : 'Regular'
```
Best for: Quality routing

</div>

<div className="pattern-card">

#### 🌊 Waterfall
```javascript
try A, then B, then C
```
Best for: Maximizing acceptance

</div>

</div>

## Next Steps

<div className="next-steps-grid">

<a href="/docs/v2/guide/flow-management/conditional-logic" className="next-step-card">
<h4>Conditional Logic</h4>
<p>Master complex routing rules</p>
</a>

<a href="/docs/v2/guide/analytics/performance-monitoring" className="next-step-card">
<h4>Performance Monitoring</h4>
<p>Track delivery effectiveness</p>
</a>

<a href="/docs/v2/reference/delivery/methods" className="next-step-card">
<h4>Delivery Methods Reference</h4>
<p>All delivery options</p>
</a>

</div>

## Additional Resources

- [Distribution Calculator Tool](/tools/distribution-calculator)
- [Pixel Testing Utility](/tools/pixel-tester)
- [Community Forum: Delivery Patterns](https://community.activeprospect.com/c/delivery)

---

<div className="feedback-section">

### 📝 Feedback

**Was this guide helpful?** [Yes](#) | [No](#) | [Report an Issue](#)

**Need help?** Contact our [Technical Support Team](mailto:support@activeprospect.com)

</div>