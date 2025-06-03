---
title: Complete Glossary
sidebar_label: Complete Glossary
description: Comprehensive glossary of terms used across ActiveProspect products including LeadConduit, TrustedForm, and LeadsBridge
---

# Complete Glossary

This comprehensive glossary includes terms used across all ActiveProspect products, organized both alphabetically and by category for easy reference.

## Quick Navigation

- [General Terms](#general-terms)
- [LeadConduit Terms](#leadconduit-terms)
- [TrustedForm Terms](#trustedform-terms)
- [LeadsBridge Terms](#leadsbridge-terms)
- [Complete A-Z Listing](#complete-a-z-listing)

---

## General Terms

### Core Concepts

- **Lead (person)**: A prospective customer who has expressed interest in a product or service. One of ActiveProspect's core values is that Leads are People.

- **Lead (data)**: Information provided by a Lead (person). At a minimum this includes contact info (phone, email, address), usually includes the prospective customer's name, and may also include additional information relevant to their suitability to the offered product or service.

- **ActiveProspect**: SaaS company providing a suite of products for managing online lead acquisition.

- **ActiveProspect ID**: A login for an individual user in Account.

- **Account**: A paying ActiveProspect customer. One of three types: Self-Service, Professional, and Enterprise. Each account has a corresponding Entity. This manages the user permissions for all ActiveProspect products (except LeadConduit Classic).

- **Platform**: A suite of products sold together that operate on the same code base.

---

## LeadConduit Terms

### Core Components

- **LeadConduit**: Real-time data integration platform. Product by ActiveProspect.

- **Flow**: A stored collection of discrete steps executed in a predefined, linear sequence, used to process submitted leads in LeadConduit.

- **Step**: A discrete operation defined in order to perform an action in a flow. When a lead is processed by a step, an event is recorded for that lead. A step can be one of two types:
  - **Filter Step**: Uses rules to determine whether the lead's passage through the flow is to be immediately terminated and if so, sends a specific response to the source.
  - **Delivery (or Recipient) Step**: Organizes, formats and sends selected lead data to a recipient web location, enhancement service or batch file, then parses and appends to the lead the response returned by the recipient.

- **Event**: The state of a lead at a particular step in a flow. Each lead typically has multiple events. An event includes a complete snapshot of the lead at the step.

### Entities & Integrations

- **Entity**: A concept used to track leads coming in or out of LeadConduit. Entities can be sources and/or recipients.

- **Source**: When leads are sent from one partner, system, or application to another, the sending partner is the Source.

- **Recipient**: When lead data are sent from one partner, system, or application to another, the receiving partner is the Recipient.

- **Integration**: Software that connects LeadConduit to other systems, including data sent into and out of LeadConduit. These incur a LeadConduit transaction fee any time they are used.

- **Inbound integration**: A type of integration that is designed to receive leads in a flow.

- **Outbound integration**: An integration used to deliver data out of LeadConduit to a recipient.

- **Enhancement**: A type of integration that is designed to validate or enhance (append data to) leads that enter a LeadConduit flow.

- **Delivery**: A type of integration that is designed to send leads out of LeadConduit.

### Integration Types

- **Bespoke Integration**: A source or recipient integration designed to work with a specific source's submission format or API.

- **Generic integration**: An outbound XML, SOAP, JSON, or FORM POST integration that's available for custom source/recipient creation.

- **Custom outbound integration**: A user-configurable delivery step integration. Content types include Form (application/x-www-form-urlencoded), Query (GET), Json, XML, and SOAP.

- **Add-On**: These integrations can be purchased from within LeadConduit and are billed to the ActiveProspect account for the service they provide instead of incurring a standard transaction fee. Add-Ons do not require users to acquire their own credentials from the service provider.

- **Marketplace integration**: See "Add-On" above.

### Fields & Data

- **Field**: The data points that comprise a Lead (data), structured as label-value pairs i.e. first_name: Pat; last_name: Jones; age: 21; phone: 212-555-1212

- **Field type**: Each field has a type. A type is responsible for breaking field data into component parts (i.e. phone_1 is a phone type and has the components: area code, exchange, line number, extension, etc.).

- **Standard field**: A pre-defined field in LeadConduit for a particular piece of data. Available in all accounts across the LeadConduit platform.

- **Custom field**: A field created within an account by an account holder. Only available in that account.

- **Submitted data**: The lead data that is submitted directly from a source in a flow.

- **Appended data**: Data, beyond the fields originally submitted and related to the lead, that is added to the lead data package as it is processed in a LeadConduit flow.

### Rules & Processing

- **Rule**: A set of one or more logical tests that evaluate lead data. Rules can determine whether an action such as a step or a mapping is to be performed, comparing the left-hand value to the right-hand value using an operator.

- **Rule set**: A set of rules/rule sets to process and an operator ("any" or "all") used to determine whether to "or" the rules or "and" the rules/rule sets together.

- **Acceptance criteria**: A rule set processed before flow steps. If the rules pass, the steps are processed. Otherwise, the source receives a failure response.

- **Step criteria**: A rule set processed before an individual step. If the rules pass, the step is processed normally. Otherwise the step is skipped and the associate event outcome is marked "skip".

- **Filter**: A step in a flow that uses a rule set to block certain leads from further processing and return a response immediately to the source who submitted the lead.

- **Mapping**: The assignment of a value to a flow field or to a parameter in an enhancement or delivery step and is dependent on if a ruleset is passed. Mapped values may include flow field contents, system field contents, appended data, or constants.

- **Operator**: A function that compares two values (i.e. "is equal to", "is greater than") or tests a single value (i.e. "is blank", "is not blank").

### Sources & Recipients

- **Account source**: A globally accessible source that represents a LeadConduit account holder. Automatically generated for each account holder.

- **Default source**: A source that's automatically added to every flow and named after the account.

- **Custom source**: A source that's only accessible within the account that created it.

- **Custom recipient**: A recipient entity that is only accessible within the account that created it.

- **Partner**: Another company with whom you are conducting business (buying or selling leads) within LeadConduit. Represented by an entity.

- **My sources**: A list of sources I have added as a source in a flow, any custom sources I have created, and any partners I have connected to as a source. A subset of all possible sources.

- **My recipients**: A list of recipients I have added as a recipient in a flow, any custom recipients I have created, and any partners I have connected to as a recipient. A subset of all possible recipients.

### Transactions & Pricing

- **Transaction**: A billable event in LeadConduit that occurs when a lead is processed by an integration.

- **Standard transaction**: The default transaction type for all LeadConduit integrations. A standard transaction occurs when a flow receives a lead via source integration, delivers a lead via recipient integration, or enhances a lead via an integration that uses standard transactional pricing.

- **Transaction cost**: The cost associated with a transaction. Can be variable or fixed.

- **Fixed transaction cost**: Cost associated with a transaction wherein the cost of the transaction does not change based on factors outside of the transaction itself. These transactions always cost the same.

- **Variable transaction cost**: Cost associated with a transaction wherein the cost of the transaction can change based on factors outside of the transaction itself (e.g. monthly volume, number of data points appended).

- **Standard transactional pricing**: Refers to the method of determining cost based on the volume of standard transactions per month.

- **Add-On transaction**: A transaction that occurs when using an Add-On integration in LeadConduit. The price varies by service and can have a fixed or variable transaction cost.

- **Add-On transactional pricing**: Refers to the method of determining cost based on the variable and fixed transaction costs associated with marketplace integrations.

- **Pricing**: A vendor-provided or rules-based price assigned at the source (purchase price) and/or recipient level (sale price).

- **Buyer provided price**: A buyer-provided sale price for a lead.

- **Vendor provided price**: A vendor-provided purchase price for a lead.

### Status & Outcomes

- **Lead status**: Displays the most recent communication between LeadConduit and a source regarding a particular lead. Indicates whether or not a seller expects a buyer to pay for a particular lead based on the information available to LeadConduit at the time. The list of all possible statuses includes accepted, rejected, error, converted, and returned.

- **Outcome**: The result of a step: success, failure, error, skip. On source and recipient events where the source or recipient is a partner, an outcome of "success" indicates that the other party intends to be paid, or to pay the account holder for the lead.

- **Lead ID**: A unique ID associated with a lead.

- **Event ID**: A 24 character alphanumeric string used in the Lead Feedback process. It is generated for every event (step) in a lead as it passes through LeadConduit.

### Reporting & Analytics

- **LeadConduit report**: A configurable table containing statistical values that represent underlying event data.

- **Shared report**: A publicly accessible version of a report in a LeadConduit account.

- **Export**: The extraction of source events from LeadConduit in a CSV file. Sends an email to the user when complete with a link for download.

- **History**: A flow-specific changelog that indicates the changes made to a flow and by whom.

- **Flow duration**: The amount of time in milliseconds it takes for LeadConduit to respond to a source.

- **Step duration**: The amount of time in milliseconds it takes for LeadConduit to receive a response from a recipient or enhancement within a flow or for a filter to process.

### Feedback

- **Feedback**: An event that associates a particular disposition type and reason with a lead LeadConduit has processed.

- **Lead feedback**: Disposition information associated with a lead that previously passed through a flow. Users can indicate that a lead was a conversion or a return as well as provide an optional reason for the feedback.

- **Feedback received from recipient**: Feedback that enters the system from a recipient.

- **Feedback sent to source**: Feedback that enters the system from a recipient and is also submitted to the original source.

### Special Features

- **Submission docs**: A source and flow-specific document that contains instructions and example for lead submission and/or pings.

- **LeadConduit Standard source integration**: A LeadConduit source integration that accepts submitted lead data according to instructions generated by LeadConduit, called "Submission Docs".

- **LeadConduit Standard recipient integration**: A LeadConduit recipient integration designed to send data from one LeadConduit flow to another flow.

- **Filter event**: An event specific to a filter. Does not incur a fee.

- **Non-billable event**: Any event in LeadConduit that does not incur a transaction cost. Examples include filters, events, LC to LC deliveries.

- **Submissions from sources**: Leads submitted from a source.

- **Submissions to recipients**: Leads submitted from a recipient.

---

## TrustedForm Terms

### Core Concepts

- **TrustedForm**: Lead certification service. Product by ActiveProspect.

- **TrustedForm Certificate**: A collection of information documenting a user's experience on a web form page as captured by TrustedForm.

- **TrustedForm for Facebook Lead Ads certificate**: A TrustedForm Certificate documenting a user's completion of a Facebook Lead Ad form.

- **TrustedForm Certify Web SDK**: The javascript snippet is embedded on a web site in order to generate the TrustedForm certificate, which can be configured to your specifications in the Certify screen of any TrustedForm account.

### Certificate Management

- **Claim or Retain [a TrustedForm certificate]**: Claim, also called Retain, is the action required to save a TrustedForm Certificate (for a default 5 years) in your ActiveProspect account for later use. This action is taken by API or LeadConduit on the full certificate URL of 69 characters in the format https://cert.trustedform.com/<cert_token>.

- **Extend [a TrustedForm certificate]**: Managed customers can extend the Claim Window for a certificate to be claimed to 90 days by API, or it may be done automatically by Auto Extend. The Extend API is available by special permission arranged by your AP team for managed customers.

- **Claim/Delete Window**: A TrustedForm certificate can be claimed/retained for a limited window of time after certificate creation. This amount of time is displayed when a claimable TrustedForm Certificate URL is viewed in a web browser.

- **Auto Extend**: When a TrustedForm certificate is created, if a submit event can be identified, the Claim/Delete window is automatically extended to 90 days.

- **Auto Retain**: Register your web site so that TrustedForm automatically claims/retains the TrustedForm Certificate to your ActiveProspect account.

### Verification & Analysis

- **TrustedForm Consent**: The Consent subscription allows you to verify consent language, check email and phone fingerprints against your lead, and retain/claim the certificate for future use.

- **TrustedForm Insights (Metadata)**: The TrustedForm Insights subscription provides metadata characterizing the consumer session captured in the TrustedForm certificate, for use in validation decisions.

- **Fingerprints**: When making a claim (i.e., retaining) a certificate, the email and phone numbers included with a lead will be hashed (encrypted) as "fingerprints" and checked against the email and phone recorded by TrustedForm during the consumer web session.

- **Page Scan**: When making a claim (i.e., retaining) a certificate, you can specify text that must be included, or must not be included, in the consumer session.

### Session Details

- **Event Log**: On a tab of the TrustedForm Certificate, the Event Log documents the consumer keystrokes, scrolling, and button presses.

- **Session Replay**: A visual re-creation of a consumer's experience on a form page as captured by TrustedForm. The replay, displayed on a TrustedForm.com-hosted page, is composed of a re-rendering of the page's HTML with overlayed replays of the users mouse and keyboard action events.

---

## LeadsBridge Terms

- **App**: A platform that is available to be connected in LeadsBridge. An app can be implemented or not (on the waiting list).

- **Bridge**: A Bridge is a connection between two platforms/applications. The connection foresees two entities. Hence it's not possible to have a bridge between multiple sources and destinations.

- **Integration**: Is the "instance" of an app w/ all the credentials defined (e.g., SFDC with the user already authenticated using the Oauth). There could be multiple integrations for the same app. The UI will call integration as "account".

- **Source**: It is the integration that sends data to the destination (e.g: Facebook Lead Ads). Leadsbridge retrieves data from the source.

- **Destination**: It is the integration where data are passed to. It receives the data form the Source (e.g: Google Sheets). LeadsBridge ingest/push data to the destination.

---

## Complete A-Z Listing

### A

- **Acceptance criteria**: A rule set processed before flow steps. If the rules pass, the steps are processed. Otherwise, the source receives a failure response.
- **Account**: A paying ActiveProspect customer. One of three types: Self-Service, Professional, and Enterprise.
- **Account source**: A globally accessible source that represents a LeadConduit account holder.
- **ActiveProspect**: SaaS company providing a suite of products for managing online lead acquisition.
- **ActiveProspect ID**: A login for an individual user in Account.
- **Add-On**: Integrations that can be purchased from within LeadConduit and are billed to the ActiveProspect account.
- **Add-On transaction**: A transaction that occurs when using an Add-On integration in LeadConduit.
- **Add-On transactional pricing**: Method of determining cost based on the variable and fixed transaction costs.
- **App**: A platform that is available to be connected in LeadsBridge.
- **Appended data**: Data added to the lead data package as it is processed in a LeadConduit flow.
- **Auto Extend**: Automatic extension of the Claim/Delete window to 90 days when a submit event is identified.
- **Auto Retain**: Automatic claiming/retaining of TrustedForm Certificates to your ActiveProspect account.

### B

- **Bespoke Integration**: A source or recipient integration designed for a specific source's submission format or API.
- **Bridge**: A connection between two platforms/applications in LeadsBridge.
- **Buyer provided price**: A buyer-provided sale price for a lead.

### C

- **Claim or Retain**: Action to save a TrustedForm Certificate for later use.
- **Claim/Delete Window**: Limited window of time after certificate creation for claiming/retaining.
- **Custom field**: A field created within an account by an account holder.
- **Custom outbound integration**: User-configurable delivery step integration.
- **Custom recipient**: A recipient entity only accessible within the creating account.
- **Custom source**: A source only accessible within the creating account.

### D

- **Default source**: Source automatically added to every flow, named after the account.
- **Delivery**: Integration type designed to send leads out of LeadConduit.
- **Destination**: Integration where data are passed to in LeadsBridge.

### E

- **Enhancement**: Integration type designed to validate or enhance leads.
- **Entity**: Concept used to track leads coming in or out of LeadConduit.
- **Event**: The state of a lead at a particular step in a flow.
- **Event ID**: 24 character alphanumeric string for the Lead Feedback process.
- **Event Log**: Documents consumer keystrokes, scrolling, and button presses.
- **Export**: Extraction of source events from LeadConduit in a CSV file.
- **Extend**: Extension of the Claim Window for a certificate to 90 days.

### F

- **Feedback**: Event associating a disposition type and reason with a processed lead.
- **Feedback received from recipient**: Feedback entering the system from a recipient.
- **Feedback sent to source**: Feedback submitted to the original source.
- **Field**: Data points comprising a Lead, structured as label-value pairs.
- **Field type**: Type responsible for breaking field data into component parts.
- **Filter**: Step using a rule set to block certain leads from further processing.
- **Filter event**: Event specific to a filter that does not incur a fee.
- **Fingerprints**: Hashed email and phone numbers checked against TrustedForm records.
- **Fixed transaction cost**: Cost that doesn't change based on external factors.
- **Flow**: Collection of discrete steps executed in sequence to process leads.
- **Flow duration**: Time in milliseconds for LeadConduit to respond to a source.

### G

- **Generic integration**: Outbound XML, SOAP, JSON, or FORM POST integration.

### H

- **History**: Flow-specific changelog indicating changes and who made them.

### I

- **Inbound integration**: Integration designed to receive leads in a flow.
- **Integration**: Software connecting LeadConduit to other systems.
- **Integration (LeadsBridge)**: Instance of an app with credentials defined.

### L

- **Lead (data)**: Information provided by a prospective customer.
- **Lead (person)**: A prospective customer who has expressed interest.
- **Lead feedback**: Disposition information associated with a processed lead.
- **Lead ID**: Unique ID associated with a lead.
- **Lead status**: Most recent communication between LeadConduit and source.
- **LeadConduit**: Real-time data integration platform by ActiveProspect.
- **LeadConduit Classic**: Previous version of the LeadConduit product.
- **LeadConduit report**: Configurable table with statistical values.
- **LeadConduit Standard recipient integration**: Integration for sending data between flows.
- **LeadConduit Standard source integration**: Integration accepting data per Submission Docs.

### M

- **Mapping**: Assignment of values to flow fields or parameters.
- **Marketplace integration**: See "Add-On".
- **My recipients**: List of recipients added, created, or connected to.
- **My sources**: List of sources added, created, or connected to.

### N

- **Non-billable event**: Event not incurring a transaction cost.

### O

- **Operator**: Function comparing values or testing single values.
- **Outbound integration**: Integration for delivering data out of LeadConduit.
- **Outcome**: Result of a step (success, failure, error, skip).

### P

- **Page Scan**: Specification of text inclusion/exclusion in consumer session.
- **Partner**: Company conducting business within LeadConduit.
- **Platform**: Suite of products on the same code base.
- **Pricing**: Vendor-provided or rules-based price assignment.

### R

- **Recipient**: Receiving partner when lead data are sent.
- **Rule**: Logical tests evaluating lead data.
- **Rule set**: Set of rules/rule sets with processing operator.

### S

- **Session Replay**: Visual re-creation of consumer's form page experience.
- **Shared report**: Publicly accessible version of a LeadConduit report.
- **Source**: Sending partner when leads are sent.
- **Source (LeadsBridge)**: Integration sending data to destination.
- **Standard field**: Pre-defined field available across LeadConduit.
- **Standard transaction**: Default transaction type for integrations.
- **Standard transactional pricing**: Cost based on monthly transaction volume.
- **Step**: Discrete operation performing an action in a flow.
- **Step criteria**: Rule set processed before individual steps.
- **Step duration**: Time for LeadConduit to receive response.
- **Submission docs**: Instructions for lead submission and pings.
- **Submissions from sources**: Leads submitted from a source.
- **Submissions to recipients**: Leads submitted from a recipient.
- **Submitted data**: Lead data submitted directly from source.
- **SuppressionList**: List querying service by ActiveProspect.

### T

- **Transaction**: Billable event when lead is processed by integration.
- **Transaction cost**: Cost associated with a transaction.
- **TrustedForm**: Lead certification service by ActiveProspect.
- **TrustedForm Certificate**: Information documenting user's web form experience.
- **TrustedForm Certify Web SDK**: Javascript snippet for generating certificates.
- **TrustedForm Consent**: Subscription for verifying consent and fingerprints.
- **TrustedForm for Facebook Lead Ads certificate**: Certificate for Facebook Lead Ad forms.
- **TrustedForm Insights**: Metadata subscription for validation decisions.

### V

- **Variable transaction cost**: Cost changing based on external factors.
- **Vendor provided price**: Vendor-provided purchase price for a lead.

---

## See Also

- [Getting Started Guide](/docs/v2/guide/getting-started)
- [LeadConduit User Manual](/docs/v2/leadconduit)
- [TrustedForm User Manual](/docs/v2/trustedform)
- [LeadsBridge User Manual](/docs/v2/leadsbridge)
- [Support & Resources](/docs/v2/guide/getting-started/support-resources)