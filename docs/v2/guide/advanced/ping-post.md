# Ping-Post Lead Distribution

Master real-time lead distribution with ping-post methodology. Learn to build competitive marketplaces, optimize pricing, and maximize revenue through intelligent routing.

## 📍 You Are Here

You're implementing ping-post, where buyers bid on leads in real-time before purchase. This advanced pattern maximizes lead value through competition while ensuring quality for buyers.

## 🎯 What You'll Learn

- Ping-post fundamentals
- Building ping and post flows
- Bidding strategies
- Response handling
- Performance optimization
- Advanced routing logic

## 🏗️ Understanding Ping-Post

### What is Ping-Post?

A two-step lead selling process:

**Ping** (Step 1):
- Send partial lead data
- Buyers evaluate and bid
- No PII transmitted
- Fast response required

**Post** (Step 2):
- Send to winning bidder(s)
- Full lead data included
- Billing occurs here
- Delivery confirmation

### Why Use Ping-Post?

**For Sellers**:
- Maximize revenue per lead
- Real-time price discovery
- Multiple buyer competition
- Reduced rejections

**For Buyers**:
- See leads before buying
- Bid based on quality
- Reduce bad purchases
- Better conversion rates

## 🔄 The Ping-Post Flow

### Complete Process

```
1. Lead Arrives
    ↓
2. PING: Send to all buyers
    ↓
3. Collect bids (timeout: 750ms)
    ↓
4. Select winner(s)
    ↓
5. POST: Send to winner
    ↓
6. Confirm delivery
```

## 🏗️ Building Your Ping Flow

### Step 1: Create Ping Flow

```yaml
Flow Name: Solar Leads - Ping
Type: Ping Flow
Timeout: 750ms
```

### Step 2: Configure Ping Data

Only send non-PII fields:
```javascript
// Ping fields (no PII)
state: "CA"
zip: "90210"
homeowner: true
electric_bill: "$200-300"
credit_range: "700+"
property_type: "single_family"

// NOT included in ping
email: [REDACTED]
phone: [REDACTED]
name: [REDACTED]
address: [REDACTED]
```

### Step 3: Add Ping Recipients

Configure each buyer:
```yaml
Recipient: Buyer A - Ping
URL: https://buyer-a.com/ping
Timeout: 500ms
Method: POST
Headers:
  Content-Type: application/json
  X-API-Key: {buyer_a_key}
```

### Step 4: Parse Ping Responses

Expected response format:
```json
{
  "bid": true,
  "price": 45.00,
  "exclusive": false,
  "buyer_id": "buyer_123",
  "conditions": {
    "max_age": 5,
    "require_consent": true
  }
}
```

Parse configuration:
```yaml
Bid Accepted: response.bid = true
Bid Price: response.price
Buyer ID: response.buyer_id
Exclusive: response.exclusive
```

## 🏗️ Building Your Post Flow

### Step 1: Create Post Flow

```yaml
Flow Name: Solar Leads - Post
Type: Post Flow
Accept From: Ping Flow Only
```

### Step 2: Routing Logic

Route based on ping results:
```javascript
// Find highest bidder
winning_bid = ping_responses
  .filter(r => r.bid === true)
  .sort((a, b) => b.price - a.price)[0]

// Route to winner
if (winning_bid) {
  route_to = winning_bid.buyer_id
  sale_price = winning_bid.price
}
```

### Step 3: Configure Post Delivery

Send complete data:
```javascript
// Post includes everything
{
  // Ping data
  ...ping_data,
  
  // PII now included
  email: lead.email,
  phone: lead.phone,
  first_name: lead.first_name,
  last_name: lead.last_name,
  address: lead.address,
  
  // Transaction data
  ping_id: ping.id,
  post_id: post.id,
  price: winning_bid.price
}
```

## 💰 Bidding Strategies

### Exclusive vs Shared

**Exclusive Bids**:
```javascript
// Single buyer gets lead
if (bid.exclusive) {
  minimum_price = 75  // Higher for exclusive
  sell_to = [highest_bidder_only]
}
```

**Shared Distribution**:
```javascript
// Multiple buyers allowed
shared_buyers = bids
  .filter(b => !b.exclusive && b.price > minimum)
  .sort((a, b) => b.price - a.price)
  .slice(0, 3)  // Top 3 bidders
```

### Dynamic Pricing

Adjust based on quality:
```javascript
// Quality multipliers
base_price = 25
quality_multiplier = calculateQuality(lead)
minimum_bid = base_price * quality_multiplier

// Time-based pricing
if (business_hours) {
  minimum_bid *= 1.2  // 20% premium
}
```

### Backup Buyers

Always have fallback options:
```javascript
// Tiered distribution
tier1_buyers = bids.filter(b => b.price >= 50)
tier2_buyers = bids.filter(b => b.price >= 30 && b.price < 50)
tier3_buyers = bids.filter(b => b.price >= 15 && b.price < 30)

// Try tiers in order
if (tier1_buyers.length > 0) {
  sell_to = tier1_buyers[0]
} else if (tier2_buyers.length > 0) {
  sell_to = tier2_buyers[0]
} else if (tier3_buyers.length > 0) {
  sell_to = tier3_buyers[0]
}
```

## 🚀 Advanced Patterns

### Multi-Tier Ping

Ping different buyer groups:
```javascript
// Premium buyers first
premium_responses = await ping(premium_buyers, timeout: 500)

if (no_acceptable_bids(premium_responses)) {
  // Standard buyers second
  standard_responses = await ping(standard_buyers, timeout: 500)
}

// Combine results
all_bids = [...premium_responses, ...standard_responses]
```

