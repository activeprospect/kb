---
layout: page
title: Ping Overview
permalink: /LeadsAndEvents/Ping/ping-overview/
---

# Ping (Pre-submission Bidding)

Ping functionality in LeadConduit enables real-time, auction-based lead purchasing that maximizes ROI by connecting you with the leads you want at the price you're willing to pay. This pre-submission bidding system allows buyers to evaluate potential leads before committing to purchase.

## What is Ping/Post?

### The Ping/Post Model

**Ping Phase:**
- Lead sources send preliminary lead information (ping) to potential buyers
- Buyers evaluate the ping data against their criteria and pricing rules
- Buyers respond with acceptance/rejection and bid pricing
- Sources select the highest bidder or best match

**Post Phase:**
- Complete lead data is sent to the winning buyer
- Final processing, validation, and delivery occurs
- Payment and feedback mechanisms are triggered

### Benefits of Ping/Post

**For Lead Buyers:**
- **Cost Control** - Only pay for leads that meet your criteria
- **Quality Assurance** - Pre-qualify leads before purchase
- **Competitive Pricing** - Participate in real-time auctions
- **Volume Management** - Control lead flow through bidding

**For Lead Sellers:**
- **Revenue Optimization** - Auction system drives higher prices
- **Reduced Waste** - Only deliver leads that buyers want
- **Market Intelligence** - Understand buyer demand and pricing
- **Automated Distribution** - Streamlined lead routing process

## LeadConduit Real-Time Bidding

### Platform Capabilities

LeadConduit's real-time bidding system provides:

**Automated Bidding Configuration:**
- Rule-based bidding strategies
- Dynamic pricing based on lead characteristics
- Volume caps and budget controls
- Time-based bidding schedules

**Easy Seller Onboarding:**
- Streamlined integration process
- Automated submission documentation
- Testing and validation tools
- Partner management features

**Comprehensive Analytics:**
- Bid performance metrics
- Win rate analysis
- Cost optimization insights
- Market trend reporting

### Technical Implementation

**Real-Time Processing:**
- Sub-second response times for ping evaluation
- Scalable infrastructure handling high volumes
- Failover and redundancy for reliability
- API-first architecture for integration flexibility

**Advanced Logic Engine:**
- Complex rule sets for bidding decisions
- Geographic and demographic targeting
- Lead scoring and quality assessment
- Competitive intelligence integration

## Acceptance Criteria in Ping

### Flow-Level Acceptance Criteria

Configure universal requirements that apply to all pings:

**Universal Standards:**
- Minimum data quality requirements
- Geographic restrictions (states, regions)
- Lead source quality thresholds
- Compliance and regulatory requirements

**Implementation:**
```
Flow Acceptance Criteria → Evaluated First
├── Data completeness rules
├── Geographic targeting
├── Source quality scores
└── Compliance checks
```

### Source-Level Acceptance Criteria

Set specific requirements for individual lead sources:

**Source-Specific Rules:**
- Custom pricing for premium sources
- Volume limits per source
- Quality thresholds based on source history
- Specialized targeting criteria

**Evaluation Order:**
1. **Flow criteria** must pass first
2. **Source criteria** evaluated second
3. Both must pass for ping acceptance
4. Failed criteria result in immediate rejection

### Rules-Based Qualification

**Dynamic Evaluation:**
- Real-time assessment of ping data
- Template-based value calculation
- Conditional logic for complex scenarios
- Integration with external data sources

**Common Criteria Examples:**
- State restrictions: `lead.state in ['CA', 'TX', 'NY']`
- Age requirements: `lead.age >= 18 && lead.age <= 65`
- Income thresholds: `lead.income >= 50000`
- Lead scoring: `lead.score >= 7.5`

## Pricing in Ping Systems

### Pricing Strategy Types

**Fixed Pricing:**
- Set standard rates per lead type
- Consistent pricing across sources
- Predictable cost management
- Simple implementation and tracking

**Dynamic Pricing:**
- Rule-based pricing adjustments
- Market-responsive rate changes
- Quality-based price variations
- Competitive bidding strategies

**Tiered Pricing:**
- Volume-based rate structures
- Source quality price tiers
- Performance-based adjustments
- Loyalty and partnership discounts

### Pricing Rule Configuration

**Rule-Based Pricing Examples:**
```
High-Value Geographic Areas:
- lead.state == 'CA' ? 25.00 : 15.00

Quality-Based Pricing:
- lead.credit_score >= 700 ? 30.00 : 20.00

Volume Incentives:
- monthly_volume >= 1000 ? base_price * 0.9 : base_price

Time-Based Pricing:
- hour_of_day >= 9 && hour_of_day <= 17 ? premium_price : standard_price
```

