# ActiveProspect Glossary Terms

This directory contains individual glossary term definitions for ActiveProspect products and concepts, extracted from the ActiveProspect Product Glossary. Each file contains a single term definition that helps users understand the key terminology used across ActiveProspect's suite of lead management and certification products.

## Table of Contents

### Core Concepts

- **[Account](account.md)** - *File:* `account.md` - *Description:* A paying ActiveProspect customer (Self-Service, Professional, or Enterprise)
- **[ActiveProspect](activeprospect.md)** - *File:* `activeprospect.md` - *Description:* SaaS company providing a suite of products for managing online lead acquisition
- **[ActiveProspect ID](activeprospect-id.md)** - *File:* `activeprospect-id.md` - *Description:* A login for an individual user in Account
- **[Entity](entity.md)** - *File:* `entity.md` - *Description:* A concept used to track leads coming in or out of LeadConduit
- **[Lead (data)](lead-data.md)** - *File:* `lead-data.md` - *Description:* Information provided by a lead including contact info and other relevant data
- **[Lead (person)](lead-person.md)** - *File:* `lead-person.md` - *Description:* A prospective customer who has expressed interest in a product or service
- **[Lead ID](lead-id.md)** - *File:* `lead-id.md` - *Description:* A unique ID associated with a lead
- **[Lead Status](lead-status.md)** - *File:* `lead-status.md` - *Description:* Most recent communication status between LeadConduit and source regarding a lead
- **[Partner](partner.md)** - *File:* `partner.md` - *Description:* Another company conducting business (buying/selling leads) within LeadConduit
- **[Platform](platform.md)** - *File:* `platform.md` - *Description:* A suite of products sold together that operate on the same code base

### LeadConduit Features

- **[LeadConduit](leadconduit.md)** - *File:* `leadconduit.md` - *Description:* Real-time data integration platform by ActiveProspect
- **[Flow](flow.md)** - *File:* `flow.md` - *Description:* Collection of discrete steps executed in sequence to process leads
- **[Step](step.md)** - *File:* `step.md` - *Description:* A discrete operation in a flow that performs an action (Filter or Delivery)
- **[Rule](rule.md)** - *File:* `rule.md` - *Description:* Logical tests that evaluate lead data to determine actions
- **[Rule Set](rule-set.md)** - *File:* `rule-set.md` - *Description:* A set of rules/rule sets with an operator to determine processing logic
- **[Filter](filter.md)** - *File:* `filter.md` - *Description:* A step that uses rules to block certain leads from further processing
- **[Delivery](delivery.md)** - *File:* `delivery.md` - *Description:* Integration designed to send leads out of LeadConduit, typically to a CRM
- **[Enhancement](enhancement.md)** - *File:* `enhancement.md` - *Description:* Integration designed to validate or append data to leads in a flow
- **[Mapping](mapping.md)** - *File:* `mapping.md` - *Description:* Assignment of values to flow fields or step parameters based on rulesets
- **[Acceptance Criteria](acceptance-criteria.md)** - *File:* `acceptance-criteria.md` - *Description:* Rule set processed before flow steps to determine processing
- **[Step Criteria](step-criteria.md)** - *File:* `step-criteria.md` - *Description:* Rule set processed before individual steps to determine if step executes
- **[LeadConduit Classic](leadconduit-classic.md)** - *File:* `leadconduit-classic.md` - *Description:* Previous version of the LeadConduit product

### Integrations & Add-Ons

