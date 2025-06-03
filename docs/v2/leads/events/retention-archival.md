---
title: Event Retention & Archival
description: Manage event lifecycle from real-time access through long-term compliance storage
tags:
  - events
  - retention
  - archival
  - compliance
  - data-management
---

# Event Retention & Archival

## Balancing Access, Cost, and Compliance

Events are the memory of your lead operation, but keeping every event forever isn't practical or necessary. This guide covers retention strategies that balance immediate access needs, storage costs, and compliance requirements while ensuring you never lose critical business intelligence.

📍 **You are here**: Planning your event data lifecycle
⏰ **What you'll master**: Retention policies, archival strategies, and compliance
💾 **The outcome**: Cost-effective event management that meets all needs

## Understanding Event Lifecycle

### The Journey of an Event

Events move through distinct phases:

```
Real-time (0-24 hours)
    ↓
Active (1-30 days)
    ↓
Historical (31-365 days)
    ↓
Archived (1-7 years)
    ↓
Purged (permanent deletion)
```

Each phase serves different needs with different access patterns.

### Why Retention Matters

**Business Needs**:
- Recent events for operations
- Monthly data for analysis  
- Annual data for trends
- Multi-year for compliance

**Cost Reality**:
- Storage costs compound
- Query performance degrades
- Maintenance overhead grows
- Backup complexity increases

## Standard Retention Policies

### Default LeadConduit Retention

Out-of-the-box settings:

```yaml
Standard Plan:
  Live Events: 30 days
  API Access: 30 days
  Exports: On-demand
  
Extended Plans:
  Live Events: 90-365 days
  API Access: Same as live
  Exports: Automated available
  
Enterprise:
  Custom retention
  Archival options
  Compliance features
```

### Industry-Specific Requirements

Common compliance needs:

```yaml
Insurance:
  TCPA Compliance: 4 years
  State Requirements: Varies (3-7 years)
  Best Practice: 5 years
  
Financial Services:
  Transaction Records: 7 years
  Compliance Docs: 7 years
  Audit Trail: Complete
  
Healthcare:
  HIPAA Requirements: 6 years
  State Laws: May extend
  Safe Harbor: 7 years
  
General Business:
  Tax Records: 3-7 years
  Contracts: Active + 7
  Litigation Hold: Indefinite
```

## Retention Strategy Design

### Tiered Retention Model

Different retention by importance:

```yaml
Tier 1 - Critical Events (7 years):
  - source.submitted
  - source.accepted
  - recipient.delivered
  - feedback.received
  - Compliance events
  
Tier 2 - Operational Events (1 year):
  - filter.passed/failed
  - enhancement.success/failed
  - flow.completed
  - Most errors
  
Tier 3 - Diagnostic Events (90 days):
  - System monitoring
  - Performance metrics
  - Debug information
  - Temporary data
```

### Retention by Event Type

Optimize by purpose:

```yaml
Financial Events - 7 years:
  Why: Audit requirements
  Events:
    - All delivered with price
    - All feedback with revenue
    - Credit/refund events
    - Billing records
    
Quality Events - 2 years:
  Why: Trend analysis
  Events:
    - Acceptance/rejection
    - Return reasons
    - Quality scores
    - Source performance
    
Technical Events - 90 days:
  Why: Troubleshooting
  Events:
    - Errors
    - Timeouts
    - Performance metrics
    - System health
```

### Data Reduction Strategies

Keep insights, reduce volume:

```yaml
Raw Events (0-30 days):
  - Complete detail
  - All fields preserved
  - Instant queries
  
Compressed Events (31-365 days):
  - Remove debug data
  - Compress JSON
  - Index key fields
  - 70% size reduction
  
Aggregated Data (1+ years):
  - Hourly/daily summaries
  - Key metrics only
  - Statistical samples
  - 95% size reduction
```

## Archival Implementation

### Hot Storage (Immediate Access)

For operational data:

