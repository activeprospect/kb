---
title: Exports
description: Extract and archive your lead data for analysis, compliance, and integration
tags:
  - exports
  - data-extraction
  - archival
  - integration
---

# Exports

## Liberate Your Lead Data

Exports are your bridge between LeadConduit and the rest of your data ecosystem. They transform your leads and events from a live operational system into portable datasets ready for spreadsheets, data warehouses, machine learning platforms, or long-term archival. While reports show you insights within LeadConduit, exports give you the raw materials to build your own.

📍 **You are here**: Learning to extract and utilize your lead data
💾 **What you'll master**: Export types, automation, and integration patterns
🚀 **The outcome**: Seamless data flow to all your systems

## Understanding Exports

### Exports vs Reports vs Firehose

Each serves a different purpose:

**Reports** 📊
- Visualizations and summaries
- Within LeadConduit
- Real-time dashboards
- Immediate insights

**Exports** 📁
- Raw data extraction
- To external systems
- Scheduled or on-demand
- Complete datasets

**Firehose** 🌊
- Continuous streaming
- Real-time delivery
- Event-based
- Always on

### Export Philosophy

LeadConduit exports follow principles:

1. **Complete Data** - Every field available
2. **Flexible Formats** - Match your needs
3. **Automated Delivery** - Set and forget
4. **Secure Transfer** - Protected always
5. **Scalable Size** - Millions of records

## Types of Exports

### Lead Exports

Extract lead data with full detail:

```yaml
What's Included:
  - Lead ID and metadata
  - All submitted fields
  - Parsed type components
  - Appended enhancement data
  - Processing outcomes
  - Financial data
  - Custom fields

Format Options:
  - CSV (Excel-ready)
  - JSON (Developer-friendly)
  - TSV (Tab-separated)
  - XML (Legacy systems)

Example CSV:
lead_id,timestamp,email,email.valid,phone,state,revenue,margin
ABC123,2024-01-15T10:30:45Z,john@example.com,true,5551234567,CA,45.00,30.00
DEF456,2024-01-15T10:31:12Z,jane@example.com,true,5559876543,TX,38.00,23.00
```

### Event Exports

Complete audit trail extraction:

```yaml
What's Included:
  - Event ID and type
  - Precise timestamp
  - Lead snapshot
  - Event metadata
  - Processing details
  - Duration metrics

Use Cases:
  - Compliance audits
  - Detailed analysis
  - System debugging
  - Historical research

Example: All delivery events
event_id,type,timestamp,lead_id,outcome,buyer,price
evt_123,recipient.delivered,2024-01-15T10:30:45Z,ABC123,success,BuyerA,45.00
evt_124,recipient.failed,2024-01-15T10:31:12Z,DEF456,duplicate,BuyerB,0.00
```

### Summary Exports

Pre-aggregated data:

```yaml
What's Included:
  - Calculated metrics
  - Grouped by dimensions
  - Time-based summaries
  - Statistical data

Use Cases:
  - Executive reports
  - Trend analysis
  - Quick insights
  - External dashboards

Example: Daily source summary
date,source,leads,accepted,delivered,revenue,cost,margin
2024-01-15,SourceA,1000,850,800,40000,15000,25000
2024-01-15,SourceB,500,450,425,21250,7500,13750
```

### Custom Exports

Tailored extractions:

```yaml
Define Your Export:
  - Select specific fields
  - Add calculated columns
  - Apply complex filters
  - Custom formatting

Example: Marketing export
email,first_name,state,score,segment,opt_in_date
john@example.com,John,CA,85,Premium,2024-01-10
jane@example.com,Jane,TX,72,Standard,2024-01-12
```

## Export Configuration

### Field Selection

Choose what to include:

**All Fields** (Default):
```yaml
Includes:
  - Every lead field
  - All type components
  - Appended data
  - System fields

File Size: Larger
Use When: Complete backup needed
```

