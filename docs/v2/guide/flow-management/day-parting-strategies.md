# Day Parting Strategies

Optimize lead distribution and pricing based on time patterns. Master day parting to route leads when buyers want them most, maximize conversion rates, and implement sophisticated time-based pricing.

## 📍 You Are Here

You need to implement time-based routing, pricing, or capacity management. Day parting helps you align lead flow with buyer schedules, optimize for conversion windows, and maximize revenue through temporal strategies.

## 🎯 What You'll Learn

- Day parting fundamentals
- Time-based routing
- Dynamic pricing by time
- Conversion optimization
- Advanced scheduling patterns
- Performance analysis

## ⏰ Understanding Day Parting

### What is Day Parting?

Day parting divides time into segments for optimization:

```javascript
const dayPartSegments = {
  // Traditional broadcast day parts
  broadcast: {
    'early_morning': { start: '06:00', end: '09:00' },
    'daytime': { start: '09:00', end: '16:00' },
    'early_fringe': { start: '16:00', end: '19:00' },
    'prime_time': { start: '19:00', end: '23:00' },
    'late_night': { start: '23:00', end: '02:00' },
    'overnight': { start: '02:00', end: '06:00' }
  },
  
  // Business-focused segments
  business: {
    'pre_work': { start: '06:00', end: '09:00' },
    'morning': { start: '09:00', end: '12:00' },
    'lunch': { start: '12:00', end: '13:00' },
    'afternoon': { start: '13:00', end: '17:00' },
    'after_work': { start: '17:00', end: '20:00' },
    'evening': { start: '20:00', end: '23:00' },
    'overnight': { start: '23:00', end: '06:00' }
  },
  
  // Custom segments
  custom: {
    'peak_conversion': { start: '10:00', end: '14:00' },
    'high_value': { start: '18:00', end: '21:00' },
    'low_competition': { start: '05:00', end: '08:00' }
  }
};
```

### Why Day Parting Matters

Benefits of temporal optimization:

```javascript
const dayPartingBenefits = {
  conversion_optimization: {
    metric: 'conversion_rate',
    improvement: '35%',
    reason: 'Leads delivered when buyers are most responsive'
  },
  
  cost_efficiency: {
    metric: 'cost_per_acquisition',
    improvement: '-22%',
    reason: 'Lower prices during off-peak hours'
  },
  
  buyer_satisfaction: {
    metric: 'buyer_nps',
    improvement: '+15 points',
    reason: 'Leads arrive when buyers want them'
  },
  
  operational_efficiency: {
    metric: 'staff_utilization',
    improvement: '28%',
    reason: 'Aligned volume with staffing levels'
  }
};
```

## 🔀 Time-Based Routing

### Basic Time Routing

Route leads by time of day:

```javascript
class TimeBasedRouter {
  constructor(config) {
    this.routes = config.routes;
    this.timezone = config.timezone || 'America/New_York';
    this.fallbackRoute = config.fallback;
  }
  
  route(lead) {
    const currentTime = this.getCurrentTime(lead.timezone || this.timezone);
    const dayOfWeek = currentTime.getDay();
    const hour = currentTime.getHours();
    const minute = currentTime.getMinutes();
    const timeValue = hour * 100 + minute; // HHMM format
    
    // Find matching route
    for (const route of this.routes) {
      if (this.matchesTimeCondition(route, dayOfWeek, timeValue)) {
        return route.destination;
      }
    }
    
    return this.fallbackRoute;
  }
  
  matchesTimeCondition(route, dayOfWeek, timeValue) {
    // Check day of week
    if (route.days && !route.days.includes(dayOfWeek)) {
      return false;
    }
    
    // Check time range
    const startTime = this.parseTime(route.start);
    const endTime = this.parseTime(route.end);
    
    // Handle overnight periods
    if (endTime < startTime) {
      return timeValue >= startTime || timeValue < endTime;
    } else {
      return timeValue >= startTime && timeValue < endTime;
    }
  }
}

// Configuration example
const routingConfig = {
  timezone: 'America/New_York',
  routes: [
    {
      name: 'Business Hours Premium',
      days: [1, 2, 3, 4, 5], // Mon-Fri
      start: '09:00',
      end: '17:00',
      destination: 'premium_buyer_pool'
    },
    {
      name: 'Evening Special',
      days: [1, 2, 3, 4, 5], // Mon-Fri
      start: '17:00',
      end: '21:00',
      destination: 'evening_buyer_pool'
    },
    {
      name: 'Weekend',
      days: [0, 6], // Sat-Sun
      start: '10:00',
      end: '18:00',
      destination: 'weekend_buyer_pool'
    }
  ],
  fallback: 'overflow_buyer_pool'
};
```

