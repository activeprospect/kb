# Hours of Operation and Scheduling

Control when flows accept and process leads. Master scheduling rules, timezone handling, and buyer availability management for optimal lead distribution.

## 📍 You Are Here

You need to manage when leads are accepted, control buyer schedules, or implement time-based routing. This guide covers all aspects of temporal control in LeadConduit.

## 🎯 What You'll Learn

- Schedule configuration
- Timezone management
- Holiday handling
- Buyer hours setup
- Time-based routing
- Schedule exceptions

## ⏰ Understanding Schedules

### Schedule Types

Different scheduling needs:

**Flow Schedules**:
- When flows accept leads
- Global operating hours
- Maintenance windows

**Buyer Schedules**:
- Individual buyer availability
- Capacity by time of day
- Regional considerations

**Step Schedules**:
- Time-based step execution
- Delayed processing
- Batch operations

### Time Concepts

```javascript
// Key time elements
const timeElements = {
  timezone: "America/New_York",
  businessHours: {
    start: "09:00",
    end: "17:00"
  },
  days: ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"],
  holidays: ["2024-12-25", "2024-01-01"],
  exceptions: [
    { date: "2024-11-28", hours: { start: "09:00", end: "13:00" } }
  ]
};
```

## 🗓️ Basic Schedule Setup

### Flow Operating Hours

Configure when flows accept leads:

```yaml
Flow Settings:
  Schedule:
    Mode: Business Hours
    Timezone: America/New_York
    Hours:
      Monday-Friday: 9:00 AM - 5:00 PM
      Saturday: 10:00 AM - 2:00 PM
      Sunday: Closed
    Action When Closed: Reject
```

### Simple Scheduling

Basic time windows:

```javascript
// Acceptance criteria by time
const timeRule = {
  field: "submission_time",
  operator: "between",
  value: {
    start: "09:00:00",
    end: "17:00:00",
    timezone: "America/New_York"
  }
};

// Day of week filter
const dayRule = {
  field: "submission_day",
  operator: "in",
  value: ["mon", "tue", "wed", "thu", "fri"]
};
```

### Handling Closed Hours

Options for outside hours:

```javascript
const closedHoursHandling = {
  "reject": {
    action: "reject_lead",
    reason: "Outside business hours",
    notification: false
  },
  "queue": {
    action: "hold_until_open",
    max_wait: 86400, // 24 hours
    process_at: "next_open_time"
  },
  "route_alternate": {
    action: "send_to_flow",
    target: "after_hours_flow",
    preserve_data: true
  },
  "store": {
    action: "save_for_batch",
    process_time: "09:00:00",
    storage: "s3_bucket"
  }
};
```

## 🌍 Timezone Management

### Multi-Timezone Operations

Handle different regions:

```javascript
class TimezoneManager {
  constructor() {
    this.buyerTimezones = new Map();
  }
  
  setBuyerTimezone(buyerId, timezone) {
    this.buyerTimezones.set(buyerId, timezone);
  }
  
  isBuyerOpen(buyerId, schedule) {
    const timezone = this.buyerTimezones.get(buyerId);
    const localTime = this.getCurrentTime(timezone);
    
    return this.isWithinSchedule(localTime, schedule);
  }
  
  getCurrentTime(timezone) {
    return new Date().toLocaleString("en-US", { 
      timeZone: timezone 
    });
  }
  
  isWithinSchedule(time, schedule) {
    const current = new Date(time);
    const dayOfWeek = current.getDay();
    const timeOfDay = current.getHours() * 100 + current.getMinutes();
    
    const todaySchedule = schedule[dayOfWeek];
    if (!todaySchedule || !todaySchedule.open) return false;
    
    return timeOfDay >= todaySchedule.start && 
           timeOfDay <= todaySchedule.end;
  }
}
```

### Lead Timezone Detection

Determine lead's timezone:

```javascript
// By state
const stateToTimezone = {
  'NY': 'America/New_York',
  'CA': 'America/Los_Angeles',
  'TX': 'America/Chicago',
  'AZ': 'America/Phoenix', // No DST
  'HI': 'Pacific/Honolulu'
};

// By ZIP code
function getTimezoneByZip(zip) {
  const zipPrefix = zip.substring(0, 3);
  // ZIP to timezone mapping
  if (zipPrefix >= '100' && zipPrefix <= '149') {
    return 'America/New_York';
  } else if (zipPrefix >= '900' && zipPrefix <= '961') {
    return 'America/Los_Angeles';
  }
  // ... more mappings
}

// By phone area code
function getTimezoneByPhone(phone) {
  const areaCode = phone.substring(0, 3);
  const areaCodeTimezones = {
    '212': 'America/New_York',
    '310': 'America/Los_Angeles',
    '312': 'America/Chicago'
  };
  return areaCodeTimezones[areaCode];
}
```

## 📅 Holiday Management

