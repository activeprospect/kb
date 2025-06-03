---
title: Pre-Processing Phase
description: The gateway where leads are authenticated, normalized, and enriched before entering your flow
tags:
  - flows
  - reference
  - technical
  - pre-processing
  - flows-focused
  - mappings-focused
  - integrations-focused
  - entities-focused
  - source-configuration
  - intermediate
  - seller-focused
  - data-management
---

# Pre-Processing Phase

## Overview

The pre-processing phase is your flow's security checkpoint and data preparation center. Before a lead officially enters your flow for business logic evaluation, it must pass through pre-processing where three critical activities occur:

1. **Authentication** - Verify the source is authorized
2. **Normalization** - Transform vendor data to your standard format
3. **Purchasing Decisions** - Enrich with data needed for accept/reject decisions

This phase ensures only properly formatted, authenticated leads from legitimate sources enter your flow.

## Authentication

When a lead arrives at your flow's endpoint, the first check is authentication:

### What Happens
1. Source provides credentials (API key, username/password, etc.)
2. LeadConduit validates against stored source configuration
3. Invalid credentials receive immediate 401 Unauthorized response
4. Valid credentials allow processing to continue

### Key Points
- Failed authentication stops processing immediately
- No events are generated for auth failures
- Each source has unique credentials
- Credentials are encrypted and secure

## Field Mapping and Normalization

Once authenticated, the lead data undergoes transformation:

### Source Field Mapping
Your source configuration defines how vendor fields become your fields:

| Vendor Sends | Your Field | Result |
|--------------|------------|--------|
| `primary_email` | `email` | Vendor's value fills your email field |
| `home_phone` | `phone_1` | Vendor's value fills your phone_1 field |
| `requested_amount` | `loan_amount` | Vendor's value fills your loan_amount field |

### Type Parsing
After mapping, each field is parsed by its [type](../types.md):
- Phone numbers are normalized
- Emails are lowercased
- States become 2-letter codes
- Dates convert to ISO format

### Data Structure
The lead data structure is initialized:
```
{
  lead: {         // Parsed field data
    email: "john@example.com",
    phone_1: "5551234567",
    state: "TX"
  },
  source: {       // Source metadata
    name: "vendor-api",
    ip_address: "192.168.1.1"
  },
  flow: {         // Flow metadata
    id: "abc123",
    name: "Insurance Leads"
  }
}
```

## Purchasing Decisions

The unique aspect of pre-processing is purchasing decision services - integrations that run BEFORE acceptance criteria to help you decide whether to accept a lead.

### Why Purchasing Decisions?

Traditional flow steps run after you've accepted a lead. But what if you need external data to make the acceptance decision itself? That's where purchasing decisions come in.

### Common Purchasing Decisions

**TrustedForm Decisions**
- Validates consent certificate exists and is fresh
- Provides basic certificate data (age, domain, validity)
- Much cheaper than full TrustedForm Insights
- Data available in acceptance criteria rules

**Phone Verification**
- Quick check if phone is connected
- Basic carrier information
- Helps reject disconnected numbers before paying

**Email Hygiene**
- Validates email deliverability
- Identifies disposable emails
- Prevents paying for bad emails

### Key Differences from Enhancement Steps

| Aspect | Purchasing Decisions | Enhancement Steps |
|--------|---------------------|-------------------|
| **When** | During pre-processing | After acceptance |
| **Purpose** | Help accept/reject decision | Enrich accepted leads |
| **Cost** | Usually minimal | Can be expensive |
| **Data** | Limited, decision-focused | Comprehensive |
| **Available In** | Acceptance criteria, caps, pricing | All flow steps |

### Using Purchasing Decision Data

Data from purchasing decisions is available in:
- **Acceptance Criteria**: "trustedform_decisions.valid is true"
- **Volume Caps**: "Cap only valid consents"
- **Pricing Rules**: "Higher price for verified phones"

But NOT in:
- Flow steps (they run after pre-processing)
- Mappings (except source mappings)
- Recipients (too late in process)

## Variable Initialization

During pre-processing, the variable system is initialized:

**System Variables Set:**
- `flow.*` - Flow metadata
- `source.*` - Source information
- `account.*` - Account details
- `submission.*` - Timestamp and metadata

**Lead Variables:**
- Populated after field mapping
- Typed after parsing
- Available for rules evaluation

## Error Handling

Pre-processing handles various error scenarios:

### Authentication Errors
- Return 401 Unauthorized
- No further processing
- No events generated

### Parsing Errors
- Don't stop processing
- Set field.valid = false
- Original data preserved in raw
- Lead continues to business logic

### Service Timeouts
- Purchasing decisions have strict timeouts
- Timeout = no data (not rejection)
- Lead continues without enhancement

## Performance Considerations

Pre-processing is optimized for speed:
- Authentication cached per request batch
- Field mapping is near-instant
- Type parsing is highly optimized
- Purchasing decisions run in parallel
- Total time: typically <100ms

## Output

After pre-processing completes, you have:
1. **Authenticated source** - Verified legitimate sender
2. **Normalized data** - Fields mapped and typed
3. **Decision data** - Purchasing decision results
4. **Ready for business logic** - Clean data for evaluation

The lead now enters the [Business Logic Phase](business-logic.md) where your rules determine its fate.

---

*Pre-processing ensures every lead entering your flow is authenticated, properly formatted, and enriched with decision-critical data. It's the foundation that makes reliable lead processing possible.*