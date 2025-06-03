---
title: Firehose
description: Stream your lead events in real-time to data warehouses and analytics platforms
tags:
  - firehose
  - streaming
  - real-time
  - data-warehouse
---

# Firehose

## Your Real-Time Data Pipeline

Firehose transforms LeadConduit from a lead processor into a streaming data platform. It continuously delivers every event from your flows directly to your data warehouse, analytics tools, or custom systems - enabling real-time dashboards, advanced analytics, and seamless integration with your broader data infrastructure.

📍 **You are here**: Connecting LeadConduit to your data ecosystem
🚀 **What you'll master**: Streaming configuration, data formats, and use cases
💡 **The outcome**: Real-time visibility and analytics across all platforms

## Understanding Firehose

### What Is Firehose?

Firehose is a real-time event streaming service that:
- Captures every event as it happens
- Batches events efficiently
- Delivers to your destination
- Handles failures gracefully
- Scales automatically

Think of it as a data conveyor belt running from LeadConduit to your analytics infrastructure.

### Why Firehose Matters

**Without Firehose**:
- Query events via API (delayed)
- Export data periodically (batch)
- Build polling systems (complex)
- Miss real-time insights (limiting)

**With Firehose**:
- Events stream continuously
- Near real-time delivery (<1 minute)
- No polling needed
- Complete data access

### The Streaming Model

```
Events Generated → Firehose Captures → Batches Created → Delivered to Destination
       ↓                  ↓                   ↓                    ↓
   Every action     Milliseconds         Size/Time based      S3, Kinesis, etc.
```

## Firehose Destinations

### Amazon S3

The most common destination:

```yaml
Destination: Amazon S3
Configuration:
  Bucket: my-leadconduit-events
  Path: /events/year={{year}}/month={{month}}/day={{day}}/
  Format: JSON (newline delimited)
  Compression: GZIP
  
File Pattern: 
  events-2024-01-15-14-30-45-ABC123.json.gz
  
Delivery:
  Frequency: Every 5 minutes or 5MB
  Error Handling: Retry with backoff
```

**Use Cases**:
- Data warehouse loading
- Long-term archival
- Batch analytics
- Compliance storage

### Amazon Kinesis

For real-time processing:

```yaml
Destination: Amazon Kinesis Data Streams
Configuration:
  Stream: leadconduit-events-stream
  Shards: Auto-scaling 1-10
  Partition Key: lead_id
  
Delivery:
  Latency: < 1 second
  Throughput: Up to 1MB/second per shard
```

**Use Cases**:
- Real-time dashboards
- Stream processing
- Alert generation
- Live monitoring

### Azure Event Hubs

Microsoft Azure integration:

```yaml
Destination: Azure Event Hubs
Configuration:
  Namespace: leadconduit-streaming
  Event Hub: lead-events
  Partition Key: source_id
  
Features:
  - Automatic scaling
  - Kafka compatibility
  - Azure integration
```

### Google Cloud Pub/Sub

Google Cloud streaming:

```yaml
Destination: Google Cloud Pub/Sub
Configuration:
  Project: my-gcp-project
  Topic: leadconduit-events
  
Features:
  - Global distribution
  - At-least-once delivery
  - Push/pull options
```

### Custom HTTP Endpoint

Your own systems:

```yaml
Destination: Custom Webhook
Configuration:
  URL: https://analytics.company.com/ingest
  Method: POST
  Headers:
    Authorization: Bearer ${WEBHOOK_TOKEN}
    Content-Type: application/json
  
Batching:
  Max Size: 1MB
  Max Count: 100 events
  Max Wait: 30 seconds
```

## Event Data Format

### Standard Event Structure

Each event delivered contains:

```json
{
  "event_id": "evt_7K9mHpQR3x2B5N8jL4wZ",
  "timestamp": "2024-01-15T14:30:45.234Z",
  "account_id": "acc_3B8nM5kL2Q9pR4wX",
  "flow_id": "flow_8B3nM5kL2Q9pR4wX",
  "lead_id": "lead_5T8nK3mP9Q2wR7xN",
  
  "event_type": "recipient.delivered",
  "entity_type": "buyer",
  "entity_id": "ent_3Q9wK5mN8B2xR7pL",
  
  "outcome": "success",
  "duration_ms": 342,
  
  "metadata": {
    "step_name": "Deliver to Buyer A",
    "integration": "custom_json",
    "buyer_response": {
      "status": "accepted",
      "price": 45.00
    }
  },
  
  "lead_data": {
    // Complete lead snapshot
  },
  
  "firehose_metadata": {
    "batch_id": "batch_9N2mK5pQ3B8wR7xL",
    "sequence": 42,
    "delivered_at": "2024-01-15T14:31:02.123Z"
  }
}
```

