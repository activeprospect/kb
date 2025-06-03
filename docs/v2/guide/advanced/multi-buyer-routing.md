# Multi-Buyer Routing and Distribution

Master complex lead distribution scenarios with multiple buyers, sophisticated routing rules, and optimized delivery strategies. Learn to balance buyer needs while maximizing revenue.

## 📍 You Are Here

You're managing lead distribution to multiple buyers with different requirements, capacities, and preferences. This guide covers advanced routing patterns that go beyond simple round-robin or highest-bidder-wins scenarios.

## 🎯 What You'll Learn

- Complex routing algorithms
- Buyer matching strategies
- Capacity management
- Priority systems
- Fallback mechanisms
- Performance optimization

## 🏗️ Routing Architecture

### Distribution Models

**Exclusive Distribution**:
```
Lead → Single Buyer (Highest match/bid)
```

**Shared Distribution**:
```
Lead → Multiple Buyers (Up to N buyers)
```

**Hybrid Distribution**:
```
Lead → Primary (Exclusive) + Secondary (Shared after delay)
```

**Waterfall Distribution**:
```
Lead → Buyer 1 → (if rejected) → Buyer 2 → Buyer 3...
```

## 🎯 Advanced Routing Algorithms

### Weighted Distribution

Balance multiple factors:

```javascript
function calculateBuyerScore(lead, buyer) {
  const weights = {
    price: 0.35,
    quality: 0.25,
    capacity: 0.20,
    performance: 0.15,
    relationship: 0.05
  };
  
  const scores = {
    price: normalizeBidPrice(buyer.bid),
    quality: calculateQualityMatch(lead, buyer.requirements),
    capacity: calculateCapacityScore(buyer),
    performance: buyer.metrics.conversionRate,
    relationship: calculateRelationshipScore(buyer)
  };
  
  return Object.entries(weights).reduce((total, [factor, weight]) => {
    return total + (scores[factor] * weight);
  }, 0);
}

function routeToOptimalBuyers(lead, buyers, maxBuyers = 1) {
  const scoredBuyers = buyers
    .map(buyer => ({
      buyer,
      score: calculateBuyerScore(lead, buyer)
    }))
    .filter(item => item.score > 0.5) // Minimum threshold
    .sort((a, b) => b.score - a.score);
    
  return scoredBuyers.slice(0, maxBuyers).map(item => item.buyer);
}
```

### Geographic Optimization

Route based on location and coverage:

```javascript
class GeographicRouter {
  constructor(buyers) {
    this.buyerCoverage = this.indexBuyerCoverage(buyers);
    this.zipToTimezone = this.loadTimezoneData();
  }
  
  routeByGeography(lead) {
    const leadLocation = {
      state: lead.state,
      zip: lead.zip,
      timezone: this.zipToTimezone[lead.zip],
      coordinates: this.getCoordinates(lead.zip)
    };
    
    // Find buyers serving this area
    const eligibleBuyers = this.buyerCoverage[lead.state] || [];
    
    // Further filter by specific requirements
    return eligibleBuyers.filter(buyer => {
      // ZIP radius check
      if (buyer.requirements.maxRadius) {
        const distance = this.calculateDistance(
          leadLocation.coordinates,
          buyer.serviceCenter
        );
        if (distance > buyer.requirements.maxRadius) return false;
      }
      
      // Business hours check
      if (buyer.requirements.businessHoursOnly) {
        const localTime = this.getLocalTime(leadLocation.timezone);
        if (!this.isBusinessHours(localTime, buyer.hours)) return false;
      }
      
      return true;
    });
  }
}
```

### Intelligent Capacity Management

Distribute based on real-time capacity:

```javascript
class CapacityManager {
  constructor() {
    this.buyerCapacity = new Map();
    this.utilizationTargets = new Map();
  }
  
  async routeWithCapacity(lead, eligibleBuyers) {
    const buyersWithCapacity = [];
    
    for (const buyer of eligibleBuyers) {
      const capacity = await this.getAvailableCapacity(buyer);
      const utilization = await this.getCurrentUtilization(buyer);
      
      // Dynamic capacity calculation
      const effectiveCapacity = this.calculateEffectiveCapacity(
        buyer,
        capacity,
        utilization,
        new Date().getHours()
      );
      
      if (effectiveCapacity > 0) {
        buyersWithCapacity.push({
          buyer,
          capacity: effectiveCapacity,
          priority: this.calculatePriority(buyer, utilization)
        });
      }
    }
    
    // Sort by priority and capacity
    return this.selectOptimalBuyers(buyersWithCapacity, lead);
  }
  
  calculateEffectiveCapacity(buyer, rawCapacity, utilization, hour) {
    // Adjust for time of day
    const hourlyMultiplier = buyer.peakHours.includes(hour) ? 1.2 : 0.8;
    
    // Adjust for current utilization
    const utilizationMultiplier = utilization < 0.7 ? 1.1 : 
                                  utilization > 0.9 ? 0.7 : 1.0;
    
    // Adjust for buyer performance
    const performanceMultiplier = buyer.recentAcceptRate > 0.8 ? 1.1 : 0.9;
    
    return Math.floor(
      rawCapacity * hourlyMultiplier * 
      utilizationMultiplier * performanceMultiplier
    );
  }
}
```