```yaml
Storage Type: High-speed SSD
Access Time: <100ms
Query Speed: Real-time
Cost: $$$$ per GB

Contains:
  - Last 24-48 hours
  - Full event detail
  - All indexes active
  - Cache enabled
  
Use Cases:
  - Live monitoring
  - Debugging
  - Real-time analytics
  - Operational queries
```

### Warm Storage (Quick Access)

For recent history:

```yaml
Storage Type: Standard disk
Access Time: <1 second
Query Speed: Fast
Cost: $$ per GB

Contains:
  - 2-30 days
  - Compressed events
  - Key indexes only
  - Partitioned by day
  
Use Cases:
  - Daily reports
  - Trend analysis
  - Quality monitoring
  - Investigation
```

### Cold Storage (Archived)

For compliance/history:

```yaml
Storage Type: Object storage
Access Time: Minutes-hours
Query Speed: Batch only
Cost: $ per GB

Contains:
  - 30+ days
  - Highly compressed
  - Archived format
  - Retrievable on demand
  
Use Cases:
  - Compliance audits
  - Historical analysis
  - Legal discovery
  - Long-term backup
```

## Archival Processes

### Automated Archival Pipeline

Move data through tiers:

```yaml
Daily Process (2 AM):
  
1. Identify Aging Events:
   - Events > 30 days old
   - Not marked for retention
   - Not under legal hold
   
2. Compress & Transform:
   - Remove verbose fields
   - Compress JSON payloads
   - Create summary records
   - Maintain relationships
   
3. Move to Cold Storage:
   - Batch upload to S3/Glacier
   - Update metadata catalog
   - Remove from hot storage
   - Verify successful transfer
   
4. Update Indexes:
   - Archive location
   - Retention policy
   - Expiration date
   - Access permissions
```

### Manual Archival Controls

Override automatic processes:

```yaml
Retention Holds:
  
Legal Hold:
  - Preserves indefinitely
  - Prevents deletion
  - Maintains full detail
  - Audit trail required
  
Business Hold:
  - Extended retention
  - Specific date range
  - Business justification
  - Periodic review
  
Compliance Hold:
  - Regulatory requirement
  - Predetermined period
  - Automated enforcement
  - Exception reporting
```

### Retrieval Procedures

Access archived events:

```yaml
Self-Service Retrieval:
  1. Request via UI/API
  2. Specify date range
  3. Choose delivery method
  4. Wait for processing
  5. Download results
  
Bulk Retrieval:
  1. Submit ticket
  2. Provide requirements
  3. Approve cost estimate
  4. Receive data transfer
  5. Confirm completion
  
Emergency Access:
  1. Contact support
  2. Explain urgency
  3. Expedited processing
  4. Direct delivery
  5. Follow-up required
```

## Cost Optimization

### Storage Cost Analysis

Understand the economics:

```yaml
Monthly Storage Costs (per million events):

Hot Storage (SSD):
  Size: ~1GB compressed
  Cost: $100/month
  Total: $100
  
Warm Storage (HDD):
  Size: ~1GB compressed  
  Cost: $25/month
  Total: $25
  
Cold Storage (S3):
  Size: ~0.5GB ultra-compressed
  Cost: $5/month
  Total: $2.50
  
Glacier (Archive):
  Size: ~0.5GB
  Cost: $0.50/month
  Total: $0.25
```

### Optimization Strategies

Reduce costs intelligently:

```yaml
1. Aggressive Compression:
   - GZIP all JSON
   - Remove whitespace
   - Deduplicate strings
   - 70-90% reduction
   
2. Smart Sampling:
   - Keep 100% critical events
   - Sample 10% diagnostic
   - Aggregate the rest
   - 80% volume reduction
   
3. Tiered Expiration:
   - Technical: 90 days
   - Operational: 1 year
   - Financial: 7 years
   - Average: 60% reduction
   
4. Efficient Queries:
   - Pre-compute aggregates
   - Maintain summary tables
   - Archive raw details
   - 95% faster queries
```

## Compliance Considerations

### Regulatory Requirements

Meet legal obligations:

```yaml
TCPA Compliance:
  Requirement: Consent records
  Retention: 4+ years
  Events: All with consent data
  Access: Audit-ready
  
CCPA/GDPR:
  Requirement: Data subject rights
  Retention: Active + 1 year
  Events: All with PII
  Access: Exportable/deletable
  
Industry Specific:
  Check: State laws
  Consult: Legal counsel
  Document: Retention policy
  Review: Annually
```

### Audit Trail Requirements

Maintain chain of custody:

```yaml
For Each Event:
  - Original timestamp
  - Archival date
  - Retention policy
  - Access history
  - Modification log
  
Proof Points:
  - Immutable storage
  - Cryptographic hashes
  - Access controls
  - Regular verification
  - Documented processes
```

### Data Deletion

When events must go:

```yaml
Deletion Triggers:
  - Retention period expired
  - Legal requirement
  - Customer request (GDPR)
  - Storage optimization
  
Deletion Process:
  1. Verify authorization
  2. Check for holds
  3. Document request
  4. Execute deletion
  5. Verify completion
  6. Update audit log
  
Permanent Deletion:
  - Overwrite storage
  - Remove all copies
  - Update indexes
  - Certificate of destruction
```

## Best Practices

### Policy Development

Create clear policies:

```yaml
Retention Policy Template:
  
1. Purpose & Scope
   - Why we retain
   - What's covered
   - Who's responsible
   
2. Retention Periods
   - By event type
   - By compliance need
   - By business value
   
3. Archival Process
   - When to archive
   - How to archive
   - Where to store
   
4. Access Controls
   - Who can access
   - Approval process
   - Audit requirements
   
5. Review Schedule
   - Annual review
   - Update triggers
   - Approval chain
```

### Monitoring & Alerts

Stay on top of retention:

```yaml
Key Metrics:
  - Storage growth rate
  - Archival success rate
  - Retrieval requests
  - Cost per event
  - Compliance status
  
Alerts:
  - Storage 80% full
  - Archival failures
  - Unusual retrieval
  - Cost overruns
  - Policy violations
```

### Testing & Validation

Ensure reliability:

```yaml
Regular Tests:
  
Monthly:
  - Retrieval speed
  - Archive integrity
  - Access controls
  
Quarterly:
  - Full retrieval test
  - Compliance audit
  - Cost analysis
  
Annually:
  - Disaster recovery
  - Policy review
  - Vendor assessment
```

## Implementation Checklist

### Getting Started

- [ ] Assess current event volume
- [ ] Identify compliance requirements
- [ ] Define retention periods
- [ ] Calculate storage costs
- [ ] Design archival pipeline

### Technical Setup

- [ ] Configure storage tiers
- [ ] Implement compression
- [ ] Set up archival jobs
- [ ] Create retrieval process
- [ ] Test full lifecycle

### Operational Readiness

- [ ] Document policies
- [ ] Train team members
- [ ] Set up monitoring
- [ ] Configure alerts
- [ ] Schedule reviews

### Compliance Verification

- [ ] Legal review
- [ ] Audit procedures
- [ ] Access controls
- [ ] Deletion process
- [ ] Documentation complete

## Your Next Steps

### Essential Planning
1. **Audit Requirements** - What must you keep?
2. **Cost Analysis** - What can you afford?
3. **Access Patterns** - How often retrieved?
4. **Growth Projections** - Plan for scale

### Implementation Support
- **[Archival API](/api/archival)** - Automate processes
- **[Firehose Setup](/leads/firehose)** - Stream to archives
- **[Compliance Guide](/guide/compliance/data-retention)** - Legal requirements

### Expert Resources
- **Architecture Review** - Optimize design
- **Compliance Consultation** - Meet requirements
- **Cost Optimization** - Reduce expenses

---

💾 **Remember**: Good retention balances access, cost, and compliance. Archive aggressively but intelligently. Keep what matters, summarize what's interesting, and delete what's allowed. Your future self (and auditor) will thank you.

*Next: Learn about [Event Performance Optimization](/leads/events/performance) for high-volume scenarios.*