### Batch Format

Events are batched for efficiency:

**Newline Delimited JSON**:
```json
{"event_id":"evt_1","timestamp":"2024-01-15T14:30:45.234Z",...}
{"event_id":"evt_2","timestamp":"2024-01-15T14:30:45.567Z",...}
{"event_id":"evt_3","timestamp":"2024-01-15T14:30:45.890Z",...}
```

**JSON Array**:
```json
[
  {"event_id":"evt_1","timestamp":"2024-01-15T14:30:45.234Z",...},
  {"event_id":"evt_2","timestamp":"2024-01-15T14:30:45.567Z",...},
  {"event_id":"evt_3","timestamp":"2024-01-15T14:30:45.890Z",...}
]
```

### Compression Options

Reduce data transfer costs:

- **GZIP**: Best compression, wide support
- **SNAPPY**: Faster, less compression
- **LZ4**: Very fast, moderate compression
- **None**: Raw data, highest speed

## Configuring Firehose

### Basic Setup

Enable Firehose on a flow:

```yaml
Flow: Production Lead Flow
Firehose: Enabled

Settings:
  Destination: S3
  Include Events: All
  Batch Size: 5MB
  Batch Timeout: 5 minutes
  Compression: GZIP
```

### Event Filtering

Stream only what you need:

**By Event Type**:
```yaml
Include Only:
  - source.accepted
  - recipient.delivered
  - recipient.failed
  - feedback.received
```

**By Outcome**:
```yaml
Include Only:
  - Events where outcome = "success"
  - Events where outcome = "failure"
    AND type = "recipient.*"
```

**By Metadata**:
```yaml
Include Only:
  - Events where metadata.price > 20
  - Events where lead_data.state = "CA"
```

### Data Enrichment

Add context to streamed events:

```yaml
Enrich With:
  - Flow name and version
  - Account metadata
  - Custom tags
  - Processing metrics
```

### Security Configuration

Protect your data:

**Encryption**:
```yaml
At Rest: S3 server-side encryption
In Transit: TLS 1.2+
Keys: AWS KMS managed
```

**Access Control**:
```yaml
S3 Bucket Policy:
  - LeadConduit service role: Write only
  - Analytics role: Read only
  - Retention: 90 days
```

**PII Handling**:
```yaml
Masking Rules:
  - SSN: Show last 4 only
  - Email: Partial masking
  - Phone: Area code only
  - Name: First letter only
```

## Common Use Cases

### Real-Time Dashboards

Build live monitoring:

```yaml
Pipeline:
  Firehose → Kinesis → Lambda → DynamoDB → Dashboard

Metrics:
  - Leads per minute by source
  - Acceptance rate (live)
  - Revenue tracking
  - Error rates

Latency: < 10 seconds end-to-end
```

### Data Warehouse Integration

Feed your analytics:

```yaml
Pipeline:
  Firehose → S3 → Glue → Redshift

Process:
  1. Events land in S3 (5 min batches)
  2. Glue catalogs new files
  3. Redshift loads incrementally
  4. BI tools query Redshift

Analytics:
  - Historical trends
  - Cohort analysis
  - Revenue attribution
  - Predictive modeling
```

### Alerting System

Proactive monitoring:

```yaml
Pipeline:
  Firehose → Kinesis → Lambda → SNS

Alert Examples:
  - Rejection rate > 40%
  - No events for 10 minutes
  - Error spike detected
  - High-value lead delivered

Response Time: < 30 seconds
```

### Compliance Archive

Maintain audit trails:

```yaml
Pipeline:
  Firehose → S3 → Glacier

Configuration:
  - All events captured
  - Immutable storage
  - 7-year retention
  - Encrypted at rest
  - Access logging

Compliance:
  - TCPA documentation
  - CCPA data trails
  - SOC 2 evidence
  - Audit support
```

### Machine Learning Pipeline

Enhance decision making:

```yaml
Pipeline:
  Firehose → Kinesis → SageMaker

ML Applications:
  - Lead scoring models
  - Fraud detection
  - Optimal routing
  - Price optimization

Feedback Loop:
  - Model predictions → LeadConduit
  - Results → Firehose → Model training
```

