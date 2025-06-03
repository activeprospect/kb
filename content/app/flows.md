# LeadConduit Flows - Complete Documentation

## Overview

Flows are the intelligent command centers that protect lead buyers from bad data while streamlining their entire lead acquisition process. For buyers, a flow is your automated quality assurance department, vendor management system, and lead delivery pipeline all rolled into one. It ensures every lead you pay for meets your exact specifications, arrives with verified consent, and seamlessly integrates with your sales systems.

At their core, flows solve the fundamental challenge every lead buyer faces: "How do I ensure I'm only paying for leads that can actually convert?" From the moment a vendor submits a lead to when it appears in your CRM or dialer, flows enforce your purchase agreements, validate data quality, check compliance, prevent duplicates, and track every dollar spent. They transform the chaotic world of multi-vendor lead acquisition into a streamlined, accountable process.

The power of flows lies in their ability to codify your entire lead buying operation without requiring technical expertise. Your purchase criteria, validation rules, compliance requirements, and delivery preferences all become configurable policies that execute automatically. This isn't just about moving data - it's about protecting your business, maximizing ROI, and giving you complete control over your lead acquisition strategy.

## Why Flows Exist

### The Vendor Management Problem
Lead buyers work with dozens of vendors, each with their own submission formats, quality levels, and technical capabilities. Without flows, you're stuck building custom integrations for each vendor, manually validating purchase agreements, and constantly fighting data quality issues. Flows solve this by providing a single submission endpoint for all vendors with automatic field mapping, built-in validation, and standardized quality gates. Your vendors get clear technical requirements, you get consistent data quality.

### The Quality Assurance Problem
Bad leads destroy ROI - invalid phone numbers, fake emails, out-of-area prospects, and missing consent can turn your sales operation into a compliance nightmare. Manual review doesn't scale, and discovering quality issues after agents have wasted time calling is expensive. Flows solve this by validating every field, verifying consent through TrustedForm, checking against your suppression lists, and enriching data with third-party verification - all before you pay a cent or waste a dial.

### The Accountability Problem
When you're buying thousands of leads from multiple vendors, tracking what you bought, what you accepted, and what you paid becomes a full-time job. Flows solve this by automatically tracking every submission, recording acceptance/rejection reasons, calculating costs, and providing detailed analytics. You know exactly which vendors send quality leads, which consistently fail your criteria, and where every dollar goes.

## Core Concepts for Lead Buyers

### The Buyer-Centric Flow Architecture

As a lead buyer, your flow serves as your automated purchasing department. Here's how each component protects your interests:

**Sources (Your Vendor Endpoints)** represent individual lead vendors or campaigns. Each source gets unique submission credentials, allowing you to:
- Track performance by vendor with granular analytics
- Set vendor-specific pricing and caps
- Configure custom field mappings for each vendor's format
- Enforce vendor-specific acceptance criteria
- Provide clear submission instructions and instant feedback

For example, if VendorA calls zip code "postal" and VendorB calls it "zipcode", sources handle that automatically while maintaining your standard field names internally.

**Fields (Your Data Requirements)** define exactly what information you need from every lead:
- **Standard fields** ensure consistency: every phone number is formatted the same way, every email is validated, every state abbreviation is standardized
- **Required fields** enforce your purchase agreements: if you're paying for "exclusive auto insurance leads with consent", the flow ensures every lead has insurance_type, exclusive_flag, and trustedform_url
- **Custom fields** capture your specific business needs: loan amounts for lending, coverage types for insurance, case details for legal

**Pre-Processing Gates (Your Quality Firewall)** protect you from paying for bad leads:
- **Acceptance Criteria** enforce your purchase agreements: "I only buy leads from CA, NV, and AZ with valid phone numbers"
- **TrustedForm Validation** ensures compliance: verify consent was properly captured and the certificate is fresh
- **Suppression Lists** prevent wasted dials: check your DNC lists, existing customer database, and recent duplicates
- **Volume Caps** control your spend: limit daily/monthly purchases by vendor or lead type
- **Data Verification Services** ensure accuracy: validate phones are real, emails are deliverable, addresses exist