- **[Integration](integration.md)** - *File:* `integration.md` - *Description:* Software connecting LeadConduit to other systems with transaction fees
- **[Add-On](add-on.md)** - *File:* `add-on.md` - *Description:* Purchasable integrations billed for service instead of standard transaction fees
- **[Inbound Integration](inbound-integration.md)** - *File:* `inbound-integration.md` - *Description:* Integration designed to receive leads in a flow
- **[Outbound Integration](outbound-integration.md)** - *File:* `outbound-integration.md` - *Description:* Integration used to deliver data out of LeadConduit to recipients
- **[Generic Integration](generic-integration.md)** - *File:* `generic-integration.md` - *Description:* Outbound XML, SOAP, JSON, or FORM POST integration for custom creation
- **[Generic Outbound Integration](generic-outbound-integration.md)** - *File:* `generic-outbound-integration.md` - *Description:* User-configurable delivery step integration with multiple content types
- **[Bespoke Integration](bespoke-integration.md)** - *File:* `bespoke-integration.md` - *Description:* Integration designed for specific source's submission format or API
- **[Marketplace Integration](marketplace-integration.md)** - *File:* `marketplace-integration.md` - *Description:* See Add-On - purchasable integrations within LeadConduit
- **[LeadConduit Standard Source Integration](leadconduit-standard-source-integration.md)** - *File:* `leadconduit-standard-source-integration.md` - *Description:* Source integration accepting data per LeadConduit submission docs
- **[LeadConduit Standard Recipient Integration](leadconduit-standard-recipient-integration.md)** - *File:* `leadconduit-standard-recipient-integration.md` - *Description:* Integration to send data from one LeadConduit flow to another

### Sources & Recipients

- **[Source](source.md)** - *File:* `source.md` - *Description:* The sending partner when leads are transferred between systems
- **[Recipient](recipient.md)** - *File:* `recipient.md` - *Description:* The receiving partner when lead data is transferred between systems
- **[Account Source](account-source.md)** - *File:* `account-source.md` - *Description:* Globally accessible source representing a LeadConduit account holder
- **[Custom Source](custom-source.md)** - *File:* `custom-source.md` - *Description:* Source only accessible within the account that created it
- **[Custom Recipient](custom-recipient.md)** - *File:* `custom-recipient.md` - *Description:* Recipient entity only accessible within the creating account
- **[Default Source](default-source.md)** - *File:* `default-source.md` - *Description:* Source automatically added to every flow named after the account
- **[My Sources](my-sources.md)** - *File:* `my-sources.md` - *Description:* List of sources added to flows, custom sources, and connected partners
- **[My Recipients](my-recipients.md)** - *File:* `my-recipients.md` - *Description:* List of recipients added to flows, custom recipients, and connected partners

### Data & Processing

- **[Field](field.md)** - *File:* `field.md` - *Description:* Data points comprising lead data as label-value pairs
- **[Field Type](field-type.md)** - *File:* `field-type.md` - *Description:* Type responsible for breaking field data into component parts
- **[Standard Field](standard-field.md)** - *File:* `standard-field.md` - *Description:* Pre-defined field available across all LeadConduit accounts
- **[Custom Field](custom-field.md)** - *File:* `custom-field.md` - *Description:* Field created within and only available to specific account
- **[Event](event.md)** - *File:* `event.md` - *Description:* Complete snapshot of lead state at a particular step in a flow
- **[Event ID](event-id.md)** - *File:* `event-id.md` - *Description:* 24-character alphanumeric string generated for every event in lead processing
- **[Filter Event](filter-event.md)** - *File:* `filter-event.md` - *Description:* Event specific to a filter that does not incur a fee
- **[Submitted Data](submitted-data.md)** - *File:* `submitted-data.md` - *Description:* Lead data submitted directly from a source in a flow
- **[Appended Data](appended-data.md)** - *File:* `appended-data.md` - *Description:* Additional data added to lead during flow processing
- **[Operator](operator.md)** - *File:* `operator.md` - *Description:* Function that compares two values or tests a single value
- **[Outcome](outcome.md)** - *File:* `outcome.md` - *Description:* Result of a step: success, failure, error, or skip

### Pricing & Billing

