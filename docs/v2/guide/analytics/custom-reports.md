---
tags:
  - buyer-focused
  - intermediate
  - how-to
  - analytics
  - reporting-focused
  - vendor-management
  - performance-optimization
  - semi-technical
---

# Building Custom Reports

Create reports that answer your specific business questions. Learn to build, customize, and share reports that provide actionable insights into your lead operations.

## 📍 You Are Here

You're learning to build custom reports that go beyond standard metrics. Whether tracking vendor performance, monitoring costs, or analyzing conversion patterns, custom reports give you the exact data you need.

## 🎯 What You'll Master

- Creating and configuring reports
- Adding columns, filters, and groupings
- Time range selection and scheduling
- Sharing and exporting reports
- Common report patterns

## 🚀 Creating Your First Report

### Step 1: Navigate to Reporting

1. Click **Reporting** in the main navigation
2. Click **Create New Report** (upper-right)
3. A new report opens in edit mode

### Step 2: Name Your Report

1. Click the pencil icon next to "Editing Report"
2. Enter a descriptive name:
   - ❌ "New Report - 2024-01-15"
   - ✅ "Daily Vendor Performance"
   - ✅ "Monthly Cost Analysis by State"

### Step 3: Configure Basic Settings

- **Date Range**: Select preset or custom range
- **Time Zone**: Ensure matches your business hours
- **Auto-refresh**: Enable for real-time dashboards

## 🏗️ Building Report Structure

### Adding Columns

Columns define what data appears in your report:

1. **Click "Add Column"**
2. **Choose Column Type**:
   - **Dimension**: Grouping data (Source, State, Outcome)
   - **Measure**: Numeric data (Count, Sum, Average)
   - **Calculated**: Custom formulas

3. **Configure the Column**:
   ```
   Column: Lead Count
   Type: Measure
   Aggregation: Count
   Field: Event ID
   ```

### Essential Column Types

**Dimensions** (for grouping):
- Source Name
- Flow Name
- Outcome (Success/Failure)
- Rejection Reason
- State/Geography
- Time periods (Hour, Day, Week)

**Measures** (for metrics):
- Lead Count
- Success Rate
- Average Price
- Total Revenue
- Processing Time

### Column Configuration Examples

**Acceptance Rate Column**:
```
Name: Acceptance Rate
Type: Calculated
Formula: (Success Count / Total Count) * 100
Format: Percentage
```

**Revenue Column**:
```
Name: Total Revenue
Type: Measure
Field: Sale Price
Aggregation: Sum
Format: Currency
```

## 🔍 Adding Filters

Filters narrow your data to specific criteria:

### Basic Filters

1. Click **Add Filter**
2. Select field to filter
3. Choose operator
4. Enter value(s)

**Examples**:
```
Flow equals "Insurance Leads"
Date is within Last 7 days
Outcome equals "Success"
State is one of ["CA", "TX", "FL"]
```

### Advanced Filter Patterns

**Time-based Filtering**:
```
Hour of Day is between 9 and 17
Day of Week is not "Saturday" or "Sunday"
Created Date is after "2024-01-01"
```

**Performance Filtering**:
```
Acceptance Rate is less than 50%
Processing Time is greater than 1000ms
Price is between 5 and 50
```

### Filter Logic

Combine filters with AND/OR logic:
```
(Flow equals "Solar Leads" AND State equals "CA")
OR
(Flow equals "Insurance" AND Source contains "Facebook")
```

## 📊 Grouping Data

Groupings organize your data hierarchically:

### Single-Level Grouping

Group by one dimension:
```
Group By: Source
Shows: Performance metrics for each source
```

### Multi-Level Grouping

Create hierarchical views:
```
Primary Group: State
Secondary Group: Source
Shows: Sources broken down by state
```

### Time-Based Grouping

Track trends over time:
```
Group By: Date (Day)
Shows: Daily performance trends

Group By: Hour of Day
Shows: Intraday patterns
```

### Grouping Best Practices

- **Start broad**: Group by major categories first
- **Add detail**: Use secondary groupings for granularity
- **Consider performance**: Too many groups slow reports
- **Use summaries**: Enable subtotals for groups

## 🎨 Common Report Patterns

### Vendor Performance Report

**Purpose**: Track source quality and costs

**Columns**:
- Source Name (Dimension)
- Lead Count (Measure)
- Acceptance Rate (Calculated)
- Average Cost (Measure)
- Revenue per Lead (Calculated)

