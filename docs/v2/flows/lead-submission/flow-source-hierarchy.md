---
title: Flow/Source Hierarchy
description: Understanding inheritance and override patterns in LeadConduit's configuration system
tags:
  - hierarchy
  - inheritance
  - configuration
  - flows
  - sources
---

# Flow/Source Hierarchy

## Configuration Inheritance Made Simple

LeadConduit's hierarchy system lets you define settings once at the flow level and override them selectively at the source level. It's like CSS for lead processing - general rules cascade down, specific rules override. This powerful pattern eliminates repetition while providing precise control where needed.

📍 **You are here**: Mastering configuration inheritance
🎯 **What you'll learn**: How settings cascade and override
💡 **The outcome**: DRY configuration that's easy to maintain

## Understanding the Hierarchy

### The Cascade Model

Settings flow from general to specific:

```
Flow Settings (Base Configuration)
    ↓
Source Settings (Overrides)
    ↓
Applied Configuration (Final Result)
```

### What Can Be Configured

Settings that support hierarchy:

**At Flow Level**:
- Field definitions
- Acceptance criteria  
- Mappings
- Volume caps
- Business hours
- Default pricing

**At Source Level**:
- Override any flow setting
- Source-specific criteria
- Custom pricing
- Individual caps
- Unique mappings

## Field Definition Hierarchy

### Flow-Level Fields

Define once, use everywhere:

```yaml
Flow: Insurance Leads
Fields:
  # Standard fields all sources must provide
  - first_name (Text, required)
  - last_name (Text, required)  
  - email (Email, required)
  - phone (Phone, required)
  - postal_code (Postal Code, required)
  - insurance_type (Text, required)
    Values: ["auto", "home", "life", "health"]
```

### Source-Level Overrides

Customize per source:

```yaml
Source: Partner A
Field Overrides:
  # They send phone as "phone_number"
  phone:
    mapping: phone_number
  
  # They have additional field
  lead_id:
    type: Text
    required: false
```

### Resolution Example

How fields resolve:

```yaml
Flow defines:
  email (required)
  
Source A:
  # Inherits requirement
  
Source B overrides:
  email (optional)
  
Result:
  A: email required
  B: email optional
```

## Acceptance Criteria Hierarchy

### Base Criteria

Flow-wide quality standards:

```yaml
Flow: Mortgage Leads
Acceptance Criteria:
  # All sources must meet these
  - Age >= 18
  - Valid email OR valid phone
  - US state only
  - Not duplicate (30 days)
```

### Source Additions

Layer on source-specific rules:

```yaml
Source: Premium Partner
Additional Criteria:
  # Base criteria PLUS:
  - Credit score >= 640
  - Income >= 50000
  - Homeowner = true
  
Source: Budget Partner  
Additional Criteria:
  # Base criteria PLUS:
  - Verified phone required
```

### Criteria Stacking

Rules combine, not replace:

```
Flow Criteria:     A AND B AND C
Source Criteria:   + D AND E
Final:            A AND B AND C AND D AND E
```

## Mapping Hierarchy

### Default Mappings

Standard field locations:

```yaml
Flow: Solar Leads
Default Mappings:
  # Where to find fields
  first_name: {{fname}}
  last_name: {{lname}}
  email: {{email_address}}
  phone: {{primary_phone}}
  state: {{state_code}}
```

### Source Variations

Handle different formats:

```yaml
Source: Old System Partner
Mapping Overrides:
  # They use different names
  first_name: {{firstName}}
  last_name: {{lastName}}
  email: {{emailAddress}}
  phone: {{phoneNumber}}
  state: {{stateAbbr}}
  
Source: New API Partner
Mapping Overrides:
  # Nested structure
  first_name: {{contact.name.first}}
  last_name: {{contact.name.last}}
  email: {{contact.email}}
  phone: {{contact.phone.primary}}
  state: {{location.state}}
```

## Volume Cap Hierarchy

### Flow-Level Caps

Overall limits:

```yaml
Flow: Purchase Intent Leads
Volume Caps:
  Daily: 10,000 leads
  Monthly: 250,000 leads
  
Business Hours:
  Monday-Friday: 8 AM - 8 PM EST
  Saturday: 9 AM - 5 PM EST
  Sunday: Closed
```

### Source-Level Caps

Individual allocations:

```yaml
Source: Trusted Partner
Volume Caps:
  Daily: 5,000 leads (50% of flow)
  Monthly: 125,000 leads
  
Source: New Partner
Volume Caps:
  Daily: 500 leads (testing)
  Monthly: 15,000 leads
  
Source: Overflow Partner
Volume Caps:
  Daily: No limit
  Monthly: No limit
  Active: Only when others capped
```

### Cap Interaction

Both limits apply:

```yaml
Scenario:
  Flow daily cap: 10,000
  Source A cap: 5,000
  Source B cap: 7,000
  
If flow has received 9,500:
  Source A: Can send 500 more (flow limit)
  Source B: Can send 500 more (flow limit)
  
If Source A sent 4,999:
  Can send 1 more (source limit)
```

## Pricing Hierarchy

### Base Pricing

Flow-level economics:

```yaml
Flow: Auto Insurance
Default Pricing:
  Source Cost: $5.00
  Minimum Margin: $2.00
  Target Price: $15.00
```

### Source Pricing

Specific agreements:

```yaml
Source: Premium Partner
Pricing Override:
  Source Cost: $8.00 (higher quality)
  Minimum Margin: $4.00
  Target Price: $25.00
  
Source: Bulk Partner
Pricing Override:
  Source Cost: $3.00 (volume discount)
  Minimum Margin: $1.00
  Target Price: $10.00
  
Source: Rev Share Partner
Pricing Override:
  Source Cost: 70% of revenue
  Minimum Margin: 30% of revenue
  Target Price: Market rate
```

## Business Hours Hierarchy

### Flow Schedule

Standard operating hours:

```yaml
Flow: B2B Leads
Business Hours:
  Monday-Friday: 9 AM - 6 PM EST
  Saturday-Sunday: Closed
  Holidays: Closed
  
Timezone: America/New_York
```

### Source Schedules

Different time zones or hours:

```yaml
Source: West Coast Partner
Business Hours Override:
  Monday-Friday: 9 AM - 6 PM PST
  Saturday: 10 AM - 2 PM PST
  
  Converted to Flow Time:
  Monday-Friday: 12 PM - 9 PM EST
  Saturday: 1 PM - 5 PM EST
  
Source: 24/7 Partner
Business Hours Override:
  Always Open
  
Source: International Partner
Business Hours Override:
  Monday-Friday: 2 AM - 10 AM EST
  (Their business hours)
```

## Hierarchy Best Practices

### Design Principles

1. **Define Common at Flow**
   - Shared requirements
   - Standard fields
   - Base quality rules
   - Default behavior

2. **Override Sparingly**
   - Only when necessary
   - Document why different
   - Test thoroughly
   - Monitor impact

3. **Keep It Simple**
   - Avoid deep nesting
   - Clear naming
   - Consistent patterns
   - Easy debugging

### Configuration Strategy

**Good Hierarchy**:
```yaml
Flow:
  90% of configuration
  Common to all sources
  
Sources:
  10% overrides
  Specific needs only
```

**Poor Hierarchy**:
```yaml
Flow:
  Minimal config
  
Sources:
  Everything different
  Repeated configuration
  Hard to maintain
```

### Testing Hierarchy

Verify inheritance works:

```yaml
Test Checklist:
  ✓ Flow settings apply to new source
  ✓ Source override takes precedence
  ✓ Removing override reverts to flow
  ✓ Multiple sources independent
  ✓ Changes cascade correctly
```

## Common Patterns

### Multi-Tier Quality

Different source quality levels:

```yaml
Flow: Insurance Leads
Base Criteria:
  - Age >= 18
  - Valid contact

Source: Tier 1
  Additional: 
    - Verified identity
    - Credit check passed
    
Source: Tier 2
  Additional:
    - Phone verified
    
Source: Tier 3
  # Base criteria only
```

### Regional Variations

Geographic differences:

```yaml
Flow: Home Services
Base Fields:
  - Standard contact fields
  
Source: California Leads
  Additional Fields:
    - Earthquake_interest
    - Solar_interest
    
Source: Florida Leads  
  Additional Fields:
    - Hurricane_coverage
    - Flood_zone
```

### Partner Evolution

Gradual requirement increases:

```yaml
Source: New Partner
Week 1-2:
  - Relaxed criteria
  - Low volume caps
  
Week 3-4:
  - Add quality rules
  - Increase caps
  
Week 5+:
  - Full criteria
  - Standard caps
```

## Troubleshooting Hierarchy

### Common Issues

**"Setting not applying"**
- Check source overrides
- Verify spelling/case
- Test without override
- Check setting level

**"Can't override setting"**
- Not all settings support hierarchy
- Some require flow change
- Check documentation
- Contact support

**"Unexpected behavior"**
- Map full hierarchy
- Check each level
- Test in isolation
- Document findings

### Debugging Tools

See applied configuration:

```yaml
Lead Details shows:
  - Flow settings (gray)
  - Source overrides (blue)
  - Final applied (green)
  
Test submission shows:
  - Which rules applied
  - Override sources
  - Resolution path
```

## Migration and Changes

### Updating Hierarchies

Safe modification process:

```yaml
To change flow setting:
  1. Review source overrides
  2. Test with sample data
  3. Deploy during low volume
  4. Monitor closely
  5. Roll back if needed
  
To add source override:
  1. Document reason
  2. Test in isolation
  3. Compare to flow behavior
  4. Deploy gradually
```

### Best Practices Summary

1. **Start General** - Flow settings first
2. **Override Thoughtfully** - Only when needed
3. **Document Everything** - Why different?
4. **Test Thoroughly** - Each combination
5. **Monitor Impact** - Watch metrics
6. **Review Regularly** - Simplify over time

## Your Next Steps

### Essential Skills
1. **[Flow Configuration](/flows/lead-submission)** - Master base settings
2. **[Source Setup](/flows/lead-submission/sources)** - Add specific overrides
3. **[Testing Guide](/help-guide/testing/hierarchy)** - Verify behavior

### Common Tasks
- Set up tiered source quality
- Implement regional variations  
- Manage partner-specific needs
- Optimize configuration

---

🎯 **Remember**: Hierarchy is about balance. Define shared behavior at the flow level, override only what's unique at the source level. This creates maintainable, scalable configurations that grow with your business.

*Next: Learn about [Submission Response](/flows/lead-submission/submission-response) handling in your flow.*