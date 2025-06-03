# LeadConduit Exports - Complete Documentation

## Overview

Exports in LeadConduit are your data extraction powerhouse - they enable bulk download of detailed lead and event data for analysis, compliance, reconciliation, or migration. Think of exports as your data liberation tool, providing structured access to the granular information that reports summarize. While reports give you aggregated insights, exports give you the raw data to analyze however you need.

At their core, exports answer the need for detailed data access: "I need all leads from last month with complete field data for our quarterly analysis" or "Compliance needs every lead interaction from this date range for an audit" or "We need to migrate this campaign's data to our data warehouse." Exports transform the vast event stream into downloadable, analyzable datasets that can be processed in any external tool.

The power of exports lies in their flexibility and completeness. Unlike reports that aggregate and summarize, exports preserve full fidelity - every field, every timestamp, every outcome. You can export leads, events, or both, filtered by any criteria, with any fields you need. The data arrives in standard CSV format, ready for Excel, data warehouses, or custom analysis tools. It's the bridge between LeadConduit's operational excellence and your broader data ecosystem.

## Why Exports Exist

### The Deep Analysis Problem
While LeadConduit's reports are powerful, sometimes you need to dig deeper. Complex analyses like cohort studies, multi-variate testing, or custom visualizations require access to row-level data. Exports solve this by providing complete datasets that can be analyzed in specialized tools like Excel, Tableau, or R, enabling analyses that go beyond built-in reporting capabilities.

### The Compliance and Audit Problem
Regulatory requests don't follow standard reporting formats. "Show us all data collected on California residents in Q3" or "Provide all consent records for these 500 phone numbers" require flexible data extraction. Exports solve this by allowing arbitrary filtering and field selection, ensuring you can respond to any audit request quickly and completely.

### The Integration Problem
Your lead data often needs to flow to other systems - data warehouses, CRM backups, partner platforms, or archive storage. Manual copying doesn't scale, and real-time APIs might overwhelm downstream systems. Exports solve this by providing batch data transfer in universal formats, enabling scheduled ETL processes and bulk migrations.

### The Reconciliation Problem
End-of-month reconciliation with vendors and buyers requires detailed transaction logs. Aggregate reports show totals, but disputes need line-by-line detail. Exports solve this by providing complete transaction records with all metadata, making reconciliation discussions fact-based rather than memory-based.

## Core Concepts

### Export Components

Every export is defined by five key components that determine what data you receive:

**Time Range (When)**
Exports always operate on a specific time window:
- Start date/time: Beginning of the export range
- End date/time: End of the export range
- Based on event timestamps, not lead creation
- Maximum range depends on your data retention period
- Can export historical data within retention window

**Filter Rules (Which Records)**
Rules determine which records to include:
- Same rule engine used throughout LeadConduit
- Filter by any field in the lead or event
- Combine multiple conditions with AND logic
- Examples:
  - "Only California leads"
  - "Only failed deliveries"
  - "Specific vendor or flow"
  - "Leads with conversion feedback"

**Fields (What Data)**
Specify exactly which fields to include:
- Lead fields: `first_name`, `phone` (exports with appropriate headers)
- Event metadata: `id`, `timestamp`, `outcome`
- Financial data: `purchase_price`, `revenue`
- Custom fields: `loan_amount`, `insurance_type` (no prefix needed)
- Appended data: `appended.demographics.income`
- System fields: `flow.id`, `source.name`

Note: Field names in exports follow the data model - standard fields get prefixed in the export headers, custom fields don't need prefixes. The special field `event_id` exports as "Event ID" in the header for clarity.

**Email Recipients (Where to Send)**
Exports are delivered via email when complete:
- Multiple recipients supported
- Must be valid account users (for API access)
- Users receive secure download links
- Automatically notified on completion
- Links expire based on retention settings

**Date Format (How to Display)**
Choose between two date formats:
- **Legacy**: Matches historical LeadConduit format
- **Standard**: ISO 8601 standard format
- Affects all date/time fields in export
- Choose based on downstream system requirements

### Export Processing

