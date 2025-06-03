---
title: Exports
description: The data extraction engine that liberates your lead information for external analysis and archival
tags:
  - exports-focused
  - reference
  - technical
  - core-concept
  - data-portability
---

# Exports

## What are Exports?

Exports are LeadConduit's data liberation tools that extract your lead and event data in formats suitable for external analysis, long-term storage, or integration with other systems. Think of exports as the shipping department of your lead warehouse - carefully packaging your data and delivering it wherever it needs to go.

Unlike reports that summarize and visualize, exports provide raw, detailed data ready for spreadsheets, databases, data warehouses, or custom analysis tools.

## Why Exports Matter

Your data shouldn't be trapped:
- Business intelligence tools need raw data
- Compliance requires data archival
- Advanced analysis happens outside LeadConduit
- Backup strategies demand data portability

Without exports, your valuable lead data is siloed. With exports, it flows freely to power your entire data ecosystem.

## Export Types

### Lead Exports

Extract lead data with all fields:

**What's Included:**
- Lead ID and metadata
- All standard fields
- All custom fields
- Type components (email.domain, phone.valid)
- Appended enhancement data
- Processing outcomes

**Use Cases:**
- Backup lead data
- Feed data warehouses
- Custom analysis
- Compliance archives

### Event Exports

Extract the complete event timeline:

**What's Included:**
- Event ID and type
- Precise timestamps
- Event metadata
- Complete lead snapshot
- Outcome details
- Processing metrics

**Use Cases:**
- Audit trails
- Debugging analysis
- Performance studies
- Dispute resolution

### Report Exports

Extract aggregated report data:

**What's Included:**
- Calculated metrics
- Grouped summaries
- Time series data
- Filtered results

**Use Cases:**
- Business intelligence
- Executive dashboards
- Trend analysis
- Financial reporting

## Export Formats

### CSV Format

The universal spreadsheet format:

**Characteristics:**
- One row per record
- Headers in first row
- Comma-separated values
- Excel/Sheets compatible

**Example:**
```csv
lead_id,email,first_name,state,revenue,delivered_at
ABC123,john@example.com,John,TX,25.00,2024-01-15T10:30:45Z
DEF456,jane@example.com,Jane,CA,30.00,2024-01-15T10:31:12Z
```

**Best For:**
- Spreadsheet analysis
- Quick data reviews
- Simple integrations
- Human-readable data

### JSON Format

The developer-friendly format:

**Characteristics:**
- Preserves data types
- Supports nested structures
- Array-friendly
- API-compatible

**Example:**
```json
[
  {
    "lead_id": "ABC123",
    "email": "john@example.com",
    "email_components": {
      "valid": true,
      "domain": "example.com"
    },
    "state": "TX",
    "revenue": 25.00,
    "delivered_at": "2024-01-15T10:30:45Z"
  }
]
```

**Best For:**
- Data warehouse ingestion
- API integrations
- Complex data structures
- Programmatic processing

### TSV Format

Tab-separated for special cases:

**When to Use:**
- Data contains commas
- Legacy system requirements
- Specific tool compatibility

## Export Configuration

### Field Selection

Choose what to export:

**All Fields**
- Complete data dump
- Maximum flexibility
- Larger file size

**Selected Fields**
```
✓ lead_id
✓ email
✓ state
✓ revenue
□ phone (excluded)
```

**Smart Selection**
- Required fields only
- PII exclusion
- Performance optimization

### Filtering

Export subsets of data:

**Time-based Filters**
```
Date range: Last 30 days
Hour range: Business hours only
Specific dates: 2024-01-15
```

**Entity Filters**
```
Sources: Web Form A, API B
Recipients: Buyer X, Buyer Y
Flows: Production Flow 1
```

**Data Filters**
```
State: TX, CA, NY
Outcome: Delivered successfully
Revenue: Greater than $10
Custom: product_type = "insurance"
```

### Scheduling

Automate your exports:

**Frequency Options**
- One-time (manual trigger)
- Daily (midnight UTC)
- Weekly (Sundays)
- Monthly (1st of month)
- Custom schedules

**Delivery Methods**
- Email attachment
- SFTP upload
- S3 bucket
- Webhook POST
- API retrieval

## Common Export Patterns

### Daily Lead Backup

Archive all leads daily:

**Configuration:**
```
Type: Lead Export
Format: JSON
Schedule: Daily at 2 AM
Filter: Previous day's leads
Delivery: S3 bucket
Path: /backups/leads/{{date}}/leads.json
```

**Purpose:**
- Disaster recovery
- Data warehouse feeding
- Compliance archival

### Weekly Performance Extract

Analyze delivery patterns:

**Configuration:**
```
Type: Event Export
Format: CSV
Schedule: Weekly on Monday
Filter: recipient.* events, last 7 days
Fields: Select performance metrics
Delivery: Email to analytics team
```

**Purpose:**
- Performance analysis
- Bottleneck identification
- SLA monitoring

