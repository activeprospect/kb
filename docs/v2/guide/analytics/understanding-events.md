# Understanding Events

Master the LeadConduit event system to debug issues, analyze performance, and understand exactly what happens to every lead. Events are your window into the system.

## 📍 You Are Here

You need to understand what happened to a specific lead or analyze patterns across many leads. The Events system provides complete visibility into every action taken on every lead.

## 🎯 What You'll Learn

- Event system fundamentals
- Reading event timelines
- Searching and filtering events
- Debugging with events
- Event data structure
- Advanced analysis techniques

## 🔍 What Are Events?

### The Complete Record

Every lead creates an event containing:
- **When**: Precise timestamp
- **What**: Every processing step
- **Where**: Source and destination
- **Why**: Outcomes and reasons
- **How**: Complete data trail

### Event Lifecycle

```
Lead Submission
    ↓
Event Created
    ↓
Processing Steps Recorded
    ↓
Final Outcome Logged
    ↓
Event Stored (Permanent)
```

## 📊 Navigating the Events Interface

### Accessing Events

1. **Flow-Level Events**
   - Open your flow
   - Click **Events** tab
   - See all events for this flow

2. **Global Events**
   - Main navigation → Events
   - See events across all flows
   - Filter by flow, date, outcome

### Event List View

Each row shows:
```
Time     | Flow        | Source      | Outcome  | Reason
---------|-------------|-------------|----------|------------------
10:32:15 | Solar Leads | Web Form    | Success  | Delivered to CRM
10:32:14 | Solar Leads | Partner API | Failure  | Invalid phone
10:32:12 | Insurance   | Facebook    | Error    | CRM timeout
```

### Filtering Events

**Quick Filters**:
- Outcome: Success / Failure / Error
- Time: Last hour / day / week
- Source: Specific source
- Search: Email, phone, ID

**Advanced Filters**:
```javascript
// Complex filter examples
outcome = "failure" AND reason contains "duplicate"
source = "Facebook" AND state = "CA"
created_at > "2024-01-15" AND price > 50
```

## 🔬 Reading Event Details

### Event Timeline

Click any event to see the timeline:

```
10:32:15.123 - Lead received from "Web Form"
              └─ email: test@example.com
              └─ phone: 555-123-4567
              └─ state: CA

10:32:15.234 - Email validation: PASSED
              └─ valid: true
              └─ deliverable: true

10:32:15.345 - Phone validation: PASSED  
              └─ valid: true
              └─ line_type: mobile

10:32:15.456 - Duplicate check: PASSED
              └─ is_duplicate: false

10:32:15.567 - Filter "Quality Check": PASSED
              └─ score: 85
              └─ threshold: 70

10:32:15.789 - Delivery "Salesforce": SUCCESS
              └─ lead_id: 00Q1234567
              └─ status: 200

10:32:15.890 - Event complete
              └─ outcome: success
              └─ billable: 1
              └─ price: 25.00
```

### Understanding Step Details

Each step shows:
- **Timestamp**: Exact time (millisecond precision)
- **Step Name**: What was executed
- **Result**: Success/Failure/Error/Skipped
- **Data**: Input and output values
- **Duration**: Processing time

## 🔎 Key Event Components

### Lead Data Tab

Shows all lead fields:
```json
{
  "email": "john.doe@example.com",
  "phone_1": "5551234567",
  "first_name": "John",
  "last_name": "Doe",
  "state": "CA",
  "city": "Los Angeles",
  "interested_in": "solar panels",
  "consent": true,
  "source_url": "https://example.com/solar-form"
}
```

### Processing Tab

Shows what happened:
- Acceptance criteria evaluation
- Enhancement results
- Filter decisions
- Delivery attempts
- Final outcome

### Metadata Tab

System information:
```json
{
  "event_id": "evt_abc123def456",
  "flow_id": "flw_789xyz",
  "created_at": "2024-01-15T10:32:15.123Z",
  "ip_address": "192.168.1.100",
  "user_agent": "Mozilla/5.0...",
  "api_key": "key_****1234"
}
```

## 🐛 Debugging with Events

### Common Debugging Scenarios

**"Why was this lead rejected?"**
1. Find the event
2. Look for red (failure) items
3. Read the rejection reason
4. Check the exact rule that failed

**"Why didn't delivery work?"**
1. Find delivery step in timeline
2. Check response code
3. Read error message
4. Review request/response data

**"Where did this data come from?"**
1. Check lead data tab
2. Look at source information
3. Trace field mappings
4. Review enhancement results