### Multi-Timezone Routing

Handle leads across time zones:

```javascript
class MultiTimezoneRouter {
  constructor() {
    this.buyerSchedules = new Map();
  }
  
  addBuyer(buyer) {
    this.buyerSchedules.set(buyer.id, {
      ...buyer,
      schedule: this.parseSchedule(buyer.schedule),
      timezone: buyer.timezone
    });
  }
  
  findAvailableBuyers(lead) {
    const leadTime = new Date();
    const availableBuyers = [];
    
    for (const [buyerId, buyer] of this.buyerSchedules) {
      // Convert to buyer's timezone
      const buyerTime = this.convertToTimezone(leadTime, buyer.timezone);
      
      if (this.isBuyerAvailable(buyer, buyerTime)) {
        availableBuyers.push({
          ...buyer,
          localTime: buyerTime,
          preference: this.calculatePreference(buyer, buyerTime)
        });
      }
    }
    
    // Sort by preference
    return availableBuyers.sort((a, b) => b.preference - a.preference);
  }
  
  isBuyerAvailable(buyer, time) {
    const dayOfWeek = time.getDay();
    const timeOfDay = time.getHours() * 100 + time.getMinutes();
    
    const daySchedule = buyer.schedule[dayOfWeek];
    if (!daySchedule || !daySchedule.open) return false;
    
    return timeOfDay >= daySchedule.start && timeOfDay < daySchedule.end;
  }
  
  calculatePreference(buyer, time) {
    let score = 100;
    
    // Peak hours bonus
    const hour = time.getHours();
    if (hour >= 10 && hour <= 14) score += 20;
    else if (hour >= 18 && hour <= 20) score += 15;
    
    // Capacity utilization
    const utilization = buyer.getCurrentUtilization();
    if (utilization < 0.5) score += 30;
    else if (utilization > 0.8) score -= 20;
    
    // Historical performance
    const hourlyConversion = buyer.getConversionRate(hour);
    score += hourlyConversion * 50;
    
    return score;
  }
}
```

### Intelligent Queue Management

Queue leads for optimal delivery:

```javascript
class TimeOptimizedQueue {
  constructor() {
    this.queues = new Map();
    this.predictions = new PredictionEngine();
  }
  
  queueLead(lead, options = {}) {
    const optimalTime = this.calculateOptimalDeliveryTime(lead);
    
    const queueEntry = {
      lead,
      queued_at: new Date(),
      deliver_at: optimalTime,
      priority: this.calculatePriority(lead),
      attempts: 0,
      options
    };
    
    this.addToQueue(queueEntry);
    
    return {
      queued: true,
      position: this.getQueuePosition(queueEntry),
      estimated_delivery: optimalTime
    };
  }
  
  calculateOptimalDeliveryTime(lead) {
    const factors = {
      buyer_availability: this.getBuyerAvailabilityWindows(lead),
      conversion_probability: this.predictions.getConversionByHour(lead),
      competition_level: this.getCompetitionByHour(),
      lead_decay: this.calculateLeadDecay(lead)
    };
    
    // Score each future hour
    const hourScores = [];
    const now = new Date();
    
    for (let h = 0; h < 24; h++) {
      const checkTime = new Date(now.getTime() + h * 3600000);
      const score = this.scoreDeliveryTime(checkTime, factors, lead);
      
      hourScores.push({
        time: checkTime,
        score,
        factors: this.explainScore(checkTime, factors)
      });
    }
    
    // Select best time
    const optimal = hourScores.reduce((best, current) => 
      current.score > best.score ? current : best
    );
    
    return optimal.time;
  }
  
  scoreDeliveryTime(time, factors, lead) {
    let score = 0;
    
    // Buyer availability (highest weight)
    const availability = factors.buyer_availability
      .filter(window => this.timeInWindow(time, window))
      .length;
    score += availability * 40;
    
    // Conversion probability
    const conversionProb = factors.conversion_probability[time.getHours()];
    score += conversionProb * 30;
    
    // Competition (inverse relationship)
    const competition = factors.competition_level[time.getHours()];
    score += (1 - competition) * 20;
    
    // Lead freshness decay
    const age = time - lead.created_at;
    const decayFactor = Math.exp(-age / factors.lead_decay.halfLife);
    score *= decayFactor;
    
    return score;
  }
}
```