**Selected Fields**:
```yaml
Choose:
  ✓ lead_id
  ✓ email
  ✓ phone_1
  ✓ state
  ✓ revenue
  ✓ delivered_at
  ✗ user_agent (excluded)
  ✗ ip_address (excluded)

Benefits:
  - Smaller files
  - Faster processing
  - Privacy compliance
  - Focused analysis
```

**Smart Selection**:
```yaml
Patterns:
  - Include: lead.* (all lead fields)
  - Include: *.valid (all validation results)
  - Exclude: appended.* (no enhancement data)
  - Exclude: *pii* (no personal info)
```

### Filtering Options

Export only what you need:

**Time-Based Filters**:
```yaml
Common Patterns:
  - Yesterday's leads
  - Last 7 days
  - Previous month
  - Date range (Jan 1-15)
  - Business hours only

Example:
  timestamp >= "2024-01-01"
  AND timestamp < "2024-02-01"
```

**Status Filters**:
```yaml
By Outcome:
  - Delivered successfully
  - Rejected at source
  - Failed delivery
  - Pending processing

Example:
  outcome = "delivered"
  AND revenue > 0
```

**Data Filters**:
```yaml
By Characteristics:
  - Specific states
  - Score ranges
  - Source types
  - Quality tiers

Example:
  state IN ("CA", "TX", "FL")
  AND lead_score >= 70
  AND email.valid = true
```

### Format Details

Match your destination needs:

**CSV Format**:
```yaml
Characteristics:
  - Headers in first row
  - Comma-separated
  - Quoted strings
  - UTF-8 encoding
  - Excel-compatible

Settings:
  - Delimiter: , (comma)
  - Quote char: " (double)
  - Escape char: \
  - Line ending: \n
  - Null value: (empty)
```

**JSON Format**:
```yaml
Structures:
  Array of objects:
  [
    {"lead_id": "ABC123", "email": "john@example.com"},
    {"lead_id": "DEF456", "email": "jane@example.com"}
  ]

  Newline delimited:
  {"lead_id": "ABC123", "email": "john@example.com"}
  {"lead_id": "DEF456", "email": "jane@example.com"}

Settings:
  - Pretty print: Optional
  - Date format: ISO 8601
  - Null value: null
  - Boolean: true/false
```

## Scheduling & Automation

### Scheduled Exports

Set it and forget it:

**Daily Backup**:
```yaml
Schedule: Daily at 2 AM
Export: Previous day's leads
Format: JSON (compressed)
Delivery: S3 bucket
Path: /backups/leads/{{date}}/
Retention: 90 days
```

**Weekly Reports**:
```yaml
Schedule: Monday 6 AM
Export: Previous week summary
Format: CSV
Delivery: Email
Recipients: analytics@company.com
Subject: Weekly Lead Export - {{week}}
```

**Monthly Archives**:
```yaml
Schedule: 1st of month
Export: Previous month (all events)
Format: JSON.GZ
Delivery: Glacier
Path: /archive/{{year}}/{{month}}/
Retention: 7 years
```

### Delivery Methods

Get exports where needed:

**Email Delivery**:
```yaml
Settings:
  - Max size: 25MB
  - Compression: ZIP
  - Password: Optional
  - Recipients: Multiple

Good for:
  - Small exports
  - Manual analysis
  - Scheduled reports
```

**SFTP Upload**:
```yaml
Settings:
  - Host: sftp.company.com
  - Port: 22
  - Username: leadconduit
  - Key auth: Preferred
  - Path: /imports/leads/

Good for:
  - Large files
  - Automated systems
  - Secure transfer
```

**Cloud Storage**:
```yaml
S3 Bucket:
  - Bucket: my-lead-exports
  - Region: us-east-1
  - Path: /exports/{{date}}/
  - Encryption: AES-256
  - Lifecycle: Transition to Glacier

Google Cloud Storage:
  - Bucket: lead-exports
  - Path: /data/{{date}}/
  
Azure Blob:
  - Container: exports
  - Path: /leads/{{date}}/
```

