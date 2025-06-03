# Batch Delivery Management

Master batch file delivery for high-volume lead processing. Learn to configure, schedule, monitor, and troubleshoot batch deliveries to FTP, SFTP, S3, and other destinations.

## 📍 You Are Here

You need to deliver leads in batches rather than real-time, either for efficiency, partner requirements, or system limitations. This guide covers all aspects of batch delivery configuration and management.

## 🎯 What You'll Learn

- Batch delivery fundamentals
- Configuration options
- File formats and naming
- Scheduling strategies
- Error handling
- Monitoring and alerts

## 📦 Understanding Batch Delivery

### When to Use Batch Delivery

Batch delivery is ideal for:
- **High Volume**: Thousands of leads per day
- **Partner Requirements**: Buyers who prefer file uploads
- **Cost Efficiency**: Reduced API calls
- **Data Warehousing**: Regular data loads
- **Compliance Exports**: Scheduled reports

### Batch vs Real-Time

```javascript
// Real-time delivery
Lead arrives → Immediate delivery → Instant response

// Batch delivery
Lead arrives → Queue → Wait for schedule → Bulk delivery
```

## 🔧 Configuring Batch Delivery

### Basic Configuration

Set up batch delivery step:

```yaml
Step Configuration:
  Type: Batch Delivery
  Name: Daily FTP Upload
  
  Schedule:
    Frequency: Daily
    Time: 02:00 EST
    Days: Monday-Friday
    
  Destination:
    Type: FTP
    Host: ftp.partner.com
    Port: 21
    Username: leadconduit_user
    Password: [encrypted]
    Directory: /incoming/leads/
    
  File Format:
    Type: CSV
    Delimiter: comma
    Include Headers: true
    Encoding: UTF-8
```

### Advanced Options

Fine-tune batch behavior:

```javascript
const batchConfig = {
  // Batching rules
  batching: {
    max_records: 50000,
    max_file_size_mb: 100,
    max_wait_time_hours: 24,
    
    // Trigger conditions (any met)
    triggers: [
      { type: 'record_count', value: 10000 },
      { type: 'time_elapsed', value: '4 hours' },
      { type: 'schedule', value: '0 2 * * *' } // 2 AM daily
    ]
  },
  
  // File handling
  file: {
    naming_pattern: 'leads_{date}_{time}_{batch_id}.csv',
    compression: 'gzip',
    split_large_files: true,
    max_file_size: 50 * 1024 * 1024, // 50MB
    
    // PGP encryption
    encryption: {
      enabled: true,
      public_key: 'partner_public_key.asc',
      armor: true
    }
  },
  
  // Delivery options
  delivery: {
    retry_attempts: 3,
    retry_delay_minutes: 15,
    success_notification: 'batch-success@company.com',
    failure_notification: 'batch-alerts@company.com',
    
    // Delivery confirmation
    confirmation: {
      require_acknowledgment: true,
      timeout_minutes: 30,
      checksum_validation: true
    }
  }
};
```

## 📂 File Formats

### CSV Format

Standard comma-separated:

```csv
lead_id,email,phone,first_name,last_name,state,created_at
12345,john@example.com,5551234567,John,Doe,CA,2024-01-15T10:30:00Z
12346,jane@example.com,5559876543,Jane,Smith,TX,2024-01-15T10:31:00Z
```

Configuration:
```javascript
const csvConfig = {
  delimiter: ',',
  quote_char: '"',
  escape_char: '\\',
  line_ending: '\r\n',
  null_value: '',
  include_headers: true,
  
  // Field configuration
  fields: [
    { name: 'lead_id', source: 'event_id' },
    { name: 'email', source: 'lead.email' },
    { name: 'phone', source: 'lead.phone_1', transform: 'digits_only' },
    { name: 'state', source: 'lead.state', uppercase: true }
  ]
};
```

### XML Format

Structured XML output:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<leads batch_id="20240115_023000" count="2">
  <lead>
    <id>12345</id>
    <contact>
      <email>john@example.com</email>
      <phone>5551234567</phone>
      <name>
        <first>John</first>
        <last>Doe</last>
      </name>
    </contact>
    <location>
      <state>CA</state>
      <zip>90210</zip>
    </location>
  </lead>