**Flow Steps (Your Processing Pipeline)** handle the leads that pass your quality gates:
- **Enhancement Steps** add value: append demographic data, verify phone connectivity, score lead quality
- **Recipient Steps** keep your team informed: alert managers of high-value leads, notify compliance of issues
- **Destination Steps** deliver to your systems: post to your CRM, add to your dialer, update your database

**Events (Your Audit Trail)** provide complete transparency:
- Track every lead from submission to delivery
- See why specific leads were rejected
- Monitor vendor quality scores
- Calculate true cost per qualified lead
- Prove compliance with detailed logs

### The Buyer's Lead Journey

Here's what happens when a vendor submits a lead to your flow, from a buyer's perspective:

1. **Vendor Submission**: Your vendor posts lead data to their assigned source endpoint
2. **Vendor Authentication**: Their API key is validated (invalid credentials = no cost to you)
3. **Field Standardization**: Vendor's field names are mapped to your standard schema
4. **Data Validation**: Every field is parsed and validated (invalid phone = you'll know before paying)
5. **Purchase Agreement Enforcement**: Your acceptance criteria verify the lead matches what you're buying
6. **Consent Verification**: TrustedForm confirms proper consent capture
7. **Duplicate Prevention**: Check if you've already bought this lead or if they're on your DNC list
8. **Cost Assignment**: Apply agreed-upon pricing (with conditional pricing for premium leads)
9. **Volume Control**: Ensure vendor hasn't exceeded their allocation
10. **Enrichment**: Add third-party data to increase lead value
11. **System Delivery**: Seamlessly insert into your CRM/dialer with all data properly formatted
12. **Vendor Response**: They receive clear accept/reject status with specific reasons

This journey happens in milliseconds, ensuring your sales team only sees qualified, compliant leads that meet your exact specifications.

## How Flows Process Leads - The Complete Picture

Let's follow a lead through the entire processing pipeline to understand exactly what happens at each stage.

### Phase 1: Lead Arrival and Initial Processing

When a lead first arrives at LeadConduit, it begins its journey:

**HTTP Request Reception**
Your source sends an HTTP POST request to the flow's endpoint. The request might look like:
```
POST /flows/552906d0a6682f0700000003/sources/fire-hydrant-insurance.in
Content-Type: application/json

{
  "first_name": "Sarah",
  "last_name": "Chen",
  "email": "sarah.chen@example.com",
  "phone_1": "(555) 123-4567",
  "insurance_type": "home",
  "property_value": "450000"
}
```

**Authentication Validation**
LeadConduit validates the API key provided in the request. If authentication fails, the lead is rejected immediately with a 401 response. No events are generated for failed authentication - the lead never officially enters the system.

**Source Configuration Loading**
The system loads the source configuration, including:
- Field mappings (e.g., "phone_1" maps to "phone")
- Default values for missing fields
- Source-specific acceptance criteria
- Pricing overrides
- Integration settings

**Variable Initialization**
A variable structure is created to accumulate data throughout processing:
```javascript
{
  lead: {},      // Will hold parsed lead data
  source: {},    // Metadata about the source
  flow: {},      // Metadata about the flow
  account: {},   // Account-level information
  submission: {} // Details about this submission
}
```

### Phase 2: Data Normalization and Enhancement

**Source Field Mapping**
The first transformation applies source-specific field mappings. Raw field names are mapped to standardized names:
- "phone_1" becomes "phone"
- "insurance_type" becomes "vertical"
- Custom fields are prefixed appropriately

**Type Parsing**
Each field is parsed according to its type definition:
- Phone: "(555) 123-4567" becomes `{valid: true, area: "555", exchange: "123", line: "4567", number: "5551234567"}`
- Email: Validates format and extracts domain
- Numbers: Converted and range-validated
- Dates: Parsed into consistent format

Importantly, parsing errors don't stop processing - they set the `valid` flag to false, allowing you to handle invalid data appropriately.

**Data Hygiene**
The system cleans the data by:
- Trimming whitespace
- Removing null values
- Standardizing boolean values
- Applying character encoding fixes

**Purchasing Decisions - Early Validation Services**
Purchasing decisions are special services that run during pre-processing to help you make accept/reject decisions. The most important is TrustedForm Decisions.

**TrustedForm Decisions vs TrustedForm Insights - Know the Difference**

*TrustedForm Decisions* (Purchasing Decision):
- Runs BEFORE acceptance criteria during pre-processing
- Provides basic certificate validation (valid/invalid, age, domain)
- Data available in acceptance criteria, volume caps, and pricing rules
- NOT available in flow steps or for mapping
- Lower cost - just enough data to make decisions
- Example: Accept only if TrustedForm certificate is valid and less than 90 days old

*TrustedForm Insights* (Enhancement Step):
- Added as a step in your flow AFTER acceptance
- Provides complete certificate data (consent text, snapshots, all metadata)
- Data available in the appended namespace for subsequent steps
- Can be mapped to fields or sent to your CRM
- Higher cost - full data access
- Example: Store consent text in your CRM for compliance records

**Why Two Services?**
Most buyers only need to know "is this consent valid?" during acceptance. Paying for full certificate data on every lead - including rejects - would be wasteful. TrustedForm Decisions lets you validate consent cheaply, then use TrustedForm Insights only on accepted leads that need full documentation.

**Other Purchasing Decisions**:
- Phone verification services
- Email hygiene services
- Identity verification
- Fraud scoring

All purchasing decisions run before acceptance criteria, allowing you to reject bad leads before paying for them.

### Phase 3: Business Logic Evaluation

**Acceptance Criteria Gate**
This is the first major decision point. Acceptance criteria are evaluated in order:
1. Flow-level criteria (apply to all sources)
2. Source-level criteria (specific to this entry point)

If any rule fails, the lead is rejected with the specific failure reason. For example:
- "Email domain not accepted"
- "Outside service area"
- "Missing required field: phone"

**Suppression List Checks**
The lead is checked against various suppression lists:
- **Duplicates**: Has this lead been seen before?
- **DNC (Do Not Call)**: Is this phone number on suppression lists?
- **Existing Customer**: Is this already a customer?
- **Custom Lists**: Any business-specific exclusions

Each check can be configured with lookback periods and custom field combinations. Matches result in immediate rejection with appropriate reason codes.

**Pricing Determination**
The lead's value is calculated through multiple layers:
1. Source pricing service (external calculation)
2. Source pricing rules (configured logic)
3. Flow pricing service (external calculation)
4. Flow pricing rules (configured logic)

The first layer that returns a price wins. This allows sophisticated pricing strategies while maintaining simple defaults.

**Volume Cap Evaluation**
Caps are checked to ensure limits aren't exceeded:
- Daily, weekly, or monthly limits
- Total or filtered counts
- Nested caps for complex scenarios

When a cap is reached, the lead is rejected with "Cap reached" and the specific cap name. Caps use timezone-aware calculations and can be configured with rules to create conditional limits.

### Phase 4: Flow Step Processing

After passing all pre-processing gates, the lead enters the main flow steps. Steps are processed sequentially, with each step potentially modifying the lead or changing its path.

**Filter Steps - The Traffic Controllers**
Filter steps evaluate rules to make routing decisions:
```
Step: "Route to California Buyers"
Rule: state is equal to "CA" AND property_value is greater than 200000
On match: Continue to next steps
On no match: Skip to step "National Buyers"
```

Filter steps can:
- Skip subsequent steps (creating branching logic)
- Stop the flow entirely (with success or failure)
- Add metadata for downstream decisions
- Generate specific outcomes for analytics

**Enhancement Steps - The Data Enrichers**
Enhancement steps call external services to append data:
- Demographic information
- Credit indicators
- Property details
- Business firmographics

Each enhancement runs independently, with timeouts to prevent blocking. Failed enhancements don't stop the flow - the lead continues with whatever data is available.

**Recipient Steps - The Internal Handlers**
Recipient steps handle internal notifications and processing:
- Email notifications to team members
- Webhook calls to internal systems
- Custom logging or analytics
- CRM updates

Recipients differ from destinations - they're for internal use and don't represent lead delivery to buyers.

**Destination Steps - The Delivery Points**
Destination steps deliver leads to buyers:
- Each destination is configured with an entity
- Outbound field mappings transform the data
- Integration modules handle the actual delivery
- Responses are captured and evaluated

Multiple destinations can receive the same lead (multi-buyer scenarios), with each delivery tracked independently.

### Phase 5: Response and Completion

**Response Aggregation**
After all steps complete, responses are aggregated:
- Overall outcome (success, failure, error)
- Individual destination results
- Generated lead ID
- Processing statistics
- Any error messages

**Event Finalization**
The complete event stream is finalized and stored:
- Every field parse, rule evaluation, and delivery attempt
- Timing information for each stage
- Variable snapshots at key points
- Outcome reasons and metadata

**Source Response**
The original source receives a response containing:
- Lead ID for tracking
- Overall outcome
- Specific reasons for any failures
- Destination-specific results
- Processing time

### When Processing Ends

Processing can terminate at multiple points:

**Pre-Processing Termination**
- **Hours of Operation**: Outside configured hours
- **Authentication Failure**: Invalid credentials
- **Acceptance Criteria**: Business rules not met
- **Suppression List**: Duplicate or suppressed
- **Volume Cap**: Limits exceeded

**Step Processing Termination**
- **Filter Step**: Explicit flow stop
- **Integration Error**: Critical failure
- **Timeout**: Processing time exceeded

**Normal Completion**
- All steps processed successfully
- Destinations attempted (regardless of outcome)
- Response sent to source

## Variables and Data Access

Understanding LeadConduit's variable system is crucial for effective flow configuration. Variables follow a namespace pattern that organizes data logically and prevents conflicts.

### The Namespace System

**lead.*** - Core lead data after parsing
- `lead.email` - The parsed email
- `lead.phone.number` - The normalized phone number
- Custom fields accessed directly by name (no prefix)

**source.*** - Information about the lead source
- `source.name` - The source identifier
- `source.ip_address` - Submitter's IP
- `source.user_agent` - Browser information

**flow.*** - Flow-level metadata
- `flow.name` - The flow name
- `flow.id` - Unique flow identifier

**appended.*** - Data from enhancement services and ALL outbound requests
- `appended.trustedform.valid` - From TrustedForm validation
- `appended.britive_verify.email_status` - From email verification
- `appended.salesforce.id` - From CRM delivery
- Created dynamically when ANY step returns response data
- Namespaced by entity name (underscored, lowercased)
- Available immediately to all subsequent steps

**destination.*** - Delivery-specific data (within destination context)
- `destination.outcome`
- `destination.reason`
- `destination.duration`

### Variable Resolution

Variables resolve through a precedence chain:
1. Most specific namespace first
2. Parent namespaces if not found
3. Literal value if no variable exists

This allows sophisticated defaulting behavior while maintaining clarity about data sources.

## Suppression Lists and TrustedForm Integration

### Suppression List Processing

Suppression lists provide crucial quality control by preventing unwanted leads from processing. The system supports multiple list types:

**Duplicate Checking**
- Configurable lookback periods (e.g., 30 days)
- Custom field combinations for matching
- Account-wide or flow-specific scope
- Real-time or batch list updates

**DNC (Do Not Call) Lists**
- Phone number suppression
- Regulatory compliance support
- Automatic formatting normalization
- Source-specific exemptions

**Existing Customer Suppression**
- Prevent remarketing to current customers
- CRM integration for real-time checks
- Custom match criteria
- Expiration support for win-back campaigns

### TrustedForm Certificate Processing

TrustedForm provides proof of consumer consent through certificate validation:

**Certificate Validation**
When a lead includes a TrustedForm certificate URL, the system:
1. Validates the certificate authenticity
2. Retrieves consent language and metadata
3. Checks certificate age and expiration
4. Extracts page content and snapshots

**Decision Points**
TrustedForm data becomes available in the `appended` namespace:
- `appended.trustedform.valid` - Certificate validity
- `appended.trustedform.age_seconds` - Time since creation
- `appended.trustedform.page_url` - Origin page
- `appended.trustedform.consent_text` - Captured consent language

**Integration with Rules**
You can use TrustedForm data in acceptance criteria:
```
Rule: appended.trustedform.valid is true
Rule: appended.trustedform.age_seconds is less than 300
```

## Volume Caps Deep Dive

Volume caps prevent overselling and help manage inventory. They're more sophisticated than simple counters, supporting complex business scenarios.

### Cap Structure

**Basic Caps**
```
Daily Cap: 100 leads per day
Reset: Daily at midnight ET
Scope: All leads in this flow
```

**Conditional Caps**
```
Premium State Cap: 50 leads per day
Rules: state is equal to "CA" OR state is equal to "NY"
Reset: Daily at midnight PT
```

**Nested Caps**
```
Parent Cap: 1000 leads per month
  Child Cap 1: 100 leads per day
  Child Cap 2: 50 leads per day where loan_amount > 100000
```

### Cap Evaluation Logic

Caps are evaluated hierarchically:
1. Parent caps checked first
2. If parent has room, child caps checked
3. Most specific applicable cap wins
4. First exceeded cap stops processing

This allows sophisticated inventory management like:
- Overall monthly limits with daily distribution
- Premium allocation for high-value leads
- Source-specific allocations
- Time-of-day volume shaping

## Pricing Rules and Services

Pricing in LeadConduit supports both static and dynamic models through a layered approach.

### Pricing Layers

**Source Pricing Service**
External services can calculate prices based on:
- Lead characteristics
- Market conditions
- Buyer demand
- Quality scores

**Source Pricing Rules**
Configured rules for source-specific pricing:
```
Rule: insurance_type is equal to "auto" AND state is equal to "CA"
Price: $15.00
```

**Flow Pricing Service**
Flow-level external pricing as fallback:
- Default pricing APIs
- Auction-based pricing
- Quality-adjusted pricing

**Flow Pricing Rules**
Base pricing configuration:
```
Default Price: $5.00
Rule: lead_quality is equal to "premium"
Price: $12.00
```

### Price Resolution

The first layer that returns a price wins:
1. Source service (if configured)
2. Source rules (if matched)
3. Flow service (if configured)
4. Flow rules (if matched)
5. Flow default price

This layering enables sophisticated strategies while maintaining simple defaults.

## Event Tracking and Analytics

Events form the backbone of LeadConduit's visibility and analytics. Every significant action generates a structured event.

### Event Types

**Source Events**
- Generated when lead processing completes
- Contains acceptance/rejection outcome
- Includes purchase price and total revenue
- Summarizes the complete journey

**Processing Events**
- `filter.evaluated` - Filter step processed
- `enhancement.requested` - External data requested
- `destination.delivered` - Lead sent to buyer
- `flow.completed` - All processing finished

**Error Events**
- `integration.error` - External service failed
- `validation.error` - Data validation failed
- `timeout.error` - Processing timeout

### Event Data Structure

Each event contains:
```javascript
{
  type: "destination.delivered",
  timestamp: "2024-01-15T10:30:00Z",
  duration_ms: 234,
  outcome: "success",
  reason: null,
  metadata: {
    destination_id: "abc123",
    integration: "webhook",
    response_code: 200
  }
}
```

### Using Events

Events enable:
- Real-time monitoring dashboards
- Historical analysis and reporting
- Debugging and troubleshooting
- Performance optimization
- Billing and reconciliation
- Compliance auditing

## Practical Flow Configuration

Building effective flows requires understanding both the mechanics and the strategy. Here's how to approach flow configuration.

### Start with Your Business Logic

Before configuring anything, map out:
1. Who sends you leads? (Sources)
2. What data do you need? (Fields)
3. What makes a good lead? (Acceptance Criteria)
4. Where do leads go? (Destinations)
5. What are your limits? (Caps)
6. How do you price leads? (Pricing)

### Design Your Field Schema

Choose standard fields when possible:
- Automatic type parsing
- Built-in validation
- Consistent naming
- Better reporting

Add custom fields for business-specific data:
- Prefix with your domain
- Use clear, descriptive names
- Document expected values
- Consider future needs

### Configure Your Sources

Each source should:
- Map incoming fields to your schema
- Set appropriate acceptance criteria
- Configure authentication
- Define source-specific pricing
- Set up testing credentials

### Build Your Pre-Processing Gates

**Acceptance Criteria Strategy**
- Start permissive, tighten over time
- Use flow-level for universal rules
- Use source-level for specific requirements
- Always provide clear rejection reasons

**Using TrustedForm Decisions in Acceptance**:
```
Rule: trustedform_decisions.valid is true
Rule: trustedform_decisions.age_seconds is less than 5400 (90 minutes)
Rule: trustedform_decisions.domain matches your approved list
```
Remember: TrustedForm Decisions data is only available in acceptance criteria, caps, and pricing - not in flow steps.

**Suppression List Strategy**
- Implement duplicate checking early
- Configure appropriate lookback windows
- Consider partial matching for phones/emails
- Plan for list maintenance

**Volume Cap Strategy**
- Set conservative initial limits
- Use nested caps for complex distribution
- Consider timezone implications
- Monitor fill rates

### Design Your Step Flow

**Linear Flows**
Simple flows process all leads identically:
1. Enhancement Step (append data)
2. Recipient Step (notify team)
3. Destination Step (deliver to buyer)

**Branching Flows**
Complex flows route based on criteria:
1. Filter: Premium leads (credit > 700)
   - Skip to: Premium Buyer
2. Filter: Standard leads (credit 600-700)
   - Skip to: Standard Buyer
3. Destination: Backup Buyer (all others)

**Multi-Buyer Flows**
Distribute to multiple buyers:
1. Filter: Exclusive buyer gets first shot
2. Destination: Exclusive buyer
3. Filter: If exclusive buyer rejected
4. Destination: Buyer pool A
5. Destination: Buyer pool B

### Implement Monitoring

Configure recipient steps for:
- Daily summary reports
- Cap threshold warnings
- Error notifications
- Quality alerts

## Common Buyer Patterns

### The Vendor Quality Control Pattern

Ensure every vendor meets your standards:
```
1. Enhancement: TrustedForm validation
2. Filter: If trustedform.valid is false
   Stop: "Invalid consent certificate"
3. Enhancement: Phone validation service
4. Filter: If phone.connected is false
   Stop: "Disconnected phone number"
5. Enhancement: Email verification
6. Filter: If email.deliverable is false
   Stop: "Invalid email address"
7. Destination: Your CRM (only quality leads arrive)
```

### The Multi-System Delivery Pattern

Send leads to all your systems:
```
1. Destination: CRM (Salesforce)
2. Destination: Dialer (Five9)
3. Destination: Marketing Automation (HubSpot)
4. Recipient: Slack notification for sales team
5. Recipient: Daily vendor report email
```

### The Service Area Routing Pattern

Route leads to the right sales teams:
```
1. Filter: California team (state is CA)
   Skip to: CA Systems
2. Filter: Texas team (state is TX)
   Skip to: TX Systems
3. Filter: National team (all others)
   Skip to: National Systems
4. [CA Systems]
   - Destination: CA Salesforce Queue
   - Destination: CA Dialer Campaign
   Skip to: End
5. [TX Systems]
   - Destination: TX Salesforce Queue
   - Destination: TX Dialer Campaign
   Skip to: End
6. [National Systems]
   - Destination: National Queue
   - Destination: National Campaign
```

### The Compliance-First Pattern

Ensure every lead meets regulatory requirements:
```
1. Filter: Check TrustedForm exists
   Rule: trustedform_url is not blank
   On fail: Stop "Missing consent documentation"
2. Enhancement: TrustedForm validation
3. Filter: Verify consent age
   Rule: appended.trustedform.age_seconds is less than 300
   On fail: Stop "Consent too old"
4. Filter: Check state regulations
   Rule: state is not equal to "restricted_state"
   On fail: Stop "State restrictions"
5. Enhancement: DNC list check
6. Filter: Verify not on DNC
   Rule: appended.dnc_listed is false
   On fail: Stop "DNC listed"
7. Destination: Compliant leads to CRM
```

### The Vendor Performance Tracking Pattern

Monitor and control vendor quality:
```
1. Enhancement: Data validation suite
2. Recipient: Log vendor quality metrics
3. Filter: If quality_score < 60
   Recipient: Alert vendor manager
   Stop: "Below quality threshold"
4. Filter: If vendor daily cap reached
   Stop: "Vendor cap reached"
5. Destination: CRM
6. Recipient: Update vendor scorecard
```

## Advanced Topics

### Performance Optimization

**Minimize External Calls**
- Batch enhancements when possible
- Cache frequently used data
- Set appropriate timeouts
- Handle failures gracefully

**Optimize Step Order**
- Filter early to reduce processing
- Quick checks before expensive operations
- Parallel operations where possible

**Efficient Rule Design**
- Simple rules execute faster
- Avoid complex regex when possible
- Use type-appropriate comparisons
- Leverage parsed components

### Error Handling

**Integration Failures**
- Set reasonable timeouts
- Configure retry logic
- Have fallback destinations
- Monitor error rates

**Data Quality Issues**
- Use type validation flags
- Set default values appropriately
- Log quality issues for analysis
- Don't over-reject on quality

### Testing Strategies

**Source Testing**
- Create test sources with known data
- Verify field mappings
- Test acceptance criteria
- Validate pricing logic

**Flow Testing**
- Use test destinations
- Verify step logic
- Test edge cases
- Monitor test events

**Integration Testing**
- Test timeout handling
- Verify error responses
- Check data transformation
- Validate delivery

## Buyer Troubleshooting Guide

### Common Vendor Issues

**"Vendor says leads are being rejected unfairly"**
1. Pull rejection report for that source
2. Review top rejection reasons
3. Check if vendor is sending required fields
4. Verify their field mapping is correct
5. Confirm acceptance criteria match purchase agreement
6. Share specific examples with clear rejection reasons

**"Duplicate leads are getting through"**
1. Check duplicate lookback window (should be 30+ days)
2. Verify matching criteria (phone + email recommended)
3. Review if duplicates are from same or different vendors
4. Check if phone formatting is causing mismatches
5. Ensure suppression list is updating properly

**"My CRM isn't receiving leads"**
1. Check destination configuration and credentials
2. Verify leads are passing all quality gates first
3. Review delivery events for error messages
4. Test with a simple webhook destination
5. Check if CRM API limits are being hit
6. Verify field mappings match CRM requirements

**"TrustedForm certificates are failing"**
1. Check if vendors are sending certificate URLs
2. Verify certificates aren't expired (>90 days old when a submit is detected, or >3 days old when a submit was not detected)
3. Review if certificate domain matches expected sites
4. Check TrustedForm integration configuration
5. Test with a known good certificate
6. Contact vendor about their form implementation

**"Wrong leads in wrong territories"**
1. Review service area filter rules
2. Check if state/zip fields are parsing correctly
3. Verify routing filter logic and skip-to steps
4. Look for overlapping or missing territories
5. Test with leads from border areas

### Vendor Management Tools

**Vendor Performance Analysis**:
```
Events to monitor by source:
- Acceptance rate (acceptance.success vs acceptance.failure)
- Top rejection reasons
- Data quality scores
- Average cost per accepted lead
- Delivery success rate
```

**Finding Problem Vendors**:
```
Red flags in events:
- High rejection rate (>50%)
- Consistent field validation failures
- Missing required fields (consent, phone)
- Duplicate rate >10%
- Old TrustedForm certificates
```

**Vendor Communication**:
```
Information to share:
- Source-specific submission endpoint
- Required fields checklist
- Example successful submission
- Common rejection reasons
- Real-time acceptance rate
```

### Using Events for Vendor Disputes

When a vendor claims a lead was wrongly rejected:
```
1. Get the timestamp of submission
2. Search events by source and timestamp
3. Find the source event with failure outcome
4. Review the complete event chain:
   - What fields were received
   - How they were parsed
   - Which rule failed
   - Exact rejection reason
5. Share event details with vendor
```

### Optimizing Acceptance Rates

**Review rejection patterns**:
```
Common fixable rejections:
- "Invalid phone": Vendor sending wrong format
- "Missing field": Vendor not sending required data
- "Invalid state": Vendor using full names not abbreviations
- "Duplicate": Vendor recycling old leads
- "No consent": Vendor not capturing TrustedForm
```

**Quick fixes**:
- Add field mappings for vendor variations
- Adjust validation rules if too strict
- Set default values for optional fields
- Extend duplicate lookback if needed
- Help vendors implement TrustedForm correctly

## Integration with Other LeadConduit Concepts

Flows are the orchestrators that bring all LeadConduit concepts together:

**Entities** provide identity for sources and destinations. Each source and destination references an entity, enabling account-to-account lead sharing and proper attribution.

**Integrations** power the connections. Sources use inbound integrations to receive data, destinations use outbound integrations to deliver data, and enhancement steps use integrations to enrich data.

**Types** ensure data quality. Every field in a flow has a type that defines how it's parsed, validated, and presented. Types transform chaos into structure.

**Templates** enable dynamic behavior. From simple variable substitution to complex value calculation, templates make flows responsive to data.

**Rules** drive decisions. Acceptance criteria, filter steps, caps, and pricing all use rules to evaluate conditions and control flow.

**Mappings** transform data. Source mappings normalize inbound data, destination mappings prepare outbound data, and enhancement mappings integrate appended data.

Together, these concepts create a powerful, flexible system for lead processing that handles real-world complexity without requiring custom code.

## Key Takeaways for Lead Buyers

- Flows are your automated lead buying department - enforcing purchase agreements, ensuring quality, and managing vendor relationships at scale
- Sources give each vendor a unique endpoint with specific field mappings, acceptance criteria, and caps - complete vendor management
- Pre-processing gates protect your investment by validating data quality, verifying consent, blocking duplicates, and enforcing caps BEFORE you pay
- TrustedForm integration provides real-time TCPA compliance verification, protecting you from consent-related risks
- Suppression lists prevent wasted dials by checking DNC lists, existing customers, and recent duplicates automatically
- Volume caps give you precise control over spend with vendor-specific, geographic, and time-based limits
- Events provide complete transparency for vendor management - track acceptance rates, rejection reasons, and true cost per qualified lead
- Common buyer patterns like compliance-first and vendor quality control are easy to implement without code
- Multi-system delivery ensures leads flow seamlessly to your CRM, dialer, and marketing automation platforms
- Vendor troubleshooting tools help resolve disputes quickly with detailed event logs showing exactly why leads were accepted or rejected
- Field standardization means you define your data requirements once and every vendor's unique format is automatically normalized
- Real-time vendor feedback helps improve quality by immediately telling vendors why their leads fail your criteria