## 🔄 Sophisticated Matching

### Multi-Criteria Matching

Match complex buyer requirements:

```javascript
class BuyerMatcher {
  matchScore(lead, buyer) {
    const requirements = buyer.requirements;
    let score = 100; // Start with perfect score
    
    // Hard filters (must match)
    const hardFilters = [
      { field: 'state', check: this.checkState },
      { field: 'creditScore', check: this.checkCreditRange },
      { field: 'age', check: this.checkAgeRange },
      { field: 'consentAge', check: this.checkConsentRecency }
    ];
    
    for (const filter of hardFilters) {
      if (!filter.check(lead, requirements)) {
        return 0; // Fail fast on hard requirements
      }
    }
    
    // Soft preferences (affect score)
    const preferences = [
      { 
        field: 'source',
        weight: 10,
        check: (lead, req) => req.preferredSources?.includes(lead.source) 
      },
      { 
        field: 'timeOfDay',
        weight: 5,
        check: (lead, req) => this.isPreferredTime(new Date(), req.preferredHours)
      },
      { 
        field: 'previousCustomer',
        weight: 15,
        check: (lead, req) => !req.excludePreviousCustomers || !lead.isPrevious
      }
    ];
    
    // Calculate preference score
    for (const pref of preferences) {
      if (!pref.check(lead, requirements)) {
        score -= pref.weight;
      }
    }
    
    // Quality bonus
    if (lead.qualityScore > 85) {
      score += 10;
    }
    
    return Math.max(0, score);
  }
}
```

### Buyer Specialization Routing

Route to specialists when appropriate:

```javascript
class SpecializationRouter {
  constructor() {
    this.specializations = {
      'high_risk': {
        buyers: ['buyer_123', 'buyer_456'],
        criteria: lead => lead.creditScore < 600,
        premium: 1.2
      },
      'spanish_speaking': {
        buyers: ['buyer_789', 'buyer_012'],
        criteria: lead => lead.language === 'es',
        premium: 1.1
      },
      'veterans': {
        buyers: ['buyer_345', 'buyer_678'],
        criteria: lead => lead.militaryService === true,
        premium: 1.0
      },
      'premium': {
        buyers: ['buyer_901', 'buyer_234'],
        criteria: lead => lead.income > 100000 && lead.creditScore > 750,
        premium: 1.5
      }
    };
  }
  
  routeToSpecialist(lead, generalBuyers) {
    // Check for specialization matches
    for (const [type, config] of Object.entries(this.specializations)) {
      if (config.criteria(lead)) {
        const specialists = config.buyers
          .map(id => this.getBuyerById(id))
          .filter(buyer => buyer && buyer.isActive);
          
        if (specialists.length > 0) {
          return {
            buyers: specialists,
            pricing: this.basePricing * config.premium,
            reason: `Routed to ${type} specialists`
          };
        }
      }
    }
    
    // Fall back to general buyers
    return {
      buyers: generalBuyers,
      pricing: this.basePricing,
      reason: 'Standard routing'
    };
  }
}
```

## 🔀 Distribution Strategies

### Tiered Waterfall

Systematic buyer attempts:

```javascript
class WaterfallDistributor {
  async distribute(lead, buyerTiers) {
    const results = [];
    
    for (const tier of buyerTiers) {
      const tierResult = await this.attemptTier(lead, tier);
      results.push(tierResult);
      
      if (tierResult.accepted) {
        // Check if exclusive or can continue
        if (tier.exclusive || tierResult.buyer.requiresExclusive) {
          break;
        }
      }
      
      // Add delay between tiers if configured
      if (tier.delayNext && !tierResult.accepted) {
        await this.delay(tier.delayNext);
      }
    }
    
    return {
      distributions: results.filter(r => r.accepted),
      attempts: results.length,
      revenue: results.reduce((sum, r) => sum + (r.revenue || 0), 0)
    };
  }
  
  async attemptTier(lead, tier) {
    const buyers = await this.selectTierBuyers(lead, tier);
    
    for (const buyer of buyers) {
      try {
        const result = await this.attemptDelivery(lead, buyer);
        
        if (result.accepted) {
          return {
            accepted: true,
            buyer: buyer,
            revenue: result.price,
            responseTime: result.duration
          };
        }
      } catch (error) {
        this.logError(buyer, error);
      }
    }
    
    return { accepted: false, tier: tier.name };
  }
}
```