### Monthly Financial Summary

Track revenue details:

**Configuration:**
```
Type: Lead Export
Format: CSV
Schedule: Monthly on 1st
Filter: Delivered leads with revenue > 0
Fields: Financial fields + source/recipient
Delivery: SFTP to accounting
```

**Purpose:**
- Financial reconciliation
- Commission calculation
- Revenue recognition

### On-Demand Dispute Resolution

Extract specific lead history:

**Configuration:**
```
Type: Event Export
Format: JSON
Schedule: One-time
Filter: Specific lead IDs
Fields: All fields and events
Delivery: Immediate download
```

**Purpose:**
- Dispute investigation
- Customer service
- Quality assurance

## Large Export Handling

### Chunking Strategy

For millions of records:

**Time-based Chunks**
```
Export January week by week:
- Week 1: Jan 1-7
- Week 2: Jan 8-14
- Week 3: Jan 15-21
- Week 4: Jan 22-31
```

**Size-based Chunks**
```
Limit: 100,000 records per file
Naming: export_part_1.csv, export_part_2.csv
```

### Compression

Reduce file sizes:

**Options:**
- ZIP compression
- GZIP for JSON
- Split archives

**Benefits:**
- Faster transfers
- Lower storage costs
- Email-friendly sizes

### Streaming Exports

For real-time needs:

**Firehose Integration**
- Continuous streaming
- Near real-time
- No scheduling needed
- Direct to S3/Kinesis

## Export Security

### Access Control

Who can export what:

**Permission Levels**
- View: See exports
- Create: Make new exports
- Download: Access files
- Admin: All permissions

**Data Scoping**
- Limit by flow access
- PII field restrictions
- Date range limits
- Row count limits

### Data Protection

Secure your exports:

**In Transit**
- HTTPS downloads
- SFTP encryption
- Encrypted email
- VPN options

**At Rest**
- Encrypted storage
- Access logging
- Retention policies
- Secure deletion

### PII Handling

Protect sensitive data:

**Exclusion Options**
- Remove PII fields
- Hash identifiers
- Mask partial data
- Tokenize values

**Example:**
```csv
lead_id,email_domain,state,revenue
HASH123,example.com,TX,25.00
HASH456,example.com,CA,30.00
```

## Best Practices

### Export Design

1. **Purpose-driven** - Export only needed data
2. **Consistent format** - Standardize across exports
3. **Clear naming** - Date and content in filename
4. **Documentation** - Record export configurations

### Performance

1. **Off-peak scheduling** - Avoid business hours
2. **Appropriate chunks** - Not too large
3. **Filter effectively** - Reduce data volume
4. **Archive old exports** - Don't accumulate

### Integration

1. **Stable schemas** - Consistent field order
2. **Error handling** - Account for failures
3. **Monitoring** - Track export success
4. **Version control** - Handle schema changes

### Compliance

1. **Audit trails** - Log who exports what
2. **Retention policies** - Delete when required
3. **Access reviews** - Regular permission audits
4. **Encryption** - Always for sensitive data

## Common Issues

### Export Timeouts
**Problem:** Large exports fail
**Solution:** Use smaller date ranges or chunking

### Missing Data
**Problem:** Expected fields not in export
**Solution:** Check field selection and filters

### Format Issues
**Problem:** Import tools can't read files
**Solution:** Verify format settings and encoding

### Delivery Failures
**Problem:** Scheduled exports don't arrive
**Solution:** Check delivery configuration and credentials

## Export vs Other Data Access

### When to Export

Use exports when you need:
- Historical data analysis
- External tool integration
- Data backup/archive
- Bulk data transfer

### When to Use API

Use API when you need:
- Real-time data access
- Specific record lookup
- Incremental updates
- Programmatic integration

### When to Use Reports

Use reports when you need:
- Summarized insights
- Visual analysis
- Quick answers
- Trend identification

## Technical Specifications

### File Limits

- Maximum rows: 5 million per export
- Maximum size: 5 GB uncompressed
- Processing time: Varies by size
- Retention: 30 days for download

### Scheduling Limits

- Minimum frequency: Daily
- Maximum exports: 100 active schedules
- Time zones: UTC-based
- Precision: Minute-level

### Format Details

**CSV Specifics:**
- Encoding: UTF-8
- Line endings: Unix (LF)
- Escaping: RFC 4180 standard
- Null values: Empty string

**JSON Specifics:**
- Encoding: UTF-8
- Pretty print: Optional
- Array wrapped: Always
- Date format: ISO 8601

## Related Concepts

- **[Events](events.md)** - Source data for event exports
- **[Reporting](reporting.md)** - Aggregated data exports
- **[Fields](fields.md)** - Define what can be exported
- **[Types](types.md)** - Affect export formatting

---

*Exports are your data's passport to the wider world. They ensure your lead intelligence isn't locked in a silo but flows freely to power your entire business ecosystem. Master exports, and your data truly belongs to you.*