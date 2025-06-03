---
URL: https://community.activeprospect.com/series/4051250/posts/4054502-activeprospect-product-glossary
Page Title: ActiveProspect Product Glossary
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-617a9598-a6e6-4913-a32f-9e08dcd0ee85.png
Scraped At: 2025-05-30 00:16:21.154
tags:
  - leadconduit
  - intermediate
  - seller-focused
  - flows
  - integrations
  - data-management
  - business-logic
secondary_tags:
  - analytics
  - admin-focused
  - reference
  - compliance
  - leadsbridge
---

[previous page](https://community.activeprospect.com/series/4051250/posts/5070196-what-is-leadsbridge) 7 of 9 [next page](https://community.activeprospect.com/series/4051250/posts/5070198-leadsbridge-glossary)

In Series: [Getting Started with the Knowledge Base](https://community.activeprospect.com/series/4051250-getting-started-with-the-knowledge-base)

[![](https://content2.bloomfire.com/avatars/users/1405246/thumb/thumbnail.png?f=1620827893&Expires=1748567764&Signature=k2EnCRpiTRmRjLWA5M8R7-Q~ePGyjTegalEZr1l2l~eMY7xFC2FmIo-9OVSnDVpY--Mbi82MQMtP34UG13foga8dMzBCQXPMx9xZ6rTZuOwK4GntN5kl6ltaJW5O5hfTxErw7QwuwLQQFZMhZXzzoxPST5FL4ufGvdNExAJJnrRC0j73E2QDrOgs~ZI-UT83wHw8JAC3dI4sJywxG-Sz8cB8e1bez~Lkv58sV9LFMjjG0AEtHKl9lnpZ18yXsHxZBPQHp93RW96Xf4nR3shGoGD54gzpAp0Fi~UM5eF4kPQBsi-BnI~SwbfUI1KMOXLzmlqBFq7S~atB-d8kmcDaXQ__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7846678-christopher-williams)

[_Christopher Williams_](https://community.activeprospect.com/memberships/7846678-christopher-williams)

Updated August 19, 2024. Published October 28, 2020.

Details

# ActiveProspect Product Glossary

Defining ActiveProspect terminology

- **Acceptance criteria**: A rule set processed before flow steps. If the rules pass, the steps are processed. Otherwise, the source receives a failure response.
- **Account**: A paying ActiveProspect customer. One of three types: Self-Service, Professional, and Enterprise. Each account has a corresponding Entity.
- **Account source**: A globally accessible source that represents a LeadConduit account holder. Automatically generated for each account holder.
- **ActiveProspect**: SaaS company providing a suite of products for managing online lead acquisition.
- **ActiveProspect ID**: A login for an individual user in Account.
- **Add-On:** These integrations can be purchased from within LeadConduit and are billed to the ActiveProspect account for the service they provide instead of incurring a standard transaction fee. Add-Ons do not require users to acquire their own credentials from the service provider.
- **Add-On transaction**: A transaction that occurs when using an Add-On integration in LeadConduit. The price varies by service and can have a fixed or variable transaction cost. The standard transactional cost does not apply when using marketplace integrations.
- **Add-On transactional pricing**: Refers to the method of determining cost based on the variable and fixed transaction costs associated with marketplace integrations.
- **Appended data**: Data, beyond the fields originally submitted and related to the lead, that is added to the lead data package as it is processed in a LeadConduit flow.
- **Bespoke Integration:** A source or recipient integration designed to work with a specific source's submission format or API.
- **Buyer provided price**: A buyer-provided sale price for a lead.
- **Custom field**: A field created within an account by an account holder. Only available in that account.
- **Custom recipient**: A recipient entity that is only accessible within the account that created it.
- **Custom outbound integration:** A user-configurable delivery step integration. Content types include Form (application/x-www-form-urlencoded), Query (GET), Json, XML, and SOAP
- **Custom source**: A source that's only accessible within the account that created it.
- **Default source**: A source that's automatically added to every flow and named after the account.
- **Delivery**: A type of integration that is designed to send leads out of LeadConduit.
- **Enhancement**: A type of integration that is designed to validate or enhance (append data to) leads that enter a LeadConduit flow.
- **Entity**: A concept used to track leads coming in or out of LeadConduit. Entities can be sources and / or recipients.
- **Event**: The state of a lead at a particular step in a flow. Each lead typically has multiple events. An event includes a complete snapshot of the lead at the step, including :
  - The data as submitted by the source.
  - Certain system data such as the identity of the source and the timestamp of the submission.
  - The outcome status of each step, as in ""success"", ""failure"", ""error"" or ""skip""
  - Data parsed from the response bodies of enhancement or delivery steps (“appended” data).
  - Time stamps and technical details (connection information, request and response) of each step in the flow for that lead.
  - The response that LeadConduit returns to the source. This includes the final lead status, a unique lead identifier, and optionally a reason if the final lead status is not ""success"".
- **Event ID:** A 24 character alphanumeric string used in the Lead Feedback process. It is generated for every event (step) in a lead as it passes through LeadConduit.
- **Export**: The extraction of source events from LeadConduit in a CSV file. Sends an email to the user when complete with a link for download.
- **Feedback**: An even that associates a particular disposition type and reason with a lead LeadConduit has processed.
- **Feedback received from recipient**: Feedback that enters the system from a recipient.
- **Feedback sent to source**: Feedback that enters the system from a recipient and s also submitted to the original source.
- **Field**: The data points that comprise a Lead (data), structured as label-value pairs i.e. first\_name: Pat; last\_name: Jones; age: 21; phone: 212-555-1212
- **Field type**: Each field has a type. A type is responsible for breaking field data into component parts (i.e. phone\_1 is a phone type and has the components: area code, exchange, line number, extension, etc.).
- **Filter**: A step in a flow that uses a rule set to block certain leads from further processing and return a response immediately to the source who submitted the lead.
- **Filter event**: An event specific to a filter. Does not incur a fee.
- **Fixed transaction cost**: Cost associated with a transaction wherein the cost of the transaction does not change based on factors outside of the transaction itself. These transactions always cost the same.
- **Flow**: A stored collection of discrete steps executed in a predefined, linear sequence, used to process submitted leads in LeadConduit.
- **Flow duration**: The amount of time in milliseconds it takes for LeadConduit to respond to a source.
- **Generic integration**: An outbound XML, SOAP, JSON, or FORM POST integration that's available for custom source / recipient creation.
- **History**: A flow-specific changelog that indicates the changes made to a flow and by whom.
- **Inbound integration**: A type of integration that is designed to receive leads in a flow.
- **Integration**: Software that connects LeadConduit to other systems, including data sent into and out of LeadConduit. These incur a LeadConduit transaction fee any time they are used.
- **Lead (person):** A prospective customer who has expressed interest in a product or service. One of ActiveProspect's core values is that Leads are People.
- **Lead (data):** Information provided by a Lead (person). At a minimum this includes contact info (phone, email, address), usually includes the prospective customer’s name, and may also include additional information relevant to their suitability to the offered product or service.
- **Lead feedback**: Disposition information associated with a lead that previously passed through a flow. Users can indicate that a lead was a conversion or a return as well as provide an optional reason for the feedback.
- **Lead ID**: A unique ID associated with a lead.
- **Lead status**: Displays the most recent communication between LeadConduit and a source regarding a particular lead. Indicates whether or not a seller expects a buyer to pay for a particular lead based on the information available to LeadConduit at the time. The list of all possible statues includes accepted, rejected, error, converted, and returned.
- **LeadConduit**: Real-time data integration platform. Product by ActiveProspect.
- **LeadConduit Classic**: A previous version of the LeadConduit product by ActiveProspect.
- **LeadConduit report**: A configurable table containing statistical values that represent underlying event data.
- **LeadConduit Standard source integration**: A LeadConduit source integration that accepts submitted lead data according to instructions generated by LeadConduit, called ""Submission Docs"". Submission docs include instructions for HTTP GET, form POST, Json POST, and XML POST, plus a bulk import app that accepts Comma-separated text files.
- **LeadConduit Standard recipient integration**: A LeadConduit recipient integration designed to send data from one LeadConduit flow to another flow.
- **Mapping**: The assignment of a value to a flow field or to a parameter in an enhancement or delivery step and is dependent on if a ruleset is passed. Mapped values may include flow field contents, system field contents, appended data, or constants. Used after a lead is processed by an inbound integration and before a lead is processed by an outbound integration. Mapping is also the similar process of assigning values when creating rules.
- **Marketplace integration**: See ""Add-On"" above.
- **My recipients**: A list of recipients I have added as a recipient in a flow, any custom recipients I have created, and any partners I have connected to as a recipient. A subset of all possible recipients.
- **My sources**: A list of sources I have added as a source in a flow, any custom sources I have created, and any partners I have connected to as a source. A subset of all possible recipients.
- **Non-billable event**: Any even in LeadConduit that does not incur a transaction cost. Examples include filters, events, LC to LC deliveries.
- **Operator**: A function that compares two values (i.e. ""is equal to"", ""is greater than"") or tests a single value (i.e. ""is blank"", ""is not blank"").
- **Outbound integration**: An integration used to deliver data out of LeadConduit to a recipient.
- **Outcome**: The result of a step: success, failure, error, skip. On source and recipient events where the source or recipient is a partner, an outcome of ""success"" indicates that the other party intends to be paid, or to pay the account holder for the lead.
- **Partner**: Another company with whom you are conducting business (buying or selling leads) within LeadConduit. Represented by an entity.
- **Platform**: A suite of products sold together that operate on the same code base.
- **Pricing**: A vendor-provided or rules-based price assigned at the source (purchase price) and / or recipient level (sale price).
- **Recipient**: When lead data are sent from one partner, system, or application to another, the receiving partner is the Recipient.
- **Rule**: A set of one or more logical tests that evaluate lead data. Rules can determine whether an action such as a step or a mapping is to be performed, comparing the left-hand value to the right-hand value using an operator.
- **Rule set**: A set of rules / rule sets to process and an operator (""any"" or ""all"") used to determine whether to ""or"" the rules or ""and"" the rules / rule sets together.
- **Session Replay:** A visual re-creation of a consumer's experience on a form page as captured by TrustedForm. The replay, displayed on a [TrustedForm.com](https://trustedform.com/?__hstc=41051389.d0951ab15763f1238c6994ab3b6b70d0.1748564176309.1748564176309.1748564176309.1&__hssc=41051389.1.1748564176309&__hsfp=3707738794)-hosted page, is composed of a re-rendering of the page's HTML with overlayed replays of the users mouse and keyboard action events.
- **Shared report**: A publicly accessible version of a report in a LeadConduit account.
- **Source**: When leads are sent from one partner, system, or application to another, the sending partner is the Source.
- **Account**: This manages the user permissions for all ActiveProspect products (except LeadConduit Classic).
- **Standard field**: A pre-defined field in LeadConduit for a particular piece of data. Available in all accounts across the LeadConduit platform.
- **Standard transaction**: The default transaction type for all LeadConduit integrations. A standard transaction occurs when a flow receives a lead via source integration, delivers a lead via recipient integration, or enhances a lead via an integration that uses standard transactional pricing.
- **Standard transactional pricing**: Refers to the method of determining cost based on the volume of standard transactions per month.
- **Step**: A discrete operation defined in order to perform an action in a flow. When a lead is processed by a step, an event is recorded for that lead.  A step can be one of two types:
  - Filter Step: Uses rules to determine whether the lead's passage through the flow is to be immediately terminated and if so, sends a specific response to the source.
  - Delivery (or Recipient) Step: Organizes, formats and sends selected lead data to a recipient web location, enhancement service or batch file, then parses and appends to the lead the response returned by the recipient.
- **Step criteria**: A rule set processed before an individual step. If the rules pass, the step is processed normally. Otherwise the step is skipped and the associate event outcome is marked ""skip"".
- **Step duration**: The amount of time in milliseconds it takes for LeadConduit to receive a response from a recipient or enhancement within a flow or for a filter to process.
- **Submission docs**: A source and flow-specific document that contains instructions and example for lead submission and / or pings.
- **Submissions from sources**: Leads submitted from a source.
- **Submissions to recipients**: Leads submitted from a recipient.
- **Submitted data**: The lead data that is submitted directly from a source in a flow.
- **SuppressionList**: List querying service. Product by ActiveProspect.
- **Transaction**: A billable event in LeadConduit that occurs when a lead is processed by an integration.
- **Transaction cost**: The cost associated with a transaction. Can be variable or fixed.
- **TrustedForm**: Lead certification service. Product by ActiveProspect.
- **TrustedForm Certificate**: A collection of information documenting a user's experience on a web form page as captured by TrustedForm.
- **TrustedForm for Facebook Lead Ads certificate**: A TrustedForm Certificate documenting a user's completion of a Facebook Lead Ad form.
- **Variable transaction cost**: Cost associated with a transaction wherein the cost of the transaction can change based on factors outside of the transaction itself (e.g. monthly volume, number of data points appended). Examples include TowerData transactions (based on data points appended), standard transactions (based on volume).
- **Vendor provided price**: A vendor-provided purchase price for a lead.

Type something"