### Holiday Configuration

Define holidays:

```javascript
const holidayConfig = {
  // Fixed holidays
  fixed: [
    { month: 1, day: 1, name: "New Year's Day" },
    { month: 7, day: 4, name: "Independence Day" },
    { month: 12, day: 25, name: "Christmas" }
  ],
  
  // Floating holidays
  floating: [
    { 
      name: "Thanksgiving",
      rule: "fourth Thursday of November" 
    },
    { 
      name: "Memorial Day",
      rule: "last Monday of May" 
    },
    { 
      name: "Labor Day",
      rule: "first Monday of September" 
    }
  ],
  
  // Custom business holidays
  custom: [
    "2024-11-29", // Black Friday
    "2024-12-31"  // New Year's Eve
  ]
};
```

### Holiday Handling

Process during holidays:

```javascript
function handleHoliday(lead, holiday) {
  const holidayRules = {
    'Christmas': {
      action: 'reject',
      message: 'Closed for Christmas'
    },
    'Thanksgiving': {
      action: 'queue',
      resumeDate: getNextBusinessDay()
    },
    'default': {
      action: 'reduced_capacity',
      multiplier: 0.5
    }
  };
  
  const rule = holidayRules[holiday.name] || holidayRules.default;
  return processWithRule(lead, rule);
}
```

## 👥 Buyer Schedule Management

### Individual Buyer Hours

Per-buyer scheduling:

```javascript
const buyerSchedules = {
  'buyer_123': {
    timezone: 'America/New_York',
    schedule: {
      monday: { open: 800, close: 1700 },
      tuesday: { open: 800, close: 1700 },
      wednesday: { open: 800, close: 1700 },
      thursday: { open: 800, close: 1700 },
      friday: { open: 800, close: 1600 },
      saturday: { open: 900, close: 1300 },
      sunday: { closed: true }
    },
    exceptions: [
      {
        date: '2024-01-15',
        hours: { open: 1000, close: 1500 },
        reason: 'Staff meeting'
      }
    ]
  }
};
```

### Capacity Scheduling

Time-based capacity:

```javascript
class CapacityScheduler {
  getHourlyCapacity(buyer, hour) {
    const schedule = buyer.capacitySchedule;
    
    // Peak hours
    if (hour >= 10 && hour <= 14) {
      return schedule.peakCapacity;
    }
    // Off-peak
    else if (hour < 9 || hour > 17) {
      return schedule.offPeakCapacity;
    }
    // Normal hours
    else {
      return schedule.normalCapacity;
    }
  }
  
  getDailyCapacity(buyer, date) {
    const dayOfWeek = date.getDay();
    
    // Weekend capacity
    if (dayOfWeek === 0 || dayOfWeek === 6) {
      return buyer.weekendCapacity || buyer.dailyCapacity * 0.5;
    }
    
    // Weekday capacity
    return buyer.dailyCapacity;
  }
}
```

## 🔀 Time-Based Routing

### Dynamic Routing Rules

Route by time:

```javascript
function routeByTime(lead) {
  const hour = new Date().getHours();
  const day = new Date().getDay();
  
  // Business hours routing
  if (hour >= 9 && hour < 17 && day >= 1 && day <= 5) {
    return routeToBusinessHoursBuyers(lead);
  }
  // Evening routing
  else if (hour >= 17 && hour < 21) {
    return routeToEveningBuyers(lead);
  }
  // Weekend routing
  else if (day === 0 || day === 6) {
    return routeToWeekendBuyers(lead);
  }
  // After hours
  else {
    return routeToAfterHoursBuyers(lead);
  }
}
```

### Time-Zone Aware Routing

Route to open buyers:

```javascript
function findOpenBuyers(allBuyers) {
  const now = new Date();
  
  return allBuyers.filter(buyer => {
    // Convert to buyer's timezone
    const buyerTime = convertToTimezone(now, buyer.timezone);
    const buyerHour = buyerTime.getHours();
    const buyerDay = buyerTime.getDay();
    
    // Check if open
    const schedule = buyer.schedule[getDayName(buyerDay)];
    if (!schedule || schedule.closed) return false;
    
    const currentTime = buyerHour * 100 + buyerTime.getMinutes();
    return currentTime >= schedule.open && currentTime <= schedule.close;
  });
}
```

## 📦 Advanced Scheduling Patterns

### Rolling Windows

Continuous availability:

```javascript
class RollingSchedule {
  constructor() {
    this.windowSize = 4; // hours
    this.regions = ['east', 'central', 'mountain', 'pacific'];
  }
  
  getCurrentWindow() {
    const easternHour = new Date().getUTCHours() - 5; // EST
    
    // Determine which regions are in business hours
    const activeRegions = this.regions.filter(region => {
      const regionHour = this.getRegionHour(region);
      return regionHour >= 9 && regionHour < 17;
    });
    
    return activeRegions;
  }
  
  routeToActiveRegions(lead) {
    const activeRegions = this.getCurrentWindow();
    const buyers = this.getBuyersByRegions(activeRegions);
    return this.selectOptimalBuyer(buyers, lead);
  }
}
```