## 💰 Dynamic Pricing Strategies

### Time-Based Pricing

Adjust prices by time:

```javascript
class DayPartPricing {
  constructor(config) {
    this.basePrices = config.basePrices;
    this.adjustments = config.adjustments;
    this.dynamicPricing = config.enableDynamic || false;
  }
  
  calculatePrice(lead, destination) {
    const basePrice = this.getBasePrice(lead, destination);
    const timeAdjustment = this.getTimeAdjustment(lead);
    const demandAdjustment = this.dynamicPricing ? 
      this.getDemandAdjustment() : 1.0;
    
    const finalPrice = basePrice * timeAdjustment * demandAdjustment;
    
    return {
      base: basePrice,
      adjustments: {
        time: timeAdjustment,
        demand: demandAdjustment
      },
      final: Math.round(finalPrice * 100) / 100,
      explanation: this.explainPricing(basePrice, timeAdjustment, demandAdjustment)
    };
  }
  
  getTimeAdjustment(lead) {
    const hour = new Date().getHours();
    const day = new Date().getDay();
    
    // Hour-based adjustments
    const hourlyAdjustments = {
      // Early morning discount
      0: 0.7, 1: 0.7, 2: 0.7, 3: 0.7, 4: 0.7, 5: 0.8,
      
      // Morning ramp up
      6: 0.9, 7: 0.95, 8: 1.0, 9: 1.1,
      
      // Peak hours premium
      10: 1.2, 11: 1.25, 12: 1.3, 13: 1.3, 14: 1.25,
      
      // Afternoon
      15: 1.15, 16: 1.1, 17: 1.05,
      
      // Evening premium
      18: 1.15, 19: 1.2, 20: 1.15, 21: 1.0,
      
      // Late night discount
      22: 0.85, 23: 0.75
    };
    
    let adjustment = hourlyAdjustments[hour] || 1.0;
    
    // Weekend adjustment
    if (day === 0 || day === 6) {
      adjustment *= 0.85; // 15% weekend discount
    }
    
    // Special day adjustments
    const specialAdjustment = this.getSpecialDayAdjustment(new Date());
    adjustment *= specialAdjustment;
    
    return adjustment;
  }
  
  getDemandAdjustment() {
    // Real-time demand-based pricing
    const metrics = {
      current_volume: this.getCurrentHourlyVolume(),
      current_capacity: this.getAvailableCapacity(),
      conversion_rate: this.getRecentConversionRate(),
      competitor_pricing: this.getCompetitorPricing()
    };
    
    let adjustment = 1.0;
    
    // High demand, low capacity = higher prices
    const utilization = metrics.current_volume / metrics.current_capacity;
    if (utilization > 0.9) {
      adjustment *= 1.15;
    } else if (utilization > 0.8) {
      adjustment *= 1.1;
    } else if (utilization < 0.3) {
      adjustment *= 0.9;
    }
    
    // High conversion = higher prices
    if (metrics.conversion_rate > 0.8) {
      adjustment *= 1.1;
    }
    
    return adjustment;
  }
}

// Pricing configuration
const pricingConfig = {
  basePrices: {
    default: 45.00,
    premium: 65.00,
    economy: 25.00
  },
  
  adjustments: {
    enableTimeOfDay: true,
    enableDayOfWeek: true,
    enableDemandBased: true,
    enableSpecialDays: true
  },
  
  specialDays: [
    { date: '2024-07-04', name: 'Independence Day', adjustment: 0.5 },
    { date: '2024-12-25', name: 'Christmas', adjustment: 0.3 },
    { date: '2024-11-29', name: 'Black Friday', adjustment: 1.5 }
  ]
};
```

### Surge Pricing

Dynamic pricing for peak demand:

```javascript
class SurgePricingEngine {
  constructor() {
    this.baseMultiplier = 1.0;
    this.surgeThresholds = [
      { utilization: 0.95, multiplier: 1.5, name: 'Extreme' },
      { utilization: 0.85, multiplier: 1.3, name: 'High' },
      { utilization: 0.75, multiplier: 1.15, name: 'Moderate' },
      { utilization: 0.65, multiplier: 1.0, name: 'Normal' }
    ];
    this.metrics = new MetricsCollector();
  }
  
  calculateSurge() {
    const realTimeMetrics = {
      lead_velocity: this.metrics.getLeadVelocity('5m'),
      buyer_capacity: this.metrics.getBuyerCapacity(),
      queue_depth: this.metrics.getQueueDepth(),
      conversion_rate: this.metrics.getConversionRate('1h')
    };
    
    // Calculate utilization
    const utilization = this.calculateUtilization(realTimeMetrics);
    
    // Find applicable surge level
    const surgeLevel = this.surgeThresholds.find(level => 
      utilization >= level.utilization
    ) || { multiplier: 1.0, name: 'Normal' };
    
    // Apply smoothing to prevent rapid changes
    const smoothedMultiplier = this.smoothMultiplier(
      surgeLevel.multiplier,
      this.currentMultiplier
    );
    
    return {
      multiplier: smoothedMultiplier,
      level: surgeLevel.name,
      utilization: utilization * 100,
      metrics: realTimeMetrics,
      next_update: new Date(Date.now() + 60000) // Update every minute
    };
  }
  
  smoothMultiplier(target, current, factor = 0.3) {
    // Exponential smoothing
    return current + (target - current) * factor;
  }
  
  applySurgePricing(basePrice, lead) {
    const surge = this.calculateSurge();
    const timeMultiplier = this.getTimeMultiplier();
    const qualityMultiplier = this.getQualityMultiplier(lead);
    
    const finalPrice = basePrice * surge.multiplier * timeMultiplier * qualityMultiplier;
    
    return {
      base_price: basePrice,
      surge_multiplier: surge.multiplier,
      surge_level: surge.level,
      time_multiplier: timeMultiplier,
      quality_multiplier: qualityMultiplier,
      final_price: Math.round(finalPrice * 100) / 100,
      valid_until: surge.next_update
    };
  }
}
```

## 📋 Conversion Optimization

### Optimal Delivery Windows

Identify best times for conversion:

```javascript
class ConversionOptimizer {
  constructor() {
    this.historicalData = new HistoricalDatabase();
    this.mlModel = new ConversionPredictionModel();
  }
  
  async analyzeConversionPatterns(segment) {
    const data = await this.historicalData.getConversions(segment, '90days');
    
    const patterns = {
      by_hour: this.analyzeHourlyPatterns(data),
      by_day: this.analyzeDailyPatterns(data),
      by_hour_and_day: this.analyzeCombinedPatterns(data),
      
      optimal_windows: this.findOptimalWindows(data),
      avoid_windows: this.findPoorWindows(data),
      
      insights: this.generateInsights(data)
    };
    
    return patterns;
  }
  
  analyzeHourlyPatterns(data) {
    const hourlyStats = new Array(24).fill(null).map(() => ({
      attempts: 0,
      conversions: 0,
      revenue: 0,
      avg_time_to_convert: 0
    }));
    
    data.forEach(record => {
      const hour = new Date(record.delivered_at).getHours();
      hourlyStats[hour].attempts++;
      
      if (record.converted) {
        hourlyStats[hour].conversions++;
        hourlyStats[hour].revenue += record.revenue;
        hourlyStats[hour].avg_time_to_convert += record.time_to_convert;
      }
    });
    
    // Calculate rates and averages
    return hourlyStats.map((stats, hour) => ({
      hour,
      conversion_rate: stats.conversions / stats.attempts || 0,
      avg_revenue: stats.revenue / stats.conversions || 0,
      avg_time_to_convert: stats.avg_time_to_convert / stats.conversions || 0,
      volume: stats.attempts,
      
      score: this.calculateHourScore(stats),
      recommendation: this.getHourRecommendation(stats, hour)
    }));
  }
  
  findOptimalWindows(data) {
    const windows = [];
    const threshold = this.calculateThreshold(data);
    
    let currentWindow = null;
    
    this.analyzeHourlyPatterns(data).forEach((hour, index) => {
      if (hour.score > threshold) {
        if (!currentWindow) {
          currentWindow = {
            start: index,
            end: index,
            avg_score: hour.score,
            total_volume: hour.volume
          };
        } else {
          currentWindow.end = index;
          currentWindow.avg_score = 
            (currentWindow.avg_score + hour.score) / 2;
          currentWindow.total_volume += hour.volume;
        }
      } else if (currentWindow) {
        windows.push(currentWindow);
        currentWindow = null;
      }
    });
    
    if (currentWindow) windows.push(currentWindow);
    
    return windows.map(w => ({
      ...w,
      description: `${this.formatHour(w.start)} - ${this.formatHour(w.end + 1)}`,
      quality: this.assessWindowQuality(w)
    }));
  }
}
```

