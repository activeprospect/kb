---
title: Filter Steps
description: Make intelligent routing decisions with lightning-fast filter steps
tags:
  - filter-steps
  - routing
  - validation
---

# Filter Steps

## Your Flow's Decision Makers

Filter steps are the traffic controllers of your lead flow. They evaluate rules against your lead data and make instant decisions - continue, stop, or route differently. Unlike enhancement steps that call external services, filters operate entirely within LeadConduit, making them blazingly fast and completely reliable.

📍 **You are here**: Learning to control lead flow with intelligent filters
⚡ **What you'll master**: Rule-based routing, validation patterns, and flow control
🎯 **The outcome**: Sophisticated lead routing without external dependencies

## Understanding Filter Steps

### What Makes Filters Special

Filter steps are unique because they:
- Execute instantly (typically <10ms)
- Never fail due to external issues
- Cost nothing to run
- Can evaluate complex logic
- Control your entire flow

Think of them as smart gates that instantly decide each lead's fate.

### Filter Anatomy

Every filter step consists of:

```yaml
Step Name: "Premium Lead Qualifier"
Step Type: Filter
Rules: 
  - loan_amount > 100000
  - AND credit_score > 720
  - AND state IN ["CA", "TX", "FL"]
On Pass: Continue to next step
On Fail: Stop processing
```

The magic is in the rules - they can be as simple or sophisticated as your business requires.

## Common Filter Patterns

### Validation Filters

Ensure data quality before processing:

**Email Quality Check**:
```yaml
Name: "Email Validation Filter"
Rules:
  - email.valid is true
  - AND email.is_disposable is false
  - AND email.is_role is false
On Fail: Stop - "Invalid or low-quality email"
```

**Phone Quality Check**:
```yaml
Name: "Phone Validation Filter"
Rules:
  - phone_1.valid is true
  - AND (phone_1.is_mobile is true OR phone_1.is_landline is true)
  - AND phone_1.is_tollfree is false
On Fail: Stop - "Invalid or non-contactable phone"
```

**Required Fields Check**:
```yaml
Name: "Required Data Filter"
Rules:
  - first_name is not blank
  - AND last_name is not blank
  - AND (email is not blank OR phone_1 is not blank)
  - AND state is not blank
On Fail: Stop - "Missing required fields"
```

### Duplicate Detection

Prevent paying for the same lead twice:

**Simple Duplicate Check**:
```yaml
Name: "Duplicate Email Filter"
Type: "Suppress Duplicates"
Settings:
  Check Field: email
  Time Window: 30 days
  Scope: Account-wide
On Duplicate: Stop - "Duplicate lead - previously received {{duplicate.date}}"
```

**Advanced Duplicate Check**:
```yaml
Name: "Household Duplicate Filter"
Type: "Suppress Duplicates"
Settings:
  Check Fields: 
    - "{{lead.address}}-{{lead.zip}}"
    - "{{lead.last_name}}-{{lead.zip}}"
  Time Window: 90 days
  Allow After: Rejection
On Duplicate: Stop - "Household already submitted"
```

### Geographic Filtering

Control lead flow by location:

**State-Based Filter**:
```yaml
Name: "Service Area Filter"
Rules:
  - state is included in list "CA,TX,FL,NY,IL"
  - OR postal_code.state is included in list "CA,TX,FL,NY,IL"
On Fail: Stop - "Outside service area"
```

**Metro Area Filter**:
```yaml
Name: "Major Metro Filter"
Rules:
  - postal_code is included in file "major_metros.csv"
  - OR city is included in list "Los Angeles,Houston,Miami,Chicago"
On Fail: Route to "Rural Buyer Flow"
```

### Time-Based Filtering

Route based on timing:

**Business Hours Filter**:
```yaml
Name: "Business Hours Only"
Rules:
  - {{format lead.timestamp "H" tz="America/New_York"}} is between 9 and 17
  - AND {{format lead.timestamp "u"}} is between 1 and 5
On Fail: Queue - "Hold for business hours"
```

**Lead Age Filter**:
```yaml
Name: "Fresh Leads Only"
Rules:
  - {{minutes_since lead.timestamp}} is less than 5
On Fail: Route to "Aged Lead Buyer"
```

