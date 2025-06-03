---
title: Reporting
description: Transform raw data into actionable insights with powerful analytics and visualizations
tags:
  - reporting
  - analytics
  - business-intelligence
  - metrics
---

# Reporting

## Your Business Intelligence Command Center

Reporting in LeadConduit transforms the millions of events flowing through your account into clear, actionable insights. It's where data becomes decisions, patterns become strategies, and metrics become money. Whether you need real-time operational dashboards or deep historical analysis, reporting gives you the visibility to optimize every aspect of your lead operation.

📍 **You are here**: Turning data into intelligence
📊 **What you'll master**: Report building, analysis techniques, and optimization strategies  
💡 **The outcome**: Data-driven decisions that improve ROI

## Understanding LeadConduit Reporting

### The Reporting Philosophy

LeadConduit reporting follows key principles:

1. **Real-time First** - See changes as they happen
2. **Drill-down Design** - Start high, go deep
3. **Action-oriented** - Reports drive decisions
4. **Accessible** - No SQL required (but available)
5. **Shareable** - Insights for the whole team

### The Data Foundation

Reports are built on:

```yaml
Events (Everything that happens)
    ↓
Aggregations (Summarized metrics)
    ↓  
Visualizations (Charts and tables)
    ↓
Insights (Business decisions)
```

### Report Categories

LeadConduit provides several report types:

**Operational Reports**
- Real-time flow monitoring
- Acceptance rates
- Processing speeds
- Error tracking

**Financial Reports**
- Revenue tracking
- Cost analysis
- Margin optimization
- ROI by source/buyer

**Quality Reports**
- Data validation rates
- Enhancement success
- Rejection analysis
- Source scoring

**Performance Reports**
- Step timing analysis
- Bottleneck identification
- Capacity planning
- Trend analysis

## Building Effective Reports

### The Report Builder

Create custom reports visually:

```yaml
Start with a question:
"Which sources send the highest quality leads?"

Build the report:
1. Select Metrics:
   - Lead count
   - Acceptance rate
   - Contact rate
   - Revenue per lead

2. Choose Dimensions:
   - Group by: Source
   - Time period: Last 30 days

3. Add Filters:
   - Only successful deliveries
   - Exclude test sources

4. Select Visualization:
   - Table with heat map
   - Sort by acceptance rate
```

### Key Metrics Library

**Volume Metrics**:
```yaml
Submissions: Total leads received
Acceptances: Leads passing validation
Deliveries: Successful recipient posts
Conversions: Feedback confirmations
```

**Rate Metrics**:
```yaml
Acceptance Rate: Accepted/Submitted
Delivery Rate: Delivered/Accepted  
Contact Rate: Contacted/Delivered
Conversion Rate: Converted/Contacted
```

**Financial Metrics**:
```yaml
Revenue: Sum of delivery prices
Cost: Sum of source costs + enhancements
Margin: Revenue - Cost
ROI: (Revenue - Cost) / Cost × 100
CPL: Cost / Accepted leads
```

**Quality Metrics**:
```yaml
Valid Email %: Valid emails / Total
Valid Phone %: Valid phones / Total
Enhancement Hit Rate: Enhanced / Attempted
Duplicate Rate: Duplicates / Submitted
```

### Dimension Options

Slice data by:

**Time Dimensions**:
- Hour of day
- Day of week
- Date
- Week
- Month
- Quarter

**Entity Dimensions**:
- Source
- Recipient (Buyer)
- Flow
- Integration
- Campaign

**Data Dimensions**:
- State
- Product type
- Lead score
- Price range
- Quality tier

**Custom Dimensions**:
- Any lead field
- Calculated fields
- Tags
- Groupings

## Essential Reports

### Source Performance Report

Evaluate your lead suppliers:

```yaml
Purpose: Identify best and worst sources
Metrics:
  - Volume (leads/day)
  - Acceptance rate
  - Cost per accepted lead
  - Revenue per lead
  - Net margin
  - Contact rate

Dimensions:
  - By source
  - By day/week/month

Insights:
  - Source A: High volume, low quality (reduce cap)
  - Source B: Low volume, high margin (increase cap)
  - Source C: Declining quality trend (investigate)
```

### Buyer Analysis Report

Understand recipient performance:

```yaml
Purpose: Optimize buyer distribution
Metrics:
  - Acceptance rate
  - Average price paid
  - Response time
  - Feedback rate
  - Payment timeliness

Dimensions:
  - By buyer
  - By lead characteristics
  - By time of day

Insights:
  - Buyer X: Prefers morning leads (route accordingly)
  - Buyer Y: High price for CA leads (prioritize)
  - Buyer Z: Slow payments (consider terms)
```