## Performance & Scaling

### Throughput Characteristics

Firehose handles massive scale:

```yaml
Capacity:
  - Events: Up to 100,000/second
  - Data: Up to 1GB/second
  - Latency: Sub-second capture
  - Delivery: 1-5 minutes typical

Auto-scaling:
  - No configuration needed
  - Handles traffic spikes
  - Cost scales with usage
```

### Optimization Strategies

Maximize efficiency:

**Batching**:
```yaml
Small Batches (Real-time priority):
  Size: 1MB
  Timeout: 1 minute
  Use: Dashboards, alerts

Large Batches (Cost priority):
  Size: 128MB
  Timeout: 15 minutes
  Use: Data warehouse, archive
```

**Compression**:
```yaml
High Volume Events:
  Format: JSON + GZIP
  Reduction: 85-95%
  CPU: Minimal impact
```

**Partitioning**:
```yaml
S3 Structure:
  /events/flow={{flow_id}}/year={{year}}/month={{month}}/day={{day}}/hour={{hour}}/

Benefits:
  - Efficient queries
  - Parallel processing
  - Cost optimization
```

## Monitoring Firehose

### Health Metrics

Track streaming health:

```yaml
Key Metrics:
  - Events captured/second
  - Delivery success rate
  - Batch size (average)
  - Delivery latency
  - Error rate

Alerts:
  - Delivery failures > 1%
  - Latency > 5 minutes
  - No events for 10 minutes
```

### Troubleshooting

Common issues and solutions:

**"Events not appearing"**
- Check Firehose enabled on flow
- Verify destination permissions
- Check event filters
- Review error logs

**"High latency"**
- Reduce batch timeout
- Check destination throttling
- Verify network connectivity
- Monitor destination capacity

**"Missing events"**
- Check filtering rules
- Verify no errors in delivery
- Confirm event generation
- Review batch settings

## Cost Optimization

### Streaming Costs

Understand pricing:

```yaml
LeadConduit Firehose: Included with Enterprise
AWS S3 Storage: ~$0.023/GB/month
AWS Kinesis: ~$0.015/shard/hour
Data Transfer: Varies by region

Example (1M events/day):
  - Data Volume: ~10GB/day
  - S3 Storage: ~$7/month
  - Transfer: ~$9/month
  - Total: ~$16/month
```

### Cost Reduction

Minimize expenses:

**Strategies**:
1. Filter unnecessary events
2. Use compression (90% reduction)
3. Optimize batch sizes
4. Lifecycle policies for old data
5. Reserved capacity for destinations

## Best Practices

### Design Principles

1. **Stream Everything Important**
   - Storage is cheap
   - You can't analyze what you didn't capture
   - Filter downstream if needed

2. **Plan for Scale**
   - Design for 10x current volume
   - Use partitioning strategies
   - Implement archival policies

3. **Secure by Default**
   - Encrypt everything
   - Minimal access permissions
   - Audit trail for access
   - PII protection

4. **Monitor Actively**
   - Set up alerts
   - Track key metrics
   - Regular health checks
   - Performance baselines

### Implementation Checklist

Before going live:

- [ ] Destination configured and tested
- [ ] Permissions verified
- [ ] Encryption enabled
- [ ] Monitoring set up
- [ ] Error handling tested
- [ ] PII rules configured
- [ ] Retention policies defined
- [ ] Cost alerts configured

## Your Next Steps

### Essential Setup
1. **[S3 Configuration](/help-guide/firehose/s3-setup)** - Most common destination
2. **[Monitoring Setup](/help-guide/firehose/monitoring)** - Track health
3. **[Cost Calculator](/help-guide/firehose/cost-calc)** - Estimate expenses

### Advanced Integration
1. **[Real-time Analytics](/help-guide/firehose/analytics)** - Build dashboards
2. **[ML Pipelines](/help-guide/firehose/ml-integration)** - Predictive models
3. **[Multi-destination](/help-guide/firehose/fan-out)** - Stream everywhere

### Resources
- **[API Reference](/api/firehose)** - Technical details
- **[Examples](/help-guide/firehose/examples)** - Common patterns
- **[Troubleshooting](/help-guide/firehose/debug)** - Fix issues

---

🚀 **Remember**: Firehose transforms LeadConduit from a lead processor into a data platform. Stream your events, build amazing analytics, and never miss an insight. Your data wants to be free - Firehose sets it free.

*Next: Explore [Reporting](/reporting) to see how streamed data becomes business intelligence.*