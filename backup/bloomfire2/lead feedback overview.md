---
URL: https://community.activeprospect.com/series/4180128/posts/4096342-lead-feedback-overview
Page Title: Lead Feedback Overview
Screenshot URL: images/screenshots/screenshot.png
Scraped At: 2025-06-02 19:44:03.707
---
mZFVZO0gIfMxmQPF~9GpzVZX4aT-PMsbrisg1n8gGHqztEq-JDGI81UumgvrYaVi3-tslI~CbW2Y7Sg8eotOZMc2-ZOrazip7tAPuzIbbl17JTaLXJ4CfnBOrD9SGB5J3Kw7CisldoijCq8BSAQ__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7557680-scott-mckee)

[_Scott McKee_](https://community.activeprospect.com/memberships/7557680-scott-mckee)

Updated March 26, 2021. Published November 30, 2020.

Details

# Lead Feedback Overview

Reporting lead returns and conversions

# What is feedback?

Feedback is the LeadConduit feature by which lead Recipients can notify LeadConduit and Sources that delivered leads have converted or are being returned . In turn, Feedback can optionally send notifications back the lead's Source.

Feedback is submitted to LeadConduit by a lead recipient, recorded for display in LeadConduit reports, and optionally, a notification of the received feedback can be sent to the Source that submitted the lead. Feedback doesn't change the original success/failure status of a lead, but is a separate event linked to the lead, its Source, and the specific flow delivery step that sent the lead to the recipient.

If a flow has more than one delivery step, each of those recipients can separately send feedback about the lead's conversion or return. There is no limit to the number of feedback reports a lead can receive

# Prerequisites for Lead Feedback

Every time a Delivery step in a flow executes, it generates a unique **Event ID**. This Event ID (not the Lead ID) is required will be required when/if the recipient posts Feedback back to LeadConduit, so the recipient must collect the Event ID to their System of Record (e.g. Salesforce, Marketo, HubSpot, Close.io) and store it with the rest of the lead data.

For example, if your flow is delivering a lead to Salesforce, you should be including the Salesforce delivery step's Event ID and storing it as a custom field in your SalesForce lead record.

# How Feedback Works

When a lead in your system of record is **Converted** to an Opportunity or closed out as **Unqualified**, you or the recipient should  make a behind the scenes Feedback POST submission (web hook) to `https://app.leadconduit.com/feedback?event_id={{event_id}}`.

including the following basic information:

1. The LeadConduit Event ID (Required. See above.)
2. The type of feedback (Required. Either ""conversion"" or ""return"")
3. An comment/reason (Optional. any additional information you want attached to the feedback and/or sent back to the Source.)

If you do this only this much, LeadConduit's reporting feature can generate an interactive report of lead performance.

You can optionally further configure LeadConduit to send a notification of that feedback back to the lead's Source either in real time as an HTTP POST or GET, or periodically in a batch file by FTP or attached to an email.

**Example:**

Let's say your phone a lead and find out they are not eligible for your product. You mark the lead as Unqualified in your CRM. Your CRM then sends a POST to the LeadConduit's URL above, sending the **Event ID** that was delivered to your CRM with the original lead, the value **return** for _type_ and **Ineligible** as the _reason_.

LeadConduit first records the Feedback Type along with the Flow, recipient, and Source of the lead. Then LeadConduit takes this information and checks if Source Feedback is configured for the associated Lead Vendor. Depending on that configuration, LeadConduit delivers the feedback information to the Source.

# Supported Feedback Types

LeadConduit currently supports two types:

- **Return** feedback should be used when a lead is non-contactable, didn't sign up, or is otherwise not a prospective customer. You are returning the lead to the source for refund.
- **Conversion** feedback should be used when the lead was converted to a customer.

Other feedback types may be added in the future.

If you configure LeadConduit to send this feedback to the Lead Vendor, they may or may not allow every feedback type. For example, if you try to submit a feedback type that is disallowed by their system, you will receive an error response.

# Feedback Reasons

The reason provides detail for the feedback. If your Lead Vendor has not established a list of acceptable reasons, the reason can be a string of any length. Keep in mind that LeadConduit provides your Lead Vendor with reports based on return reason. For this reason, you should keep your reasons short and consistent. In other words, every time you're returning a lead because it was a wrong number, use the same short reason **Wrong Number**.

You should not need to include the phone number as a part of the reason. If your Lead Vendor uses LeadConduit too, the feedback is associated with the Original lead data.

Your Lead Vendor may have rules about which reasons are allowed. If you submit a return with a reason that is not allowed, your feedback will not be accepted.

# Feedback Responses

When a recipient sends feedback about a lead, they will receive a response from LeadConduit that indicates **success**, **failure**, or **error**.

- **Success** indicates the feedback was accepted.
- **Failure** indicates the feedback has been rejected. (a reason should be provided)
- **Error** indicates something unexpected happened while processing the feedback (the reason provides additional detail). Errors are a rare occurrence.

# Lead Feedback Counts as a LeadConduit Transaction

On your monthly invoice, Lead Feedback is broken out by Event Type.

- **Feedback Received** events are the feedback posts to LeadConduit by a lead recipient.
- **Feedback Sent** events are the LeadConduit posts back to the Source.

Type something"
