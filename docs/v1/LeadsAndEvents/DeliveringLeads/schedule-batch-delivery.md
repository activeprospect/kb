---
layout: page
title: Schedule Batch Delivery
permalink: /LeadsAndEvents/DeliveringLeads/schedule-batch-delivery
---

# Schedule Batch Delivery

Batch delivery in LeadConduit enables efficient processing of leads in scheduled groups, providing recipients with organized data files at predetermined intervals. This delivery method optimizes workflow efficiency while maintaining data quality and delivery reliability.

## Batch Delivery Overview

### When to Use Batch Delivery

**Optimal Use Cases:**
- Recipients prefer scheduled data delivery over real-time processing
- Large volume lead processing requiring organized distribution
- Integration with systems that process data in batches
- Cost optimization through reduced per-transaction processing
- Compliance requirements for data delivery timing and documentation

**Business Scenarios:**
- Daily lead delivery to CRM systems
- Weekly reporting and analysis requirements
- Monthly campaign performance data distribution
- Scheduled integration with external processing systems
- Compliance-driven data delivery schedules

### Batch vs. Real-Time Delivery

**Batch Delivery Advantages:**
- Organized data presentation in structured files
- Reduced system load through scheduled processing
- Better data validation and quality control
- Simplified recipient system integration
- Lower processing costs for high-volume operations

**Real-Time Delivery Advantages:**
- Immediate lead processing and response
- Faster lead response times for sales teams
- Real-time validation and error handling
- Better customer experience with immediate follow-up
- Dynamic pricing and routing capabilities

## Batch Delivery Configuration

### Accessing Batch Configuration

**From Flow Configuration:**
1. Navigate to your specific LeadConduit flow
2. Add or edit a recipient step
3. Select "Batch File Delivery" as the step type
4. Configure batch parameters and settings
5. Save configuration and test delivery

**From Libraries Section:**
1. Access main navigation menu
2. Select "Libraries" section
3. Choose "Batches" subsection
4. View all account-level batch deliveries
5. Edit, enable/disable, or manage existing batches

### Batch Delivery Wizard

**Step-by-Step Configuration:**

**1. Basic Settings:**
- Batch delivery name and description
- Target recipient configuration
- Delivery method selection (email, SFTP, cloud storage)
- File format specification (CSV, Excel, JSON, XML)

**2. Schedule Configuration:**
- Delivery frequency (hourly, daily, weekly, monthly)
- Specific delivery times and time zones
- Weekend and holiday handling
- Custom schedule patterns

**3. File Settings:**
- File naming conventions and templates
- Data formatting and field mapping
- Header row configuration
- File compression and encryption options

**4. Delivery Settings:**
- Recipient contact information
- Authentication credentials (SFTP, cloud storage)
- Delivery confirmation and notifications
- Error handling and retry configuration

**5. Advanced Options:**
- Data filtering and selection criteria
- Custom field mapping and transformation
- Conditional delivery rules
- Integration with external systems

## Delivery Methods

### Email Delivery

**Email Configuration:**
- Recipient email addresses (multiple recipients supported)
- Email subject line templates with dynamic variables
- Email body content and formatting
- Attachment handling and file size limits

**Email Template Variables:**
```
Subject: {{batch.name}} - {{delivery.date}} Leads
Body: Attached please find {{lead.count}} leads for {{delivery.period}}
File: {{batch.name}}_{{delivery.date}}_{{lead.count}}.csv
```

**Email Best Practices:**
- Use clear, descriptive subject lines
- Include delivery summary in email body
- Ensure recipient email addresses are whitelisted
- Monitor delivery success and bounce rates

### SFTP/FTP Delivery

**Connection Configuration:**
- Server hostname and port
- Authentication method (username/password, SSH keys)
- Target directory path
- Connection security and encryption settings

**File Transfer Settings:**
- File naming conventions
- Directory structure organization
- Temporary file handling during transfer
- Transfer completion verification

**SFTP Security:**
- Secure authentication credentials
- Encrypted data transmission
- Access logging and monitoring
- Regular credential rotation

### Cloud Storage Delivery

**Supported Platforms:**
- Amazon S3 bucket delivery
- Google Cloud Storage integration
- Microsoft Azure Blob Storage
- Other S3-compatible storage services

**Cloud Configuration:**
- Storage account credentials and permissions
- Bucket or container specification
- File organization and directory structure
- Access control and security settings