### Using Event IDs

Every event has a unique ID:
```
Event ID: evt_2605ec3a321e7c5a7a1e456c541c58f52c2b7e4a
```

Use for:
- Support tickets
- API lookups
- Cross-referencing
- Audit trails

## 📈 Event Patterns and Analysis

### Identifying Trends

Look for patterns in failures:

**Time-based**:
```
Morning: 95% success rate
Afternoon: 87% success rate
Evening: 72% success rate
→ Investigate evening degradation
```

**Source-based**:
```
Source A: 98% valid emails
Source B: 67% valid emails
→ Source B quality issue
```

**Geographic**:
```
CA leads: 91% success
TX leads: 89% success  
FL leads: 64% success
→ Florida-specific problem
```

### Performance Analysis

Use events to measure:

**Processing Speed**:
```javascript
avg_time = events
  .map(e => e.duration_ms)
  .reduce((a, b) => a + b) / events.length

// Find slow steps
slow_steps = events
  .flatMap(e => e.steps)
  .filter(s => s.duration_ms > 1000)
  .groupBy(s => s.name)
```

**Success Rates**:
```javascript
success_rate = events
  .filter(e => e.outcome === 'success')
  .length / events.length * 100

// By source
source_rates = events
  .groupBy(e => e.source)
  .map(group => ({
    source: group.key,
    rate: group.success_count / group.total * 100
  }))
```

## 🔄 Event Export and API

### Exporting Events

Download event data:
1. Click **Export** button
2. Select format:
   - CSV for spreadsheets
   - JSON for developers
   - XML for legacy systems
3. Choose fields to include
4. Set date range

### Event API Access

Query events programmatically:
```bash
# Get specific event
GET /api/events/evt_abc123def456

# Search events
GET /api/events?outcome=failure&date=2024-01-15

# Get event details
GET /api/events/evt_abc123/details
```

Response format:
```json
{
  "event_id": "evt_abc123",
  "flow_id": "flw_xyz789",
  "outcome": "success",
  "created_at": "2024-01-15T10:32:15.123Z",
  "lead": { /* lead data */ },
  "steps": [ /* processing steps */ ],
  "metadata": { /* system info */ }
}
```

## 💡 Pro Tips

### Search Operators

Master search syntax:
```
email:*@gmail.com          # All Gmail addresses
phone:555*                 # Phones starting with 555
NOT outcome:success        # All non-success
created:[NOW-1H TO NOW]    # Last hour
price:[10 TO 50]          # Price range
```

### Bookmarking Searches

Save common searches:
- "Today's Failures"
- "High-Value Success"
- "Source A Problems"
- "Delivery Timeouts"

### Event Retention

Default retention:
- **Success events**: 30 days
- **Failure events**: 90 days
- **Error events**: 90 days
- **All events**: Exportable before deletion

## 🚫 Common Misconceptions

### "Events Slow Down Processing"

**Reality**: Events are recorded asynchronously
- No impact on lead processing speed
- Written after response sent
- Optimized for performance

### "I Can Modify Events"

**Reality**: Events are immutable
- Cannot be edited after creation
- Complete audit trail
- Compliance-friendly

### "Events Show Everything"

**Reality**: Some data is protected
- Passwords never shown
- API keys partially hidden
- PII can be masked

## 📊 Event-Based Reports

### Creating Event Reports

Use events for custom reports:

**Failure Analysis**:
```sql
SELECT 
  DATE(created_at) as date,
  failure_reason,
  COUNT(*) as count
FROM events
WHERE outcome = 'failure'
GROUP BY date, failure_reason
ORDER BY count DESC
```

**Source Performance**:
```sql
SELECT
  source,
  COUNT(*) as total,
  SUM(outcome = 'success') as successes,
  AVG(price) as avg_price
FROM events
GROUP BY source
```

## 🎯 Event Investigation Checklist

When investigating an issue:
- [ ] Locate the specific event
- [ ] Check the timeline
- [ ] Identify the failing step
- [ ] Read exact error message
- [ ] Review lead data
- [ ] Check previous attempts
- [ ] Note any patterns
- [ ] Export if needed

## 📚 Related Documentation

- [Basic Troubleshooting](../getting-started/basic-troubleshooting.md) - Using events to debug
- [Custom Reports](./custom-reports.md) - Reporting on event data
- [API Reference](../../reference/events-api.md) - Programmatic access

---

🔍 **Event Expertise**: Events tell the complete story of every lead. Master the event system and you'll never wonder what happened - you'll know exactly what, when, and why!