# LeadConduit Content Taxonomy

## Overview

This document defines the official taxonomy for tagging LeadConduit documentation content. The taxonomy consists of four main categories that work together to provide precise content classification for document builders and knowledge management.

## Taxonomy Structure

### Category 1: Core Lead Flow Tags
These tags identify the **direction** of lead flow within LeadConduit.

#### `sources`
**Definition:** Where leads come FROM - any system, company, or process that provides leads to LeadConduit.

**Examples:**
- Web form integrations
- Lead seller companies
- Partner companies providing leads
- API submissions
- Third-party lead generation services

**Content Examples:**
- "Adding a source to your flow"
- "Configuring web form sources"
- "Setting up API lead submission"

#### `recipients`
**Definition:** Where leads go TO - any system, company, or process that receives leads from LeadConduit.

**Examples:**
- Lead buyer companies
- CRM systems
- Email service providers
- Analytics platforms
- Partner companies receiving leads

**Content Examples:**
- "Setting up lead delivery to buyers"
- "Configuring CRM integrations"
- "Batch file delivery setup"

---

### Category 2: Business Relationship Tags
These tags identify the **business relationship** or **type of system** involved in lead processing.

#### `sellers`
**Definition:** Companies or services that sell leads TO the account holder.

**Examples:**
- Lead generation companies
- Affiliate networks
- Partner companies providing leads
- Third-party lead vendors

**Usage:** Tag content about managing relationships with lead providers, configuring seller sources, or seller-related processes.

#### `buyers`
**Definition:** Companies or services that buy leads FROM the account holder.

**Examples:**
- Insurance companies
- Financial services companies
- Home improvement companies
- Any business purchasing leads

**Usage:** Tag content about lead sales, buyer management, delivery configuration, or buyer-related processes.

#### `partners`
**Definition:** Business partners regardless of whether they have LeadConduit accounts. Partners can be sellers, buyers, or both.

**Examples:**
- Strategic business partners
- Affiliate companies
- Joint venture partners
- Long-term commercial relationships

**Key Insight:** A partner can simultaneously be a seller (providing leads) and buyer (purchasing leads). Partnership is about business relationship, not technical implementation.

#### `forms`
**Definition:** Web forms that generate leads, including landing pages and form builders.

**Examples:**
- Website contact forms
- Landing page forms
- Third-party form builders (Unbounce, Gravity Forms, etc.)
- Facebook Lead Ads forms

**Usage:** Tag content about form configuration, form tracking, form optimization, or form-related integrations.

#### `crm`
**Definition:** Customer Relationship Management systems and Email Service Providers that receive lead data.

**Examples:**
- Salesforce
- HubSpot
- Mailchimp
- Constant Contact
- Custom CRM systems

**Usage:** Tag content about CRM integrations, data mapping, email automation, or customer data management.

#### `integrations`
**Definition:** Technical connections between external systems and LeadConduit that require customer configuration work.

**Customer Experience:**
- Customer does their own technical setup
- Requires API keys, credentials, field mappings
- Customer manages their own relationship with the external service
- Customer bills separately with the service provider
- Custom configuration and troubleshooting required