### Smart Fallback Chains

Handle rejections intelligently:

```javascript
class FallbackChain {
  constructor() {
    this.chains = new Map();
    this.buildChains();
  }
  
  buildChains() {
    // Define fallback relationships
    this.chains.set('premium_auto', [
      'standard_auto',
      'subprime_auto',
      'auto_remarketing'
    ]);
    
    this.chains.set('purchase_mortgage', [
      'refinance_mortgage',
      'home_equity',
      'personal_loan'
    ]);
  }
  
  async routeWithFallback(lead, initialCategory) {
    const chain = this.chains.get(initialCategory) || [initialCategory];
    
    for (const category of chain) {
      const buyers = await this.getBuyersForCategory(category);
      const result = await this.attemptCategory(lead, buyers, category);
      
      if (result.success) {
        return result;
      }
      
      // Transform lead for next category if needed
      lead = this.transformForCategory(lead, category, chain[chain.indexOf(category) + 1]);
    }
    
    return { success: false, exhausted: true };
  }
}
```

## ⚡ Performance Optimization

### Parallel Processing

Maximize throughput:

```javascript
class ParallelRouter {
  async routeInParallel(leads, buyers) {
    const batchSize = 100;
    const batches = this.chunk(leads, batchSize);
    
    const results = await Promise.all(
      batches.map(batch => this.processBatch(batch, buyers))
    );
    
    return results.flat();
  }
  
  async processBatch(leads, buyers) {
    // Pre-calculate buyer availability
    const buyerAvailability = await this.getBulkAvailability(buyers);
    
    // Process leads in parallel with concurrency limit
    const concurrencyLimit = 10;
    const results = [];
    
    for (let i = 0; i < leads.length; i += concurrencyLimit) {
      const chunk = leads.slice(i, i + concurrencyLimit);
      const chunkResults = await Promise.all(
        chunk.map(lead => this.routeSingleLead(lead, buyerAvailability))
      );
      results.push(...chunkResults);
    }
    
    return results;
  }
}
```

### Predictive Routing

Use ML for optimal routing:

```javascript
class PredictiveRouter {
  constructor(model) {
    this.model = model;
    this.featureExtractor = new FeatureExtractor();
  }
  
  async predictBestBuyer(lead, buyers) {
    // Extract features for each buyer-lead pair
    const predictions = await Promise.all(
      buyers.map(async buyer => {
        const features = this.featureExtractor.extract(lead, buyer);
        const prediction = await this.model.predict(features);
        
        return {
          buyer,
          predictedAcceptance: prediction.acceptance,
          predictedValue: prediction.value,
          confidence: prediction.confidence
        };
      })
    );
    
    // Select based on expected value
    return predictions
      .filter(p => p.confidence > 0.7)
      .sort((a, b) => {
        const expectedValueA = a.predictedAcceptance * a.predictedValue;
        const expectedValueB = b.predictedAcceptance * b.predictedValue;
        return expectedValueB - expectedValueA;
      })[0]?.buyer;
  }
}
```

## 📊 Monitoring Multi-Buyer Systems

### Distribution Analytics

Track routing effectiveness:

```javascript
const distributionMetrics = {
  // Buyer performance
  buyerAcceptanceRates: calculateByBuyer(acceptances),
  buyerResponseTimes: calculateByBuyer(responseTimes),
  buyerRevenue: calculateByBuyer(revenue),
  
  // Routing effectiveness
  firstAttemptSuccess: firstAttempts / totalLeads,
  avgAttemptsPerLead: totalAttempts / totalLeads,
  routingAccuracy: correctRoutes / totalRoutes,
  
  // System performance
  avgRoutingTime: average(routingTimes),
  parallelEfficiency: parallelSuccess / parallelAttempts,
  fallbackUtilization: fallbackSuccess / fallbackAttempts,
  
  // Business metrics
  revenuePerLead: totalRevenue / totalLeads,
  buyerSatisfaction: calculateSatisfactionScores(),
  leadWastage: unroutedLeads / totalLeads
};
```