### Quality Scoring

Route based on lead quality:

**Simple Score Filter**:
```yaml
Name: "Premium Lead Filter"
Rules:
  - lead_score is greater than 80
On Pass: Route to "Premium Buyer"
On Fail: Continue to "Standard Buyers"
```

**Composite Score Filter**:
```yaml
Name: "Quality Gate"
Calculate custom field "quality_score":
  Base: 0
  +20 if email.valid
  +20 if phone.valid
  +10 if phone.is_mobile
  +15 if income > 75000
  +15 if homeowner = true
  +20 if credit_score > 700

Rules:
  - quality_score >= 60
On Fail: Stop - "Below minimum quality threshold"
```

## Advanced Filter Techniques

### Multi-Path Routing

Create sophisticated routing logic:

**Tiered Distribution**:
```yaml
Step 1 - Name: "Exclusive Buyer Filter"
Rules:
  - state = "CA"
  - AND loan_amount > 200000
  - AND credit_score > 750
On Pass: Route to "Exclusive California Buyer"
On Fail: Continue

Step 2 - Name: "Premium Buyer Filter"  
Rules:
  - loan_amount > 100000
  - AND credit_score > 700
On Pass: Route to "Premium Buyer Pool"
On Fail: Continue

Step 3 - Name: "Standard Buyer Filter"
Rules:
  - credit_score > 600
On Pass: Route to "Standard Buyer Pool"
On Fail: Route to "Subprime Specialists"
```

### Conditional Enhancement

Use filters to control expensive operations:

**Smart Enhancement Gate**:
```yaml
Name: "Enhancement Qualifier"
Rules:
  - loan_amount > 50000
  - OR (state = "CA" AND income > 100000)
  - OR source.type = "premium"
On Pass: Continue to enhancement steps
On Fail: Skip to delivery (save enhancement costs)
```

### Complex Business Logic

Implement sophisticated rules:

**Insurance Eligibility**:
```yaml
Name: "Auto Insurance Eligibility"
Rules:
  # Basic eligibility
  - age is between 18 and 80
  - AND has_valid_license is true
  
  # Risk assessment
  - AND NOT (violations > 2 AND time_period = "3 years")
  - AND NOT (dui_conviction = true AND time_period = "5 years")
  
  # Vehicle requirements
  - AND vehicle_year > {{current_year - 20}}
  - AND vehicle_type is not included in list "commercial,motorcycle"
  
On Fail: Stop - "Does not meet insurance eligibility requirements"
```

### List-Based Filtering

Use external lists for dynamic filtering:

**Suppression List Filter**:
```yaml
Name: "Suppression Check"
Type: "List Filter"
Settings:
  Lists:
    - name: "DNC List"
      field: phone_1
      action: reject
    - name: "Email Suppressions"
      field: email
      action: reject
    - name: "Litigation List"
      field: "{{first_name}} {{last_name}}"
      action: flag
On Match: Stop - "Found on suppression list: {{matched_list}}"
```

**Inclusion List Filter**:
```yaml
Name: "VIP Customer Check"
Type: "List Filter"
Settings:
  List: "VIP Customers"
  Match Field: email
  On Match: Add tag "VIP"
  Route: "VIP Flow"
```

## Filter Performance Optimization

### Rule Ordering

Order matters for performance:

**Efficient Ordering**:
```yaml
Good:
1. state = "CA" (filters 80%)
2. AND income > 100000 (filters 50% of remaining)
3. AND credit_score > 700 (filters 30% of remaining)

Bad:
1. credit_score > 700 (requires calculation)
2. AND income > 100000 (still processing many)
3. AND state = "CA" (could have filtered 80% first)
```

### Short-Circuit Evaluation

Leverage logical operators:

**AND Logic** - Stops at first false:
```yaml
Rules:
  - email.valid is true (if false, stop here)
  - AND phone.valid is true (only evaluated if email valid)
  - AND expensive_check is true (only if both above pass)
```

**OR Logic** - Stops at first true:
```yaml
Rules:
  - source.type = "premium" (if true, pass immediately)
  - OR lead_score > 90 (only checked if not premium)
  - OR manual_override = true (last resort check)
```