**Webhook POST**:
```yaml
Settings:
  - URL: https://api.company.com/import
  - Method: POST
  - Headers: 
      Authorization: Bearer {{token}}
  - Format: JSON
  - Batch size: 1000 records

Good for:
  - Real-time processing
  - Direct integration
  - Streaming ingestion
```

## Common Export Patterns

### Data Warehouse Loading

Feed your analytics:

```yaml
Pattern: Daily incremental load
Export Config:
  - Schedule: Daily 3 AM
  - Filter: Yesterday's data
  - Format: CSV
  - Delivery: S3
  
ETL Process:
  1. Export lands in S3
  2. Spark job processes
  3. Load into Redshift
  4. Update BI tools

Fields:
  - All lead data
  - Calculated metrics
  - Denormalized for queries
```

### CRM Synchronization

Keep systems in sync:

```yaml
Pattern: Hourly updates
Export Config:
  - Schedule: Every hour
  - Filter: Modified in last hour
  - Format: JSON
  - Delivery: API webhook
  
Integration:
  1. Export triggers webhook
  2. CRM processes updates
  3. Match on email/phone
  4. Update lead status

Fields:
  - Contact info
  - Latest status
  - Quality scores
  - Source attribution
```

### Compliance Archives

Meet regulatory requirements:

```yaml
Pattern: Complete monthly archive
Export Config:
  - Schedule: Monthly
  - Filter: All data
  - Format: JSON (compressed)
  - Delivery: Glacier
  
Compliance:
  - All events included
  - Immutable storage
  - 7-year retention
  - Encrypted at rest
  - Access logging

Contents:
  - Full lead data
  - All events
  - Consent records
  - Processing history
```

### Marketing Lists

Segmented contact lists:

```yaml
Pattern: Weekly segment export
Export Config:
  - Schedule: Weekly
  - Filter: Converted leads
  - Format: CSV
  - Delivery: Email
  
Segments:
  - High value (score > 80)
  - Recent (last 7 days)
  - By product interest
  - By geography

Fields:
  - Email
  - Name
  - Preferences
  - Engagement score
```

### Financial Reconciliation

Match the books:

```yaml
Pattern: Daily financial export
Export Config:
  - Schedule: Daily 6 AM
  - Filter: Previous day delivered
  - Format: CSV
  - Delivery: SFTP
  
Finance Data:
  - Lead ID
  - Source + cost
  - Buyer + revenue  
  - Margin
  - Timestamps
  - Invoice references
```

## Large Export Handling

### Chunking Strategy

Handle millions of records:

**Size-Based Chunks**:
```yaml
Configuration:
  - Max rows: 100,000
  - Max size: 1GB
  - Naming: export_part_001.csv
  
Benefits:
  - Manageable files
  - Parallel processing
  - Faster transfers
```

**Time-Based Chunks**:
```yaml
Monthly export by week:
  - Week 1: Jan 1-7
  - Week 2: Jan 8-14
  - Week 3: Jan 15-21
  - Week 4: Jan 22-31
  
Benefits:
  - Logical divisions
  - Easy to process
  - Clear organization
```

### Compression Options

Reduce transfer size:

```yaml
Formats:
  - ZIP: Universal support
  - GZIP: Best compression
  - 7Z: Maximum compression
  - TAR.GZ: Unix-friendly

Savings:
  - CSV: 80-90% reduction
  - JSON: 85-95% reduction
  - Already compressed: 5-10%
```

### Performance Tips

Make exports fast:

**Query Optimization**:
- Filter early
- Limit fields
- Use indexes
- Avoid complex joins

**Processing Tips**:
- Off-peak scheduling
- Parallel generation
- Streaming writes
- Direct to storage

## Security & Privacy

### Data Protection

Keep exports secure:

**In Transit**:
```yaml
Requirements:
  - TLS 1.2+ always
  - SFTP/FTPS only
  - Encrypted email
  - VPN option

Never:
  - Plain FTP
  - Unencrypted email
  - Public URLs
  - Shared passwords
```

