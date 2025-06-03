# Volume Caps Configuration

Control the flow of leads with volume caps - your automated traffic controller. Set limits by source, time period, or conditions to manage costs, prevent overselling, and maintain quality service levels.

## 📍 You Are Here

You're learning to configure volume caps that limit how many leads are accepted over specific time periods. Whether controlling daily budgets, managing inventory, or throttling high-volume sources, volume caps give you precise control over lead flow.

## 🎯 What You'll Master

- Flow, Source, and Step cap configuration
- Time-based limits and reset behaviors
- Conditional and nested caps
- Performance optimization strategies
- Integration with other flow controls

## 🔑 Understanding Volume Cap Types

### Flow Caps
**What they control**: Total leads entering your flow from all sources
**Use when**: You have overall daily/monthly limits
**Behavior**: Lead fails with "Cap reached" when exceeded

### Source Caps  
**What they control**: Leads from specific sources
**Use when**: Different vendors have different allocations
**Behavior**: Source-specific limit, lead fails when exceeded

### Step Caps
**What they control**: Leads sent to specific recipients or destinations
**Use when**: Recipients have capacity limits
**Behavior**: Step skips (lead continues), unless filter stops it

## ⏱️ How Volume Caps Work

### The Counter System

Each cap maintains a counter that:
1. **Starts at zero** when created
2. **Increments by one** for each successful lead
3. **Resets to zero** based on duration settings
4. **Only counts successes** - failures don't increment

💡 **Key Point**: Only successful leads count against caps. Rejected leads don't use your allocation.

### Reset Timing

Caps reset at the END of their duration period in your account timezone:

| Duration | Reset Time |
|----------|------------|
| Hour | 59 minutes past the hour |
| Day | 11:59 PM |
| Week | Sunday 11:59 PM |
| Month | Last day 11:59 PM |

**Custom Durations**:
- "2 days" → Resets at 11:59 PM on the 2nd day
- "3 weeks" → Resets Sunday 11:59 PM of the 3rd week

## 🛠️ Basic Configuration

### Setting Up a Simple Daily Cap

1. **Navigate to Configuration**
   - For Flow/Source caps: Flow Editor → Sources tab
   - For Step caps: Flow Editor → Steps tab → Select step

2. **Add Volume Cap**
   - Click "Add Volume Cap" or "Configure Caps"
   - Choose cap type if prompted

3. **Configure the Cap**
   ```
   Name: Daily Lead Limit (or auto-generated)
   Quantity: 1000
   Duration: 1 day
   ```

4. **Save Changes**
   - Cap activates immediately
   - Counter starts at zero

### Example: Basic Source Cap

Limit a specific vendor to 500 leads per day:

```
Location: Source Configuration
Name: Vendor ABC Daily Limit
Quantity: 500
Duration: 1 day
Rules: None (applies to all leads from this source)
```

## 🎯 Advanced Configurations

### Conditional Caps

Use rules to create caps that only apply to specific leads:

**Example**: Different limits by state
```
Cap 1: California Leads
Quantity: 200
Duration: 1 day
IF: state is equal to "CA"

Cap 2: Other States
Quantity: 800  
Duration: 1 day
IF: state is not equal to "CA"
```

### Nested Caps

Create hierarchical limits with parent-child relationships:

**Example**: Monthly cap with daily limits
```
Parent Cap: Monthly Total
Quantity: 10,000
Duration: 1 month

  Child Cap: Daily Limit
  Quantity: 500
  Duration: 1 day
```

How it works:
- Daily cap prevents more than 500/day
- Monthly cap ensures total doesn't exceed 10,000
- If parent cap rule doesn't match, children aren't evaluated

### Multiple Independent Caps

Configure multiple caps that work independently:

```
Cap 1: Hourly Throttle
Quantity: 100
Duration: 1 hour

Cap 2: Daily Maximum
Quantity: 2,000
Duration: 1 day

Cap 3: Premium Leads
Quantity: 50
Duration: 1 day
IF: lead_quality is equal to "premium"
```

All caps evaluate independently - hitting one doesn't affect others.

## 💡 Strategic Use Cases

### Budget Control

Prevent overspending with daily/monthly limits:
```
Daily Budget Cap:
Quantity: $5000 worth of leads
Duration: 1 day
Calculate quantity based on average lead cost
```