### Batch Processing Windows

Scheduled batch runs:

```javascript
const batchSchedule = {
  'morning_batch': {
    time: '06:00:00',
    timezone: 'America/New_York',
    process: 'overnight_leads',
    notification: 'ops-team@company.com'
  },
  'noon_batch': {
    time: '12:00:00',
    timezone: 'America/New_York',
    process: 'morning_accumulation',
    conditions: {
      min_leads: 100,
      max_wait: 14400 // 4 hours
    }
  },
  'end_of_day': {
    time: '18:00:00',
    timezone: 'America/New_York',
    process: 'daily_reconciliation',
    actions: [
      'process_remaining',
      'send_reports',
      'archive_processed'
    ]
  }
};
```

### Schedule Inheritance

Hierarchical schedules:

```javascript
const scheduleHierarchy = {
  global: {
    timezone: 'America/New_York',
    businessHours: { start: 800, end: 1700 },
    holidays: globalHolidays
  },
  
  flow: {
    inherits: 'global',
    overrides: {
      businessHours: { start: 900, end: 1800 }
    }
  },
  
  buyer: {
    inherits: 'flow',
    overrides: {
      timezone: 'America/Los_Angeles',
      saturday: { open: 1000, close: 1400 }
    }
  }
};

function resolveSchedule(level) {
  let schedule = {};
  
  // Build from inheritance chain
  if (level.inherits) {
    schedule = { ...resolveSchedule(schedules[level.inherits]) };
  }
  
  // Apply overrides
  if (level.overrides) {
    Object.assign(schedule, level.overrides);
  }
  
  return schedule;
}
```

## 📈 Monitoring Schedule Performance

### Schedule Analytics

Track schedule effectiveness:

```javascript
const scheduleMetrics = {
  // Coverage metrics
  hoursOpen: calculateOpenHours(schedule),
  coverageRate: openHours / totalHours,
  
  // Lead distribution
  leadsByHour: groupLeadsByHour(leads),
  peakHours: identifyPeakHours(leadsByHour),
  
  // Missed opportunities
  afterHoursLeads: countAfterHoursLeads(),
  rejectedDueToSchedule: countScheduleRejections(),
  
  // Buyer utilization
  buyerUptime: calculateBuyerUptime(buyers),
  capacityUtilization: actualVolume / scheduledCapacity
};
```

### Schedule Optimization

Improve coverage:

```javascript
function optimizeSchedule(currentSchedule, leadData) {
  const analysis = {
    // Find gaps
    uncoveredHours: findUncoveredHighVolumeHours(leadData),
    
    // Identify waste
    lowVolumeOpenHours: findLowVolumeOpenHours(leadData),
    
    // Regional needs
    timezoneGaps: analyzeTimezoneCoverage(leadData)
  };
  
  const recommendations = {
    extendHours: analysis.uncoveredHours,
    reduceHours: analysis.lowVolumeOpenHours,
    addBuyers: analysis.timezoneGaps
  };
  
  return recommendations;
}
```

## 🎯 Best Practices

### Schedule Design

1. **Clear Documentation**:
   ```yaml
   Schedule: East Coast Business Hours
   Purpose: Standard business hour coverage
   Timezone: America/New_York
   Hours: Mon-Fri 9AM-5PM EST
   Holidays: US Federal holidays
   Exceptions: See schedule_exceptions.yml
   ```

2. **Graceful Degradation**:
   ```javascript
   // Always have fallback
   const schedule = buyer.schedule || 
                   flow.defaultSchedule || 
                   system.globalSchedule;
   ```

3. **Testing Schedules**:
   ```javascript
   // Test different times
   const testCases = [
     { time: '2024-01-15 09:00:00', expected: 'open' },
     { time: '2024-01-15 17:00:00', expected: 'open' },
     { time: '2024-01-15 17:01:00', expected: 'closed' },
     { time: '2024-01-13 10:00:00', expected: 'closed' } // Saturday
   ];
   ```

### Common Pitfalls

1. **DST Handling**: Always use timezone-aware dates
2. **Holiday Updates**: Keep holiday lists current
3. **Capacity Planning**: Account for seasonal variations
4. **Time Zone Confusion**: Be explicit about zones

## 📚 Related Documentation

- [Flow Configuration](./configuring-flow-steps.md) - Step scheduling
- [Buyer Management](./managing-buyers.md) - Buyer schedules
- [Day Parting](./day-parting.md) - Time-based pricing

---

⏰ **Schedule Mastery**: Effective scheduling ensures leads reach the right buyers at the right time. Plan thoroughly and monitor continuously for optimal results!