**At Rest**:
```yaml
Storage:
  - Encrypted buckets
  - Access controls
  - Audit logging
  - Time-limited URLs

Retention:
  - Define policies
  - Auto-deletion
  - Secure disposal
  - Compliance aligned
```

### PII Handling

Protect sensitive data:

**Exclusion Options**:
```yaml
Remove PII:
  - SSN: Exclude entirely
  - Email: Hash or mask
  - Phone: Last 4 only
  - Name: Initials only
  - Address: City/State only
```

**Masking Examples**:
```yaml
Original: john.doe@example.com
Masked: j***.d**@example.com

Original: 555-123-4567
Masked: XXX-XXX-4567

Original: 123-45-6789
Masked: XXX-XX-6789
```

### Access Control

Limit who can export:

```yaml
Roles:
  - Admin: All exports
  - Analyst: Anonymized only
  - Operations: Recent data
  - Auditor: Read-only

Permissions:
  - Create exports
  - Schedule exports
  - Download files
  - Delete exports
```

## Monitoring & Management

### Export Tracking

Know what's happening:

**Status Monitoring**:
```yaml
Track:
  - Scheduled: Waiting to run
  - Running: In progress
  - Completed: Ready
  - Failed: Error occurred
  - Expired: Auto-deleted

Alerts:
  - Export failed
  - Large export warning
  - Delivery failure
  - Storage limit approaching
```

### Cost Management

Control export costs:

```yaml
Costs:
  - Processing: Included
  - Storage: $0.023/GB/month
  - Transfer: $0.09/GB
  - Compression: Saves 90%

Optimization:
  - Compress always
  - Limit retention
  - Filter unnecessary data
  - Schedule off-peak
```

### Troubleshooting

Common issues:

**"Export taking too long"**
- Reduce date range
- Limit fields
- Add filters
- Check system load

**"File too large"**
- Enable chunking
- Use compression
- Reduce scope
- Stream delivery

**"Delivery failed"**
- Check credentials
- Verify permissions
- Test connectivity
- Review error logs

## Best Practices

### Design Principles

1. **Purpose-Driven**
   - Export for specific use
   - Include only needed data
   - Format for destination
   - Document purpose

2. **Automated**
   - Schedule everything possible
   - Minimize manual exports
   - Chain with workflows
   - Monitor automatically

3. **Secure**
   - Encrypt always
   - Limit access
   - Audit usage
   - Expire promptly

4. **Efficient**
   - Compress large files
   - Filter at source
   - Use appropriate format
   - Clean up old exports

### Export Strategy

Plan your approach:

**Regular Exports**:
- Daily operational data
- Weekly summaries
- Monthly archives
- Yearly compliance

**Ad-Hoc Exports**:
- Investigation data
- Custom analysis
- Partner requests
- Audit support

**Integration Exports**:
- CRM sync
- BI feeds
- ML datasets
- Backup systems

## Your Next Steps

### Quick Start
1. **[First Export](/exports/quick-start)** - Create one now
2. **[Schedule Setup](/exports/scheduling)** - Automate delivery
3. **[Security Guide](/exports/security)** - Protect your data

### Advanced Topics
1. **[Warehouse Integration](/exports/data-warehouse)** - ETL patterns
2. **[API Exports](/exports/api-access)** - Programmatic access
3. **[Custom Formats](/exports/custom-formats)** - Special needs

### Resources
- **[Export Templates](/exports/templates)** - Common configurations
- **[Size Calculator](/exports/calculator)** - Estimate file sizes
- **[Troubleshooting](/exports/troubleshooting)** - Fix issues

---

💾 **Remember**: Your data has value beyond LeadConduit. Exports unlock that value, feeding your BI tools, training your ML models, and satisfying your compliance needs. Export thoughtfully, automate religiously, and let your data work everywhere it's needed.

*Congratulations! You've completed the core LeadConduit documentation journey. Ready to put it all into practice? Start with [Creating Your First Flow](/getting-started/first-flow) or dive deep into any topic that interests you.*