### Buyer Health Monitoring

Track buyer system health:

```javascript
class BuyerHealthMonitor {
  checkBuyerHealth(buyer) {
    const health = {
      responsive: this.checkResponseTime(buyer) < 500,
      accepting: this.getAcceptRate(buyer) > 0.7,
      capacity: this.getCapacityUtilization(buyer) < 0.9,
      errors: this.getErrorRate(buyer) < 0.05,
      payment: this.getPaymentDelinquency(buyer) === 0
    };
    
    health.overall = Object.values(health).filter(v => v === true).length / 5;
    
    return health;
  }
  
  async monitorAllBuyers() {
    const buyers = await this.getAllActiveBuyers();
    const healthReports = buyers.map(buyer => ({
      buyer,
      health: this.checkBuyerHealth(buyer)
    }));
    
    // Alert on unhealthy buyers
    healthReports
      .filter(report => report.health.overall < 0.6)
      .forEach(report => this.alertUnhealthyBuyer(report));
      
    return healthReports;
  }
}
```

## 💡 Best Practices

### Fair Distribution

Ensure equitable lead distribution:

```javascript
class FairDistributor {
  constructor() {
    this.distributionHistory = new Map();
  }
  
  selectBuyerFairly(eligibleBuyers) {
    const now = Date.now();
    const hourAgo = now - 3600000;
    
    // Calculate recent distribution
    const recentDistribution = eligibleBuyers.map(buyer => {
      const history = this.distributionHistory.get(buyer.id) || [];
      const recentLeads = history.filter(time => time > hourAgo).length;
      
      return {
        buyer,
        recentLeads,
        targetShare: buyer.targetShare || (1 / eligibleBuyers.length),
        actualShare: recentLeads / this.totalRecentLeads
      };
    });
    
    // Select underserved buyer
    return recentDistribution
      .sort((a, b) => {
        const aDeficit = a.targetShare - a.actualShare;
        const bDeficit = b.targetShare - b.actualShare;
        return bDeficit - aDeficit;
      })[0].buyer;
  }
}
```

### Relationship Management

Maintain buyer relationships:

```javascript
class RelationshipManager {
  scoreBuyerRelationship(buyer) {
    const factors = {
      tenure: this.calculateTenureScore(buyer.startDate),
      volume: this.calculateVolumeScore(buyer.monthlyVolume),
      payment: this.calculatePaymentScore(buyer.paymentHistory),
      quality: this.calculateQualityScore(buyer.leadFeedback),
      communication: this.calculateCommScore(buyer.supportTickets)
    };
    
    const weights = {
      tenure: 0.15,
      volume: 0.25,
      payment: 0.30,
      quality: 0.20,
      communication: 0.10
    };
    
    return Object.entries(factors).reduce((score, [factor, value]) => {
      return score + (value * weights[factor]);
    }, 0);
  }
  
  applyRelationshipBenefits(buyer, baseTerms) {
    const score = this.scoreBuyerRelationship(buyer);
    
    if (score > 90) {
      return {
        ...baseTerms,
        priorityRouting: true,
        volumeDiscount: 0.05,
        extendedCredit: true,
        dedicatedSupport: true
      };
    } else if (score > 75) {
      return {
        ...baseTerms,
        volumeDiscount: 0.02,
        prioritySupport: true
      };
    }
    
    return baseTerms;
  }
}
```

## 📋 Implementation Checklist

**Routing Setup**:
- [ ] Distribution model selected
- [ ] Routing algorithms implemented
- [ ] Buyer requirements mapped
- [ ] Capacity tracking active

**Matching Logic**:
- [ ] Hard filters configured
- [ ] Soft preferences weighted
- [ ] Specializations defined
- [ ] Fallback chains built

**Performance**:
- [ ] Parallel processing enabled
- [ ] Caching strategies implemented
- [ ] Predictive models trained
- [ ] Monitoring dashboards live

**Business Rules**:
- [ ] Fair distribution ensured
- [ ] SLAs configured
- [ ] Relationship scoring active
- [ ] Revenue optimization balanced

## 📚 Related Documentation

- [Ping-Post Operations](./ping-post.md) - Two-step distribution
- [Real-Time Bidding](./real-time-bidding.md) - Auction-based routing
- [Acceptance Criteria](../flow-management/acceptance-criteria.md) - Buyer requirements

---

🎯 **Routing Mastery**: Sophisticated multi-buyer routing balances revenue, relationships, and operational efficiency. Start simple, measure everything, and evolve based on data!