# Monitoring Performance

Set up comprehensive monitoring to track flow health, identify issues early, and optimize performance. Learn metrics, alerting, dashboards, and continuous improvement strategies.

## 📍 You Are Here

Your flows are running, but you need visibility into their performance. This guide shows you how to monitor effectively, set up alerts, and continuously optimize your lead operations.

## 🎯 What You'll Learn

- Key performance indicators
- Real-time monitoring setup
- Alert configuration
- Dashboard creation
- Performance optimization
- Trend analysis

## 📊 Key Performance Indicators

### Volume Metrics

Track lead flow:
- **Leads per hour/day/month**
- **Source distribution**
- **Peak vs off-peak patterns**
- **Growth trends**

```javascript
// Calculate hourly rate
hourly_rate = leads_last_hour.count
daily_projection = hourly_rate * 24

// Check if normal
if (hourly_rate < historical_average * 0.5) {
  alert("Volume significantly below normal")
}
```

### Quality Metrics

Monitor lead quality:
- **Acceptance rate** (% passing criteria)
- **Validation pass rate** (email, phone)
- **Duplicate rate**
- **Enhancement success rate**

```javascript
// Quality score calculation
quality_score = (
  (valid_emails / total) * 0.3 +
  (valid_phones / total) * 0.3 +
  (non_duplicates / total) * 0.2 +
  (enhanced_data / total) * 0.2
) * 100
```

### Performance Metrics

System performance:
- **Average processing time**
- **Step duration breakdown**
- **API response times**
- **Queue depth**

### Business Metrics

Bottom line impact:
- **Cost per lead**
- **Revenue per lead**
- **ROI by source**
- **Conversion rates** (with feedback)

## 🚨 Setting Up Alerts

### Critical Alerts

Immediate attention needed:

**Flow Stopped**:
```yaml
Alert: Flow Processing Stopped
Condition: leads_last_15_min = 0 AND expected > 0
Action: Email + SMS to on-call
Priority: Critical
```

**High Failure Rate**:
```yaml
Alert: High Rejection Rate
Condition: failure_rate > 50% for 10 minutes
Action: Email team, pause source
Priority: High
```

**API Errors**:
```yaml
Alert: Integration Failing
Condition: API_errors > 10 in 5 minutes
Action: Email, create ticket
Priority: High
```

### Warning Alerts

Attention needed soon:

**Volume Changes**:
```yaml
Alert: Volume Drop
Condition: current_volume < average * 0.7
Duration: 30 minutes
Action: Email notification
Priority: Medium
```

**Quality Degradation**:
```yaml
Alert: Quality Declining
Condition: quality_score < 80%
Duration: 1 hour
Action: Email report
Priority: Medium
```

### Informational Alerts

Good to know:

**Daily Summary**:
```yaml
Alert: Daily Performance Report
Schedule: Daily at 9 AM
Content: Volume, quality, cost metrics
Action: Email to team
Priority: Low
```

## 📈 Real-Time Dashboards

### Executive Dashboard

High-level business view:

```
┌─────────────────────────────────────────┐
│         EXECUTIVE DASHBOARD             │
├─────────────────┬───────────────────────┤
│ Today's Leads   │ 12,456 ↑ 15%        │
│ Acceptance Rate │ 89.3% ↓ 2.1%        │
│ Total Cost      │ $18,684              │
│ Projected Rev   │ $124,560             │
│ ROI             │ 567% ↑ 12%          │
└─────────────────┴───────────────────────┘

Top Sources          Quality    Volume
1. Google Ads         95.2%     4,521
2. Facebook           91.8%     3,892
3. Partner Network    87.4%     2,156
```

### Operations Dashboard

Detailed operational view:

```
┌─────────────────────────────────────────┐
│       OPERATIONS DASHBOARD              │
├─────────────────────────────────────────┤
│ Processing Time:  324ms avg            │
│ Queue Depth:      12 leads             │
│ Active Flows:     8/10                 │
│                                        │
│ Errors (Last Hour):                    │
│ - Email validation: 3                  │
│ - CRM timeout: 1                       │
│ - Phone service: 0                     │
│                                        │
│ [Processing Graph - Real-time]         │
└─────────────────────────────────────────┘
```

### Source Performance Dashboard

Vendor management view:

```
Source: ABC Marketing
├─ Volume: 1,234 leads today
├─ Quality Score: 91.2%
├─ Duplicate Rate: 3.4%
├─ Cost per Lead: $12.50
├─ Rejection Reasons:
│  - Invalid phone: 45 (3.6%)
│  - Duplicate: 42 (3.4%)
│  - Bad email: 23 (1.9%)
└─ Trend: ↑ Improving
```

## 🔍 Deep Dive Analysis

### Hourly Patterns

Identify optimal times:
```javascript
// Analyze by hour
hourly_analysis = leads
  .groupBy(lead => new Date(lead.created).getHours())
  .map(hour => ({
    hour: hour.key,
    volume: hour.length,
    quality: hour.filter(l => l.valid).length / hour.length,
    conversion: hour.filter(l => l.converted).length / hour.length
  }))

// Find best hours
best_hours = hourly_analysis
  .sort((a, b) => b.conversion - a.conversion)
  .slice(0, 3)
```

### Source Comparison

Compare vendor performance:
```javascript
source_metrics = sources.map(source => ({
  name: source.name,
  volume: getVolume(source),
  quality: getQualityScore(source),
  cost: getTotalCost(source),
  revenue: getProjectedRevenue(source),
  roi: (revenue - cost) / cost * 100
}))

// Rank by ROI
ranked_sources = source_metrics
  .sort((a, b) => b.roi - a.roi)
```

### Error Analysis

Understand failure patterns:
```javascript
error_analysis = failed_leads
  .groupBy(lead => lead.failure_reason)
  .map(reason => ({
    reason: reason.key,
    count: reason.length,
    percentage: reason.length / total_leads * 100,
    sources: [...new Set(reason.map(l => l.source))],
    trend: calculateTrend(reason.key, last_period)
  }))
  .sort((a, b) => b.count - a.count)
```

## 🎯 Performance Optimization

### Identify Bottlenecks

Find slow steps:
```javascript
// Average time per step
step_performance = events
  .flatMap(e => e.steps)
  .groupBy(s => s.name)
  .map(step => ({
    name: step.key,
    avg_time: average(step.map(s => s.duration)),
    max_time: Math.max(...step.map(s => s.duration)),
    count: step.length
  }))
  .sort((a, b) => b.avg_time - a.avg_time)

// Steps taking > 1 second
slow_steps = step_performance
  .filter(s => s.avg_time > 1000)
```

### Optimize Slow Steps

Common optimizations:

**Reorder Steps**:
```javascript
// Before: Slow enhancement first
1. Data Enhancement (2s)
2. Email Check (0.1s)
3. Delivery (0.5s)
Total: 2.6s

// After: Fast filter first
1. Email Check (0.1s)
2. Data Enhancement (2s) - only if email valid
3. Delivery (0.5s)
Total: 0.6s for invalid, 2.6s for valid
```

**Add Caching**:
```javascript
// Cache enhancement results
if (cache.has(phone)) {
  result = cache.get(phone)
} else {
  result = await enhance(phone)
  cache.set(phone, result, ttl: 3600)
}
```

## 📊 Trend Analysis

### Daily Trends

Track patterns over time:
```javascript
// 30-day rolling average
daily_trends = past_30_days.map(day => ({
  date: day,
  volume: getVolume(day),
  quality: getQuality(day),
  moving_avg: getMovingAverage(day, 7)
}))

// Detect anomalies
anomalies = daily_trends.filter(day => 
  Math.abs(day.volume - day.moving_avg) > day.moving_avg * 0.3
)
```

### Seasonal Patterns

