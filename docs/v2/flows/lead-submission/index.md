---
title: Lead Submission
description: Master how leads enter your flows and set up quality gates from the start
tags:
  - lead-submission
  - sources
  - validation
---

# Lead Submission

## Where Your Lead Journey Begins

Lead submission is the critical first phase of every flow - it's where raw lead data enters LeadConduit and gets transformed into standardized, validated information ready for processing. Get this phase right, and everything downstream works smoothly. Get it wrong, and you'll fight data quality issues forever.

📍 **You are here**: The entry point of your lead processing pipeline
🎯 **What you'll master**: Sources, mappings, criteria, caps, and pricing
🚀 **Why it matters**: Quality in = Quality out (and money saved)

## The Lead Submission Process

When a lead arrives at your flow, five things happen in sequence:

```
1. Authentication → Is this source allowed to send?
2. Field Mapping → Transform their fields to yours
3. Type Parsing → Validate and standardize data
4. Acceptance Criteria → Does this lead meet standards?
5. Response → Tell source what happened
```

This happens in milliseconds, creating a quality gate that protects your entire operation.

## Key Components

### [Sources](/flows/lead-submission/sources)
Your connection points to the outside world:
- Configure how leads enter your flow
- Set up authentication and security
- Define expected field structure
- Monitor source performance

**Key Insight**: One source can feed multiple flows, or multiple sources can feed one flow. Design for your business needs.

### [Field Mappings](/flows/lead-submission/mappings)
Transform chaos into order:
- Rename vendor fields to your standards
- Handle different naming conventions
- Maintain clean, consistent data
- Enable source flexibility

**Example**: Vendor sends `fname`, you need `first_name`. Mappings handle this automatically.

### [Acceptance Criteria](/flows/lead-submission/acceptance-criteria)
Your quality firewall:
- Define what makes a lead acceptable
- Reject bad data before it costs money
- Provide clear feedback to sources
- Maintain data quality standards

**Power Move**: Layer criteria from basic (has email) to advanced (TrustedForm age < 30 seconds).

### [Volume Caps](/flows/lead-submission/volume-caps)
Control the flow:
- Set daily, monthly, or total limits
- Cap by source, state, or any criteria
- Prevent oversupply
- Manage inventory intelligently

**Pro Tip**: Use nested caps (e.g., 1000/day total, but max 100/day from Nevada).

### [Pricing](/flows/lead-submission/pricing)
Track the money automatically:
- Set what you pay per lead
- Configure conditional pricing
- Track source costs
- Calculate margins in real-time

**Advanced**: Pay more for exclusive leads, less for aged, premium for specific states.

### [Submission Response](/flows/lead-submission/submission-response)
Close the feedback loop:
- Send clear accept/reject messages
- Include specific rejection reasons
- Provide lead IDs for tracking
- Enable source optimization

## Common Patterns

### Basic Web Form
Simple lead collection:
```yaml
Source: Inbound Field
Mappings: Direct field match
Criteria: Email and phone valid
Caps: 500/day
Price: $5 fixed
```

### Vendor Integration
Professional lead buying:
```yaml
Source: Vendor API (authenticated)
Mappings: Their fields → Your fields
Criteria: Multiple quality gates
Caps: Scaled by performance
Price: Varies by quality
```

### Network Distribution
Hub for multiple sources:
```yaml
Sources: Multiple vendors + forms
Mappings: Standardize all inputs
Criteria: Universal quality standards
Caps: By source and total
Price: Source-specific rates
```

## Best Practices

### Source Configuration
1. **Use descriptive names** - "Facebook-Auto-Insurance-CA" not "Source 1"
2. **Document field requirements** - Help sources send correctly
3. **Set reasonable timeouts** - Balance speed vs reliability
4. **Monitor auth failures** - Catch issues early

### Mapping Strategy
1. **Map once, use everywhere** - Standard internal fields
2. **Don't transform in mappings** - Let types handle parsing
3. **Document unusual mappings** - Why does `opt_in_url` map to `xxTrustedFormCertUrl`?
4. **Test with real data** - Verify mappings work

### Criteria Design
1. **Start strict** - You can always loosen later
2. **Layer requirements** - Basic → Advanced
3. **Provide clear rejections** - Help sources improve
4. **Monitor rejection rates** - >50% means something's wrong

### Cap Management
1. **Set conservative initially** - Increase as you verify quality
2. **Use multiple cap levels** - Daily within monthly
3. **Plan for timezone** - When do caps reset?
4. **Alert before caps hit** - Avoid surprise shutoffs

### Pricing Discipline
1. **Track everything** - Even free leads have processing costs
2. **Use conditional pricing** - Pay for quality
3. **Review regularly** - Markets change
4. **Include all costs** - Enhancements, delivery, overhead

## Troubleshooting

### High Rejection Rates
**Symptoms**: >30% of leads rejected
**Common Causes**:
- Mismatched field mappings
- Too strict criteria
- Source data quality issues
- Type parsing failures

**Solutions**:
1. Review rejection reasons
2. Check sample submissions
3. Verify field mappings
4. Adjust criteria if needed

### Mapping Confusion
**Symptoms**: Data in wrong fields
**Common Causes**:
- Similar field names
- Nested data structures
- Array vs single values
- Case sensitivity

**Solutions**:
1. Test with real examples
2. Use explicit paths
3. Document complex mappings
4. Verify with events

### Cap Violations
**Symptoms**: Leads rejected when shouldn't be
**Common Causes**:
- Timezone misunderstandings
- Nested cap logic
- Counter reset timing
- Shared cap groups

**Solutions**:
1. Review cap configuration
2. Check timezone settings
3. Verify reset schedules
4. Monitor cap utilization

## Advanced Techniques

### Dynamic Acceptance
Adjust criteria based on conditions:
- Stricter during high volume
- Looser for premium sources
- Time-based requirements
- Performance-based standards

### Smart Pricing
Optimize cost structure:
- Volume discounts
- Quality bonuses
- Time-of-day pricing
- Performance incentives

### Source Scoring
Track and act on source quality:
- Acceptance rate
- Contact rate
- Conversion rate
- Lifetime value

### Feedback Loops
Use outcome data to improve:
- Tighten criteria for non-converters
- Reward high-performing sources
- Adjust caps based on quality
- Optimize pricing for ROI

## Your Learning Path

1. **Start Here**: [Sources](/flows/lead-submission/sources) - Configure your first source
2. **Then**: [Mappings](/flows/lead-submission/mappings) - Handle any data format
3. **Next**: [Acceptance Criteria](/flows/lead-submission/acceptance-criteria) - Build quality gates
4. **Advanced**: [Volume Caps](/flows/lead-submission/volume-caps) - Control flow intelligently
5. **Master**: [Pricing](/flows/lead-submission/pricing) - Track ROI automatically

## Quick Reference

### Essential Rules
- ✅ Always map before accepting
- ✅ Validate early and often
- ✅ Provide clear feedback
- ✅ Track every penny
- ✅ Monitor continuously

### Common Mistakes
- ❌ Accepting first, validating later
- ❌ Vague rejection messages
- ❌ Ignoring source quality metrics
- ❌ Static pricing for all leads
- ❌ No cap management strategy

---

🎯 **Next Step**: Dive into [Sources](/flows/lead-submission/sources) to configure your first lead entry point. Master sources, and you master the quality of everything that follows.

*Remember: The best time to ensure lead quality is before you pay for it. Lead submission is your first and best defense against bad data.*