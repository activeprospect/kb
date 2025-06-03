# Data Exports and Analytics

Master LeadConduit's data export capabilities for advanced analytics, compliance, and business intelligence. Learn to extract, transform, and analyze your lead data at scale.

## 📍 You Are Here

You need to export lead data for analysis, compliance, or integration with external BI tools. This guide covers all export methods, from simple CSV downloads to automated data pipelines.

## 🎯 What You'll Learn

- Export methods and formats
- Automated export scheduling
- Data transformation techniques
- Analytics integration
- Compliance exports
- Performance optimization

## 📊 Export Methods Overview

### Manual Exports

Quick data extraction via UI:

**Events Export**:
- Navigate to Events tab
- Apply filters
- Click Export
- Choose format (CSV, JSON, XML)
- Select fields
- Download

**Reports Export**:
- Open report
- Run with parameters
- Click Export
- Choose format
- Download or email

### API Exports

Programmatic data access:

```bash
# Export events via API
GET https://app.leadconduit.com/api/events/export
  ?start_date=2024-01-01
  &end_date=2024-01-31
  &format=json
  &fields=email,phone,outcome,price

# Export with pagination
GET https://app.leadconduit.com/api/events/export
  ?page=1
  &per_page=1000
  &sort=created_at:desc
```

### Scheduled Exports

Automated recurring exports:
- Daily summaries
- Weekly reports
- Monthly compliance
- Custom schedules

## 🔧 Configuring Exports

### Field Selection

Choose what to export:

```javascript
// Core lead fields
const leadFields = [
  'event_id',
  'created_at',
  'email',
  'phone',
  'first_name',
  'last_name',
  'state',
  'zip'
];

// Processing data
const processingFields = [
  'outcome',
  'rejection_reason',
  'acceptance_criteria_result',
  'total_duration_ms'
];

// Financial data
const financialFields = [
  'purchase_price',
  'sale_price',
  'margin',
  'buyer_id'
];

// Compliance data
const complianceFields = [
  'consent_text',
  'consent_timestamp',
  'trustedform_cert_url',
  'ip_address'
];
```

### Data Filtering

Export specific subsets:

```javascript
// Time-based filters
filters: {
  created_at: {
    start: '2024-01-01T00:00:00Z',
    end: '2024-01-31T23:59:59Z'
  }
}

// Outcome filters
filters: {
  outcome: ['success', 'failure'],
  rejection_reason: {
    not_in: ['duplicate', 'test']
  }
}

// Complex filters
filters: {
  and: [
    { field: 'state', operator: 'in', value: ['CA', 'TX'] },
    { field: 'price', operator: '>', value: 50 },
    { field: 'source', operator: 'contains', value: 'google' }
  ]
}
```

### Format Options

Choose appropriate format:

**CSV Format**:
```csv
event_id,email,phone,outcome,price,created_at
evt_123,john@example.com,5551234567,success,45.00,2024-01-15T10:30:00Z
evt_124,jane@example.com,5559876543,failure,0.00,2024-01-15T10:31:00Z
```

**JSON Format**:
```json
[
  {
    "event_id": "evt_123",
    "email": "john@example.com",
    "phone": "5551234567",
    "outcome": "success",
    "price": 45.00,
    "created_at": "2024-01-15T10:30:00Z"
  }
]
```

**XML Format**:
```xml
<events>
  <event>
    <event_id>evt_123</event_id>
    <email>john@example.com</email>
    <phone>5551234567</phone>
    <outcome>success</outcome>
    <price>45.00</price>
    <created_at>2024-01-15T10:30:00Z</created_at>
  </event>
</events>
```

## 🔄 Automated Export Pipelines

### Scheduled Export Configuration

Set up recurring exports:

```javascript
const exportConfig = {
  name: "Daily Revenue Report",
  schedule: {
    frequency: "daily",
    time: "09:00",
    timezone: "America/New_York"
  },
  filters: {
    created_at: "yesterday",
    outcome: "success"
  },
  fields: [
    "event_id",
    "source",
    "buyer",
    "price",
    "margin"
  ],
  format: "csv",
  delivery: {
    method: "email",
    recipients: ["analytics@company.com"],
    subject: "Daily Revenue Report - {date}"
  }
};
```

### SFTP Delivery

Automated file delivery:

```javascript
const sftpConfig = {
  host: "sftp.analytics.company.com",
  port: 22,
  username: "leadconduit_export",
  authentication: "ssh_key",
  directory: "/imports/leadconduit/",
  filename_pattern: "leads_{date}_{time}.csv",
  compression: "gzip"
};

// Configure in export
delivery: {
  method: "sftp",
  config: sftpConfig,
  retry: {
    attempts: 3,
    delay: 300
  }
}
```

### S3 Integration