### Flow Performance Report

Monitor operational health:

```yaml
Purpose: Identify bottlenecks and issues
Metrics:
  - Processing time (by step)
  - Success rates (by step)
  - Error frequency
  - Queue depths

Dimensions:
  - By flow
  - By step
  - By hour

Insights:
  - Enhancement step slow (add timeout)
  - High rejection at filter X (review rules)
  - Peak hours need capacity (scale up)
```

### Financial Dashboard

Track the money:

```yaml
Purpose: Real-time financial visibility
Metrics:
  - Today's revenue
  - Today's cost
  - Running margin
  - Projected month-end

Visualizations:
  - Revenue gauge (vs goal)
  - Margin trend line
  - Top sources by profit
  - Top buyers by revenue

Alerts:
  - Margin below threshold
  - Unusual cost spike
  - Revenue below projection
```

## Advanced Reporting Techniques

### Cohort Analysis

Track groups over time:

```yaml
Lead Cohorts by Source Month:
Jan leads: 50% contacted, 10% converted
Feb leads: 55% contacted, 12% converted  
Mar leads: 45% contacted, 8% converted

Insights:
- February sources were highest quality
- Investigate March quality drop
- Seasonal patterns emerging
```

### Funnel Analysis

Understand drop-off points:

```yaml
Lead Processing Funnel:
Submitted: 10,000 (100%)
    ↓
Accepted: 8,500 (85%)
    ↓
Enhanced: 8,000 (94%)
    ↓
Delivered: 7,500 (94%)
    ↓
Contacted: 4,500 (60%)
    ↓
Converted: 450 (10%)

Bottlenecks:
- 15% rejection at source (too high?)
- 40% not contacted (data quality?)
```

### Predictive Analytics

Use historical data for forecasting:

```yaml
Conversion Prediction Model:
Factors:
  - Lead score > 80: 2x conversion rate
  - Mobile phone: 1.5x conversion rate
  - < 5 min old: 3x conversion rate
  - California: 1.2x conversion rate

Routing Decision:
Route high-probability leads to best closers
```

### Comparative Analysis

Benchmark and compare:

```yaml
This Week vs Last Week:
Volume: +15% ✓
Acceptance: -5% ⚠
Revenue: +8% ✓
Margin: -2% ⚠

Action Items:
- Investigate acceptance drop
- Quality may be declining
- Review source changes
```

## Real-time Dashboards

### Operations Dashboard

Monitor live performance:

```yaml
Widgets:
1. Active Flow Status (green/yellow/red)
2. Last Hour Metrics:
   - Leads processed
   - Acceptance rate
   - Delivery rate
   - Error count

3. Queue Depths (by step)
4. Recent Errors (last 10)
5. Revenue Ticker

Refresh: Every 30 seconds
```

### Executive Dashboard

High-level business metrics:

```yaml
Widgets:
1. Month-to-Date Revenue (vs goal)
2. Margin Trend (daily)
3. Top 5 Sources (by profit)
4. Top 5 Buyers (by volume)
5. Key Ratios:
   - Cost per acquisition
   - Lifetime value
   - ROI by channel

Refresh: Every 5 minutes
```

### Quality Dashboard

Data integrity monitoring:

```yaml
Widgets:
1. Validation Rates (by type)
2. Enhancement Success Rates
3. Duplicate Detection Rate
4. Rejection Reasons (pie chart)
5. Source Quality Scores

Alerts:
- Validation < 80%
- Enhancement < 90%
- Duplicates > 10%
```

## Report Scheduling & Distribution

### Automated Delivery

Schedule reports for stakeholders:

```yaml
Daily Operations Report:
  Schedule: 8 AM every day
  Recipients: Operations team
  Format: PDF + Excel
  Content: Previous day summary

Weekly Performance Report:
  Schedule: Monday 9 AM
  Recipients: Management
  Format: PDF
  Content: Week-over-week analysis

Monthly Financial Report:
  Schedule: 1st of month
  Recipients: Finance team
  Format: Excel
  Content: Full financial breakdown
```

### Sharing Options

Distribute insights effectively:

**Email Delivery**:
- Scheduled or on-demand
- PDF, Excel, or CSV
- Include visualizations
- Add commentary

**Shared Links**:
- Live report access
- Auto-updating data
- Permission controlled
- Embeddable