- **[Pricing](pricing.md)** - *File:* `pricing.md` - *Description:* Vendor-provided or rules-based price assigned at source or recipient level
- **[Transaction](transaction.md)** - *File:* `transaction.md` - *Description:* Billable event when lead is processed by an integration
- **[Transaction Cost](transaction-cost.md)** - *File:* `transaction-cost.md` - *Description:* Cost associated with a transaction (variable or fixed)
- **[Standard Transaction](standard-transaction.md)** - *File:* `standard-transaction.md` - *Description:* Default transaction type for all LeadConduit integrations
- **[Standard Transactional Pricing](standard-transactional-pricing.md)** - *File:* `standard-transactional-pricing.md` - *Description:* Cost determination based on volume of standard transactions per month
- **[Add-On Transaction](add-on-transaction.md)** - *File:* `add-on-transaction.md` - *Description:* Transaction occurring when using Add-On integration with variable pricing
- **[Add-On Transactional Pricing](add-on-transactional-pricing.md)** - *File:* `add-on-transactional-pricing.md` - *Description:* Cost determination based on marketplace integration transaction costs
- **[Fixed Transaction Cost](fixed-transaction-cost.md)** - *File:* `fixed-transaction-cost.md` - *Description:* Transaction cost that doesn't change based on external factors
- **[Variable Transaction Cost](variable-transaction-cost.md)** - *File:* `variable-transaction-cost.md` - *Description:* Transaction cost that changes based on factors like volume or data points
- **[Non-billable Event](non-billable-event.md)** - *File:* `non-billable-event.md` - *Description:* Event in LeadConduit that does not incur transaction cost
- **[Buyer Provided Price](buyer-provided-price.md)** - *File:* `buyer-provided-price.md` - *Description:* Buyer-provided sale price for a lead
- **[Vendor Provided Price](vendor-provided-price.md)** - *File:* `vendor-provided-price.md` - *Description:* Vendor-provided purchase price for a lead

### TrustedForm

- **[TrustedForm](trustedform.md)** - *File:* `trustedform.md` - *Description:* Lead certification service by ActiveProspect
- **[TrustedForm Certificate](trustedform-certificate.md)** - *File:* `trustedform-certificate.md` - *Description:* Documentation of user's experience on web form page captured by TrustedForm
- **[TrustedForm for Facebook Lead Ads Certificate](trustedform-for-facebook-lead-ads-certificate.md)** - *File:* `trustedform-for-facebook-lead-ads-certificate.md` - *Description:* Certificate documenting user's completion of Facebook Lead Ad form
- **[Session Replay](session-replay.md)** - *File:* `session-replay.md` - *Description:* Visual re-creation of consumer's form page experience captured by TrustedForm

### Other Products

- **[SuppressionList](suppressionlist.md)** - *File:* `suppressionlist.md` - *Description:* List querying service by ActiveProspect

### Feedback & Reporting

- **[Feedback](feedback.md)** - *File:* `feedback.md` - *Description:* Event associating disposition type and reason with processed lead
- **[Lead Feedback](lead-feedback.md)** - *File:* `lead-feedback.md` - *Description:* Disposition information for leads that passed through a flow
- **[Feedback Received from Recipient](feedback-received-from-recipient.md)** - *File:* `feedback-received-from-recipient.md` - *Description:* Feedback entering the system from a recipient
- **[Feedback Sent to Source](feedback-sent-to-source.md)** - *File:* `feedback-sent-to-source.md` - *Description:* Recipient feedback also submitted to the original source
- **[LeadConduit Report](leadconduit-report.md)** - *File:* `leadconduit-report.md` - *Description:* Configurable table with statistical values representing event data
- **[Shared Report](shared-report.md)** - *File:* `shared-report.md` - *Description:* Publicly accessible version of a LeadConduit account report
- **[Export](export.md)** - *File:* `export.md` - *Description:* Extraction of source events from LeadConduit in CSV format

### Technical Terms

- **[Flow Duration](flow-duration.md)** - *File:* `flow-duration.md` - *Description:* Time in milliseconds for LeadConduit to respond to a source
- **[Step Duration](step-duration.md)** - *File:* `step-duration.md` - *Description:* Time in milliseconds for recipient/enhancement response or filter processing
- **[Submission Docs](submission-docs.md)** - *File:* `submission-docs.md` - *Description:* Source and flow-specific instructions for lead submission and pings
- **[History](history.md)** - *File:* `history.md` - *Description:* Flow-specific changelog indicating changes and who made them
- **[Submissions from Sources](submissions-from-sources.md)** - *File:* `submissions-from-sources.md` - *Description:* Leads submitted from a source
- **[Submissions to Recipients](submissions-to-recipients.md)** - *File:* `submissions-to-recipients.md` - *Description:* Leads submitted from a recipient

