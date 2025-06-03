---
title: Source Events
description: Understanding lead submission and acceptance events from your sources
tags:
  - events
  - source
  - submission
  - acceptance
---

# Source Events

## The Starting Point of Every Lead Journey

Source events mark the beginning of a lead's lifecycle in LeadConduit. They capture everything about how a lead enters your system - from initial submission through acceptance or rejection. Understanding these events helps you optimize acceptance rates, debug integration issues, and maintain source quality.

📍 **You are here**: Learning about lead submission and source processing
📊 **What you'll track**: Submissions, acceptances, rejections, and reasons
🎯 **The outcome**: Better source management and higher acceptance rates

## Understanding Source Events

### Event Types

Source events occur in sequence:

```
source.submitted
    ↓
source.validated (internal)
    ↓
source.accepted OR source.rejected
```

Each captures different aspects of lead processing.

### The Source Event Flow

What happens during submission:

```yaml
1. Lead Submitted:
   - Raw data received
   - Timestamp recorded
   - Source identified
   - IP captured

2. Validation Applied:
   - Field parsing
   - Type validation
   - Required field checks

3. Acceptance Decision:
   - Rules evaluated
   - Duplicate check
   - Cap verification
   
4. Event Recorded:
   - Final outcome
   - All lead data
   - Processing details
```

## Source.Submitted Event

### What It Captures

Raw submission data:

```json
{
  "event_type": "source.submitted",
  "timestamp": "2024-01-15T10:30:45.123Z",
  "lead_id": "lead_7K9mHpQR3x2B5N8j",
  "source": {
    "id": "src_3B8nM5kL2Q9p",
    "name": "Landing Page A"
  },
  "data": {
    "first_name": "John",
    "last_name": "Smith",
    "email": "JOHN.SMITH@EXAMPLE.COM",
    "phone": "(555) 123-4567",
    "postal_code": "90210",
    "ip_address": "192.168.1.100",
    "user_agent": "Mozilla/5.0...",
    "landing_page": "https://example.com/insurance"
  },
  "metadata": {
    "api_key": "key_abc123",
    "submission_method": "POST",
    "content_type": "application/x-www-form-urlencoded"
  }
}
```

### Key Information

What to look for:

**Submission Method**:
- API POST
- Form submission
- Batch upload
- Manual entry

**Raw vs Parsed**:
- Raw: Exactly as received
- Parsed: After normalization
- Both stored for debugging

**Metadata**:
- Submission IP
- User agent
- Referrer
- Custom headers

## Source.Accepted Event

### Successful Acceptance

Lead passes all checks:

```json
{
  "event_type": "source.accepted",
  "timestamp": "2024-01-15T10:30:45.456Z",
  "lead_id": "lead_7K9mHpQR3x2B5N8j",
  "source": {
    "id": "src_3B8nM5kL2Q9p",
    "name": "Landing Page A"
  },
  "outcome": "accepted",
  "duration_ms": 234,
  "lead_data": {
    "first_name": "John",
    "last_name": "Smith", 
    "email": "john.smith@example.com",
    "email.valid": true,
    "phone": "5551234567",
    "phone.valid": true,
    "phone.type": "mobile",
    "postal_code": "90210",
    "state": "CA"
  },
  "acceptance": {
    "rules_passed": [
      "email.valid is true",
      "phone.valid is true",
      "age >= 18"
    ],
    "duplicate_check": "passed",
    "cap_check": "passed"
  },
  "metadata": {
    "parser_version": "2.1",
    "rules_evaluated": 12,
    "enhancements_applied": []
  }
}
```

### Acceptance Details

Key acceptance information:

**Validation Results**:
- All field validations
- Type parsing results
- Component extraction

**Rules Passed**:
- Which criteria evaluated
- All passed conditions
- No failures to report

**System Checks**:
- Duplicate: None found
- Volume cap: Space available
- Time window: Within hours

## Source.Rejected Event

### Rejection with Reasons

Lead fails validation:

```json
{
  "event_type": "source.rejected", 
  "timestamp": "2024-01-15T10:30:45.789Z",
  "lead_id": "lead_8L0nK4pR2x5C6M9k",
  "source": {
    "id": "src_3B8nM5kL2Q9p",
    "name": "Landing Page A"
  },
  "outcome": "rejected",
  "duration_ms": 123,
  "rejection": {
    "reason": "Failed acceptance criteria",
    "failed_rules": [
      {
        "rule": "email.valid is true",
        "result": false,
        "actual": "invalid-email-format"
      }
    ],
    "error_code": "VALIDATION_FAILED"
  },
  "lead_data": {
    "first_name": "Test",
    "last_name": "User",
    "email": "not-an-email",
    "email.valid": false,
    "phone": "1234",
    "phone.valid": false
  },
  "metadata": {
    "rules_evaluated": 5,
    "first_failure": "email.valid is true"
  }
}
```

### Rejection Reasons

Common rejection categories:

**Validation Failures**:
```yaml
Email Invalid:
  - Bad format
  - Disposable domain
  - Role account

Phone Invalid:
  - Wrong length
  - Bad area code
  - Disconnected

Required Missing:
  - No email or phone
  - Missing consent
  - No state
```

**Business Rules**:
```yaml
Quality Issues:
  - Age under 18
  - Outside service area
  - Blacklisted

Duplicate Detection:
  - Seen in last 30 days
  - Already sold
  - In suppression list
```

**System Limits**:
```yaml
Volume Caps:
  - Daily limit reached
  - Monthly limit reached
  - Source cap hit

Time Restrictions:
  - Outside business hours
  - Holiday blackout
  - Maintenance window
```