**API Access**:
- Programmatic retrieval
- JSON/CSV formats
- Real-time data
- Integration ready

### Alert Configuration

Proactive notifications:

```yaml
Margin Alert:
  Condition: Hourly margin < $1000
  Action: Email + SMS to manager
  Include: Last hour's data

Quality Alert:
  Condition: Source acceptance < 50%
  Action: Email to operations
  Include: Rejection breakdown

Volume Alert:
  Condition: No leads for 10 minutes
  Action: Page on-call engineer
  Include: System status
```

## Reporting Best Practices

### Design Principles

1. **Start with Questions**
   - What decision needs data?
   - Who will use this report?
   - How often is it needed?
   - What action will it drive?

2. **Keep It Simple**
   - One report, one purpose
   - Clear visualizations
   - Obvious insights
   - Actionable metrics

3. **Make It Fast**
   - Optimize queries
   - Cache when possible
   - Aggregate smartly
   - Limit date ranges

4. **Enable Discovery**
   - Drill-down capability
   - Related reports linked
   - Export options
   - Historical context

### Common Pitfalls

**Information Overload**:
```yaml
Bad: 50 metrics on one dashboard
Good: 5-7 key metrics with drill-down
```

**Vanity Metrics**:
```yaml
Bad: Total leads ever processed
Good: This week's conversion rate
```

**Static Reports**:
```yaml
Bad: PDF from 6 months ago
Good: Live dashboard with filters
```

**No Context**:
```yaml
Bad: Revenue = $50,000
Good: Revenue = $50,000 (+15% WoW, 95% of goal)
```

## Advanced Analytics

### SQL Access

For power users:

```sql
-- Top sources by margin this month
SELECT 
  source_name,
  COUNT(*) as leads,
  SUM(revenue) as total_revenue,
  SUM(cost) as total_cost,
  SUM(revenue - cost) as margin,
  AVG(revenue - cost) as avg_margin
FROM lead_events
WHERE 
  event_type = 'flow.completed'
  AND timestamp >= DATE_TRUNC('month', CURRENT_DATE)
GROUP BY source_name
ORDER BY margin DESC
LIMIT 10;
```

### Custom Metrics

Build your own KPIs:

```yaml
Lead Quality Score:
  Components:
    - Valid email: +20
    - Valid phone: +20
    - Mobile phone: +10
    - Verified identity: +25
    - TrustedForm < 5min: +15
    - No duplicates: +10
  
  Range: 0-100
  Use: Route by quality tier
```

### Predictive Models

Leverage ML insights:

```yaml
Conversion Probability:
  Input: Lead characteristics
  Model: Gradient boosting
  Output: 0-100% probability
  
  Application:
    - >80%: Premium routing
    - 50-80%: Standard routing
    - <50%: Batch processing
```

## Optimization Through Reporting

### Continuous Improvement

Use reports to optimize:

**Weekly Review Process**:
1. Run standard reports
2. Identify anomalies
3. Drill into causes
4. Make adjustments
5. Monitor impact

**Optimization Targets**:
- Increase acceptance +5%
- Reduce cost -10%
- Improve contact +15%
- Boost margin +20%

### A/B Testing

Data-driven experiments:

```yaml
Test: New acceptance criteria
Control: Current rules (50%)
Variant: Relaxed rules (50%)

Measure:
- Acceptance rate
- Quality scores  
- Delivery rate
- Final margin

Result: Variant +12% margin
Action: Roll out to 100%
```

## Your Next Steps

### Essential Reports
1. **[Source Performance](/reporting/source-analysis)** - Know your suppliers
2. **[Financial Tracking](/reporting/financial)** - Follow the money
3. **[Quality Metrics](/reporting/quality)** - Ensure standards

### Advanced Analytics
1. **[Custom Dashboards](/reporting/dashboards)** - Build your own
2. **[SQL Queries](/reporting/sql-access)** - Direct data access
3. **[Predictive Analytics](/reporting/ml-insights)** - Future-focused

### Resources
- **[Report Gallery](/reporting/gallery)** - Pre-built templates
- **[Metric Dictionary](/reporting/metrics)** - All available metrics
- **[Best Practices](/reporting/best-practices)** - Design guidance

---

📊 **Remember**: Data without analysis is just numbers. Analysis without action is just interesting. But data-driven action? That's how you win. Build reports that drive decisions, and watch your operation transform.

*Next: Explore [Exports](/exports) to extract your data for external analysis and archival.*