Understanding how exports work helps set proper expectations:

**Asynchronous Processing**
Exports run as background jobs:
1. Request submitted → Export created with "created" status
2. Job queued → Processing begins when resources available
3. Data extraction → System queries and formats data
4. File creation → CSV generated and compressed
5. Upload to S3 → Secure storage for download
6. Email notification → Recipients notified with download link

**Progress Tracking**
Exports provide real-time status:
- `created`: Export requested but not started
- `processing`: Actively extracting data
- `complete`: Ready for download
- `error`: Processing failed
- `truncated`: Partial export due to retention limits

Progress includes:
- Percentage complete
- Records processed
- Estimated time remaining

**Data Retention Impact**
Your account's data retention period affects exports:
- Default: 92 days of data retention
- Custom: Based on your account settings
- Truncation: Exports requesting data beyond retention show partial results
- Clear messaging: System indicates when exports are truncated

### Export Types by Content

**Lead Exports**
Focus on lead data with event context:
- One row per lead
- Includes all lead fields
- Latest values after all processing
- Associated event metadata
- Source and flow information

Ideal for:
- Lead list generation
- CRM synchronization
- Quality analysis
- Vendor reconciliation

**Event Exports**
Complete event stream data:
- One row per event
- Full event metadata
- Complete lead snapshot from that moment
- Processing details
- Outcome information

Ideal for:
- Audit trails
- Process analysis
- Troubleshooting
- Compliance documentation

**Combined Exports**
Both lead and event data:
- Comprehensive dataset
- Larger file sizes
- Maximum flexibility
- Complete picture

Ideal for:
- Data warehouse loading
- Complex analysis
- Historical archives
- Migration projects

### File Format and Delivery

**CSV Format**
Exports use standard CSV format:
- Headers match field names
- Quoted values for safety
- UTF-8 encoding
- Compatible with all tools
- Compressed with gzip

**Secure Delivery**
Files are delivered securely:
- Encrypted storage
- Time-limited download links
- Secure HTTPS transmission
- No permanent public access
- Automatic expiration

**Email Notifications**
Recipients receive:
- Export completion notice
- Secure download link
- Export ID for reference
- Expiration date warning
- File size information

## Common Export Patterns

### Monthly Vendor Reconciliation

Export all transactions with a specific vendor:

```
Time Range: Last month (1st to 31st)
Filter Rules: 
- source.id equals "vendor-123"
Fields:
- event_id
- timestamp  
- lead.id
- outcome
- reason
- purchase_price
- All lead fields
Recipients: accounting@company.com
```

Result: Complete transaction log for vendor payment verification

### Compliance Audit Response

Export all California resident data:

```
Time Range: Specific quarter
Filter Rules:
- lead.state equals "CA"
Fields:
- timestamp
- lead.* (all lead fields)
- trustedform_decisions.* 
- outcome
- flow.name
- source.name
Recipients: compliance@company.com, legal@company.com
```

Result: Comprehensive data for regulatory response

### Failed Delivery Analysis

Export all failed recipient deliveries:

```
Time Range: Last 7 days
Filter Rules:
- type equals "recipient"
- outcome equals "failure"
Fields:
- event_id
- timestamp
- lead.id
- recipient.name
- reason
- delivery (full request/response)
Recipients: techops@company.com
```

Result: Technical troubleshooting dataset

### Quality Assurance Sample

Export successful leads for quality review:

```
Time Range: Yesterday
Filter Rules:
- outcome equals "success"
- Random 10% sample (if supported)
Fields:
- All lead fields
- source.name
- flow.name
- purchase_price
- appended.* (all enhancement data)
Recipients: qa@company.com
```

Result: Representative sample for quality checks

### Data Warehouse ETL

Export everything for warehouse loading:

```
Time Range: Last 24 hours
Filter Rules: None (all data)
Fields:
- All available fields
Recipients: dataeng@company.com
Date Format: Standard (ISO 8601)
```

Result: Complete dataset for ETL pipeline

## Advanced Export Concepts

### Performance Considerations

Large exports require planning:

**Time Range Impact**
- Longer ranges = more data = longer processing
- Consider breaking into smaller chunks
- Daily exports often better than monthly
- Balance completeness with performance

**Field Selection**
- More fields = larger files
- Include only needed fields
- Nested objects expand size
- Consider multiple focused exports

**Filter Efficiency**
- Filters reduce data volume
- Improves processing speed
- Reduces file size
- More specific = faster

### Working with Truncated Exports

When exports hit retention limits:

**Understanding Truncation**
- Export shows data up to retention limit
- Status marked as "truncated"
- Clear message about cutoff date
- Partial data still valuable

**Handling Strategies**
- Adjust date ranges to fit retention
- Request shorter time periods
- Plan exports before data expires
- Consider retention extension

### Export Automation

While exports are manual, you can build automation:

**Scheduled Requests**
- Use API to trigger exports
- Cron jobs for regular exports
- Webhook on completion
- Automatic processing pipelines

**Standardized Extracts**
- Template common export configurations
- Consistent field selections
- Reusable filter sets
- Documented procedures

### Security and Privacy

Exports handle sensitive data carefully:

**Access Control**
- Only account users can create exports
- Email validation ensures authorized recipients
- API access requires authentication
- Audit trail of export requests

**Data Protection**
- Encrypted storage at rest
- Secure transmission (HTTPS)
- Time-limited download links
- No public accessibility
- Automatic expiration

**Compliance Features**
- Complete audit trail
- Data minimization options
- Purpose-limited extracts
- Documented chain of custody

## Best Practices

### Planning Your Exports

Before creating an export, consider:

1. **Purpose**: Why do you need this data?
2. **Scope**: What time range and filters?
3. **Fields**: Which specific data points?
4. **Format**: How will you process it?
5. **Frequency**: One-time or recurring need?

### Export Design Guidelines

**Right-Size Your Exports**
- Start with smaller test exports
- Validate fields and filters
- Scale up gradually
- Monitor processing times

**Optimize for Use Case**
- Reconciliation: Include financial fields
- Analysis: Include all metadata
- Compliance: Include consent data
- Migration: Include everything

**Document Your Process**
- Record export configurations
- Note filter logic
- Track regular export schedules
- Maintain audit trail

### Processing Exported Data

**Immediate Steps**
1. Download promptly (links expire)
2. Verify row count matches expectations
3. Check for truncation warnings
4. Store securely if contains PII

**Analysis Preparation**
1. Decompress gzip file
2. Import to analysis tool
3. Verify field mapping
4. Check data types
5. Handle nested JSON fields

**Common Tools**
- Excel: For smaller datasets
- Google Sheets: For collaboration
- Python/Pandas: For analysis
- SQL databases: For joining
- Tableau/PowerBI: For visualization

## Common Misconceptions

### "Exports are real-time"
Reality: Exports are asynchronous batch processes. For real-time data access, use the Events API or webhooks.

### "I can export years of data"
Reality: Exports are limited by your data retention period (default 92 days). Data older than retention is not available.

### "Exports include everything automatically"
Reality: You must specify which fields to include. Only requested fields appear in the export.

### "Anyone can download export files"
Reality: Download links are secure, time-limited, and require the original email notification to access.

### "Exports replace reporting"
Reality: Exports complement reporting. Use reports for aggregated insights, exports for detailed data access.

## Key Takeaways

1. **Exports Provide Raw Data Access**: While reports aggregate, exports give you row-level detail
2. **Flexible Filtering and Field Selection**: Export exactly what you need, nothing more
3. **Time-Based Data Extraction**: All exports operate on time ranges within retention limits
4. **Asynchronous Processing**: Exports run in background and notify when complete
5. **Secure Delivery via Email**: Recipients get time-limited download links
6. **CSV Format for Universal Access**: Compatible with any data analysis tool
7. **Retention Limits Apply**: Can only export data within retention window
8. **Complement Reports**: Use exports for deep analysis, reports for quick insights
9. **Audit Trail Included**: Every export request is logged and tracked
10. **Plan for Performance**: Large exports take time, design thoughtfully