## Alphabetical Index

- [Acceptance Criteria](acceptance-criteria.md)
- [Account](account.md)
- [Account Source](account-source.md)
- [ActiveProspect](activeprospect.md)
- [ActiveProspect ID](activeprospect-id.md)
- [Add-On](add-on.md)
- [Add-On Transaction](add-on-transaction.md)
- [Add-On Transactional Pricing](add-on-transactional-pricing.md)
- [Appended Data](appended-data.md)
- [Bespoke Integration](bespoke-integration.md)
- [Buyer Provided Price](buyer-provided-price.md)
- [Custom Field](custom-field.md)
- [Custom Recipient](custom-recipient.md)
- [Custom Source](custom-source.md)
- [Default Source](default-source.md)
- [Delivery](delivery.md)
- [Enhancement](enhancement.md)
- [Entity](entity.md)
- [Event](event.md)
- [Event ID](event-id.md)
- [Export](export.md)
- [Feedback](feedback.md)
- [Feedback Received from Recipient](feedback-received-from-recipient.md)
- [Feedback Sent to Source](feedback-sent-to-source.md)
- [Field](field.md)
- [Field Type](field-type.md)
- [Filter](filter.md)
- [Filter Event](filter-event.md)
- [Fixed Transaction Cost](fixed-transaction-cost.md)
- [Flow](flow.md)
- [Flow Duration](flow-duration.md)
- [Generic Integration](generic-integration.md)
- [Generic Outbound Integration](generic-outbound-integration.md)
- [History](history.md)
- [Inbound Integration](inbound-integration.md)
- [Integration](integration.md)
- [Lead (data)](lead-data.md)
- [Lead (person)](lead-person.md)
- [Lead Feedback](lead-feedback.md)
- [Lead ID](lead-id.md)
- [Lead Status](lead-status.md)
- [LeadConduit](leadconduit.md)
- [LeadConduit Classic](leadconduit-classic.md)
- [LeadConduit Report](leadconduit-report.md)
- [LeadConduit Standard Recipient Integration](leadconduit-standard-recipient-integration.md)
- [LeadConduit Standard Source Integration](leadconduit-standard-source-integration.md)
- [Mapping](mapping.md)
- [Marketplace Integration](marketplace-integration.md)
- [My Recipients](my-recipients.md)
- [My Sources](my-sources.md)
- [Non-billable Event](non-billable-event.md)
- [Operator](operator.md)
- [Outbound Integration](outbound-integration.md)
- [Outcome](outcome.md)
- [Partner](partner.md)
- [Platform](platform.md)
- [Pricing](pricing.md)
- [Recipient](recipient.md)
- [Rule](rule.md)
- [Rule Set](rule-set.md)
- [Session Replay](session-replay.md)
- [Shared Report](shared-report.md)
- [Source](source.md)
- [Standard Field](standard-field.md)
- [Standard Transaction](standard-transaction.md)
- [Standard Transactional Pricing](standard-transactional-pricing.md)
- [Step](step.md)
- [Step Criteria](step-criteria.md)
- [Step Duration](step-duration.md)
- [Submission Docs](submission-docs.md)
- [Submissions from Sources](submissions-from-sources.md)
- [Submissions to Recipients](submissions-to-recipients.md)
- [Submitted Data](submitted-data.md)
- [SuppressionList](suppressionlist.md)
- [Transaction](transaction.md)
- [Transaction Cost](transaction-cost.md)
- [TrustedForm](trustedform.md)
- [TrustedForm Certificate](trustedform-certificate.md)
- [TrustedForm for Facebook Lead Ads Certificate](trustedform-for-facebook-lead-ads-certificate.md)
- [Variable Transaction Cost](variable-transaction-cost.md)
- [Vendor Provided Price](vendor-provided-price.md)