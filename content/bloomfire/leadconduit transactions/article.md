---
URL: https://community.activeprospect.com/posts/4583804-leadconduit-transactions
Page Title: LeadConduit Transactions
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-1a31a4eb-b4fe-438d-b77f-0085432a151c.png
Scraped At: 2025-06-02 22:29:25.440
---


[_Scott McKee_](https://community.activeprospect.com/memberships/7557680-scott-mckee)

Updated July 25, 2024. Published January 19, 2022.

Details

# LeadConduit Transactions

Which LeadConduit events are billable transactions?

**What’s a Transaction?**

LeadConduit tracks account activity using units called transactions. Transactions are specific types of LeadConduit events that are charged to your account’s available balance or to your account’s volume allotment for the current contract period.

See also [Transactional Billing](https://community.activeprospect.com/posts/4076597).

**What’s a LeadConduit event?**

An event is a discrete action or step in a LeadConduit flow.

These are the types of LeadConduit Events. Not all of these are charged to your account.

1. **Source events**: Receiving a lead from a Source and evaluating it against the flow’s acceptance criteria, volume caps, and Source-level lead pricing.
2. **Add-ons** : Flow steps that interact with end points or services external to LeadConduit for the purpose of receiving additional knowledge about the lead. LeadConduit maintains a library of add-on steps.
3. **Filter steps**: Flow steps that use rules to stop the movement of a lead through  the flow.
4. **Integrations**: Flow steps that send data to end points or services external to LeadConduit, but which are not in LeadConduit’s Add-on library. Delivery steps may send lead data to CRMs, call center, or data warehouses, or they may also interact with enhancement-type services that are not in LeadConduit’s Add-on library.
5. **Feedback Received events**: Discreet feedback reports on a lead that are submitted or imported to LeadConduit by a recipient.
6. **Feedback Sent events**: Notifications that are sent to a Source informing them of the Feedback that one of their leads has received.
7. **Ping Events**: Real-Time Bidding “ping” submissions from a source. These events are related to LeadConduit’s Real-Time Bidding feature.

**Which events are charged to my account as a transaction?**

1. **Source events**: A single source (or inbound) transaction includes receiving the lead, evaluating acceptance criteria rules, volume caps, and Source lead pricing to the extent that they don’t invoke external services like TrustedForm data or SuppressionList queries (i.e. [Enhanced Real-Time Bidding](https://internal.activeprospect.com/posts/4312150-enhanced-real-time-bidding-with-trustedform-data-services)).
2. **Add-ons**. These include:
1. Add-ons are charged based on the prices shown at [https://activeprospect.com/integrations/?type=enhancement](https://activeprospect.com/integrations/?type=enhancement). Some services are billable as long as the outcome isn't an error, and some services are billable only when a result is returned.
2. Some Add-ons offer user-selectable data points that charge per data point appended. For example, Telesign services charge per data point returned and is priced at $0.10 per billable data point. If the user selects data points 1, 2. 4, to be returned if available and a lead is processed through a flow and returns a Telesign value for data point 1 and 4, at $0.10 per data point this single lead would account for a $0.20 to be billed for this Telesign event. Refer to the [Add-ons catalog](https://activeprospect.com/integrations/?type=enhancement) for details.
3. Note that among SuppressionList integrations only the “SuppressionList Query List” and “SuppressionList Is Unique” integrations are chargeable. “SuppressionList Add to List” and “SuppressionList Delete from List” integrations are free. Some Add-on events are not charged as a transaction if they fail to return any appendable data. For instance, there is no charge for a TrustedForm Claim step if the certificate is invalid or expired.
3. **Integration steps**: A single transaction includes sending the lead to an external system.
4. **Feedback Received events**: A single transaction includes receiving the feedback.
5. **Feedback sent events**: A single transaction includes sending the lead, except if an HTTP 5xx error response is returned.
6. **Ping events**: Ping events are typically invoiced as a separate line item from other flow events.

**Special Considerations**

LeadConduit only charges you for the services your leads consume.

Typically, not all of the steps configured in a flow are executed for every lead. Filters may stop a lead before some steps are reached. Some steps may be skipped due to step criteria rules. _Therefore you can expect your costs to vary from lead to lead and over time._

In general, high-quality leads will incur higher costs because more Add-on and recipient events will take place. Low-quality leads will be filtered out early, before many Add-on or deliveries take place.

Type something