**Filters**:
- Date: Last 30 days
- Flow: Your active flows

**Grouping**:
- Primary: Source
- Secondary: Week

### Geographic Analysis

**Purpose**: Understand regional performance

**Columns**:
- State (Dimension)
- Lead Volume (Measure)
- Conversion Rate (Calculated)
- Average Value (Measure)

**Filters**:
- Outcome: Success
- Date: Current month

**Grouping**:
- Primary: Region
- Secondary: State

### Time-of-Day Analysis

**Purpose**: Optimize staffing and caps

**Columns**:
- Hour (Dimension)
- Lead Count (Measure)
- Success Rate (Calculated)
- Average Response Time (Measure)

**Filters**:
- Day of Week: Monday-Friday

**Grouping**:
- Hour of Day

### Cost Analysis Report

**Purpose**: Track spending and ROI

**Columns**:
- Date (Dimension)
- Total Leads (Measure)
- Total Cost (Sum of Purchase Price)
- Total Revenue (Sum of Sale Price)
- Net Profit (Calculated)
- ROI Percentage (Calculated)

**Filters**:
- Date: Custom range
- Outcome: Success

**Grouping**:
- Primary: Month
- Secondary: Source

## 💡 Advanced Features

### Calculated Fields

Create custom metrics:

**Profit Margin**:
```
Formula: (Sale Price - Purchase Price) / Sale Price * 100
Format: Percentage
```

**Lead Score**:
```
Formula: 
IF(State = "CA", 10, 5) + 
IF(Phone Valid, 5, 0) + 
IF(Email Valid, 5, 0)
```

### Conditional Formatting

Highlight important data:
- Red: Acceptance rate < 50%
- Yellow: Cost > $20
- Green: ROI > 200%

### Report Scheduling

Automate report delivery:
1. Click **Schedule**
2. Set frequency (Daily, Weekly, Monthly)
3. Choose time and recipients
4. Select format (Excel, CSV, PDF)

## 📤 Sharing and Exporting

### Sharing Options

**Direct Share**:
1. Click **Share**
2. Enter email addresses
3. Set permissions (View only, Edit)
4. Add message

**Public Link**:
1. Generate shareable URL
2. Set expiration (optional)
3. Password protect (optional)

### Export Formats

- **Excel**: Full formatting preserved
- **CSV**: Raw data for analysis
- **PDF**: Presentation-ready
- **API**: Programmatic access

## 🚫 Common Issues

### "Report Takes Too Long"

**Solutions**:
- Reduce date range
- Limit groupings
- Add more filters
- Use sampling for large datasets

### "Missing Data"

**Check**:
- Date range includes data
- Filters aren't too restrictive
- User has permission to view data
- Events are being recorded

### "Calculations Wrong"

**Verify**:
- Formula syntax correct
- Using right fields
- Aggregation method appropriate
- Time zones aligned

## 📈 Optimization Tips

### Performance

- **Index frequently filtered fields**
- **Limit columns** to what's needed
- **Pre-aggregate** when possible
- **Cache** for static reports

### Usability

- **Clear naming**: "Vendor Quality Score" not "Metric 1"
- **Logical order**: Most important columns first
- **Consistent formatting**: Currencies, percentages
- **Helpful descriptions**: Add memo explaining metrics

### Maintenance

- **Review monthly**: Remove unused reports
- **Version control**: Copy before major changes
- **Document formulas**: Explain complex calculations
- **Share knowledge**: Train team on report usage

## 🎯 Report Templates

### Executive Dashboard
```
Columns: Date, Total Leads, Accept Rate, Total Cost, Total Revenue, ROI
Filters: Last 30 days
Grouping: By Week
Format: Summary with charts
```

### Vendor Scorecard
```
Columns: Vendor, Volume, Quality Score, Avg Cost, Compliance Rate
Filters: Active vendors only
Grouping: By Vendor Tier
Format: Detailed with conditional formatting
```

### Compliance Audit
```
Columns: Date, Source, TrustedForm Valid %, Consent Age, DNC Hits
Filters: Last 90 days
Grouping: By Month and Source
Format: Detailed for audit trail
```

## 📚 Related Documentation

- [Understanding Events](./understanding-events.md) - Data that powers reports
- [Report Reference](../../reference/reporting.md) - Technical specifications
- [Data Exports](./data-exports.md) - Bulk data access

---

📊 **Insight Delivered**: Custom reports transform raw data into business intelligence. Start simple, add complexity as needed, and always focus on actionable insights that drive decisions!