### Conditional Routing

Route based on bid conditions:
```javascript
// Check buyer requirements
acceptable_bids = bids.filter(bid => {
  if (bid.conditions.max_age && lead.age > bid.conditions.max_age) {
    return false
  }
  if (bid.conditions.states && !bid.conditions.states.includes(lead.state)) {
    return false
  }
  return true
})
```

### Revenue Optimization

Maximize total revenue:
```javascript
// Consider multiple factors
scores = bids.map(bid => ({
  buyer: bid.buyer_id,
  score: (
    bid.price * 0.5 +                    // Price weight: 50%
    bid.historical_acceptance * 0.3 +     // Acceptance weight: 30%
    bid.payment_speed * 0.2              // Payment weight: 20%
  )
}))

// Select by score, not just price
winner = scores.sort((a, b) => b.score - a.score)[0]
```

## ⚡ Performance Optimization

### Minimize Ping Time

Fast pings = more buyers:
```yaml
Ping Timeout: 750ms max
Individual Buyer Timeout: 500ms
Concurrent Requests: Yes
Cache Warm: Yes
```

### Efficient Data Transfer

Send only necessary fields:
```javascript
// Minimal ping
ping_data = {
  st: lead.state,        // Shortened keys
  z: lead.zip.slice(0,3), // Partial ZIP
  hm: lead.homeowner,
  eb: lead.electric_bill_range
}
```

### Connection Pooling

Reuse connections:
```yaml
HTTP Settings:
  Keep-Alive: true
  Connection Pool: 10
  DNS Cache: 3600s
```

## 📊 Monitoring Ping-Post

### Key Metrics

Track performance:
- **Ping Response Rate**: % of buyers responding
- **Average Bid Price**: Trending up or down?
- **Win Rate**: % of pings resulting in post
- **Post Accept Rate**: % of posts accepted
- **Revenue per Ping**: Total optimization metric

### Buyer Performance

Monitor each buyer:
```javascript
buyer_metrics = {
  response_time: avg(response_times),
  bid_rate: bids / pings * 100,
  avg_bid: avg(bid_prices),
  accept_rate: accepted / posted * 100,
  payment_speed: avg(payment_days)
}
```

### Alerts

Set up monitoring:
```yaml
Alert: Low Bid Rate
Condition: bid_rate < 20%
Action: Check buyer endpoint

Alert: Slow Responses  
Condition: avg_response_time > 600ms
Action: Contact buyer

Alert: Revenue Drop
Condition: revenue_per_ping < threshold
Action: Review pricing strategy
```

## 🔧 Troubleshooting

### "No Bids Received"

**Check**:
1. Ping data has required fields
2. Buyers' endpoints responding
3. Timeout not too short
4. Data quality meets standards

### "Low Bid Prices"

**Investigate**:
1. Lead quality indicators
2. Market conditions
3. Buyer capacity
4. Competition

### "Post Rejections"

**Common Causes**:
- Data mismatch between ping/post
- Timeout between ping/post
- Buyer capacity reached
- Duplicate detection

## 💡 Best Practices

### For Sellers

**Optimize Timeouts**: Balance speed vs buyer participation
```
Premium Buyers: 750ms
Standard Buyers: 500ms
Backup Buyers: 300ms
```

**Transparent Data**: Send accurate ping data
```javascript
// Good - accurate representation
credit_range: "650-700"

// Bad - misleading
credit_range: "700+" // When it's actually 650
```

**Fair Distribution**: Honor bid conditions
```javascript
if (bid.exclusive && bid.price === highest) {
  // Must sell exclusively if they paid for it
  sell_only_to(bid.buyer_id)
}
```

### For Buyers

**Fast Response**: Every millisecond counts
- Optimize endpoint performance
- Use connection pooling
- Cache decision logic

**Smart Bidding**: Bid what you can profit from
```javascript
estimated_value = calculateValue(ping_data)
costs = fixed_costs + acquisition_cost
minimum_profit = estimated_value * 0.3
bid_price = estimated_value - costs - minimum_profit
```

**Clear Requirements**: Specify conditions
```json
{
  "bid": true,
  "price": 45.00,
  "conditions": {
    "states": ["CA", "TX", "FL"],
    "max_age_minutes": 5,
    "exclusive_required": false
  }
}
```

## 📋 Implementation Checklist

**Ping Flow Setup**:
- [ ] Non-PII fields identified
- [ ] All buyers configured
- [ ] Response parsing tested
- [ ] Timeouts optimized

**Post Flow Setup**:
- [ ] Routing logic implemented
- [ ] Winner selection tested
- [ ] Backup buyers configured
- [ ] Delivery confirmed

**Monitoring**:
- [ ] Metrics tracked
- [ ] Alerts configured
- [ ] Reports created
- [ ] Performance baseline set

**Optimization**:
- [ ] A/B testing planned
- [ ] Pricing strategies defined
- [ ] Quality scoring implemented
- [ ] Revenue tracking active

## 📚 Related Documentation

- [Real-Time Bidding](./real-time-bidding.md) - Advanced bidding strategies
- [API Performance](../integrations/api-performance.md) - Speed optimization
- [Revenue Optimization](../analytics/revenue-optimization.md) - Maximizing value

---

🏆 **Ping-Post Mastery**: Successful ping-post implementation balances speed, accuracy, and fairness. Start simple, measure everything, and continuously optimize for maximum value!