### Contact Strategy Optimization

Best times to contact leads:

```javascript
class ContactStrategyOptimizer {
  optimizeContactSchedule(lead, buyerPreferences) {
    const factors = {
      lead_data: {
        timezone: this.detectTimezone(lead),
        occupation: this.inferOccupation(lead),
        age_group: this.categorizeAge(lead.age),
        previous_engagement: this.getEngagementHistory(lead)
      },
      
      buyer_data: {
        operating_hours: buyerPreferences.hours,
        preferred_times: buyerPreferences.preferred_contact_times,
        capacity_by_hour: buyerPreferences.hourly_capacity
      },
      
      historical_data: {
        contact_success_by_hour: this.getContactSuccessRates(),
        conversion_by_delay: this.getConversionByDelay()
      }
    };
    
    const strategy = {
      immediate: this.shouldContactImmediately(factors),
      optimal_time: this.calculateOptimalContactTime(factors),
      
      schedule: this.buildContactSchedule(factors),
      
      messaging: {
        tone: this.recommendTone(factors),
        channel: this.recommendChannel(factors),
        urgency: this.calculateUrgency(factors)
      }
    };
    
    return strategy;
  }
  
  buildContactSchedule(factors) {
    const schedule = [];
    const maxAttempts = 5;
    let delay = 0;
    
    for (let attempt = 1; attempt <= maxAttempts; attempt++) {
      const timing = this.calculateAttemptTiming(attempt, factors);
      
      schedule.push({
        attempt,
        delay_minutes: delay,
        time: new Date(Date.now() + delay * 60000),
        method: timing.method,
        script_tone: timing.tone,
        
        success_probability: timing.probability,
        
        if_no_answer: timing.voicemail ? 'leave_voicemail' : 'no_message',
        
        next_attempt_delay: timing.next_delay
      });
      
      delay += timing.next_delay;
    }
    
    return schedule;
  }
}
```

## 📈 Performance Analysis

### Day Part Analytics

Measure and optimize:

```javascript
class DayPartAnalytics {
  constructor() {
    this.metrics = new MetricsStore();
    this.reports = new ReportGenerator();
  }
  
  async generateDayPartReport(dateRange) {
    const data = await this.metrics.getDataForRange(dateRange);
    
    const report = {
      summary: this.generateSummary(data),
      
      performance_by_hour: this.analyzeHourlyPerformance(data),
      performance_by_day: this.analyzeDailyPerformance(data),
      
      day_part_comparison: this.compareDayParts(data),
      
      optimal_schedules: this.recommendSchedules(data),
      
      financial_impact: this.calculateFinancialImpact(data),
      
      visualizations: this.generateCharts(data)
    };
    
    return report;
  }
  
  analyzeHourlyPerformance(data) {
    const hourlyMetrics = new Array(24).fill(null).map((_, hour) => {
      const hourData = data.filter(d => 
        new Date(d.timestamp).getHours() === hour
      );
      
      return {
        hour,
        volume: hourData.length,
        
        conversion_rate: this.calculateConversionRate(hourData),
        avg_revenue: this.calculateAvgRevenue(hourData),
        avg_response_time: this.calculateAvgResponseTime(hourData),
        
        quality_metrics: {
          avg_quality_score: this.calculateAvgQuality(hourData),
          high_quality_percentage: this.calculateHighQualityPercentage(hourData)
        },
        
        buyer_metrics: {
          acceptance_rate: this.calculateAcceptanceRate(hourData),
          buyer_satisfaction: this.calculateBuyerSatisfaction(hourData)
        },
        
        efficiency_score: this.calculateEfficiencyScore(hourData),
        
        recommendations: this.generateHourlyRecommendations(hourData, hour)
      };
    });
    
    return hourlyMetrics;
  }
  
  compareDayParts(data) {
    const dayParts = {
      'morning': { hours: [6, 7, 8, 9, 10, 11] },
      'afternoon': { hours: [12, 13, 14, 15, 16, 17] },
      'evening': { hours: [18, 19, 20, 21, 22, 23] },
      'overnight': { hours: [0, 1, 2, 3, 4, 5] }
    };
    
    const comparison = {};
    
    Object.entries(dayParts).forEach(([name, config]) => {
      const partData = data.filter(d => 
        config.hours.includes(new Date(d.timestamp).getHours())
      );
      
      comparison[name] = {
        volume: partData.length,
        volume_percentage: (partData.length / data.length) * 100,
        
        performance: {
          conversion_rate: this.calculateConversionRate(partData),
          revenue: this.calculateTotalRevenue(partData),
          avg_value: this.calculateAvgValue(partData)
        },
        
        quality: {
          avg_score: this.calculateAvgQuality(partData),
          distribution: this.calculateQualityDistribution(partData)
        },
        
        optimal_use: this.recommendDayPartUsage(partData, name)
      };
    });
    
    return comparison;
  }
}
```