### Competitive Bidding

**Auction Mechanics:**
- Real-time bid evaluation
- Highest bidder selection
- Reserve price protection
- Bid increment rules

**Bidding Strategies:**
- Maximum bid limits
- Competitive response rules
- Market position optimization
- ROI-based bidding

## Volume Caps in Ping

### Purpose and Benefits

**Cost Control:**
- Prevent budget overruns
- Manage cash flow effectively
- Control lead processing costs
- Maintain operational capacity

**Quality Management:**
- Ensure processing quality doesn't suffer
- Maintain service level agreements
- Balance volume with performance
- Protect system resources

### Cap Configuration Types

**Time-Based Caps:**
- Hourly lead limits
- Daily volume maximums
- Weekly budget controls
- Monthly spending limits

**Source-Based Caps:**
- Per-source volume limits
- Source quality thresholds
- New source testing limits
- Partnership volume agreements

**Geographic Caps:**
- State-specific limits
- Regional distribution controls
- Market penetration management
- Compliance requirement caps

### Implementation Strategies

**Hierarchical Volume Management:**
```
Volume Cap Hierarchy:
├── Account-level caps (total budget)
├── Flow-level caps (campaign limits)
├── Source-level caps (vendor limits)
└── Geographic caps (market limits)
```

**Advanced Cap Logic:**
- Percentage-based allocation
- Priority source handling
- Overflow routing rules
- Cap reset schedules

## Ping Limits

### Enhanced Security and Control

**New Source Protection:**
- Test new vendors with limited exposure
- Gradual volume increases based on performance
- Automatic suspension for quality issues
- Monitored integration periods

**Vendor Management:**
- Individual source ping limits
- Performance-based limit adjustments
- Historical volume tracking
- Abuse prevention measures

### Configuration Options

**Limit Types:**
- Maximum pings per hour
- Daily ping allowances
- Total ping budgets
- Frequency restrictions

**Dynamic Adjustments:**
- Performance-based limit increases
- Quality-triggered limit reductions
- Market condition responses
- Seasonal adjustment capabilities

### Monitoring and Alerts

**Real-Time Visibility:**
- Live ping volume tracking
- Limit utilization monitoring
- Threshold breach alerts
- Performance impact assessment

**Reporting and Analytics:**
- Ping volume trends
- Limit effectiveness analysis
- Cost optimization insights
- Vendor performance comparison

## Best Practices for Ping Implementation

### Strategy Development

**Market Analysis:**
- Understand competitor pricing
- Analyze lead quality trends
- Identify optimal bid ranges
- Monitor market demand patterns

**Rule Optimization:**
- Start with simple rules
- Test and iterate based on performance
- Monitor win rates and costs
- Adjust based on ROI data

### Operational Excellence

**Monitoring and Maintenance:**
- Regular rule performance reviews
- Pricing strategy adjustments
- Volume cap optimization
- Quality threshold updates

**Partner Management:**
- Clear communication of requirements
- Regular performance feedback
- Collaborative improvement initiatives
- Fair and transparent pricing

### Advanced Techniques

**Machine Learning Integration:**
- Predictive bid optimization
- Automated quality scoring
- Dynamic pricing algorithms
- Pattern recognition for fraud detection

**Multi-Channel Optimization:**
- Cross-platform bidding strategies
- Unified pricing across channels
- Integrated volume management
- Holistic performance tracking

## Troubleshooting Ping Issues

### Common Problems

**Low Win Rates:**
- Pricing too low for market conditions
- Overly restrictive acceptance criteria
- Slow response times affecting competitiveness
- Poor quality scores impacting bid priority

**Budget Overruns:**
- Volume caps set too high
- Pricing rules not properly configured
- Seasonal demand not accounted for
- Poor quality leads requiring replacement

**Integration Issues:**
- Timeout configurations
- Response format mismatches
- Authentication problems
- Data mapping errors

### Resolution Strategies

**Performance Optimization:**
- A/B testing of pricing strategies
- Gradual rule adjustments
- Market timing optimization
- Quality improvement initiatives

**Technical Improvements:**
- Response time optimization
- System capacity scaling
- Integration monitoring
- Error handling enhancement

Ping functionality transforms lead acquisition from a passive purchasing model into an active, strategic market participation system. Understanding and optimizing ping operations enables maximum ROI while maintaining quality standards and cost control.