**Cloud Benefits:**
- Scalable storage capacity
- Global accessibility and availability
- Integration with cloud-based processing systems
- Cost-effective long-term storage

## File Formats and Configuration

### CSV File Format

**Standard CSV Configuration:**
- Field delimiter (comma, semicolon, tab)
- Text qualifier handling (quotes, double quotes)
- Header row inclusion and customization
- Character encoding (UTF-8, ASCII, Windows-1252)

**CSV Field Mapping:**
```
CSV Structure Example:
first_name,last_name,email,phone,state,submission_date
John,Smith,john@email.com,555-123-4567,CA,2024-01-15
Jane,Doe,jane@email.com,555-987-6543,TX,2024-01-15
```

### Excel File Format

**Excel Configuration:**
- Worksheet naming and organization
- Multiple sheet support for data categorization
- Cell formatting and data types
- Formula inclusion and calculation

**Excel Advantages:**
- Rich formatting and presentation options
- Multiple worksheet organization
- Built-in data validation and formulas
- Familiar format for business users

### JSON and XML Formats

**JSON Structure:**
```json
{
  "batch_info": {
    "delivery_date": "2024-01-15",
    "lead_count": 150,
    "batch_id": "batch_001"
  },
  "leads": [
    {
      "first_name": "John",
      "last_name": "Smith",
      "email": "john@email.com",
      "phone": "555-123-4567",
      "state": "CA"
    }
  ]
}
```

**XML Configuration:**
- Schema definition and validation
- Namespace management
- Nested data structure support
- Custom element naming and organization

## Scheduling and Timing

### Schedule Configuration Options

**Frequency Settings:**
- **Hourly:** Every hour, specific minutes past hour
- **Daily:** Specific time each day, weekday/weekend options
- **Weekly:** Specific day and time each week
- **Monthly:** Specific date and time each month
- **Custom:** Complex schedules with multiple delivery times

**Time Zone Management:**
- Account time zone configuration
- Recipient-specific time zone settings
- Daylight saving time handling
- International delivery coordination

### Advanced Scheduling

**Conditional Scheduling:**
- Lead volume thresholds for delivery
- Business day vs. weekend delivery rules
- Holiday schedule management
- Emergency delivery procedures

**Schedule Examples:**
```
Business Hours Daily Delivery:
├── Monday-Friday at 9:00 AM local time
├── Minimum 10 leads required for delivery
├── Skip delivery on company holidays
└── Emergency delivery available on-demand

Weekly Summary Delivery:
├── Every Friday at 5:00 PM
├── Include all leads from Monday-Friday
├── Comprehensive weekly summary report
└── Special handling for short weeks
```

## Batch Management and Operations

### Batch Delivery Management

**Operations Available:**
- **Edit:** Modify configuration, schedule, or delivery settings
- **Enable/Disable:** Start or stop batch processing without deletion
- **Deliver Pending:** Trigger immediate delivery of queued leads
- **Make Copy:** Duplicate configuration for similar batches
- **Delete:** Remove batch configuration (requires removal from flows)

**Bulk Operations:**
- Enable/disable multiple batches simultaneously
- Mass configuration updates
- Batch performance monitoring
- Consolidated reporting across batches

### Pending Lead Management

**Lead Queue Management:**
- View pending leads awaiting delivery
- Manual delivery trigger for urgent processing
- Lead queue monitoring and alerting
- Queue size optimization and management

**Out-of-Schedule Delivery:**
- Immediate delivery of pending leads
- Option to include leads in next scheduled delivery
- Emergency delivery procedures
- Queue state preservation options

### File Processing and History

**Processed Files Management:**
- Complete delivery history and tracking
- File download and re-delivery capabilities
- Delivery confirmation and status tracking
- Historical data retention and access

**File Operations:**
```
Processed File Actions:
├── Download: Retrieve previously delivered files
├── Redeliver: Send files again to recipients
├── View Details: Delivery status and metrics
└── Archive: Long-term storage management
```

## Error Handling and Troubleshooting

### Common Delivery Errors

**Email Delivery Issues:**
- **Oversized Attachments:** Files exceeding email size limits
- **Bounced Emails:** Invalid or inactive recipient addresses
- **Spam Filtering:** Emails blocked by recipient systems
- **Authentication Failures:** Sender reputation issues

