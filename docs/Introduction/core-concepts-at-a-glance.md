---
layout: page
title: Core Concepts at a Glance
permalink: /Introduction/core-concepts-at-a-glance
---

# Core Concepts at a Glance

Before diving into LeadConduit's features, it's essential to understand the fundamental concepts that form the foundation of the platform. These concepts work together to create a powerful lead processing ecosystem.

## Essential Terminology

### Leads
**Lead (Person):** A prospective customer who has expressed interest in a product or service. Remember: **Leads are People** – one of ActiveProspect's core values.

**Lead (Data):** The information provided by a lead person, including contact details, preferences, and qualification data. This data flows through your LeadConduit system.

### Core Components

#### Sources
**What it is:** The origin of lead data entering your system. Sources send leads into LeadConduit for processing.

**Types:**
- **Web forms** on your websites
- **API integrations** from partner systems
- **Manual entry** by your team
- **Partner sources** from other LeadConduit users

**Key concept:** Every lead must come from a source, and sources can have their own validation rules and pricing.

#### Recipients
**What it is:** The destination for processed leads. Recipients receive leads from LeadConduit after processing.

**Types:**
- **CRM systems** (Salesforce, HubSpot, etc.)
- **Call centers** and dialer systems
- **Email marketing platforms**
- **Partner recipients** (other LeadConduit users)
- **Custom API endpoints**

**Key concept:** Recipients can be internal systems or external partners who purchase your leads.

#### Flows
**What it is:** A structured sequence of steps that process leads from sources to recipients. Think of it as a assembly line for lead processing.

**Core purpose:** Flows define **how** leads are processed, **where** they're delivered, and **what** business logic applies during processing.

**Key concept:** Every lead follows a specific path through your flow, and each step in the flow can modify, enhance, or filter the lead.

## The Lead Processing Journey

### 1. Lead Submission
```
Source → LeadConduit Flow → Initial Validation
```
- Lead data arrives from a source
- Basic format and required field validation
- System assigns unique Lead ID

### 2. Flow Processing
```
Validation → Enhancement → Business Rules → Delivery
```
- **Filters** can stop low-quality leads
- **Enhancement steps** add valuable data
- **Business rules** determine routing and pricing
- **Delivery steps** send leads to recipients

### 3. Response and Tracking
```
Delivery Response → Lead Status → Source Notification
```
- Recipients respond with acceptance/rejection
- System tracks lead status changes
- Source receives confirmation and lead status

## Key Data Structures

### Fields
**Standard Fields:** Pre-defined data points available across all accounts (first_name, email, phone, etc.)

**Custom Fields:** Account-specific fields you create for specialized data (lead_score, campaign_id, etc.)

**Field Types:** Each field has a type that determines how data is processed and validated (phone, email, text, number, etc.)

### Events
**What it is:** A snapshot of a lead at each step in the flow, including all data and processing results.

**Why it matters:** Events provide complete audit trails and enable detailed reporting and troubleshooting.

**Types:**
- **Source events** (lead submission)
- **Filter events** (qualification decisions)
- **Enhancement events** (data enrichment)
- **Delivery events** (recipient submissions)
- **Feedback events** (conversion tracking)

## Business Logic Components

### Rules and Rule Sets
**Rules:** Logical tests that evaluate lead data (e.g., "state equals California")

**Rule Sets:** Collections of rules combined with AND/OR logic for complex decision making

**Applications:**
- **Acceptance criteria** (should we accept this lead?)
- **Step criteria** (should we execute this step?)
- **Pricing rules** (what should we charge/pay?)
- **Volume caps** (have we reached our limits?)

### Mapping and Templates
**Mapping:** Assigning lead data to recipient fields or parameters

**Templates:** Using variables and logic to dynamically generate content (Handlebars syntax)

**Example:** `Hello {{first_name}}, thanks for your interest in {{product_type}}`

## Integration Concepts

### Standard vs. Add-On Integrations
**Standard Integrations:** Basic connections that incur standard transaction fees

**Add-On Integrations:** Premium services with specialized pricing (TrustedForm, SuppressionList, etc.)

### Transaction Types
**Standard Transaction:** Basic lead processing (sources, recipients, enhancements)

**Add-On Transaction:** Specialized services with variable pricing based on usage

**Non-billable Events:** Filters and internal operations that don't incur charges

## Partner Ecosystem

### Entity Relationships
**Entities:** Organizations in the LeadConduit ecosystem (your account, partners, etc.)

**Partners:** Other companies you do business with through LeadConduit

**Connection Process:** Formal invitation and acceptance system for business relationships

### Data Sharing and Privacy
**Visibility Controls:** Determine what data partners can see

**Submission Instructions:** Generated documentation for partners to integrate with your flows

**Feedback Sharing:** Conversion and return data sharing between partners

## Pricing and Volume Management

### Pricing Models
**Vendor-Provided Pricing:** Fixed prices set by sources or recipients

**Rules-Based Pricing:** Dynamic pricing based on lead characteristics

**Buyer-Provided Pricing:** Competitive bidding scenarios

### Volume Controls
**Volume Caps:** Limits on lead quantities (daily, hourly, total)

**Scheduling:** Time-based delivery controls

**Distribution Rules:** How to allocate leads among multiple recipients

## Quality and Compliance

### Lead Quality
**Validation:** Ensuring data meets format and business requirements

**Enhancement:** Adding valuable data to improve lead quality

**Scoring:** Assigning quality scores based on multiple factors

### Compliance and Security
**Audit Trails:** Complete tracking of all lead processing activities

**Data Privacy:** Controls for handling sensitive personal information

**Security Standards:** SOC 2 Type II certification and enterprise security measures

## Getting Started Framework

Understanding these concepts provides the foundation for:

1. **Planning your flows** based on business requirements
2. **Configuring sources and recipients** for your ecosystem
3. **Setting up business rules** that match your processes
4. **Monitoring and optimizing** performance over time

Each of these concepts will be explored in detail throughout this user guide, with practical examples and step-by-step instructions for implementation.

## Next Steps

Now that you understand the core concepts, you're ready to:
- Set up your LeadConduit account
- Build your first flow
- Configure sources and recipients
- Implement business rules and monitoring

The following chapters will guide you through each of these steps with detailed instructions and best practices.