**Examples:**
- Salesforce CRM integration (customer has existing Salesforce license)
- HubSpot connection (customer configures their HubSpot account)
- Facebook Lead Ads setup (customer's Facebook advertising account)
- Mailchimp email automation (customer's Mailchimp account)
- Custom webhook endpoints
- Third-party API connections

**Usage:** Tag content about setting up external connections, API configuration, credential management, field mapping, or integration troubleshooting.

#### `add-ons`
**Definition:** Third-party services customers buy through LeadConduit with no technical setup required. These are plug-and-play services that ActiveProspect handles billing and management for.

**Customer Experience:**
- No technical setup needed - just add to flow and use
- ActiveProspect handles all billing (consumption-based)
- ActiveProspect manages service relationships and backend integrations
- Immediate availability once purchased
- No external accounts or credentials required

**ActiveProspect Add-Ons:**
- **TrustedForm** - Consent certification and verification
- **SuppressionList** - Duplicate checking and blacklist management

**Third-Party Add-Ons:**
- **BriteVerify** - Email and phone validation service
- Other data enhancement services
- Lead scoring services
- Verification and validation tools

**Key Distinction:** While Add-Ons technically require integrations in the background to function, customers never see this complexity. From the user perspective, Add-Ons are simply services they can purchase and use immediately through LeadConduit, with no integration work required.

**Usage:** Tag content about purchasing services through LeadConduit, using marketplace services, Add-On billing, or plug-and-play service configuration.

---

### Category 3: Service Integration Tags
These tags distinguish between different ways customers connect external services to LeadConduit.

### Category 4: Entity Management Tags
These tags identify **how** entities are managed within LeadConduit - the administrative and organizational aspects.

#### `standard-entities`
**Definition:** Pre-built entities provided by LeadConduit for convenience. These represent known companies and services so account holders don't need to create custom entities.

**Examples:**
- Major insurance companies in the directory
- Well-known lead generation services
- Popular CRM platforms
- Common email service providers

**Usage:** Tag content about selecting from entity directories, using built-in integrations, or managing pre-configured entities.

#### `account-entities`
**Definition:** Entities representing other LeadConduit accounts. These are companies that have their own LeadConduit accounts.

**Examples:**
- Partner companies with LeadConduit accounts
- Subsidiary companies with separate accounts
- Joint venture partners using LeadConduit

**Key Features:**
- These entities have full LeadConduit accounts
- They can manage their own flows and configurations
- They appear differently in the UI
- They enable account-to-account lead sharing

**Usage:** Tag content about account connections, account-to-account lead sharing, or managing relationships with other LeadConduit users.

#### `custom-entities`
**Definition:** Entities created by the account holder to track leads coming into or leaving LeadConduit. These can represent anything not covered by standard entities.

**Examples:**
- Proprietary lead sources
- Custom API integrations
- Internal tracking systems
- Unique business relationships
- Custom-built applications

**Usage:** Tag content about creating custom entities, custom integrations, API development, or unique business requirements.

---

## Tag Combinations

The power of this taxonomy comes from **combining tags across categories**. Here are common and useful combinations:

### Lead Flow + Business Relationship Examples:
- `sources` + `sellers` - Content about companies that sell leads to you
- `recipients` + `buyers` - Content about companies that buy leads from you
- `sources` + `forms` - Content about web forms providing leads
- `recipients` + `crm` - Content about CRM systems receiving leads
- `sources` + `partners` + `sellers` - Content about partner companies providing leads
- `recipients` + `partners` + `buyers` - Content about partner companies purchasing leads

### Business Relationship + Entity Management Examples:
- `sellers` + `standard-entities` - Content about selecting lead sellers from the directory
- `buyers` + `custom-entities` - Content about creating custom buyer entities
- `partners` + `account-entities` - Content about partner companies with LeadConduit accounts
- `crm` + `standard-entities` - Content about built-in CRM integrations
- `forms` + `custom-entities` - Content about custom form integrations

### Service Integration Examples:
- `recipients` + `crm` + `integrations` - Content about connecting external CRM systems
- `add-ons` + `trustedform` - Content about using TrustedForm consent certification
- `sources` + `forms` + `integrations` - Content about connecting external form builders
- `add-ons` + `suppressionlist` - Content about using duplicate checking services
- `integrations` + `credentials` - Content about managing API keys and authentication

### Complex Multi-Tag Examples:
- `sources` + `recipients` + `partners` + `account-entities` - Content about partner companies that both provide and receive leads
- `recipients` + `crm` + `custom-entities` - Content about custom CRM integrations
- `sources` + `forms` + `standard-entities` - Content about standard form builder integrations

---

## Usage Guidelines for Document Builders

### 1. Always Use Lead Flow Direction
Every piece of content involving lead movement should include either `sources` or `recipients` (or both).

### 2. Add Business Context
Include business relationship tags (`sellers`, `buyers`, `partners`, `forms`, `crm`) to provide context about the type of relationship or system.

### 3. Specify Management Type When Relevant
Include entity management tags (`standard-entities`, `account-entities`, `custom-entities`) when content deals with entity creation, selection, or management.

### 4. Think from User Perspective
Users don't think in terms of "entities" - they think about:
- Where their leads come from (`sources`)
- Where their leads go (`recipients`) 
- What kind of business relationships they have (`sellers`, `buyers`, `partners`)
- What systems they're integrating with (`forms`, `crm`)
- How much customization they need (`standard-entities` vs `custom-entities`)

### 5. Multiple Tags Are Expected
Most content will have 2-4 tags from this taxonomy. Don't limit yourself to one tag per category.

---

## Content Examples by Tag Combination

### `sources` + `sellers` + `standard-entities`
- "Adding a lead seller from the directory"
- "Configuring a standard lead vendor source"
- "Selecting insurance lead providers"

### `recipients` + `buyers` + `custom-entities`  
- "Creating a custom buyer entity"
- "Setting up a proprietary buyer integration"
- "Custom lead delivery endpoints"

### `sources` + `forms` + `standard-entities`
- "Integrating Unbounce forms with LeadConduit"
- "Facebook Lead Ads setup guide"
- "Gravity Forms WordPress integration"

### `recipients` + `crm` + `integrations`
- "Connecting Salesforce to LeadConduit"
- "HubSpot integration configuration"
- "Mailchimp list automation setup"

### `add-ons` + `trustedform`
- "Adding TrustedForm consent certification to your flow"
- "Using TrustedForm certificate verification"
- "TrustedForm billing and usage"

### `add-ons` + `suppressionlist`
- "Setting up duplicate lead checking"
- "Using SuppressionList for blacklist management"
- "SuppressionList pricing and configuration"

### `sources` + `forms` + `integrations`
- "Integrating Unbounce forms with LeadConduit"
- "Facebook Lead Ads integration setup"
- "Custom form webhook configuration"

### `sources` + `recipients` + `partners` + `account-entities`
- "Managing partner account relationships"
- "Account-to-account lead sharing"
- "Setting up bidirectional partner flows"

---

## Implementation Notes

This taxonomy is implemented in the content tagging system and should be used consistently across all LeadConduit documentation. The tags are designed to be:

- **Mutually compatible** - Multiple tags from different categories work together
- **User-focused** - Based on how users think about their business, not internal API concepts
- **Comprehensive** - Covers all major content types and use cases
- **Scalable** - New content types can be accommodated with existing tag combinations

For questions about tag usage or taxonomy updates, consult the documentation team or review the tagging script implementation at `/Users/alex/Dev/kb/bin/tag_content.sh`.