Understand cycles:
```javascript
// Day of week analysis
dow_pattern = leads
  .groupBy(l => new Date(l.created).getDay())
  .map(day => ({
    day: ['Sun','Mon','Tue','Wed','Thu','Fri','Sat'][day.key],
    avg_volume: average(day.volumes),
    avg_quality: average(day.qualities)
  }))

// Monthly patterns
monthly_pattern = leads
  .groupBy(l => new Date(l.created).getMonth())
  .map(month => ({
    month: month.key,
    characteristics: analyzeMonth(month)
  }))
```

## 🔧 Monitoring Tools

### Built-in Tools

LeadConduit provides:
- Real-time flow statistics
- Event browser
- Basic reports
- Email alerts

### External Integration

Connect to monitoring platforms:

**Datadog**:
```javascript
// Send metrics
datadog.gauge('leadconduit.acceptance_rate', acceptance_rate, tags)
datadog.increment('leadconduit.leads_processed', 1, tags)
```

**New Relic**:
```javascript
// Track transactions
newrelic.startSegment('lead_processing', true, () => {
  // Process lead
  newrelic.addCustomAttribute('source', lead.source)
  newrelic.addCustomAttribute('outcome', outcome)
})
```

**Custom Webhooks**:
```javascript
// Send to monitoring endpoint
webhook.send({
  metric: 'lead_processed',
  dimensions: {
    flow: flow_id,
    source: source_name,
    outcome: result
  },
  value: 1,
  timestamp: Date.now()
})
```

## 💡 Best Practices

### Monitor Proactively

**Don't Wait for Problems**:
- Set up alerts before issues
- Review dashboards daily
- Track trends weekly
- Deep dive monthly

### Focus on Business Impact

**Prioritize Metrics**:
1. Revenue-impacting metrics
2. Cost-related metrics
3. Quality indicators
4. Technical performance

### Automate Response

**When Possible**:
```javascript
// Auto-pause bad sources
if (source.quality_score < 70) {
  source.pause()
  notify_team("Source auto-paused: " + source.name)
}

// Auto-scale volume caps
if (conversion_rate > target) {
  increase_volume_cap(source, 20)
}
```

### Document and Share

**Keep Team Informed**:
- Document what metrics mean
- Share dashboard access
- Train on alert response
- Regular performance reviews

## 🎯 Monitoring Checklist

**Initial Setup**:
- [ ] Define KPIs
- [ ] Set up dashboards
- [ ] Configure critical alerts
- [ ] Test alert delivery

**Daily Monitoring**:
- [ ] Check dashboard
- [ ] Review any alerts
- [ ] Note anomalies
- [ ] Quick fixes applied

**Weekly Review**:
- [ ] Analyze trends
- [ ] Compare sources
- [ ] Review costs
- [ ] Plan optimizations

**Monthly Deep Dive**:
- [ ] Full performance analysis
- [ ] ROI calculations
- [ ] Process improvements
- [ ] Strategy adjustments

## 📈 Continuous Improvement

### Regular Optimization Cycle

1. **Measure**: Collect performance data
2. **Analyze**: Identify improvement areas
3. **Optimize**: Implement changes
4. **Verify**: Confirm improvements
5. **Repeat**: Continue cycle

### A/B Testing

Test improvements:
```javascript
// Test new validation
if (Math.random() < 0.1) {  // 10% test
  use_new_validation = true
} else {
  use_old_validation = true
}

// Track results
track_metric('validation_success', {
  version: use_new_validation ? 'new' : 'old',
  result: validation_result
})
```

## 📚 Related Documentation

- [Custom Reports](./custom-reports.md) - Build specific reports
- [Understanding Events](./understanding-events.md) - Event analysis
- [Flow Optimization](../best-practices/flow-optimization.md) - Performance tips

---

📊 **Monitor to Master**: Effective monitoring transforms reactive firefighting into proactive optimization. Set up comprehensive monitoring and watch your performance improve continuously!