# Lead Feedback Management

Implement two-way communication between LeadConduit and your lead buyers to track conversions, update lead status, and improve quality. Learn feedback loops, conversion tracking, and quality management.

## 📍 You Are Here

You need to know what happens to leads after delivery - did they convert? Were they qualified? This guide shows you how to implement feedback systems that close the loop on lead performance.

## 🎯 What You'll Learn

- Feedback fundamentals
- Implementation methods
- Conversion tracking
- Quality scoring
- Automated actions
- Reporting on feedback

## 🔄 Understanding Lead Feedback

### What is Feedback?

Feedback is post-delivery information about leads:
- **Conversion Status**: Sold, not sold, pending
- **Quality Rating**: Good, bad, invalid
- **Contact Result**: Reached, no answer, wrong number
- **Revenue Data**: Sale amount, commission
- **Timing**: When events occurred

### Why Feedback Matters

**For Sellers**:
- Optimize lead sources
- Improve acceptance criteria
- Demonstrate ROI
- Refine pricing

**For Buyers**:
- Track performance
- Automate quality control
- Manage vendor relationships
- Calculate true cost per acquisition

## 🛠️ Feedback Methods

### Method 1: Real-Time API

Immediate feedback via webhook:

```javascript
// Buyer sends feedback
POST https://app.leadconduit.com/flows/[ID]/feedback
{
  "lead_id": "evt_abc123",
  "outcome": "converted",
  "revenue": 1500,
  "feedback_timestamp": "2024-01-15T14:30:00Z"
}
```

**Pros**:
- Instant updates
- Automated flow
- Real-time optimization

**Cons**:
- Requires integration
- Technical setup

### Method 2: Batch Upload

Periodic file uploads:

```csv
lead_id,outcome,revenue,contacted_date,notes
evt_123,converted,1200,2024-01-15,Great lead
evt_124,bad_info,,2024-01-15,Wrong phone
evt_125,no_contact,,2024-01-16,Never answered
```

**Pros**:
- Simple process
- No coding required
- Bulk updates

**Cons**:
- Delayed feedback
- Manual process

### Method 3: Portal Updates

Web interface for feedback:

1. Buyer logs into portal
2. Views delivered leads
3. Updates status individually
4. Submits feedback

**Pros**:
- User-friendly
- No technical skills
- Immediate updates

**Cons**:
- Manual effort
- Not scalable

## 📡 Implementing API Feedback

### Step 1: Enable Feedback

In your flow configuration:
```yaml
Feedback Settings:
  Enabled: true
  Authentication: API Key
  Allowed Fields: [outcome, revenue, quality_score]
  Update Window: 90 days
```

### Step 2: Share Documentation

Provide buyers with:
```
Endpoint: POST https://app.leadconduit.com/flows/[FLOW_ID]/feedback
Headers:
  Content-Type: application/json
  X-API-Key: [BUYER_API_KEY]

Body:
{
  "lead_id": "string (required)",
  "outcome": "string (required)",
  "revenue": "number (optional)",
  "feedback_timestamp": "ISO 8601 date"
}
```

### Step 3: Map Feedback Fields

Configure field mapping:
```javascript
// Feedback fields → LeadConduit fields
feedback.outcome → lead.buyer_status
feedback.revenue → lead.sale_amount
feedback.quality_score → lead.buyer_rating
feedback.contacted_date → lead.first_contact
```

## 📊 Feedback Data Structure

### Standard Feedback Fields

**Outcome Types**:
```javascript
outcome: {
  "converted": "Lead purchased/converted",
  "contacted": "Reached but not converted",
  "no_contact": "Could not reach",
  "bad_info": "Invalid contact information",
  "duplicate": "Already in system",
  "not_interested": "Not interested in offer",
  "returned": "Requested return/refund"
}
```

**Quality Ratings**:
```javascript
quality: {
  5: "Excellent - Perfect lead",
  4: "Good - Minor issues",
  3: "Fair - Usable but problems",
  2: "Poor - Major issues",
  1: "Bad - Should not have been sent"
}
```

### Custom Feedback Fields

Define business-specific fields:
```javascript
// Insurance feedback
{
  "policy_sold": true,
  "premium_amount": 150,
  "policy_type": "auto",
  "underwriting_result": "approved"
}

// Solar feedback
{
  "appointment_set": true,
  "appointment_date": "2024-01-20",
  "system_size": "8kW",
  "financing_approved": true
}
```

## 🔄 Automating Actions on Feedback

### Quality-Based Routing

Adjust routing based on feedback:
```javascript
// Calculate source quality
source_quality = feedback
  .filter(f => f.source === source_id)
  .map(f => f.quality_score)
  .average()

// Route based on quality
if (source_quality < 3.0) {
  pause_source = true
  alert_team = true
} else if (source_quality > 4.5) {
  increase_volume_cap = true
}
```

### Conversion-Based Pricing

Dynamic pricing from feedback:
```javascript
// Calculate conversion rate
conversion_rate = feedback
  .filter(f => f.outcome === 'converted')
  .length / total_delivered

// Adjust pricing
if (conversion_rate > 0.10) {
  price_adjustment = 1.2  // 20% increase
} else if (conversion_rate < 0.05) {
  price_adjustment = 0.8  // 20% decrease
}
```