## Using Source Events

### Acceptance Rate Analysis

Monitor source quality:

```yaml
Calculate Acceptance Rate:
  Accepted Events / Submitted Events × 100
  
By Time Period:
  - Last hour: 87%
  - Today: 85%
  - This week: 83%
  - This month: 84%
  
By Source:
  - Landing Page A: 92%
  - Partner API: 78%
  - Organic Form: 95%
```

### Rejection Analysis

Understand why leads fail:

```yaml
Top Rejection Reasons:
  1. Invalid phone (35%)
  2. Duplicate (28%)
  3. Missing email (15%)
  4. Under age (12%)
  5. Wrong state (10%)

Action Items:
  - Add phone validation to form
  - Increase duplicate window
  - Make email required
  - Add age verification
  - Limit state dropdown
```

### Source Debugging

Trace submission issues:

```yaml
Common Investigations:

"Why was this lead rejected?"
  1. Find source.rejected event
  2. Check failed_rules
  3. Review lead_data
  4. Identify issue

"Is integration working?"
  1. Check recent source.submitted
  2. Verify data mapping
  3. Look for patterns
  4. Test with sample

"Source quality dropping?"
  1. Compare acceptance rates
  2. Analyze rejection reasons
  3. Check for changes
  4. Contact source
```

## Event Patterns

### Successful Submission Pattern

Ideal flow:

```yaml
Timeline:
  10:30:45.123 - source.submitted
  10:30:45.234 - (internal validation)
  10:30:45.456 - source.accepted
  10:30:45.678 - (enhancement begins)
  
Characteristics:
  - Fast processing (<500ms)
  - All validations pass
  - No duplicate found
  - Caps available
```

### Rejection Pattern

Failed submission:

```yaml
Timeline:
  10:30:45.123 - source.submitted
  10:30:45.234 - (validation fails)
  10:30:45.345 - source.rejected
  
Characteristics:
  - Quick rejection (<250ms)
  - Clear failure reason
  - No further processing
  - Source notified
```

### Duplicate Pattern

Previously seen lead:

```yaml
Timeline:
  10:30:45.123 - source.submitted
  10:30:45.234 - (duplicate check)
  10:30:45.345 - source.rejected
  
Rejection Details:
  reason: "Duplicate lead"
  duplicate_of: "lead_5T8nK3mP9Q2w"
  first_seen: "2024-01-01T08:15:00Z"
  days_ago: 14
```

## Source Event Metrics

### Key Performance Indicators

Monitor source health:

```yaml
Volume Metrics:
  - Submissions per hour
  - Acceptance count
  - Rejection count
  - Duplicate rate

Quality Metrics:
  - Acceptance rate
  - Validation pass rate
  - Average field completion
  - Data accuracy score

Performance Metrics:
  - Processing time
  - Validation duration
  - Time to decision
  - API response time
```

### Trending Analysis

Spot patterns:

```yaml
Daily Patterns:
  - Morning: 85% acceptance
  - Afternoon: 82% acceptance
  - Evening: 78% acceptance
  - Night: 73% acceptance

Weekly Patterns:
  - Monday: Highest quality
  - Friday: Most volume
  - Weekend: Lower quality

Monthly Patterns:
  - Start: Budget fresh
  - Middle: Steady flow
  - End: Quality drops
```

## Advanced Source Analysis

### Source Scoring

Rate your sources:

```yaml
Quality Score Components:
  - Acceptance rate (40%)
  - Contact rate (30%)
  - Conversion rate (20%)
  - Data completeness (10%)

Source Rankings:
  1. Organic Forms: 95/100
  2. Premium Partner: 88/100
  3. Standard Partner: 75/100
  4. Budget Partner: 62/100
```

### Anomaly Detection

Catch issues early:

```yaml
Alert Triggers:
  - Acceptance < 70% (1 hour)
  - Rejections spike >200%
  - New rejection reason
  - Unusual field values

Example Alert:
  "Source A acceptance dropped to 45%
   Primary issue: Invalid phones (89%)
   Started: 2:15 PM
   Action: Check integration"
```

## Best Practices

### Source Monitoring

1. **Real-Time Dashboards**
   - Current acceptance rate
   - Recent rejections
   - Volume tracking
   - Error patterns

2. **Regular Reviews**
   - Weekly quality reports
   - Monthly trending
   - Rejection analysis
   - Source comparisons

3. **Proactive Alerts**
   - Quality degradation
   - Volume anomalies
   - New error types
   - Integration failures

### Source Optimization

1. **Feedback Loops**
   - Share rejection reasons
   - Provide field guidance
   - Suggest improvements
   - Track progress

2. **Testing Programs**
   - Sample submissions
   - Edge case validation
   - Format verification
   - Regular health checks

3. **Documentation**
   - Clear requirements
   - Example submissions
   - Common errors
   - Best practices

## Your Next Steps

### Essential Reading
1. **[Recipient Events](/leads/events/recipient-events)** - Delivery outcomes
2. **[Acceptance Criteria](/flows/lead-submission/acceptance-criteria)** - Validation rules
3. **[Source Configuration](/flows/lead-submission/sources)** - Source setup

### Common Tasks
- Debug rejected leads
- Analyze source quality
- Set up monitoring
- Optimize acceptance

---

📊 **Remember**: Source events are your quality gates. They protect your system from bad data, enforce business rules, and provide the foundation for optimization. Monitor them closely, analyze patterns regularly, and use insights to improve source quality.

*Next: Learn about [Recipient Events](/leads/events/recipient-events) to track delivery success.*