</leads>
```

### JSON Format

For modern systems:

```json
{
  "batch_info": {
    "id": "batch_20240115_023000",
    "created": "2024-01-15T02:30:00Z",
    "record_count": 2
  },
  "leads": [
    {
      "id": "12345",
      "email": "john@example.com",
      "phone": "5551234567",
      "metadata": {
        "source": "web_form",
        "quality_score": 85
      }
    }
  ]
}
```

### Fixed Width Format

For legacy systems:

```
John      Doe       john@example.com    5551234567CA90210
Jane      Smith     jane@example.com    5559876543TX75001
```

Configuration:
```javascript
const fixedWidthConfig = {
  fields: [
    { name: 'first_name', start: 1, length: 10, pad: 'right' },
    { name: 'last_name', start: 11, length: 10, pad: 'right' },
    { name: 'email', start: 21, length: 20, pad: 'right' },
    { name: 'phone', start: 41, length: 10, pad: 'left', fill: '0' },
    { name: 'state', start: 51, length: 2 },
    { name: 'zip', start: 53, length: 5 }
  ],
  encoding: 'ISO-8859-1',
  line_ending: '\n'
};
```

## 📍 Delivery Destinations

### SFTP Delivery

Secure file transfer:

```javascript
const sftpConfig = {
  host: 'sftp.partner.com',
  port: 22,
  username: 'batch_user',
  
  // Authentication methods
  authentication: {
    method: 'ssh_key', // or 'password'
    private_key: process.env.SFTP_PRIVATE_KEY,
    passphrase: process.env.KEY_PASSPHRASE
  },
  
  // Directory handling
  remote_path: '/data/incoming/leads/',
  create_directories: true,
  
  // File handling
  temp_suffix: '.tmp',
  atomic_upload: true, // Upload as .tmp, rename when complete
  
  // Connection options
  connection: {
    timeout: 30000,
    keepalive_interval: 10000,
    algorithms: {
      cipher: ['aes256-ctr', 'aes192-ctr', 'aes128-ctr']
    }
  }
};
```

### S3 Delivery

Amazon S3 buckets:

```javascript
const s3Config = {
  bucket: 'partner-lead-intake',
  region: 'us-east-1',
  
  // Path configuration
  key_pattern: 'leads/{year}/{month}/{day}/batch_{timestamp}.csv',
  
  // Authentication
  credentials: {
    method: 'iam_role', // or 'access_keys'
    role_arn: 'arn:aws:iam::123456789:role/LeadConduitBatch'
  },
  
  // S3 options
  options: {
    storage_class: 'STANDARD_IA',
    server_side_encryption: 'AES256',
    
    // Metadata
    metadata: {
      'x-amz-meta-source': 'leadconduit',
      'x-amz-meta-batch-id': '{batch_id}',
      'x-amz-meta-record-count': '{record_count}'
    },
    
    // Lifecycle
    expiration_days: 90,
    
    // Notifications
    event_notifications: {
      sns_topic: 'arn:aws:sns:us-east-1:123456789:batch-delivered'
    }
  }
};
```

### Google Cloud Storage

GCS delivery:

```javascript
const gcsConfig = {
  bucket: 'partner-leads',
  project_id: 'lead-processing-123456',
  
  // Authentication
  credentials: {
    type: 'service_account',
    key_file: '/path/to/service-account-key.json'
  },
  
  // Object configuration
  object_naming: {
    pattern: 'imports/{date}/leads_{batch_id}.csv',
    metadata: {
      source: 'leadconduit',
      environment: 'production'
    }
  }
};
```

### HTTP/Webhook Delivery

Batch POST to endpoints:

```javascript
const httpBatchConfig = {
  endpoint: 'https://api.partner.com/batch-intake',
  method: 'POST',
  
  // Authentication
  auth: {
    type: 'bearer',
    token: process.env.PARTNER_API_TOKEN
  },
  
  // Request configuration
  headers: {
    'Content-Type': 'application/json',
    'X-Batch-ID': '{batch_id}',
    'X-Record-Count': '{record_count}'
  },
  
  // Chunking for large batches
  chunking: {
    enabled: true,
    max_records_per_request: 1000,
    parallel_requests: 3
  },
  
  // Success validation
  success_criteria: {
    status_codes: [200, 201, 202],
    response_path: 'status',
    response_value: 'success'
  }
};
```

## 🗓️ Scheduling Strategies

### Time-Based Scheduling

Regular intervals:

```javascript
const schedules = {
  // Fixed daily time
  daily_morning: {
    cron: '0 6 * * *', // 6 AM every day
    timezone: 'America/New_York'
  },
  
  // Multiple times per day
  twice_daily: {
    cron: '0 8,20 * * *', // 8 AM and 8 PM
    timezone: 'America/New_York'
  },
  
  // Business hours only
  hourly_business: {
    cron: '0 9-17 * * MON-FRI', // Every hour 9 AM - 5 PM weekdays
    timezone: 'America/New_York'
  },
  
  // End of week
  weekly_summary: {
    cron: '0 18 * * FRI', // 6 PM Friday
    timezone: 'America/New_York'
  }
};
```

### Volume-Based Triggers

Batch when threshold reached:

```javascript
const volumeTriggers = {
  // Simple count trigger
  record_count: {
    threshold: 5000,
    check_interval: '5 minutes'
  },
  
  // Size-based trigger
  file_size: {
    threshold_mb: 50,
    compression_estimate: 0.3 // 70% compression
  },
  
  // Composite triggers
  composite: {
    conditions: [
      { type: 'record_count', value: 1000, priority: 'low' },
      { type: 'age', value: '2 hours', priority: 'medium' },
      { type: 'vip_count', value: 10, priority: 'high' }
    ],
    
    // Trigger on any condition met
    operator: 'OR'
  }
};
```

### Dynamic Scheduling

Adjust based on conditions:

```javascript
class DynamicScheduler {
  calculateNextBatch(metrics) {
    const hour = new Date().getHours();
    const pending = metrics.pending_count;
    
    // Rush hour - more frequent batches
    if (hour >= 10 && hour <= 14) {
      if (pending > 1000) return { trigger: 'now' };
      if (pending > 500) return { trigger: '15 minutes' };
    }
    
    // Off hours - less frequent
    if (hour < 6 || hour > 22) {
      if (pending > 5000) return { trigger: 'now' };
      return { trigger: '6 AM' };
    }
    
    // Standard hours
    if (pending > 2500) return { trigger: 'now' };
    return { trigger: '1 hour' };
  }
}
```

## 🚨 Error Handling

### Common Batch Errors

Handle delivery failures:

```javascript
const errorHandlers = {
  // Connection errors
  connection_failed: {
    retry: true,
    max_attempts: 5,
    backoff: 'exponential',
    alert_after: 3,
    
    fallback: {
      action: 'queue_for_manual',
      notification: 'ops-team@company.com'
    }
  },
  
  // Authentication errors
  auth_failed: {
    retry: false,
    action: 'suspend_delivery',
    notification: 'urgent-alerts@company.com',
    
    diagnostic: {
      check_credentials: true,
      verify_permissions: true,
      test_connection: true
    }
  },
  
  // File errors
  file_write_failed: {
    retry: true,
    max_attempts: 3,
    
    checks: [
      'disk_space',
      'file_permissions',
      'path_exists'
    ]
  },
  
  // Partner errors
  partner_rejection: {
    parse_response: true,
    
    handlers: {
      'quota_exceeded': { action: 'delay', until: 'tomorrow' },
      'invalid_format': { action: 'reformat', notify: true },
      'duplicate_batch': { action: 'skip', log: true }
    }
  }
};
```

### Recovery Procedures

Recover from failures:

```javascript
class BatchRecovery {
  async recoverFailedBatch(batchId) {
    const batch = await this.getBatchDetails(batchId);
    
    // Identify failure point
    const failurePoint = this.identifyFailure(batch);
    
    switch (failurePoint) {
      case 'file_generation':
        // Regenerate file from queued records
        return this.regenerateFile(batch);
        
      case 'delivery':
        // Retry delivery with existing file
        return this.retryDelivery(batch);
        
      case 'partial_delivery':
        // Identify and resend missing records
        const missing = await this.findMissingRecords(batch);
        return this.createRecoveryBatch(missing);
        
      case 'corruption':
        // Full rebuild from source
        return this.rebuildBatch(batch);
    }
  }
  