**SFTP/FTP Connection Problems:**
- **Connection Timeouts:** Network connectivity issues
- **Authentication Failures:** Invalid credentials or permissions
- **Directory Access:** Insufficient permissions or invalid paths
- **File Transfer Interruptions:** Network instability during transfer

**Cloud Storage Issues:**
- **Authentication Errors:** Invalid credentials or expired tokens
- **Bucket Permissions:** Insufficient access rights
- **Storage Quotas:** Exceeded storage limits or restrictions
- **Regional Restrictions:** Geographic access limitations

### Error Resolution Strategies

**Automatic Error Handling:**
- Retry logic with exponential backoff
- Alternative delivery method fallbacks
- Queue preservation during failures
- Automated error notification and alerting

**Manual Error Resolution:**
```
Error Resolution Process:
├── Identify error type and root cause
├── Apply appropriate resolution strategy
├── Test resolution with sample delivery
├── Monitor for recurring issues
└── Update configuration to prevent recurrence
```

### Specific Error Solutions

**File Size Errors:**
```
Error: Message length exceeds 10MB limit
Solution:
├── Enable zip file compression in Advanced settings
├── Split large files into multiple deliveries
├── Use cloud storage for large file delivery
└── Optimize data selection and filtering
```

**Email Delivery Failures:**
```
Error: Message rejected by recipient server
Solution:
├── Whitelist delivery@yourlead.info sender address
├── Remove bouncing email addresses from delivery list
├── Check for out-of-office auto-replies causing issues
└── Use alternative delivery method if needed
```

**SFTP Connection Issues:**
```
Error: Connection failed - ENOTFOUND
Solution:
├── Verify server hostname spelling and availability
├── Check network connectivity and firewall settings
├── Validate authentication credentials
└── Test connection with alternative SFTP client
```

## Performance Optimization

### Delivery Performance

**Optimization Strategies:**
- Optimal batch size for delivery method
- Efficient file format selection
- Data compression and optimization
- Delivery timing for recipient system availability

**Performance Monitoring:**
- Delivery success rates and timing
- File size and processing performance
- Recipient system response and acknowledgment
- Error rates and resolution tracking

### Cost Optimization

**Cost Management:**
- Delivery method cost comparison
- File size optimization for storage and transfer
- Schedule optimization for off-peak processing
- Recipient preference alignment for efficiency

**Resource Utilization:**
- Server resource optimization for large batches
- Network bandwidth management
- Storage optimization for file retention
- Processing queue management and optimization

## Compliance and Security

### Data Security

**Security Measures:**
- Encrypted file transmission for all delivery methods
- Secure authentication for SFTP and cloud storage
- File encryption for sensitive data protection
- Access logging and audit trail maintenance

**Privacy Protection:**
- PII handling compliance during batch processing
- Data retention policies for batch files
- Secure deletion of temporary files
- Cross-border data transfer compliance

### Audit and Compliance

**Audit Trail Requirements:**
- Complete delivery history and documentation
- File access and download tracking
- Configuration change logging
- Compliance reporting capabilities

**Regulatory Compliance:**
- Industry-specific data handling requirements
- Data retention and deletion policies
- Cross-border data transfer regulations
- Privacy regulation compliance (GDPR, CCPA)

## Best Practices

### Configuration Best Practices

**Setup Recommendations:**
- Use descriptive naming conventions for easy identification
- Test configurations with small data sets before full deployment
- Document delivery requirements and recipient preferences
- Implement monitoring and alerting for delivery failures

**Maintenance Procedures:**
- Regular review of delivery performance and success rates
- Periodic validation of recipient contact information
- Configuration backup and disaster recovery planning
- Continuous optimization based on performance metrics

### Operational Excellence

**Monitoring and Management:**
- Daily review of delivery status and error reports
- Proactive maintenance of recipient systems and credentials
- Regular communication with recipients about delivery schedules
- Performance trend analysis and optimization recommendations

**Continuous Improvement:**
- Regular recipient feedback collection and analysis
- A/B testing of delivery methods and schedules
- Technology evaluation and upgrade planning
- Best practice sharing across teams and organizations

Batch delivery provides efficient, organized lead distribution that balances operational efficiency with recipient requirements. Proper configuration, monitoring, and maintenance ensure reliable delivery performance while maintaining data quality and security standards.