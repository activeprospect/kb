# LeadConduit Reporting Mastery

Build powerful reports to track performance, analyze trends, and make data-driven decisions. Master LeadConduit's reporting system from basic metrics to advanced analytics.

## 📍 You Are Here

You need to create reports that provide insights into your lead operations, track vendor performance, monitor quality, and demonstrate ROI. This guide covers the complete reporting ecosystem.

## 🎯 What You'll Learn

- Report types and capabilities
- Creating custom reports
- Advanced filtering and grouping
- Report scheduling and distribution
- Performance optimization
- Best practices

## 📊 Report Types

### System Reports

Pre-built reports available:

**Lead Volume Report**:
- Tracks lead flow over time
- Shows acceptance/rejection rates
- Identifies trends and patterns

**Source Performance**:
- Compares lead sources
- Quality metrics by source
- Cost and revenue analysis

**Buyer Performance**:
- Delivery success rates
- Response times
- Revenue by buyer

**Flow Analytics**:
- Processing times
- Step performance
- Bottleneck identification

### Custom Reports

Build reports for specific needs:

```javascript
const customReport = {
  name: "High Value Lead Analysis",
  description: "Track premium leads by source and outcome",
  
  // Data source
  source: "events",
  date_range: "last_30_days",
  
  // Filters
  filters: [
    { field: "lead.quality_score", operator: ">", value: 85 },
    { field: "outcome", operator: "in", value: ["success", "pending"] },
    { field: "price", operator: ">=", value: 50 }
  ],
  
  // Groupings
  group_by: ["source", "buyer", "state"],
  
  // Metrics
  metrics: [
    { type: "count", alias: "Lead Count" },
    { type: "sum", field: "price", alias: "Revenue" },
    { type: "avg", field: "quality_score", alias: "Avg Quality" },
    { type: "conversion_rate", alias: "Success Rate" }
  ],
  
  // Visualization
  charts: [
    { type: "line", metric: "Lead Count", dimension: "date" },
    { type: "bar", metric: "Revenue", dimension: "source" },
    { type: "pie", metric: "Lead Count", dimension: "state" }
  ]
};
```

## 🎯 Creating Reports

### Step-by-Step Report Creation

1. **Navigate to Reports**:
   - Click Reports in main navigation
   - Select "Create New Report"

2. **Choose Report Type**:
   ```yaml
   Report Types:
     - Summary: High-level metrics
     - Detail: Individual records
     - Comparison: Side-by-side analysis
     - Trend: Time-based patterns
     - Distribution: Geographic/demographic
   ```

3. **Configure Data Source**:
   ```javascript
   dataSource: {
     type: "events", // or "leads", "transactions"
     
     // Time range
     dateRange: {
       type: "relative", // or "absolute"
       value: "last_7_days",
       // OR
       start: "2024-01-01",
       end: "2024-01-31"
     },
     
     // Sampling for large datasets
     sampling: {
       enabled: true,
       rate: 0.1, // 10% sample
       method: "random"
     }
   }
   ```

4. **Add Filters**:
   ```javascript
   filters: [
     // Simple filters
     { field: "flow", operator: "equals", value: "Production Flow" },
     
     // Complex filters
     {
       type: "group",
       operator: "AND",
       conditions: [
         { field: "state", operator: "in", value: ["CA", "TX", "FL"] },
         { field: "age", operator: "between", value: [25, 65] }
       ]
     },
     
     // Nested conditions
     {
       type: "group",
       operator: "OR",
       conditions: [
         {
           type: "group",
           operator: "AND",
           conditions: [
             { field: "source", operator: "contains", value: "google" },
             { field: "quality_score", operator: ">=", value: 80 }
           ]
         },
         { field: "vip_flag", operator: "equals", value: true }
       ]
     }
   ]
   ```

### Advanced Filtering

Powerful filter combinations:

```javascript
// Time-based filters
const timeFilters = {
  // Business hours only
  business_hours: {
    field: "created_at.hour",
    operator: "between",
    value: [9, 17]
  },
  
  // Weekdays only
  weekdays: {
    field: "created_at.day_of_week",
    operator: "not_in",
    value: [0, 6] // Sunday, Saturday
  },
  
  // Recent leads
  recent: {
    field: "created_at",
    operator: "within_last",
    value: "24_hours"
  }
};

// Performance filters
const performanceFilters = {
  // Fast processing
  fast_leads: {
    field: "processing_time_ms",
    operator: "<",
    value: 500
  },
  
  // High conversion
  converting_sources: {
    field: "source_conversion_rate",
    operator: ">=",
    value: 0.7
  }
};
```

## 📦 Grouping and Aggregation

### Grouping Strategies

Organize data effectively:

```javascript
// Single dimension grouping
groupBy: "source"

// Multiple dimensions
groupBy: ["source", "state", "buyer"]

// Time-based grouping
groupBy: {
  field: "created_at",
  interval: "hour", // minute, hour, day, week, month
  timezone: "America/New_York"
}

// Custom grouping
groupBy: {
  field: "price",
  type: "range",
  ranges: [
    { label: "Low", min: 0, max: 25 },
    { label: "Medium", min: 25, max: 50 },
    { label: "High", min: 50, max: null }
  ]
}

// Calculated grouping
groupBy: {
  field: "custom",
  expression: "CASE WHEN quality_score > 90 THEN 'Premium' ELSE 'Standard' END",
  alias: "lead_tier"
}
```

### Aggregation Functions

Calculate meaningful metrics:

```javascript
const metrics = [
  // Basic aggregations
  { function: "count", alias: "Total Leads" },
  { function: "count_distinct", field: "email", alias: "Unique Leads" },
  
  // Statistical
  { function: "sum", field: "revenue", alias: "Total Revenue" },
  { function: "avg", field: "quality_score", alias: "Avg Quality" },
  { function: "min", field: "price", alias: "Min Price" },
  { function: "max", field: "price", alias: "Max Price" },
  { function: "stddev", field: "response_time", alias: "Response Variance" },
  
  // Percentiles
  { function: "percentile", field: "price", percentile: 50, alias: "Median Price" },
  { function: "percentile", field: "price", percentile: 95, alias: "95th Percentile" },
  
  // Calculated metrics
  {
    function: "calculated",
    expression: "(SUM(CASE WHEN outcome = 'success' THEN 1 ELSE 0 END) / COUNT(*)) * 100",
    alias: "Success Rate %"
  },
  
  // Running totals
  {
    function: "running_sum",
    field: "revenue",
    partition_by: "source",
    order_by: "created_at",
    alias: "Cumulative Revenue"
  }
];
```

## 📈 Visualizations

### Chart Types

Visualize data effectively:

**Line Charts**:
```javascript
{
  type: "line",
  x_axis: "date",
  y_axis: "lead_count",
  series: "source", // Multiple lines
  
  options: {
    smooth: true,
    show_points: true,
    interpolation: "linear", // or "step", "basis"
    y_axis_start: 0
  }
}
```

**Bar Charts**:
```javascript
{
  type: "bar",
  category: "buyer",
  value: "revenue",
  
  options: {
    orientation: "vertical", // or "horizontal"
    stacked: true,
    show_values: true,
    sort: "descending"
  }
}
```

**Pie/Donut Charts**:
```javascript
{
  type: "donut",
  dimension: "state",
  metric: "lead_count",
  
  options: {
    show_percentages: true,
    min_slice_percentage: 2, // Group small slices
    inner_radius: 60 // For donut
  }
}
```

**Heat Maps**:
```javascript
{
  type: "heatmap",
  x_axis: "hour_of_day",
  y_axis: "day_of_week",
  value: "conversion_rate",
  
  options: {
    color_scale: "green_to_red",
    show_values: true,
    format: "percentage"
  }
}
```

### Dashboard Creation

Combine multiple visualizations:

```javascript
const dashboard = {
  name: "Executive Overview",
  layout: "grid", // or "freeform"
  
  widgets: [
    {
      type: "metric",
      position: { x: 0, y: 0, w: 3, h: 1 },
      config: {
        metric: "total_revenue",
        comparison: "previous_period",
        format: "currency"
      }
    },
    {
      type: "chart",
      position: { x: 0, y: 1, w: 6, h: 3 },
      config: {
        report_id: "revenue_trend",
        chart_type: "line"
      }
    },
    {
      type: "table",
      position: { x: 6, y: 0, w: 6, h: 4 },
      config: {
        report_id: "top_sources",
        limit: 10
      }
    }
  ],
  
  // Auto-refresh
  refresh_interval: 300, // 5 minutes
  
  // Filters apply to all widgets
  global_filters: [
    { field: "environment", value: "production" }
  ]
};
```

## 🗓️ Scheduling and Distribution

### Report Scheduling

Automate report delivery:

```javascript
const schedule = {
  frequency: "daily", // hourly, daily, weekly, monthly
  
  // Specific timing
  timing: {
    time: "08:00",
    timezone: "America/New_York",
    days_of_week: [1, 2, 3, 4, 5], // Mon-Fri
    
    // Monthly options
    day_of_month: 1, // First day
    // OR
    week_of_month: "last",
    day_of_week: "friday" // Last Friday
  },
  
  // Delivery configuration
  delivery: {
    method: "email",
    recipients: [
      "leadership@company.com",
      "analytics@company.com"
    ],
    
    // Email options
    subject: "Daily Lead Report - {date}",
    body: "Please find attached the daily lead report.",
    format: "pdf", // pdf, excel, csv
    
    // Include charts
    include_visualizations: true
  },
  
  // Conditional delivery
  conditions: {
    only_if_data: true, // Skip if no results
    minimum_rows: 10,
    
    // Alert conditions
    alerts: [
      {
        condition: "revenue < 10000",
        additional_recipients: ["alerts@company.com"],
        priority: "high"
      }
    ]
  }
};
```

### Distribution Options

Multiple delivery methods:

```javascript
// Slack integration
const slackDelivery = {
  method: "slack",
  webhook: process.env.SLACK_WEBHOOK,
  channel: "#lead-metrics",
  
  format: {
    summary: true,
    top_metrics: 5,
    include_chart: true
  }
};

// S3 delivery
const s3Delivery = {
  method: "s3",
  bucket: "company-reports",
  path: "leadconduit/{year}/{month}/{report_name}_{date}.csv",
  
  options: {
    acl: "private",
    encryption: "AES256"
  }
};

// FTP delivery
const ftpDelivery = {
  method: "ftp",
  host: "reports.partner.com",
  username: "report_user",
  password: process.env.FTP_PASSWORD,
  directory: "/incoming/daily/"
};
```

## ⚡ Performance Optimization

### Query Optimization

Speed up report generation:

```javascript
// Index usage
const optimizedFilters = {
  // Use indexed fields first
  primary_filters: [
    { field: "created_at", operator: "between", value: [start, end] },
    { field: "flow_id", operator: "equals", value: flowId }
  ],
  
  // Then apply additional filters
  secondary_filters: [
    { field: "quality_score", operator: ">", value: 80 }
  ]
};

// Limit data scanned
const efficiency = {
  // Pre-aggregate when possible
  use_summary_tables: true,
  
  // Sample for estimates
  sampling: {
    enabled: true,
    confidence_level: 0.95,
    margin_of_error: 0.05
  },
  
  // Partition pruning
  partition_filters: {
    date_partition: "2024-01"
  }
};
```

### Caching Strategies

Improve response times:

```javascript
const cacheConfig = {
  // Report-level caching
  cache_duration: 3600, // 1 hour
  
  // Invalidation rules
  invalidate_on: [
    "new_data",
    "filter_change",
    "time_window_shift"
  ],
  
  // Incremental updates
  incremental: {
    enabled: true,
    merge_strategy: "append", // or "replace"
    key_field: "event_id"
  }
};
```

## 📊 Advanced Reporting

### Cohort Analysis

Track groups over time:

```javascript
const cohortReport = {
  type: "cohort",
  
  // Define cohorts
  cohort_definition: {
    field: "created_at",
    interval: "month"
  },
  
  // Activity to track
  activity: {
    field: "purchase_date",
    metric: "conversion"
  },
  
  // Time windows
  periods: [0, 7, 14, 30, 60, 90], // Days after cohort start
  
  // Visualization
  display: {
    type: "retention_curve",
    show_percentages: true,
    highlight_threshold: 0.5
  }
};
```

