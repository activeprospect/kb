---
title: Reporting
description: The business intelligence engine that transforms raw event data into actionable insights
tags:
  - reporting-focused
  - reference
  - technical
  - core-concept
  - analytics
  - events-focused
  - exports-focused
  - flows
  - financial-management
  - performance-optimization
  - universal
  - intermediate
  - buyer-focused
  - seller-focused
  - admin-focused
---

# Reporting

## What is Reporting?

Reporting is LeadConduit's business intelligence system that aggregates the millions of events flowing through your account into meaningful insights. It transforms raw data points into clear visualizations that answer critical business questions: Which sources are profitable? Which buyers convert best? Where are the bottlenecks? 

Think of reporting as your lead flow's data scientist - constantly analyzing, summarizing, and presenting information in ways that drive better decisions.

## Why Reporting Matters

Data without analysis is just noise:
- Thousands of leads generate millions of events
- Success requires spotting patterns in the chaos
- Optimization needs measurable baselines
- Business decisions demand clear metrics

Without reporting, you're drowning in data. With reporting, you're surfing on insights that drive growth and profitability.

## How Reporting Works

### The Aggregation Engine

Reporting performs three key functions:

1. **Collection** - Gathers events across all flows
2. **Computation** - Calculates metrics and aggregates
3. **Presentation** - Displays insights visually

```
Raw Events → Aggregation → Metrics → Visualizations → Insights
                ↓            ↓           ↓               ↓
            Grouping    Calculations  Charts      Business Decisions
```

### Report Types

LeadConduit offers several report categories:

| Type | Purpose | Key Metrics |
|------|---------|-------------|
| **Volume** | Track lead flow | Counts, trends, distribution |
| **Quality** | Monitor data integrity | Validation rates, duplicates |
| **Financial** | Analyze profitability | Revenue, cost, margin |
| **Performance** | Measure efficiency | Speed, success rates |
| **Source** | Evaluate suppliers | Volume, quality, cost |
| **Recipient** | Assess buyers | Acceptance, revenue, feedback |

## Core Metrics

### Volume Metrics

Track the flow of leads:

**Submissions**
- Total leads received
- By source
- Over time
- Growth trends

**Acceptances**
- Passed validation
- Acceptance rate
- Rejection reasons

**Deliveries**
- Successful sends
- Delivery rate
- By recipient

### Quality Metrics

Measure data integrity:

**Validation**
- Field validity rates
- Common failures
- Data completeness

**Duplicates**
- Duplicate rate
- Time between duplicates
- Source patterns

**Enhancements**
- Append success rate
- Data accuracy
- Service performance

### Financial Metrics

Analyze money flow:

**Revenue**
- Total revenue
- Per lead average
- By buyer
- By characteristics

**Cost**
- Total cost
- Per lead average
- By source
- Cost trends

**Margin**
- Gross margin
- Margin percentage
- By source/buyer combo
- Profitability trends

### Performance Metrics

Monitor system efficiency:

**Speed**
- Processing time
- Step duration
- Bottleneck identification

**Success Rates**
- Delivery success
- Enhancement success
- Overall completion

**Errors**
- Error frequency
- Error types
- Recovery rates

## Report Components

### Dimensions

How to slice your data:

**Time-based**
- Hourly/Daily/Weekly/Monthly
- Custom date ranges
- Comparative periods

**Entity-based**
- By source
- By recipient  
- By integration
- By flow

**Data-based**
- By state
- By product
- By quality tier
- Custom fields

### Filters

Narrow your focus:

**Basic Filters**
```
Date range: Last 30 days
Source: Web Form A
State: TX, CA, NY
```

**Advanced Filters**
```
Margin > $10
Email is valid
Delivered successfully
Custom field contains "premium"
```

### Groupings

Organize results:

**Single Grouping**
```
Group by: Source
Shows: All metrics per source
```

**Multi-level Grouping**
```
Group by: Source, then State
Shows: Breakdown by source and state within each
```

**Time Grouping**
```
Group by: Day, then Hour
Shows: Hourly patterns per day
```

## Common Reports

### Source Performance Report

Evaluate lead suppliers:

**Configuration:**
- Dimension: Source
- Metrics: Volume, Cost, Quality, Margin
- Period: Last 30 days

**Insights:**
- Most/least profitable sources
- Quality trends
- Volume consistency
- Cost effectiveness

### Buyer Analysis Report

Assess recipient performance:

**Configuration:**
- Dimension: Recipient
- Metrics: Acceptance rate, Revenue, Feedback
- Period: Last 7 days

**Insights:**
- Best performing buyers
- Revenue concentration
- Acceptance patterns
- Feedback quality

### Daily Operations Report

Monitor daily health:

**Configuration:**
- Dimension: Date (daily)
- Metrics: All key metrics
- Comparison: Previous period

**Insights:**
- Daily trends
- Anomaly detection
- Capacity planning
- Performance tracking

### Geographic Analysis

Understand regional patterns:

**Configuration:**
- Dimension: State
- Metrics: Volume, Revenue, Margin
- Filter: Successful deliveries only

**Insights:**
- Geographic demand
- Regional profitability
- Expansion opportunities
- Pricing optimization

## Advanced Reporting Features

### Calculated Metrics

Beyond basic aggregation:

**Conversion Rate**
```
Feedback Conversions / Deliveries × 100
```

**Return on Investment**
```
(Revenue - Cost) / Cost × 100
```

**Lead Scoring**
```
Quality indicators weighted by importance
```

### Comparative Analysis

Compare performance:

**Period over Period**
- This week vs last week
- This month vs same month last year
- Custom period comparisons

**Entity Comparison**
- Source A vs Source B
- Buyer performance rankings
- Flow effectiveness

### Drill-Down Capability

From summary to detail:

```
Total Revenue: $50,000
↓ Click to expand
By Source: Web Form A: $30,000, API B: $20,000
↓ Click to expand
By State in Web Form A: TX: $15,000, CA: $10,000, NY: $5,000
↓ Click to expand
Individual leads from TX...
```

## Report Scheduling & Sharing

### Automated Delivery

Schedule reports:

**Frequency Options**
- Daily (morning summary)
- Weekly (Monday review)
- Monthly (business review)
- Custom schedules

**Delivery Methods**
- Email (PDF/CSV attachment)
- Shared link
- API endpoint
- FTP delivery

### Access Control

Manage visibility:

**Permission Levels**
- View only
- Create/modify
- Share/export
- Admin (all permissions)

**Data Scoping**
- Limit by flow
- Limit by entity
- Limit by date range
- Custom restrictions

## Building Effective Reports

### Start with Questions

What do you need to know?
1. "Which sources send the best leads?"
2. "What's our profit margin by state?"
3. "Are delivery times increasing?"
4. "Which buyers have the best feedback?"

### Choose Appropriate Metrics

Match metrics to questions:
- Volume questions → Count metrics
- Quality questions → Validation metrics
- Money questions → Financial metrics
- Efficiency questions → Performance metrics

### Design for Action

Make reports actionable:
1. **Clear titles** - State what's measured
2. **Relevant periods** - Match business cycles
3. **Appropriate grouping** - Logical organization
4. **Visual hierarchy** - Important data prominent

## Visualization Best Practices

### Chart Selection

Choose the right visualization:

**Line Charts**
- Trends over time
- Multiple metrics
- Comparative analysis

**Bar Charts**
- Category comparison
- Rankings
- Distribution

**Tables**
- Detailed data
- Precise values
- Multi-metric views

**Pie Charts**
- Proportional data
- Market share
- Limited categories

### Dashboard Design

Create effective dashboards:

1. **Summary first** - Key metrics at top
2. **Logical flow** - Related data together
3. **Consistent periods** - Same timeframe
4. **Clear labels** - No ambiguity

## Performance Optimization

### Query Efficiency

Speed up reports:

1. **Limit date ranges** - Smaller = faster
2. **Reduce groupings** - Fewer = faster
3. **Filter early** - Less data to process
4. **Cache when possible** - Reuse calculations

### Data Management

Handle large datasets:

1. **Archive old data** - Keep active data small
2. **Summarize details** - Pre-aggregate common queries
3. **Index properly** - Speed up searches
4. **Partition by time** - Efficient time-based queries

## Common Pitfalls

### Misleading Metrics
❌ Volume without quality
✅ Balanced scorecard approach

### Over-aggregation
❌ Losing important details
✅ Drill-down capabilities

### Static Reporting
❌ Set and forget
✅ Regular review and adjustment

### Vanity Metrics
❌ Impressive but not actionable
✅ Metrics tied to business goals

## Integration with Other Systems

### Export Capabilities

Share data externally:
- CSV for spreadsheets
- JSON for APIs
- PDF for presentations
- Direct database sync

### Business Intelligence Tools

Connect to BI platforms:
- Tableau
- Power BI
- Looker
- Custom solutions

### Alerting Systems

Trigger notifications:
- Threshold alerts
- Anomaly detection
- Trend warnings
- SLA monitoring

## Related Concepts

- **[Events](events.md)** - Raw data that feeds reports
- **[Exports](exports.md)** - Extract report data
- **[Pricing](pricing.md)** - Financial metrics in reports
- **[Flows](flows.md)** - Performance data source

---

*Reporting transforms LeadConduit from a lead router into a business intelligence platform. It's where data becomes decisions, metrics become strategy, and insights become competitive advantages.*