### Inventory Management

Match lead flow to sales capacity:
```
Sales Team Capacity:
Quantity: 50 (leads per agent × number of agents)
Duration: 1 day
```

### Geographic Distribution

Balance leads across territories:
```
California Cap: 30% of daily volume
Texas Cap: 25% of daily volume  
Florida Cap: 20% of daily volume
Other States: 25% of daily volume
```

### Time-Based Throttling

Smooth out lead flow throughout the day:
```
Business Hours Cap:
Quantity: 100
Duration: 1 hour
IF: hour is between 9 and 17
```

## 🔧 Important Behaviors

### Counter Reset Rules

**When counters reset to zero**:
- Creating a new cap
- Changing cap rules (IF conditions)
- Reducing duration (e.g., month → week)
- Duration period expires

**When counters DON'T reset**:
- Changing quantity only (no rule changes)
- Increasing duration
- Renaming the cap
- Normal incrementation

### Evaluation Order

1. **Flow caps checked first**
   - If exceeded, lead fails immediately
   - Source caps aren't checked

2. **Source caps checked second**
   - Only if flow caps pass
   - Specific to the submitting source

3. **Step caps evaluated during processing**
   - Don't prevent lead acceptance
   - Skip the step when exceeded

### Multiple Cap Behavior

When multiple caps exist:
- All matching caps increment together
- First exceeded cap stops processing
- Remaining caps don't increment if one fails

## 📊 Monitoring Cap Status

### Flow Dashboard View

See cap status at a glance:
- Current count / Maximum
- Time until reset
- Nested cap expansion

### Real-Time Monitoring

Track cap usage throughout the day:
- Green: Under 80% capacity
- Yellow: 80-95% capacity
- Red: Over 95% or exceeded

### Cap Naming Convention

Default pattern helps identify caps:
```
[Flow Name]: [Source/Step Name] [Type] - [Location]
Example: "Insurance Leads: State Farm Source - Cap 1"
```

Rename for clarity:
```
"State Farm Daily Limit"
"California Hourly Throttle"
"Sales Team Capacity"
```

## 🚀 Optimization Strategies

### Rule Ordering

For best performance with conditional caps:
1. Most restrictive rules first
2. Most common conditions first
3. Complex calculations last

### Capacity Planning

Set caps based on:
- Historical acceptance rates
- Sales team capacity
- Budget constraints
- Quality requirements

### Combining with Other Controls

**With Hours of Operation**:
- Hours of Operation: When to accept leads
- Volume Caps: How many to accept

**With Acceptance Criteria**:
- Acceptance Criteria: Lead quality requirements
- Volume Caps: Quantity limits on good leads

**With Day Parting**:
- Use submission timestamp rules
- Create time-of-day caps
- Optimize for call center hours

## 🚫 Common Issues and Solutions

### "Cap Not Resetting"

**Check**:
- Timezone settings in account
- Duration configuration
- Whether rules changed (triggers reset)

### "Unexpected Counter Values"

**Verify**:
- Only successful leads count
- Multiple caps might be incrementing
- Parent cap rules affecting children

### "Step Cap Not Working"

**Remember**:
- Step caps just skip the step
- Add a filter after to stop the flow if needed
- Check if lead is succeeding elsewhere

## 💡 Best Practices

**Start Conservative**: Set lower limits initially, increase based on performance.

**Use Descriptive Names**: "California Daily Solar Leads" beats "Cap 1".

**Monitor Fill Rates**: Track how often caps are hit to optimize limits.

**Plan for Resets**: Know when caps reset to avoid surprise cutoffs.

**Document Your Strategy**: Note why each cap exists and how limits were determined.

## 📚 Related Documentation

- [Acceptance Criteria](./acceptance-criteria.md) - Quality controls
- [Hours of Operation](./hours-of-operation.md) - Time-based controls
- [Filter Steps](./filter-routing.md) - Routing based on cap status
- [Pricing Rules](./pricing-strategies.md) - Cost management

---

🎚️ **Control Your Flow**: Volume caps give you precise control over lead flow, ensuring you never exceed capacity or budget. Start simple with daily caps, then add sophistication as your needs grow!