Direct to data lake:

```javascript
const s3Config = {
  bucket: "company-data-lake",
  region: "us-east-1",
  path: "leadconduit/exports/{year}/{month}/{day}/",
  filename: "leads_{timestamp}.json",
  access: "iam_role",
  encryption: "AES256",
  storage_class: "INTELLIGENT_TIERING"
};

// Partition by date for Athena
partitioning: {
  scheme: "year/month/day",
  format: "hive"
}
```

## 📈 Analytics Integration

### Business Intelligence Tools

Connect to BI platforms:

**Tableau Connection**:
```javascript
// Web Data Connector
const tableauWDC = {
  endpoint: "https://app.leadconduit.com/tableau/connector",
  authentication: "api_key",
  refresh_interval: 3600,
  incremental_refresh: true
};
```

**Power BI Integration**:
```javascript
// REST API Connection
const powerBIConfig = {
  url: "https://app.leadconduit.com/api/analytics",
  authentication: {
    type: "Bearer",
    token: "{api_token}"
  },
  tables: ["events", "leads", "buyers", "sources"]
};
```

**Looker/Data Studio**:
```sql
-- Custom SQL for Looker
SELECT 
  DATE(created_at) as date,
  source,
  state,
  COUNT(*) as lead_count,
  SUM(CASE WHEN outcome = 'success' THEN 1 ELSE 0 END) as success_count,
  AVG(price) as avg_price,
  SUM(price) as revenue
FROM leadconduit_events
WHERE created_at >= CURRENT_DATE - INTERVAL '30 days'
GROUP BY 1, 2, 3
```

### Data Warehouse Loading

ETL/ELT pipelines:

```python
# Python ETL Example
import pandas as pd
from sqlalchemy import create_engine

class LeadConduitETL:
    def __init__(self, api_key):
        self.api_key = api_key
        self.engine = create_engine('postgresql://warehouse')
    
    def extract(self, date_range):
        """Extract data from LeadConduit API"""
        endpoint = "https://app.leadconduit.com/api/events/export"
        params = {
            'start_date': date_range['start'],
            'end_date': date_range['end'],
            'format': 'json'
        }
        response = requests.get(endpoint, params=params, 
                               headers={'X-API-Key': self.api_key})
        return pd.DataFrame(response.json())
    
    def transform(self, df):
        """Transform and enrich data"""
        # Add calculated fields
        df['hour_of_day'] = pd.to_datetime(df['created_at']).dt.hour
        df['day_of_week'] = pd.to_datetime(df['created_at']).dt.dayofweek
        df['conversion'] = df['outcome'] == 'success'
        
        # Standardize fields
        df['state'] = df['state'].str.upper()
        df['email_domain'] = df['email'].str.split('@').str[1]
        
        return df
    
    def load(self, df, table_name='leadconduit_events'):
        """Load to data warehouse"""
        df.to_sql(table_name, self.engine, if_exists='append', index=False)
```

## 📊 Advanced Analytics Exports

### Cohort Analysis Data

Export for retention analysis:

```javascript
const cohortExport = {
  name: "Monthly Cohort Data",
  grouping: {
    cohort_field: "created_at",
    cohort_period: "month",
    activity_field: "last_activity_date"
  },
  metrics: [
    "lead_count",
    "conversion_count",
    "revenue_sum",
    "avg_quality_score"
  ],
  filters: {
    created_at: {
      start: "2023-01-01",
      end: "2023-12-31"
    }
  },
  output_format: "pivot_table"
};
```

### Attribution Analysis

Multi-touch attribution data:

```javascript
const attributionExport = {
  name: "Attribution Analysis",
  include_touchpoints: true,
  attribution_window: 30, // days
  models: ["first_touch", "last_touch", "linear", "time_decay"],
  dimensions: ["source", "medium", "campaign"],
  metrics: ["conversions", "revenue", "cost"],
  group_by: ["attribution_model", "dimension"]
};
```

### Predictive Model Training

Export for ML pipelines:

```javascript
const mlExport = {
  name: "ML Training Data",
  fields: [
    // Features
    "state", "age", "income_range", "credit_range",
    "source", "time_of_day", "day_of_week",
    "email_domain_type", "phone_line_type",
    
    // Labels
    "converted_within_7_days",
    "lifetime_value",
    "quality_score"
  ],
  filters: {
    created_at: {
      start: "2023-01-01",
      end: "2023-12-31"
    },
    exclude_test_data: true
  },
  sampling: {
    method: "stratified",
    target: "converted_within_7_days",
    size: 100000
  },
  format: "parquet" // Efficient for ML
};
```

## 🛡️ Compliance Exports

### GDPR Data Requests

Handle right to access:

```javascript
const gdprExport = {
  type: "gdpr_subject_access",
  identifier: {
    email: "user@example.com",
    phone: "5551234567"
  },
  include: [
    "all_lead_data",
    "processing_history",
    "consent_records",
    "data_sharing_log"
  ],
  format: "encrypted_zip",
  delivery: "secure_link"
};
```

### Audit Trail Exports

Compliance documentation:

```javascript
const auditExport = {
  name: "Monthly Compliance Audit",
  date_range: "last_month",
  include: [
    {
      type: "consent_records",
      fields: ["email", "consent_text", "timestamp", "ip_address", "page_url"]
    },
    {
      type: "opt_outs",
      fields: ["identifier", "opt_out_date", "method", "confirmation"]
    },
    {
      type: "data_access_log",
      fields: ["user", "action", "timestamp", "data_accessed"]
    }
  ],
  format: "csv",
  encryption: "pgp",
  retention: "7_years"
};
```

## ⚡ Performance Optimization

### Large Export Handling

Stream large datasets:

```javascript
class StreamingExporter {
  async exportLargeDataset(config) {
    const CHUNK_SIZE = 10000;
    let offset = 0;
    let hasMore = true;
    
    // Initialize output stream
    const outputStream = this.createOutputStream(config);
    
    while (hasMore) {
      // Fetch chunk
      const chunk = await this.fetchChunk(config, offset, CHUNK_SIZE);
      
      // Process and write
      const processed = this.processChunk(chunk, config);
      await outputStream.write(processed);
      
      // Update position
      offset += chunk.length;
      hasMore = chunk.length === CHUNK_SIZE;
      
      // Progress callback
      if (config.onProgress) {
        config.onProgress({
          processed: offset,
          estimated_total: this.estimateTotal(config)
        });
      }
    }
    
    await outputStream.close();
  }
}
```

### Export Optimization

Speed up exports:

```javascript
const optimizedExport = {
  // Minimize fields
  fields: ["only", "required", "fields"],
  
  // Use efficient formats
  format: "parquet", // For analytics
  compression: "snappy", // Fast compression
  
  // Parallel processing
  parallel_streams: 4,
  
  // Smart filtering
  pre_aggregate: true,
  push_down_predicates: true,
  
  // Caching
  use_cache: true,
  cache_ttl: 3600
};
```

## 📋 Export Management

### Monitoring Exports

Track export health:

```javascript
const exportMonitoring = {
  metrics: {
    export_duration: "avg, p95, p99",
    export_size: "bytes, records",
    export_failures: "count, reasons",
    delivery_success: "rate"
  },
  alerts: [
    {
      condition: "export_duration > 30 minutes",
      action: "notify_ops"
    },
    {
      condition: "export_failures > 3 in 1 hour",
      action: "page_on_call"
    }
  ]
};
```

### Export Governance

Control and audit exports:

```javascript
class ExportGovernance {
  async requestExport(user, config) {
    // Check permissions
    if (!this.hasExportPermission(user, config)) {
      throw new Error('Insufficient permissions');
    }
    
    // Apply data policies
    config = this.applyDataPolicies(config, user);
    
    // Log request
    await this.logExportRequest({
      user: user.id,
      config: config,
      timestamp: new Date(),
      ip_address: user.ip
    });
    
    // PII masking if required
    if (config.mask_pii) {
      config.transformations.push(this.piiMasking);
    }
    
    return this.executeExport(config);
  }
}
```

## 💡 Best Practices

### Export Strategy

Plan your exports:
1. **Define purpose** - Analytics, compliance, or integration?
2. **Choose frequency** - Real-time, daily, or on-demand?
3. **Select format** - Consider downstream usage
4. **Optimize size** - Export only needed fields
5. **Secure delivery** - Encrypt sensitive data

### Data Quality

Ensure export quality:
```javascript
// Add data quality checks
const qualityChecks = {
  pre_export: [
    "validate_date_ranges",
    "check_field_completeness",
    "verify_no_duplicates"
  ],
  post_export: [
    "verify_record_count",
    "check_file_integrity",
    "validate_schema"
  ]
};
```

### Documentation

Document your exports:
```yaml
Export: Daily Analytics Feed
Purpose: Populate data warehouse for BI
Schedule: Daily at 2 AM EST
Format: Parquet
Destination: S3://analytics/leadconduit/
Fields: [list of fields]
Filters: Only successful leads
Owner: Data Team
SLA: Available by 6 AM EST
```

## 📚 Related Documentation

- [Custom Reports](./custom-reports.md) - Building reports
- [Understanding Events](./understanding-events.md) - Event data model
- [API Reference](../../reference/export-api.md) - Export API details

---

📊 **Export Excellence**: Effective data exports power analytics, ensure compliance, and enable integration. Plan your export strategy carefully and automate wherever possible!