### ROI Optimization

Maximize return through timing:

```javascript
class DayPartROI {
  optimizeScheduleForROI(historicalData, constraints) {
    const model = {
      objective: 'maximize_profit',
      
      variables: this.defineScheduleVariables(),
      
      constraints: [
        ...this.volumeConstraints(constraints),
        ...this.capacityConstraints(constraints),
        ...this.budgetConstraints(constraints)
      ],
      
      coefficients: this.calculateProfitCoefficients(historicalData)
    };
    
    const solution = this.solver.solve(model);
    
    return {
      optimal_schedule: this.interpretSolution(solution),
      expected_roi: solution.objective_value,
      
      implementation: {
        routing_rules: this.generateRoutingRules(solution),
        pricing_rules: this.generatePricingRules(solution),
        capacity_allocation: this.generateCapacityPlan(solution)
      },
      
      sensitivity_analysis: this.analyzeSensitivity(solution, model)
    };
  }
  
  calculateProfitCoefficients(data) {
    const coefficients = {};
    
    // For each hour and buyer combination
    this.buyers.forEach(buyer => {
      for (let hour = 0; hour < 24; hour++) {
        const key = `${buyer.id}_hour_${hour}`;
        
        const hourlyData = data.filter(d => 
          d.buyer === buyer.id && 
          new Date(d.timestamp).getHours() === hour
        );
        
        // Expected profit = revenue * conversion_rate - cost
        const avgRevenue = this.calculateAvgRevenue(hourlyData);
        const conversionRate = this.calculateConversionRate(hourlyData);
        const avgCost = this.calculateAvgCost(hourlyData);
        
        coefficients[key] = (avgRevenue * conversionRate) - avgCost;
      }
    });
    
    return coefficients;
  }
}
```

## 💡 Best Practices

### Implementation Guidelines

1. **Start Simple**: Begin with basic time blocks
2. **Test Thoroughly**: A/B test schedule changes
3. **Monitor Continuously**: Track performance shifts
4. **Adjust Gradually**: Avoid dramatic changes
5. **Consider Holidays**: Plan for special days

### Common Patterns

```javascript
const commonDayPartPatterns = {
  b2c: {
    peak_hours: ['10-12', '18-20'],
    avoid_hours: ['22-06'],
    weekend_premium: false
  },
  
  b2b: {
    peak_hours: ['09-11', '14-16'],
    avoid_hours: ['18-08', 'weekends'],
    weekend_premium: true
  },
  
  financial: {
    peak_hours: ['09-17'],
    avoid_hours: ['20-07'],
    lunch_dip: '12-13'
  },
  
  insurance: {
    peak_hours: ['10-14', '18-20'],
    saturday_morning: true,
    sunday_closed: true
  }
};
```

### Testing Strategies

```javascript
class DayPartTester {
  async runDayPartTest(config) {
    const control = config.current_schedule;
    const variant = config.test_schedule;
    const duration = config.test_duration || '2_weeks';
    
    // Split traffic
    const test = {
      name: config.name,
      hypothesis: config.hypothesis,
      
      allocation: {
        control: 0.5,
        variant: 0.5
      },
      
      metrics: [
        'conversion_rate',
        'revenue_per_lead',
        'buyer_satisfaction',
        'operational_cost'
      ],
      
      success_criteria: config.success_criteria
    };
    
    // Run test
    const results = await this.abTest.run(test, duration);
    
    // Analyze results
    return {
      winner: results.winner,
      confidence: results.statistical_significance,
      impact: results.estimated_impact,
      recommendation: this.generateRecommendation(results)
    };
  }
}
```

## 📚 Related Documentation

- [Hours of Operation](./hours-of-operation.md) - Schedule configuration
- [Volume Caps Advanced](./volume-caps-advanced.md) - Time-based caps
- [Revenue Optimization](../analytics/revenue-optimization.md) - Pricing strategies

---

⏰ **Timing Excellence**: Day parting aligns your lead operations with natural rhythms of business and buyer behavior. Use data to find your optimal patterns and continuously refine!