### Computed Fields

Pre-calculate for complex filters:

**Instead of**:
```yaml
Rules:
  - (loan_amount * 0.8) > 100000
  - AND (income / 12) > 5000
```

**Do This**:
```yaml
Computed Fields:
  - ltv_amount = loan_amount * 0.8
  - monthly_income = income / 12

Rules:
  - ltv_amount > 100000
  - AND monthly_income > 5000
```

## Filter Testing

### Test Scenarios

Always test both paths:

**Positive Tests** (Should Pass):
```json
{
  "state": "CA",
  "loan_amount": 250000,
  "credit_score": 750
}
```

**Negative Tests** (Should Fail):
```json
{
  "state": "NV",
  "loan_amount": 250000,
  "credit_score": 750
}
```

**Edge Cases**:
```json
{
  "state": "CA",
  "loan_amount": 100000,  // Exactly at threshold
  "credit_score": 700      // Minimum acceptable
}
```

### Debugging Filters

Use events to understand behavior:

**What to Check**:
1. Input data to filter
2. Rule evaluation results
3. Which rule failed/passed
4. Final outcome

**Debug Mode**:
```yaml
Name: "Complex Filter (DEBUG)"
Rules:
  - state = "CA" → [Log: "State check: {{result}}"]
  - AND loan_amount > 100000 → [Log: "Amount check: {{result}}"]
  - AND credit_score > 700 → [Log: "Credit check: {{result}}"]
```

## Common Filter Mistakes

### Over-Filtering

**Problem**: Rejecting too many good leads
```yaml
Bad:
- email.is_free is false (rejects all Gmail!)
- AND phone.is_mobile is true (rejects valid landlines)
- AND age is between 25 and 45 (too narrow)
```

**Solution**: Start permissive, tighten based on data

### Under-Filtering

**Problem**: Bad leads getting through
```yaml
Bad:
- email is not blank (doesn't check validity)
- OR phone is not blank (allows either/or)
```

**Solution**: Layer your validation

### Wrong Filter Type

**Problem**: Using wrong step type
```yaml
Bad: Using enhancement step to check email validity
Good: Using filter step with email.valid rule
```

## Filter Best Practices

### Design Principles

1. **Filter Early and Often**
   - Catch problems immediately
   - Save processing costs
   - Improve overall quality

2. **Be Specific in Rejections**
   - Clear failure reasons
   - Help sources improve
   - Reduce disputes

3. **Layer Your Logic**
   - Basic validation first
   - Business rules second
   - Quality scoring last

4. **Test Thoroughly**
   - All acceptance paths
   - All rejection paths
   - Edge cases
   - Performance impact

### Maintenance

**Regular Reviews**:
- Check filter pass rates
- Analyze rejection reasons
- Optimize rule ordering
- Remove redundant filters

**Documentation**:
```yaml
Name: "California Premium Filter"
Purpose: "Routes high-value CA leads to exclusive buyer"
Business Rule: "Contract #123 - Exclusive CA leads over $200k"
Last Updated: "2024-01-15"
Updated By: "John Doe"
```

## Your Next Steps

### Essential Reading
1. **[Rules Reference](/reference/rules)** - Deep dive into rule syntax
2. **[Enhancement Steps](/flows/flow-steps/enhancement)** - When filters aren't enough
3. **[Recipient Steps](/flows/flow-steps/recipient-steps)** - Where filtered leads go

### Quick Wins
1. Add one validation filter to catch bad data
2. Implement duplicate checking
3. Create a quality score filter
4. Test all filter paths

### Advanced Topics
- **[Complex Routing](/help-guide/patterns/routing-patterns)** - Multi-path flows
- **[Dynamic Lists](/help-guide/features/dynamic-lists)** - External list management
- **[Filter Analytics](/help-guide/analytics/filter-performance)** - Optimization strategies

---

⚡ **Remember**: Filters are free, fast, and failsafe. Use them liberally to protect your flow, route intelligently, and ensure only quality leads consume expensive resources.

*Next: [Enhancement Steps](/flows/flow-steps/enhancement) - Add valuable data to your filtered leads.*