  async validateBatchIntegrity(batch) {
    const checks = {
      record_count: batch.expected_count === batch.actual_count,
      checksum: this.verifyChecksum(batch.file, batch.checksum),
      format: this.validateFormat(batch.file, batch.format),
      encoding: this.verifyEncoding(batch.file, batch.encoding)
    };
    
    return Object.values(checks).every(check => check === true);
  }
}
```

## 📊 Monitoring and Alerts

### Batch Metrics

Track performance:

```javascript
const batchMetrics = {
  // Delivery metrics
  delivery: {
    total_batches: 1543,
    successful: 1520,
    failed: 23,
    success_rate: '98.5%',
    
    avg_delivery_time: '3.2 minutes',
    avg_batch_size: 4532,
    total_records_delivered: 6999876
  },
  
  // Performance metrics
  performance: {
    file_generation_time: {
      avg: '45 seconds',
      p95: '2 minutes',
      p99: '5 minutes'
    },
    
    compression_ratio: 0.28, // 72% reduction
    transfer_speed: '12.5 MB/s'
  },
  
  // Queue metrics
  queue: {
    pending_records: 2341,
    oldest_record_age: '47 minutes',
    estimated_next_batch: '13 minutes',
    
    by_priority: {
      high: 45,
      normal: 2180,
      low: 116
    }
  }
};
```

### Alert Configuration

Proactive monitoring:

```javascript
const alertRules = [
  {
    name: 'Batch Delivery Failed',
    condition: 'batch.status = failed',
    severity: 'high',
    
    notifications: [
      { channel: 'email', recipients: ['ops@company.com'] },
      { channel: 'slack', webhook: process.env.SLACK_ALERTS },
      { channel: 'pagerduty', after_failures: 3 }
    ]
  },
  
  {
    name: 'Queue Backup',
    condition: 'queue.pending_records > 10000',
    severity: 'medium',
    
    actions: [
      { type: 'trigger_batch', immediate: true },
      { type: 'notify', message: 'Queue backup detected' }
    ]
  },
  
  {
    name: 'Slow Delivery',
    condition: 'delivery_time > 10 minutes',
    severity: 'low',
    
    diagnostics: [
      'check_network_latency',
      'verify_file_size',
      'test_partner_endpoint'
    ]
  }
];
```

### Batch Reports

Regular summaries:

```javascript
// Daily batch report
const dailyReport = {
  date: '2024-01-15',
  summary: {
    total_batches: 48,
    total_records: 234567,
    success_rate: '97.9%',
    
    by_destination: [
      { name: 'Partner A', batches: 24, records: 125000 },
      { name: 'Partner B', batches: 12, records: 67890 },
      { name: 'Archive S3', batches: 12, records: 41677 }
    ]
  },
  
  issues: [
    {
      time: '14:32',
      batch_id: 'batch_123',
      error: 'Connection timeout',
      resolution: 'Auto-retry succeeded'
    }
  ],
  
  performance: {
    avg_batch_time: '2.8 minutes',
    peak_hour: '11:00',
    peak_volume: 45678
  }
};
```

## 💡 Best Practices

### Batch Design

1. **Right-size batches**: Balance frequency and size
2. **Include metadata**: Batch ID, timestamp, counts
3. **Enable resume**: Design for partial delivery recovery
4. **Compress large files**: Reduce transfer time and costs
5. **Validate before sending**: Ensure format compliance

### Security

1. **Encrypt in transit**: Use SFTP/HTTPS
2. **Encrypt at rest**: PGP for files
3. **Rotate credentials**: Regular key rotation
4. **Audit access**: Log all batch operations
5. **Secure storage**: Temporary file cleanup

### Reliability

1. **Implement checksums**: Verify file integrity
2. **Keep source data**: Until delivery confirmed
3. **Monitor continuously**: Proactive alerts
4. **Test regularly**: Delivery path validation
5. **Document procedures**: Recovery runbooks

## 📚 Related Documentation

- [Batch Delivery Setup](./batch-delivery.md) - Configuration guide
- [File Formats](../data-management/export-formats.md) - Format specifications
- [Performance Optimization](../best-practices/performance-optimization.md) - Speed tips

---

📦 **Batch Excellence**: Well-managed batch delivery combines efficiency with reliability. Configure thoughtfully, monitor closely, and always have a recovery plan!