### Funnel Analysis

Conversion funnel tracking:

```javascript
const funnelReport = {
  type: "funnel",
  
  steps: [
    { name: "Lead Received", condition: "event_type = 'created'" },
    { name: "Passed Validation", condition: "outcome != 'rejected'" },
    { name: "Enhanced", condition: "enhancement_complete = true" },
    { name: "Delivered", condition: "delivery_status = 'success'" },
    { name: "Converted", condition: "conversion = true" }
  ],
  
  // Grouping
  segment_by: "source",
  
  // Time constraint
  conversion_window: "24 hours",
  
  // Visualization
  chart: {
    type: "funnel",
    show_conversion_rates: true,
    show_absolute_numbers: true
  }
};
```

### Custom Calculations

Complex business metrics:

```javascript
// Customer Lifetime Value
const clvCalculation = {
  name: "Customer Lifetime Value",
  
  formula: `
    SUM(revenue) / COUNT(DISTINCT customer_id) * 
    (1 / (1 - retention_rate))
  `,
  
  variables: {
    retention_rate: {
      calculation: "month_over_month_retention",
      lookback_months: 6
    }
  }
};

// ROI Calculation
const roiCalculation = {
  name: "Return on Investment",
  
  formula: `
    ((SUM(revenue) - SUM(cost)) / SUM(cost)) * 100
  `,
  
  breakdown_by: ["source", "campaign"],
  
  filters: {
    exclude_test: true,
    min_volume: 100
  }
};
```

## 💡 Best Practices

### Report Design

1. **Start with Questions**: What decisions will this inform?
2. **Keep It Simple**: Don't overwhelm with metrics
3. **Use Clear Names**: "Conversion Rate" not "CR%"
4. **Add Context**: Include comparisons and benchmarks
5. **Mobile Friendly**: Design for small screens

### Data Accuracy

1. **Validate Filters**: Test edge cases
2. **Check Calculations**: Verify formulas
3. **Time Zone Awareness**: Be consistent
4. **Handle Nulls**: Decide how to treat missing data
5. **Document Logic**: Explain complex calculations

### Performance Tips

1. **Limit Date Ranges**: Don't query all history
2. **Use Summaries**: Pre-aggregated data when possible
3. **Index Key Fields**: Ensure filters use indexes
4. **Schedule Wisely**: Run intensive reports off-hours
5. **Monitor Usage**: Track report performance

## 📓 Report Examples

### Daily Operations Report

```javascript
const dailyOpsReport = {
  name: "Daily Operations Summary",
  schedule: "daily @ 6 AM",
  
  sections: [
    {
      title: "Key Metrics",
      metrics: [
        "Total Leads",
        "Acceptance Rate",
        "Revenue",
        "Avg Response Time"
      ]
    },
    {
      title: "Top Performers",
      type: "table",
      data: "top_10_sources_by_volume"
    },
    {
      title: "Issues",
      type: "alert_list",
      filters: { severity: ["high", "critical"] }
    }
  ]
};
```

### Vendor Scorecard

```javascript
const vendorScorecard = {
  name: "Monthly Vendor Scorecard",
  
  metrics_per_vendor: [
    { name: "Volume", weight: 0.2 },
    { name: "Quality Score", weight: 0.3 },
    { name: "Conversion Rate", weight: 0.3 },
    { name: "Compliance Rate", weight: 0.2 }
  ],
  
  scoring: {
    calculate_composite: true,
    grade_thresholds: {
      A: 90,
      B: 80,
      C: 70,
      D: 60
    }
  },
  
  actions: {
    grade_A: "Increase caps",
    grade_D: "Review relationship"
  }
};
```

## 📚 Related Documentation

- [Understanding Events](./understanding-events.md) - Event data model
- [Custom Reports](./custom-reports.md) - Advanced report building
- [Data Exports](./data-exports.md) - Exporting report data

---

📊 **Reporting Excellence**: Great reports turn data into decisions. Build reports that answer real questions, deliver insights automatically, and drive continuous improvement!