### Suppression Management

Auto-suppress based on feedback:
```javascript
// Add returns to suppression
if (feedback.outcome === 'returned') {
  suppression_list('Returns').add(lead.email)
  suppression_list('Returns').add(lead.phone)
}

// Block bad sources
if (source_bad_info_rate > 0.20) {
  suppression_list('Bad Sources').add(source_id)
}
```

## 📈 Feedback Analytics

### Key Metrics

Track these feedback metrics:

**Conversion Metrics**:
- Overall conversion rate
- Conversion by source
- Time to conversion
- Revenue per lead

**Quality Metrics**:
- Average quality score
- Quality by source
- Bad info rate
- Contact rate

### Feedback Reports

Create insightful reports:

```sql
-- Source Performance Report
SELECT 
  source,
  COUNT(*) as total_leads,
  SUM(CASE WHEN outcome = 'converted' THEN 1 ELSE 0 END) as conversions,
  AVG(quality_score) as avg_quality,
  SUM(revenue) as total_revenue
FROM lead_feedback
WHERE feedback_date >= CURRENT_DATE - INTERVAL '30 days'
GROUP BY source
ORDER BY total_revenue DESC
```

### Feedback Dashboard

Monitor real-time:
- Current conversion rate
- Quality trends
- Revenue tracking
- Source rankings
- Alert triggers

## 🔧 Troubleshooting Feedback

### "Feedback Not Updating"

**Check**:
1. API key is valid
2. Lead ID format correct
3. Within update window
4. Field mapping correct

**Debug**:
```bash
# Test feedback endpoint
curl -X POST https://app.leadconduit.com/flows/[ID]/feedback \
  -H "X-API-Key: [KEY]" \
  -H "Content-Type: application/json" \
  -d '{"lead_id":"evt_test","outcome":"converted"}'
```

### "Can't Match Leads"

**Common Issues**:
- Using wrong ID format
- IDs changed in delivery
- Time zone mismatches

**Solution**:
```javascript
// Use event ID (most reliable)
lead_id: "evt_abc123def"

// Or use your ID if mapped
external_id: "CRM_12345"
```

### "Feedback Delayed"

**For Batch Uploads**:
- Schedule more frequently
- Reduce batch size
- Consider real-time API

**For API**:
- Check endpoint performance
- Implement retry logic
- Queue during high volume

## 💡 Best Practices

### Clear Expectations

Document for buyers:
- What feedback to send
- When to send it
- Required vs optional fields
- Update frequency

### Standardize Formats

Use consistent values:
```javascript
// Good - Standardized
outcome: "converted"
outcome: "no_contact"
outcome: "bad_info"

// Bad - Inconsistent
outcome: "sold"
outcome: "CONVERTED"
outcome: "conv"
```

### Timely Updates

Set expectations:
- Real-time: Within 1 hour
- Daily: By 9 AM next day
- Weekly: Monday mornings
- Monthly: First business day

### Data Quality

Validate feedback:
```javascript
// Validate before accepting
if (!['converted', 'contacted', 'no_contact'].includes(outcome)) {
  reject_feedback("Invalid outcome value")
}

if (revenue && revenue < 0) {
  reject_feedback("Revenue cannot be negative")
}
```

## 🎯 Implementation Patterns

### Pattern 1: Simple Status

Basic conversion tracking:
```javascript
Feedback Fields:
- lead_id (required)
- converted (boolean)
- date (timestamp)

Actions:
- Update lead record
- Calculate conversion rate
- No complex routing
```

### Pattern 2: Quality Focus

Detailed quality feedback:
```javascript
Feedback Fields:
- lead_id (required)
- quality_score (1-5)
- issues (array)
- recommendations (text)

Actions:
- Pause low-quality sources
- Bonus high-quality sources
- Generate quality reports
```

### Pattern 3: Full Revenue

Complete sales tracking:
```javascript
Feedback Fields:
- lead_id (required)
- outcome (detailed)
- revenue (decimal)
- commission (decimal)
- product_details (object)

Actions:
- Calculate ROI
- Optimize pricing
- Revenue share calculations
- Performance bonuses
```

## 📋 Feedback Setup Checklist

**Technical Setup**:
- [ ] Enable feedback in flow
- [ ] Configure authentication
- [ ] Map feedback fields
- [ ] Test with sample data

**Documentation**:
- [ ] Create buyer guide
- [ ] Provide API examples
- [ ] Document field values
- [ ] Share test credentials

**Process Setup**:
- [ ] Define update schedule
- [ ] Set quality standards
- [ ] Create alerts
- [ ] Build reports

**Optimization**:
- [ ] Automate actions
- [ ] Monitor compliance
- [ ] Track trends
- [ ] Iterate based on data

## 📚 Related Documentation

- [Understanding Events](../analytics/understanding-events.md) - Event IDs for feedback
- [Custom Reports](../analytics/custom-reports.md) - Feedback reporting
- [API Reference](../../reference/feedback-api.md) - Technical details

---

🔄 **Feedback Loop Complete**: Implementing feedback transforms one-way lead delivery into a collaborative optimization system. Start simple and expand based on your needs!