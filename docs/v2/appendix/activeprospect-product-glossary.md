---
URL: https://community.activeprospect.com/series/4051250/posts/4054502-activeprospect-product-glossary
Page Title: ActiveProspect Product Glossary
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-617a9598-a6e6-4913-a32f-9e08dcd0ee85.png
Scraped At: 2025-05-30 00:16:21.154
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
  - The outcome status of each step, as in ""success"", ""failure"", ""error"" or ""skip"
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

Type something
---
URL: https://community.activeprospect.com/posts/5039672-how-do-i-choose-the-right-plan-for-me
Page Title: How do I choose the right LeadsBridge plan for me?
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-45162993-a009-4d6a-b611-7c283925911f.png
Scraped At: 2025-05-30 00:16:21.214
---

[![](https://content2.bloomfire.com/avatars/users/1451136/thumb/thumbnail.png?f=1623686660&Expires=1748567773&Signature=daq2ZUs-ce5e53PgoRM71vcEVURBBOKpu5i8R4sU7SfonYkc539CuH1dh1Xi5vKbSTCdJ3~GZVE75YgmniH5wEZ8iwq5E84m~ZEBi8aPX80MgzTb0TM8hCH5M2kr6Q9ck~o5UvxH9thDIBFXdzho~xhpJIrsDEcnjvX67mNqPve1mLh3GirtxtuKaEJVVRdeyYdyj5TmKT3n9d3i8weffwmJ7ZbhpI8bZ3dqEQO1K-XTs4KanA2hzS86lPXkNUdXNd0lvjLzAxWPpNwxAXaw~BuBhUPZuU0VFlAhDUoVyMjiJNouyWXe3p5hOeHQhvz2wZw225Gm7IulgXc0m91D~Q__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/8017840-claudia-melis)

[_Claudia Melis_](https://community.activeprospect.com/memberships/8017840-claudia-melis)

Updated November 8, 2024. Published April 19, 2023.

Details

# How do I choose the right LeadsBridge plan for me?

LeadsBridge offers 4 pricing plans:

- The **Free plan**, is a self-service free forever plan.

- The **Starter plan**, is a basic self-service paid plan.

- The **Pro plan**, is a self-service paid plan.

- The **Business plan**, is a managed paid plan.


## Free plan

Our Free plan allows you to **connect all the top advertising platforms** – including Facebook, Instagram, Google, Youtube, LinkedIn, and TikTok – **and webforms with your favorite marketing tools**, to move leads across platforms in real-time, for free.

This plan **includes 1 running bridge**, it lets you sync up to **2 fields** (like Name and Email, for example),and allows you to **move 50 leads per month**. What does this mean? It means that inside your LeadsBridge platform you can potentially have more than one bridge, but you can only have one bridge up and running at a time.

And if you don’t have a CRM, don’t worry. With this plan, you can **send automated welcome emails to your prospects for free** without needing any sort of CRM system.

The Free plan is a **perfect fit for all marketers who are approaching the advertising world for the first time**. And if they need support, they can rely on our [community articles](https://community.activeprospect.com/).

## Starter Plan

If you need to be able to have more than 1 bridge running at the same time, the Starter plan is your best option, and a great solution if you have a small budget but still need to run multiple automations.

This plan’s starting point includes 3 bridges and 800 leads per month, and it lets you sync up to **6 fields** for $29 a month (billed annually). From there, you can fully customize your plan with as many bridges and as many leads as you need (for a maximum threshold of 2,000 leads/mo and 6 bridges). The monthly fee will be adjusted accordingly.

Starter users have the opportunity to receive a notification via email every time a lead interacts with their ad or web form.

The Email Receipt feature allows all paying LeadsBridge users to keep track and have a better understanding of their lead generation efforts. So, after completing the bridge creation, a little switch button will activate this feature and you will start receiving notification emails about each new lead coming in.

Everything that is included in the Free plan is also included in the Starter plan. Plus, you will have access to [Online-to-Offline Tracking](https://leadsbridge.com/conversions-sync/).

You have 14 days to try it for free - no credit card required \- and see if it works for you. And if you need help, you can rely on our Customer Support Team to assist you by email.

## Pro Plan

**If you’re a seasoned marketer** who needs to transfer loads of lead data by using complex bridges and formulas, **the Pro plan is what best fits your needs**.

It allows you to generate an **interconnected marketing ecosystem**, which will help you build a **stronger omnichannel strategy**.

The Pro plan starting point includes **15** **bridges and 2.000 leads per month,and it lets you sync up to 40 fields for $79 a month**(paid annually). From there, you can fully **customize your plan** with as many bridges and as many leads as you need and the monthly **fee will adjust accordingly**.

**Everything that is included in the Starter plan is also included in the Pro plan**. Plus, you will have **access to all complex** [**automotive CRMs**](https://leadsbridge.com/integrations/categories/automotive-software/ ""https://leadsbridge.com/integrations/categories/automotive-software/"") (such as ADF/XML, VinSolutions, DealerSocket, elead, and more), [**Gym & Fitness apps**](https://leadsbridge.com/integrations/categories/gym-fitness-management/ ""https://leadsbridge.com/integrations/categories/gym-fitness-management/"") (such as Mindbody), webhooks, devs tools, [**Custom Audiences**](https://leadsbridge.com/custom-audiences-sync/ ""https://leadsbridge.com/custom-audiences-sync/""), and [**Online-to-Offline Tracking**](https://leadsbridge.com/conversions-sync/ ""https://leadsbridge.com/conversions-sync/"").

Basically, the Pro plan allows you to **unleash the full potential of LeadsBridge**, empowering you to:

- Move leads across 380+ platforms;

- Target and re-engage your ideal potential customers;

- Track your offline conversions data.


You have **14 days to try it for free - no credit card required** \- and see if it works for you. And if you need help, you can rely on our Customer Support Team to assist you either by [email or screen-sharing call](https://leadsbridge.com/contact-us/ ""https://leadsbridge.com/contact-us/"").

## Business plan

If you can’t find the integration you need inside our integrations list, or you have to integrate with your own CRM, don’t worry. We are ready to develop an integration, specifically for you. With the Business plan, you can **rely on our team of developers to build a** [**custom integration**](https://leadsbridge.com/custom-integration/ ""https://leadsbridge.com/custom-integration/"") **that fits your business needs** and handle everything for you. This way, you won’t have to hire developers or devote your own developers’ time to building and monitoring the integration.

You can even add SALM single sign-on (SSO) to ensure secure access to your LeadsBridge account.

With the Business plan, you will have a **dedicated LeadsBridge Customer Success Manager**, who will support you and guide you in setting up and managing your account, allowing you to have **immediate contact with a Partner Solution Engineer**. We offer VIP and SLA support, and if your company requires a **vendor security assessment**, we can make that happen for you with a Business plan.

## How to define how many bridges you need while selecting/upgrading your plan?

Each one of our plans allows you to **create unlimited bridges**. The threshold indicated in each plan only defines **how many bridges can be live and running data at the same time**. Moreover, how many bridges you need is defined by your use case. For example:

- Lead Ads/web form to CRM: Each form is a bridge.

- Webinar (as source or destination): Each webinar is a bridge.

- Google Sheets (as source or destination): Each Google Sheet is a bridge.

- CRM/Email System (as source or destination): Each segment, entity, and list is a bridge.

- Mindbody: Each Site ID/location ID is a bridge.

- Calendar (e.g. Calendly): Each calendar is a bridge.

- Custom Audiences: Each Custom Audience is a bridge.

- Offline Conversion API: Each event is a bridge.

- Chatbot: Each chatbot is a bridge.


Let’s get into more detail with some **additional examples**.

### Example \#1

You use Salesforce as a CRM system and you generate leads from 3 different channels: you have 2 forms on Facebook Lead Ads, 2 forms on LinkedIn Lead Gen Forms, and 1 form on your website. In total, you have 5 forms, therefore you need 5 bridges.

### Example \#2

Your CRM system is HubSpot and you use Zoom Webinar. You have 3 different webinars scheduled on Zoom and you would like to connect each webinar to HubSpot. Each webinar needs its own bridge, so you need 3 bridges in total.

### Example \#3

You use Mindbody, you have 2 Site/Location IDs, and you have 6 forms on Facebook Lead Ads. You would like to split your forms into 2 groups and connect 3 forms to each one of your Mindbody Site/Location IDs. So, 3 forms to 1 Site/Location ID and 3 other forms to the second Site/Location ID. Considering that each form is a bridge, you need 6 bridges in total.

### Example \#4

You have a Salesforce list with 3000 contacts and would like to send these contacts to different Custom Audiences as follows: 500 contacts to one Custom Audience on Facebook, 500 contacts to another Custom Audience on Facebook, 1000 contacts to a Custom Audience on Google, 1000 contacts to a Custom Audience on LinkedIn. In this case, you need 4 bridges total, one for each Custom Audience (2 for Facebook, 1 for Google, and 1 for LinkedIn). This logic applies also to the CAPI use case.

Type something
---
URL: https://community.activeprospect.com/series/4051250/posts/4547947-introduction-to-leadconduit
Page Title: Introduction to LeadConduit
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-1c5339fa-e027-4491-b30c-54eba9b3160b.png
Scraped At: 2025-05-30 00:16:21.282
---

[previous page](https://community.activeprospect.com/series/4051250/posts/4886991-introduction-to-trustedform) 5 of 9 [next page](https://community.activeprospect.com/series/4051250/posts/5070196-what-is-leadsbridge)

In Series: [Getting Started with the Knowledge Base](https://community.activeprospect.com/series/4051250-getting-started-with-the-knowledge-base)

[![](https://content1.bloomfire.com/avatars/users/1317000/thumb/thumbnail.png?f=1617311121&Expires=1748567754&Signature=Yzv0NpfZyLplIIn9CiaF4khFNixGrcpyN53uDxTf0t6CL06vs-4feneAiVKWaGNTjp9ok9dhbSo2OXi2SN0eiE6iW7iGFXklXaTtKiz1Dowj4a33SQGXaDdEY-vURDtFLowCHSZ8G9C1HCRsw8GDGlFBS6UkDbbXn4l4T1PhbfRDrIbLMDAgKcuOAwba2h0CvtanFmpSa8x0jg4lYZ~J6l9lg1ohQw6VhKAW9fvCrxmEOcfC-0nB0E7n4MvffHwG4e8W6yDrsNjI5DNhIoTRS4u63jCjP8NwM5fWzzACNk3~WTBE0r9QzHPlirbO0zXyg7GMptwkb5kmJAB-2-cQfA__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7557680-scott-mckee)

[_Scott McKee_](https://community.activeprospect.com/memberships/7557680-scott-mckee)

Updated April 12, 2024. Published December 8, 2021.

Details

# Introduction to LeadConduit

LeadConduit 101: What does it do? Who needs it and why?

Collapse

00:00

07:53

Introduction to LeadConduit

![](https://content3.bloomfire.com/thumbnails/contents/002/895/923/_270x180.png?f=1632936371&Expires=1748567774&Signature=tB-UloDLJYXYdgbla4DJhK3XOzn2oczfXFrVaFyYUd~H7zQi6Y3p2HCV9fS~rJGt0DVi9qKupsVPtCyU-g-JtUgZBewG6HEYsISX0PGh60fFhWJBkEP9grTLi7FLz8LfAW-3VDTPfAfhJuWeyvr66sFA9nyDDWo8bIk9joxfDIDN1yHntRAauRHHGbTVOjZz6uZeiCqlefLBg2ooMXuL0j8AWK6Y8zKudGoLpLadtzjo3zBNM0-7UwN5vjOTSBntptZFJV8bD55JdCpncAJ57Df9XWb6guU7ZVrEklZxgo4AzEpgK2Z-4yLvm-650O8u1Cq0FSe3spU0LhN7eNFMmA__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

#### Introduction to LeadConduit

Type something
---
URL: https://community.activeprospect.com/posts/4109880-finding-and-using-submission-docs
Page Title: Finding and Using Submission Docs
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-5fdc921a-b7d3-4873-9a8c-87cf2d86acae.png
Scraped At: 2025-05-30 00:16:21.703
---

[![](https://content1.bloomfire.com/avatars/users/1317000/thumb/thumbnail.png?f=1617311121&Expires=1748567753&Signature=A94op~Gy3qAVemBlvXBjBmViM4Hvt-7JTH-Hg5z5LkCXVAnGkk6KyB0zamH5xF1WLDrgAq8sIrLiiZw6uW2MHBvNcYb7N9WZttRIxxFUIKQdyg5GPew1Upr-ESUFrx5H5VlCXTP9LUt2~rti6BRHtwxdvOGo2FBqBGx2Moms5pCZF99HsmVCm63eYDvr3lxxDorYDZUpeaxswcNR6gTv9fMJ0TMGxK57PPEraqtoGaTJqto8JyzXkd8zXyv4nC4NDnCcSZcp66Lr07K~OD20spFy~ySLHVG7QSL40SlPwrlP9~iqGIay2ZSIccD-NjsCF7cAxM4JItWtX11KK1rIPg__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7557680-scott-mckee)

[_Scott McKee_](https://community.activeprospect.com/memberships/7557680-scott-mckee)

Updated September 9, 2021. Published December 14, 2020.

Details

# Finding and Using Submission Docs

Now that your flow is built, either you or your Lead Vendors will need Submission Docs in order to get your lead data into LeadConduit.

LeadConduit account holders can access Source-specific Submission Docs by following these steps:

1. On the navigation menu, click the heading ""Flows"" to expand, click the sub-heading ""Flows"" to refresh the page, and click on your ""Flow"" title to go to that specific Flow.

![](https://content2.bloomfire.com/thumbnails/contents/002/863/083/original.png?f=1631214035&Expires=1748567773&Signature=jEY~xDl31z64sstTrCfugJ3GImACh7r0fxTVHKAr1zpe5~RsX-lTIxcgOHylhmMlzTppkfufaKjBACf7YVwOv9okQ57wgP5q28xlQY92R3QA1yawJsuK5NdRgwcfqr3XIkjsYpbmCHzT9YQh8BESwQDX7e8fF3cMDZuSr1VNUgjKmTNBcr9BPTCOcRZxl3BcHICvCBNVEuR7XronBdrsJpN89xvQluFUcJbYhqwDS4Qq4tMrzN3jZ~W9aItgEMa5FqpDkeS3xWAUW7nIlhWKkKXQ2rn8MixuSvw6a3W4uuB96l887-F5PhZSUhIdTFHaUuGInaHCUneGr2OKYnVJgw__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)
2. On the Flow page, go to the top right and click the ""Submission Docs"" dropdown menu to select the Source-specific Submission Docs for that Flow.

![](https://content0.bloomfire.com/thumbnails/contents/002/863/087/original.png?f=1631214222&Expires=1748567773&Signature=fA9jmJUl0G-xeDzwhoZpVOUQFBuSqZ7fzNyftWtGTF8diWIl3pdTZu0iUl6727E7WNfz1T5CUyBhAkubcfTahTVwVlVeiW2vlUP6Bzpn8hiiBcsOvKWsXMxGbYdy19K-TXpG4HE0WulpMKLkuZ035BYGP5tocGMz1SqLfXtpGN2LbDxYJ4DVS94V5gZ15JMuI5O6s1utguOV4TK3kH5llE8Erw2AFSyOwfIqu~SLSVHLFlNz6OKws8ZXjJVZFkpXOX5IvtIf5F7CMyCK2PG7aQXbdyBkid9jY9RGm2j7fOPZrM82jwWXtcWEv3IuS7qOxfYbvwYhCn2Fy9-KdYeh8Q__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

Once you select a Source, a new page will open with a unique hashed URL for this Flow + Source combination.

Here is a short video showing the process of accessing Submission Docs:

2021-09-09\_13-52-55 - TechSmith Screencast

[Skip to Content](https://app.screencast.com/pq2lmyopAKBvb/e#start-of-content)

Your browser cannot play this video.

An annotation is now visible

0:00 / 0:00

[Acknowledgements](https://www.techsmith.com/redirect.asp?target=SmartPlayerAcknowledgementLink&ver=1.0.0&lang=enu&os=na&product=smartplayer)

Player Settings

Closed Captions

Playback Speed2.01.751.51.25normal0.750.50.25

[Acknowledgements](https://www.techsmith.com/redirect.asp?target=SmartPlayerAcknowledgementLink&ver=1.0.0&lang=enu&os=na&product=smartplayer)

![The video is loading.](data:image/gif;base64,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)

If this is for an external lead vendor, you can safely share this Submission Docs URL with your lead vendor. No LeadConduit account credentials are required.

On the Submission Docs page, there are in-depth instructions on how to submit lead data to LeadConduit, including any requirements you configured in the Acceptance Criteria section of the flow, a sample lead request and response in various supported formats.

You can also Batch Import Leads (in CSV format) directly to LeadConduit from the Submission Docs page by clicking the ""Import Leads"" button at the top right of the page.

![](https://content3.bloomfire.com/thumbnails/contents/002/863/102/original.png?f=1631214617&Expires=1748567773&Signature=D0~hibaqRVZ2Deku9g0wIr39OOiSzm0CRm81AtDlDOiUnZl6dHf4BNbN9dgkVAtRIIjG1IGZu~LtIi62NBcAfPNzH~EnSRuCf1QUfozZCp3VNs1FuNw9knayh9tu-qW7mI90UiyIQxPH6Kv7lWi4sMzijOPCF-8JmsMtFskomAwpd8p8V4OjjjvHT~dzw1rOKgxpSL1Jfz~Kc0gvTzkDUQ3zXj4blg4VAlu0v79XrXvvnD5YDnmjKKOiBW7B30EfXnmPQm7k4Z3hI0RIvXt0MiEowfTPQregCM71TxIgau9RVPLj6c1tivX-5mqSj4ruaVLQ11oeBQadVzjjwp32ZA__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

The batch import process takes place in your browser. The browser processes the CSV and dispatches each lead request individually. Most browsers have a maximum of 6 concurrent http requests so, at most, 6 leads are being processed simultaneously. From there it depends on the overhead inherent in http itself plus whatever the actual processing time is for each lead.

Type something
---
URL: https://community.activeprospect.com/series/4114377/posts/4100506-retaining-trustedform-certificates-in-leadconduit
Page Title: Retaining TrustedForm Certificates in LeadConduit
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-6b20b47d-d74d-4bd9-a788-5c35beed6605.png
Scraped At: 2025-05-30 00:16:21.775
---

1 of 2 [next page](https://community.activeprospect.com/series/4114377/posts/4114383-how-to-retrieve-your-retained-trustedform-certificates)

In Series: [Retaining TrustedForm Certificates with LeadConduit](https://community.activeprospect.com/series/4114377-retaining-trustedform-certificates-with-leadconduit)

[![](https://content2.bloomfire.com/avatars/users/1316943/thumb/thumbnail.png?f=1612413648&Expires=1748567773&Signature=SJ9HupwoINzVYX0ZKinKAOLGJv6UJ~hDD4lh4jTTwIahs9E2zsssLq1vbovV0dxe44skeyQxe3HvLM4jvWH4JqFHuBH8UBa7deM6FpFMJ6U~OKR3wMs-wk54EhIvkmvv9Maq6R79qfmCfdIUAdjt3XlP8oxtvqrRSNVyzTaeCmNp8yUbyRmYnErjBrClKYwKLVRVTcJIs6cylkSMnc2Cp3PyBgH82u1f~AGJZP~JQx5k6LC2SdzSPjWG4~q4MqYwtdhliEis8syoxdMm77fz5SMzrEtJI17B3Tj~gFdY0wy8oRtIjqug~tgOFMwR4iDsAPX-L9w6n8VnnzUF9RQVSQ__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7557566-ashley-thomas)

[_Ashley Thomas_](https://community.activeprospect.com/memberships/7557566-ashley-thomas)

Updated June 20, 2023. Published December 3, 2020.

Details

# Retaining TrustedForm Certificates in LeadConduit

ActiveProspect account holders with TrustedForm and LeadConduit subscriptions can easily retain TrustedForm certificates by adding a TrustedForm Add-on step to their flow.

If the TrustedForm step is successful (or even if it's a failure based on Page Scan requirements), we'll store your certificate for the amount of time you've specified in your account (5 years is the default). If the TrustedForm step produces an error, the certificate may have passed the retention period, the certificate URL may be invalid or missing, or the retain process may have encountered an error.

# Before We Begin

This article assumes you're able to post the TrustedForm certificate URL to your LeadConduit flow correctly. If you need a refresher, please see the Submission Docs located on the Source tab.

# Steps

**Step 1**: On the ""Flow Steps"" page in the flow editor, go to **Add Step** and select **Add-on**.

![](https://content3.bloomfire.com/thumbnails/contents/003/763/247/original.png?f=1687312482&Expires=1748567773&Signature=kgNdhnDAqi~g0I2k5bbBcYedn79vsfFI-YkqVIF5MF3TneMGnpaF50dPWzCjS9CUo2xd92AHGrluk2eKCgWOXkfjyOVhAYpu2KwUBWhx8ZEu2QFGaocoP~RnndXd1nnFtK4JmqO7db8b9o1c1Fe6-L7kp-lnuCT~xXcVgB~L62OwZ50TScVIZx9ZCI-BXyuVc0yyYe8nov2O5oQjxhjJvjrB0~aEwVEpbla8uKYn9xX7EPUOuDSV0jH6hYw~p8Bro1MAsgyyeo2L5r72qCb7eWQZDN9nRvIkYSD~4KGhhKLBa3ACMC8WViJmESqOxasWWeOsZyWviM4FtClEqoZ4~Q__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

**Step 2**: Select the TrustedForm Add-on by clicking the **Add To Flow** button.

![](https://content2.bloomfire.com/thumbnails/contents/003/763/253/original.png?f=1687312799&Expires=1748567773&Signature=Tp7oPGFnlKSTjsSdgoSRazYzXAabkHAHqPMGR8ilK9XMdtkMAb7JLwEqfI~QTSx6nthn3LVrvU3PhSQ5hgEE9pVCfJ~R1fN6LC-UUcqYjApY04ZpEmKvX9EeXUY-GGm0K4LzQe6CA-P97d8zWmDNHkvgsdEE2IkVt4Ea9ZqonYIMSJvC3Yx0utBcFa9zCSODWmOT7RJbMwf30fUi9ytcNNaj3vAyr-~lduEso4f8N~NmU~KbEhHMJSaIsgNhZBlGrjMHtU9GTaW0~JpyYkI5xyKt~ElgajKPKUYdHIcn1-AYK1nbROHch7AzUqctPALph35pJk63AQGTWtF2iUskBQ__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

**Step 3:** Select Retain and click Finish.

![](https://content3.bloomfire.com/thumbnails/contents/003/763/255/original.png?f=1687313073&Expires=1748567773&Signature=EytXzxV~iZmUGMsc-hlLNVCLUB6YPGRweMDAljpPyRexLubFZotuDQj5PORdJMgB9o4MYi44z01tpPvJ7lZ0-8B7IKzrqQm3Mgq2AmL~jejMZ3Q05L7qqE2BfE4njg9NrpopcEdERXuywqU0bcgS8cxJB9yBGV7OsPE8sP4RkAxt-URpzLkHQ2Z8FEWmOKO~tXDuWdQyI7Ndbc-CWD4Tcde9f~mSB8InXeIC8zXznZZbUZ-nKQxesi1ON9CbxctI0WHZQTnEp5x~qd7rfEpLKnblAa~wenOSuOC14n0ssTh~SZMd4SZlc-QUdyirQGqYxKDs415F8nUDPubRl7yfSA__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

**Step 4**: Decide where the TrustedForm step should occur in your flow and move the step to that location. Typically you'd want to retain/claim the certificate on leads that have passed other validations, such as duplicate-checking and phone validation.

To simply retain a certificate for your account, the step is ready to go. No mappings are necessary. The TrustedForm step will automatically look for and use the TrustedForm Cert Url field to retain/claim the certificate.

**NOTE:** The configuration of an Optional Filter step depends on how you choose to use TrustedForm.

# Filtering Examples

When the TrustedForm outcome is not a success (errors, skips, failures), you could to add a filter after the TrustedForm step to stop the flow and return a **Failure** response for the lead. Otherwise, LeadConduit will respond with a **Success** outcome, even though the TrustedForm certificate was not retained.

![](https://content2.bloomfire.com/thumbnails/contents/003/763/256/original.png?f=1687313614&Expires=1748567773&Signature=cPPQGRwITETPv60cDxyB3zkyoY6Xrueg6wXloLARusBzEjDivxYBBPnoPaKU7pb5DU5RjKDANW8Ev7R0gNcOWVtzHL01oYSCXH3qBd11YflLZxV-kRAtMNrp-FEJOIR~QWB-y9i~WIhZHspUkA6Tm2zkTVQktjXam6Myo5oqDuSBYKVKLrPBcAmCnp9kiZqg3aOSlRSEFxOpVfZVwMYYhlBUMFoBa4yFUXdigDByVi2Em8dMXh6Ovpp62ZRA40xt2js3-noME1G8QqqgsnAyvebkGNJl7UjEe1IuItbS51lyIpyHrTov0sFldBHJwKl60expl4Niv-6h3DIkkm4cLw__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

Another popular filtering example is:

- Fail a lead only when the TrustedForm step returns a **Error**, allowing TrustedForm Failures (and Skips) to pass through the flow.

Type something
---
URL: https://community.activeprospect.com/posts/4649879-verify-domain-ownership?_gl=1*zqdwg8*_gcl_aw*R0NMLjE3NDU2MDAxMjguQ2owS0NRandoWVNfQmhEMkFSSXNBSlRNTVFiaXRYMkdhRFdWemNDYW0wOFJtNXpFNzRLbHpuVEtxMkxjWV9JN2VIRU5wcGZJZFo1dzFOb2FBb2VXRUFMd193Y0I.*_gcl_au*MTI0OTE0OTIxNS4xNzQ0NjM5NjA2LjY1MDQxMjc5OC4xNzQ1ODc5MTYxLjE3NDU4NzkxODE.*_ga*NTQ3NjI0NDQxLjE3MzQ2Mzk3NDQ.*_ga_QHXBV6N7D1*MTc0NTk4Nzc4Ny4xODEuMS4xNzQ1OTkzNjA2LjQ1LjAuNDE0MTA2MzQw
Page Title: Verify Domain Ownership
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-a603d328-a02b-4ac8-a715-eb50807dc812.png
Scraped At: 2025-05-30 00:16:22.115
---

[![](https://content2.bloomfire.com/avatars/users/1316948/thumb/thumbnail.png?f=1606147181&Expires=1748567773&Signature=N1XtN~uVAegVWQUQbdNNW7Ug8tyFooXE0EjJD~WiWPniL5EQJ1s6XzB-1ms0vHRDifcqTNei~WffVItjr2-2GhRXIbH~SEs1P8edAHTDGsYe03ia7dHdVWq8DU5eFdR62s06dlCFEtbQSvhzoT72Ath2vj4~rkz~mjKi5LoGYOIbnE7uAgtbodhmxF6Lzw7VRnrQHc5Q9zfky3Bka~QgAB95XcB37qUmEb1TwWPN2Z8o9w2UBedGGc5RwyyZc2i-FTYS9W2lha~0A8i8ISz3NDKcEe-cHcs9VBLalrP2xJocmcbZN2msgNoeeoy9bMtjX-jy8JLi-YwuPWZwBPWUtQ__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7557576-caitie-clarke)

[_Caitie Clarke_](https://community.activeprospect.com/memberships/7557576-caitie-clarke)

Updated May 14, 2025. Published March 29, 2022.

Details

# Verify Domain Ownership

Verify your domains in your ActiveProspect Account to start gaining domain specific insights.

### Why Verify?

As a site-owner generating TrustedForm certificates, we want to provide you insights into domain specific certificate volume and give you credit for TrustedForm certificates claimed from your domains. To do that, all you have to do is verify you are the domain owner.

Verifying ownership of domains and sub-domains where you have implemented the TrustedForm Script, lets us positively verify that you created a lead associated with the TrustedForm Certificate.

Once your domain is added, no other account can claim ownership of that domain.

### Verification Process

The process of verifying your domains is simple; we generate a unique code per domain that you add to your domain's dns record and we check for a match in the background.

### 1\. Add your domains to ActiveProspect Account

1. Navigate to the Domain section in [My Account](https://account.activeprospect.com/domains) (if you do not see a Domains, please talk to your admin, this is a permission setting)
2. Select Add Domains
3. List all domains you want to verify
1. If you are verifying subdomains, you can individually add and verify subdomains. Or you can just add the root domain and you'll have an option in step 2 to verify all subdomains.

### 2\. Get your verification code from ActiveProspect Account

1. Under Actions, select the Verify Ownership link for the domain you are ready to verify
2. Copy the unique code

![](https://content3.bloomfire.com/thumbnails/contents/004/944/170/original.png?f=1745956313&Expires=1748567773&Signature=azKb8lxzOYkes20OkFf3HrV5aRkyQkL9lAYbEXvU3b9A-yvRhShRmBoiHXJ~sDuU7MtyOM~R-nFeTcfnLJpCkm1Dtz9tvQaymLaETpiK2wzu-xpnurqOJZnoyV2pP5e0lZGtVIB82e9rm5MxdMF-c~~IGS639lj3Bn29eO775RVu269VbmfYbNK4z3HzuqGxHXS6qdtA~ttbhL8~1ISudakDXLJsKvDj2FHu0RKt1Wl8MOxSao3ggdUGDWEdG8LLXJLnpRkItGayah0LwrvDii51mVbAVFPD7uvxXyQ4ZLVV4LrejzD3oykK5CCUzpBtjJX1p54YEGdfHgWSxO2ivw__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

### 3\. Add a TXT record in your domain's DNS registrar

1. In a second browser window or tab, sign in to your domain's DNS registrar/host
2. Go to your domain’s DNS records. The page might be called something like DNS Management, Name Server Management, Control Panel, or Advanced Settings.
3. Select the option to add a new TXT record
1. If you're verifying an individual subdomain, you'll want to add the TXT record to the root domain in your DNS. If you're verifying multiple subdomains for one root domain, your root domain should have multiple TXT records.
4. In the TXT record, set the unique code as the value/answer/destination (the field names vary based on your registrar).

### 4\. (Optional) Verify all subdomains - NEW

If you're verifying a root domain, you'll see an option to also verify all subdomains (STEP 3). If this is selected and auto-retain is enabled for the root domain, auto-retain will also be enabled for **all** subdomains.

_**This will also be reflected under the 'Auto Retain Confirmed Domains' section in [TrustedForm Certify tab](https://app.trustedform.com/certificates/issue?__hstc=41051389.35fac6c93cef7b38a5359d0547f3275d.1748564175270.1748564175270.1748564175270.1&__hssc=41051389.1.1748564175270&__hsfp=3707738794), as follows:**_

![](https://content2.bloomfire.com/thumbnails/contents/004/944/754/original.png?f=1745989144&Expires=1748567773&Signature=nGUEWtGGnboQKlYnV2LeEpwXM9Af8T4p~obXoiQWLg~8hqiVmkAJD1qm0ifUIyDYuAYwJDtsO~lr20lAPOQyTrbCyuKG4ZdWTC4n3cWZjGwzF3ZXP6VDU-qB-yiUkDAm9gOr9KIB4XeA4rR6Veux5bBUzpjJX1N1OFGNIL~ThMKpEv5id1ERvMvbbwTg6fHlHGquFQTD5m-L0ZwRWCJ7P3caLc8MuO3H0BgO27icAxtHZCd2D5kvPd5FKYnSEOvQAU66jUEmFwbaH7q7fedhHXsB6ZnVJdlUzDSA8itoFxcBt3IpvsE-ZOJs-ezIpSg4lkVjAaFiNgG0oqKvtvwo5Q__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

**_Subdomain Ownership Statuses Explained:_**

- **Confirmed:** This status appears when the option to also verify all subdomains is checked for the given domain. Ownership of subdomains is confirmed.
- **Unconfirmed:** This status appears when ownership of subdomains has not been confirmed (the option to also verify all subdomains is not checked).
- **N/A:** This status appears when the domain itself is a subdomain. Subdomain ownership confirmation is not applicable here because the option to verify subdomains only applies to root domains.

### 5\. Tell ActiveProspect Account to check your verification code

1\. Navigate back to your ActiveProspect Account tab, and select Begin Verification. Once selected, we will star the process of verifying your domain.

2\. Refresh the page to check for updated ownership status

### Do you have a CNAME record on the domain you want to verify?

CNAME records are common for subdomains and TXT records can't be added to domains with CNAME records. If you're verifying a subdomain, add the TXT record to the root domain. If you're verifying multiple subdomains, your root domain can have multiple TXT records (one for each subdomain).

### Domain Statuses

Once you have initiated the verification process, we will continuously check and update the domain status until you remove the domain.

![](https://content1.bloomfire.com/thumbnails/contents/003/147/093/original.png?f=1648485804&Expires=1748567773&Signature=b4MpLhKFK9lD-Ookt5nODVj1D5a6kLBbFLmcudJ3L93D809mmqPYj0z81Nqz8JHSpjgqRECVZ-8hdQ1sUs3sGOSG~43KhQhVsFVBjXfxw1LkBZg2Tbd628s0i7vDahQia6ixuRbv-aEvpuBQh5MOGq1Xe0DhotRxo3ax7bXqn2Gc8LNQGvwud83RgLK5QVrGppmLBGz4nxXSZDlLFV7yUzdTAa5fuj62kJAz8wtRD5xC5lhMXHvU0lWtVnNj8WKj9zdvp6Lw1QG3s~tiCltAowzG24oTB4zlys0knbzq7SCkGnZaQXWIagGAMA6AVcRZoSmTs2Ho6H4iCWxyez1k4w__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

Ownership Status:  represents the current status of the domain. Refresh the page to see the most up-to-date ownership statuses.

Last Checked: timestamp of the last time we checked the verification status of the domain (every time we attempt a verification)

Last Verified:  timestamp of the last successful verification of the domain

### Ownership Status Reasons Explained

- **Verified**: You have proved ownership of the domain! We successfully matched the unique code with your domain's dns record
- **Unverified**: We have not proved ownership of the domain.
  - Ownership not yet verified: you have not started the verification process for this domain
  - Verification pending: you have initiated the verification process but we have not yet verified ownership
  - Code Not Found: you have begun the verification process but no code is found on the dns record.
  - Connection error: there has been a timeout. If an already verified domain receives a connection error, then we will retry verification 10 times using exponential backoff. After 10 connection errors, the domain will be marked as unverified.
  - Domain not found: Domain doesn't exist
  - Code not found: We successfully checked the domain, but there was not a TXT record with the correct code

### Troubleshooting Tips:

- We run a domain verification check in the background at different cadences once you have started the verification process for a specific domain
  - We check **unverified** domains every 5 minutes.
  - We check **verified** domains once a day at midnight (Central Standard Time)
- If the ""Last Checked"" and ""Last Verified"" timestamps are different, the verification has failed.  Meaning, we did not receive a successful verification when last checked.
- A domain is marked unverified if it hasn't been verified in three days.
  - The ownership status will stay verified for a 3 day grace period, if after 3 days of attempts to reverify the ownership status successfully, the verified status will change to unverified with a reason. This grace period is to provide time for you to make planned updates to your domain records and not have your ownership status impacted.
- The Ownership Status - \[reason\] will provide information for you to investigate possible causes of the change in verification status.
- Domains rarely become unverified, common reasons that ownership status changes from verified to unverified;
  - the code is deleted from the TXT record answer
  - loss of ownership of the domain
- If you delete the code in the TXT record answer, all you need to do is re-add the same code back in. No need to generate a new domain code in your ActiveProspect Account.
- Make sure to verify your sub-domains if you wish to auto claim from those domains.
- Only users with the permission, ""Manage user and domains for this account"" will be able to see and manage domains. If you need permissions, please contact your account admin or [support@activeprospect.com](mailto:support@activeprospect.com)





**FAQ**
1. **Can I use the \`verify all subdomains\` checkbox if I’ve already verified some subdomains individually?**
     - Yes. If you have already verified subdomains and then use the \`verify all subdomains\` checkbox on your root domain, it will be duplicative, but that's alright. You can choose to delete the individual subdomains and the related TXT records from your DNS, but it’s not required.
2. **Does the TXT record now only need to exist on the root domain?**
     - The TXT record used to confirm ownership, whether for the root domain or a subdomain, should be placed on the root domain in your DNS. But now, with the \`verify all subdomains\` checkbox, you only need to add your root domain, grab the single TXT record, and add it to the root domain’s DNS entry. This avoids having multiple TXT records on the root domain for different subdomains.
3. **Will the \`verify all subdomains\` checkbox include verification of sub-domains of a sub-domain?**
     - Yes, it should confirm ownership of all subdomains under the root domain. For example, if the root domain is example.com, then both blog.example.com and shop.blog.example.com would be covered.
4. If I’ve already verified my root domain, do I just need to check the box to \`verify all subdomains\`, or is there more to it?
     - That’s correct, you just need to enable the \`verify all subdomains\` checkbox and save. No additional steps are required.

Type something
---
URL: https://community.activeprospect.com/memberships/8005854-kami-berge
Page Title: Kami Berge
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-fc669b10-ab2d-4ede-bdb0-b6e25c7ff525.png
Scraped At: 2025-05-30 00:16:22.136
---

![avatar](https://content3.bloomfire.com/avatars/users/1444674/thumb/thumbnail.png?f=1722355335&Expires=1748567773&Signature=Fcsr9mcprxpr0tx8nST6owc4PYV1TRfH2BQftONJlCMZ9y5lRbuzcU1XrHdks7olIlQDi4EBHg4ojs6iCx1w--XJLfQWnYq7fow~0Z09yrpzicER6h3SjRp0FZ-pg6el9HBTjqI5Mt1KozkJHI5NRvZyw1q0TRc91VCEEwWFwNAbs0y2cK1J1eojvVjnaWawIWnqNW2RFkUPnHe~ZxgeazArlfaeEyWHzYQbH9jBQlO0a5iDK1W2HPUHhEmtdk1wDaI1a5~AnGZWzzRlt5l6NsNp0ye52CuYWMDu6q-opE-y7Ladvad5TanRSR0q3Jd9tnsE4T956oeJ70J2kR3c1Q__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

# Kami Berge

Learning Architect **·** ActiveProspect

0following0followers

AboutContributionsResponses

## About

Nothing to show

Schedule a time \| Chili Piper

Loading

![](https://bat.bing.com/action/0?ti=4018451&Ver=2&mid=a695a597-cf06-47cf-a99f-d6cc113becb1&bo=1&sid=4bd4a5b03ceb11f09f91e7d54219a6ed&vid=4bd4d0203ceb11f083aca95ae586f75a&vids=1&msclkid=N&pi=918639831&lg=en-US&sw=1280&sh=1024&sc=24&p=https%3A%2F%2Fcommunity.activeprospect.com%2Fmemberships%2F8005854-kami-berge&r=&lt=764&evt=pageLoad&sv=1&cdb=AQAQ&rn=897010)![](https://bat.bing.com/action/0?ti=4018451&Ver=2&mid=a695a597-cf06-47cf-a99f-d6cc113becb1&bo=2&sid=4bd4a5b03ceb11f09f91e7d54219a6ed&vid=4bd4d0203ceb11f083aca95ae586f75a&vids=0&msclkid=N&gtm_tag_source=ua&ec=Client%20ID&el=%2Fmemberships%2F8005854-kami-berge&gc=USD&tpp=1&en=Y&p=https%3A%2F%2Fcommunity.activeprospect.com%2Fmemberships%2F8005854-kami-berge&sw=1280&sh=1024&sc=24&evt=custom&cdb=AQAQ&rn=546244)
---
URL: https://community.activeprospect.com/series/4583478/posts/5034662-step-by-step-add-a-new-vendor-or-lead-source-to-your-flow
Page Title: Step by step, add a new vendor or lead source to your flow
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-3ada9b0f-c814-47eb-ab12-c1ad86a19feb.png
Scraped At: 2025-05-30 00:16:22.223
---

[previous page](https://community.activeprospect.com/series/4583478/posts/4583626-leadconduit-pro-tip-optimize-the-sequence-order-of-alternative-prices-volume-ca) 4 of 4

In Series: [LeadConduit Pro Tips](https://community.activeprospect.com/series/4583478-leadconduit-pro-tips)

[![](https://content2.bloomfire.com/avatars/users/1316943/thumb/thumbnail.png?f=1612413648&Expires=1748567733&Signature=KoCbdTtXkDCsuR9vQYZx-MAtDGCF3aiHVPhatiruSzeoEi~AXEyfoKu2DVYGAujS~riLrrgCd8AgHGzqSYUrtlVVkh~XMO9wqwc6BALq3ysjoCDPKJ39u1goQYlyiYgMEfsc~7DA4OxTrbXF210utcSETnRxpGdNS3TdLNKYfIzG-TqpHi8qFFf5nkNOoqwyefvtamB6bgzp923z1V3V9P2NHUhTKv7pqeXs4qaHLOJolNkIprUalpuaPWq35jE3nUl0flPAJef2KqCfhYAuZdnswIKx3FWjy2ETGzOdJBukA~FHvfQTXNUGDMYqqb19IAmZbfT1pUB9wFPKyIgkDQ__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7557566-ashley-thomas)

[_Ashley Thomas_](https://community.activeprospect.com/memberships/7557566-ashley-thomas)

Updated April 21, 2023. Published April 14, 2023.

Details

# Step by step, add a new vendor or lead source to your flow

How to add a source for a new lead supplier (e.g., a vendor, partner, or site) to an existing LeadConduit Flow

Periodically, you'll want to set up a new Source in your LeadConduit flow for a new partner, vendor, or web site to send in leads. Here are the steps in that process.

# Gather information

To set up a new source, you'll need to gather the following information:

1.  The name of the vendor, partner, web site or campaign you need to set up. Here we'll call this a ""Vendor"" or ""Source"" but it may be a partner, web site, campaign, or lead supplier.
2. Requirements you have for the data in the leads

# Examine existing sources

If other sources pre-exist in the flow,  assess how existing vendors appear on the Sources tab. You'll want to set up the sources (vendors) consistently in your flow in order to get the most out of your data. Specifically, if you have other sources already:

1. Click the Sources tab. Are there any acceptance criteria that are present and/or customized for each source?
2. Are there mappings that are present for most of the sources, and may need to be duplicated/customized in the new source?
3. Are there mappings that are specific to this particular source that need to be identified out of LeadConduit, such as a value used for particular campaigns or lead sources in your CRM?
4. Does the pricing column for other sources read ""Buyer Price""?

# Adding a Vendor - Details

Now set up the source for the new vendor:

## A. Edit the flow and add the new lead source

1. Click on the flow from the LeadConduit Home or Flows list and pick “Edit Flow.”
2. Click the Sources tab and click “Add Source” at top right
3. Search on the vendor name
4.  If there is a source name already available for this vendor, it will pop up and it's best to click it. Otherwise, enter a vendor name under ""create a new custom source"
5. Pick “LeadConduit Standard” if you are creating a new custom source, in the vast majority of cases
6. Select “Other” as the source classification so that if you want to, you can create a test lead in LeadConduit
7. Click ""Finish"

## B. Set up the acceptance criteria and mappings, if applicable

Set up any acceptance criteria and mappings that mights be needed/requested;  examine whether  other vendors have mappings if you're unsure

## C. Set up the pricing parameters

1. You may need to check whether the pricing of other sources shows ""buyer price"" or the customer has specified pricing that you need to track
2. If the vendor will send in the price of the lead in the ""price"" field, you need to enable ""Buyer Price"" for your new source, click the pricing link to the right of the source in the sources tab;  pick “Vendor.” Click “Save Pricing"
3. If the price is static, you can edit the pricing link, which is initially “$0.00”, and click ""Save Pricing"

## D. Check for (Rare) Source Specific Rules in Your Flow

(Rarely) If your flow is complex in logic, you may benefit from clicking on ""Steps"" and checking for delivery step criteria or filters that reference particular sources - a quick check may identify a rule where you need to include your new Source

## E. Save your changes

Save the flow at top right. Don't forget to save your changes; probably the most common error is forgetting to save your work!

## F. Send submission document

1. Send the new submission document URL out to the team, asking the new vendor to send in a test lead.
2. Click the flow name in the path at top left, in the navigation
3. Click the source name from the drop down list at top right to find the submission doc for the new source.
4. Copy the URL of the Submission Doc from your browser. Here's an example: https://app.leadconduit.com/flows/5e6faa784b842808342a4d25/sources/640a98819d091a08e2/docs
5. Then, send a note back similar to this one to the new lead vendor and the team:



Dear \[Lead Vendor\],

We’ve completed the integration needed for you to submit leads to our lead process. To ensure a smooth and successful collaboration, we would like to provide you with the necessary guidelines for submitting leads to our system via LeadConduit. You should submit the leads to the webhook provided in the Submission Docs, which can be found at: \[insert the submission docs url such as [https://app.leadconduit.com/flows/5e6faa784b842808342a4d25/sources/640a98819d099c468e2/docs\]](https://app.leadconduit.com/flows/5e6faa784b842808342a4d25/sources/640a98819d099c468e2/docs%5D)



Please ensure that all data is formatted correctly and that the required fields described in your Submission Docs are included. Examples are in the Submission Docs; just pick the format from the drop-down and you can see formats and fields included for different submission formats.



Please send over a test lead when you are ready; if you have any questions or concerns regarding lead submission or lead requirements, please do not hesitate to contact us.

# Field any questions that arise during testing

Check LeadConduit each day to see if there are test leads; if a test comes in for the new source and encounters an error, report back the error to the vendor, and request a retry correcting the leads until things are working correctly. Generally, when a lead is successful and you can see it in your CRM or other systems correctly delivered from LeadConduit, you can call the process complete.

# Other Resources

More detailed information about adding sources is available through the following community articles:

- [Adding a Source](https://community.activeprospect.com/posts/4098888-adding-a-source)
- [Adding an Account Source to your Flow](https://community.activeprospect.com/posts/4122047-adding-an-account-source-to-your-flow)
- Video: [Adding Sources to a Flow](https://community.activeprospect.com/posts/4541251-adding-sources-to-a-flow?video_markers=source%2C%2Csource%2Csources%2Csource.%2Csources.)

Type something
---
URL: https://community.activeprospect.com/posts/5075230-how-do-i-reauthorize-my-facebook-ad-account
Page Title: How do I reauthorize my Facebook Ad Account?
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-6e4150c6-8626-4dff-ac4a-bffaa5cd6771.png
Scraped At: 2025-05-30 00:16:22.344
---

[![](https://content2.bloomfire.com/avatars/users/1410227/thumb/thumbnail.png?f=1617390238&Expires=1748567774&Signature=qlMdkorUdxv4OHiccL-R7kUs9xk6apbur4KpwlK2D2zffSNK3gq6LvE2D9lsOv5JIkimmhZrFKVN4i4etgpKyGAuyPfIxmI7WF-1Nw1XbiVpcv86od-p~nsm61kYlh2W28dxGD2ANmrn7wHa9vpyT6j0fhzRsLZqBiE0CxhWS3C0igw7X-5O9OQIXgTmMvTYPack-hc7F-lNX69vlo3SyaDJYegHaYI4s3zdaAA6jSF3Sg9wI~CglU0baLa6JIVERKSN3-vxLA-m~matT1RhhI1qBw613xGda8e6XHr7Vifnfo8WLIwPtfY8T~hHTk-wVwVIYkxG0IvLu6T5IrFKpQ__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7866463-svitlana-zhyhulina)

[_Svitlana Zhyhulina_](https://community.activeprospect.com/memberships/7866463-svitlana-zhyhulina)

Updated February 27, 2025. Published June 1, 2023.

Details

# How do I reauthorize my Facebook Ad Account?

If you are connected to your LeadsBridge account via Facebook Ad Account, it could happen that your Facebook Ad Account has expired or some information has been changed on the Facebook side. In those cases, you should reauthorize your account in order to refresh your Facebook account connection with LeadsBridge.

In order to reauthorize your Facebook Ad Account while using different  bridge configurations, you should follow the steps below:

### Complex Bridge

1. Log in to the **Facebook account** you’ve connected with LeadsBridge
2. Then, log in to your **LeadsBridge account**
3. On the left column, go to **Facebook Suite** » **[Ad Accounts](https://leadsbridge.com/app/adAccounts)**
4. **Click** on the **name** of the Facebook account you want to re-authorize (it should be the same one you’ve logged on the first step)
5. **Click** on the **Reauthorize** button, as shown in the screenshot below:


![LeadsBridge reauthorize ad account button](https://d3pef22pb68mhq.cloudfront.net/wp-content/uploads/2018/08/17150049/5a6802ae366650556020e3b774c37226_Screenshot-2019-05-17T123A553A59.894Z.png)6\. A new Facebook page will open, follow the instructions and give all the required permissions

7\. Once done, you’ll be redirected back to LeadsBridge.

### Simple Bridge

1. Log in to the **Facebook account** you’ve connected with LeadsBridge
2. Then, log in to your **LeadsBridge account**
3. On the left column, go to **Facebook Suite** » [**Accounts**](https://leadsbridge.com/app/facebookAdAccounts)
4. **Click** on the **name** of the Facebook account you want to re-authorize (it should be the same one you’ve created the connection from the first time in the first step of the bridge)
5. **Click** on the **Reauthorize** button, as shown in the screenshot below:

![](https://content0.bloomfire.com/thumbnails/contents/004/828/928/original.png?f=1740660542&Expires=1748567774&Signature=uX~-u50GEgYaQfE8CDwaRJeyheWjn2dV54slfy7afg1XQs6~8h~JUVL0Bi3vs9vbu03gTf~zXdcoqZVrJpm2tmZvMwsr5EzRfR6o4j9e54T1W5KKS4nAm10aUGmo0TuQHTo2Y81DOZIDzlhwkpJKn8Luuny4rGVzZmGyNWcWoCJCyllZvn3sjgDO14Sadw820MsJht7mpWYQHYWIqdwbxfTHjxbaAw0cfMjRobjf2L-yH9scXM8apsaqsby0nY2P3ZCc081-BYcwuINJ13VBucA4IgnaLxbOpAo5sHQp7Xaz6qrI1koNnQOw02hvedhhxaiws~HUsO1TwbrO2DIS8Q__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

6\. A new Facebook page will open, follow the instructions and give all the required permissions

7\. Once done, you’ll be redirected back to LeadsBridge.

#### **What does ""Error validating access token: the user has changed the password"" mean?**

The following error shows up when the password for the account has been changed, as it stops LeadsBridge from accessing it. To fix this, you should **Reauthorize** the Ad Account from which you have changed the password.

Type something
---
URL: https://community.activeprospect.com/series/4881972/posts/4883927-trustedform-glossary
Page Title: TrustedForm Glossary
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-211b628d-c038-41e8-9462-172677d1981a.png
Scraped At: 2025-05-30 00:16:22.974
---

[previous page](https://community.activeprospect.com/series/4881972/posts/4112178-trustedform-api-overview) 3 of 3

In Series: [TrustedForm Overview](https://community.activeprospect.com/series/4881972-trustedform-overview)

[![](https://content2.bloomfire.com/avatars/users/1316943/thumb/thumbnail.png?f=1612413648&Expires=1748567774&Signature=tsFtG~3CS8rKexQYYCpX8QYxwgEhFZOSEkl7kW4wID3Q1yk03sG2DZ~3PZHuSIGqT93Y1dVJjTuj1IMPk0fWpzaZnFn4WdV0IjRj41mywbEuoJC8hxVJqqNpqqIpG3Ik~IUFcIT2f77mwzloqLDLpXVn7SGpchgN88VONmskliEzqR1FlfqMCZ8aOdB6yxQGt6Z0yy9MhZnMFpRMkOZII04lDV2ysYEB5pVQ-0ou4RxolvhglLUINZSGtI3IXeRwNcyXx1crhYBWQeKyoBsW-0yRGUBQlWOPJMLbjEzHz74JSxN6tAAh~0BAPMNm6sseItnmWdESFhEVG4jcHHpX-Q__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7557566-ashley-thomas)

[_Ashley Thomas_](https://community.activeprospect.com/memberships/7557566-ashley-thomas)

Updated November 15, 2023. Published December 6, 2022.

Details

# TrustedForm Glossary

TrustedForm terms and what they mean

|     |     |
| --- | --- |
| Claim or Retain \[a TrustedForm certificate\] | Claim, also called Retain, is the [action required to save a TrustedForm Certificate](https://developers.activeprospect.com/docs/trustedform/getting-started-with-claiming/) (for a default 5 years) in your ActiveProspect account for later use. This action is taken by API or LeadConduit on the full certificate URL of 69 characters in the format https://cert.trustedform.com/<cert\_token>. |
| Extend \[a TrustedForm certificate\] | Managed customers can extend the Claim Window for a certificate to be claimed to 90 days [by API,](https://developers.activeprospect.com/docs/trustedform/api/v3.0/tag/TrustedForm-Certificate-Check-in/) or it may be done automatically [by Auto Extend.](https://community.activeprospect.com/posts/4488105-extended-retention-window-for-submitted-leads) The Extend API is available by special permission arranged by your AP team for managed customers. |
| Claim/Delete Window | A TrustedForm certificate can be claimed/retained for [a limited window of time after certificate creation](https://community.activeprospect.com/posts/4488105-extended-retention-window-for-submitted-leads). This amount of time is displayed when a claimable TrustedForm Certificate URL is viewed in a web browser. For example, a certificate that can be claimed for the next 12 weeks might display ""Unless claimed, this certificate will be deleted in: 12 weeks."" |
| Auto Extend | When a TrustedForm certificate is created, [if a submit event can be identified, the Claim/Delete window is automatically extended](https://community.activeprospect.com/posts/4488105-extended-retention-window-for-submitted-leads) to 90 days. |
| Auto Retain | [Register your web site so that](https://community.activeprospect.com/posts/4812756-trustedform-auto-retain-for-first-party-lead-certification) TrustedForm automatically claims/retains the TrustedForm Certificate to your ActiveProspect account. |
| TrustedForm Certify Web SDK | [The javascript snippet is embedded on a web site in order to generate the TrustedForm certificate](https://community.activeprospect.com/series/4190127-implementing-the-trustedform-script-in-a-form-page), which can be configured to your specifications in the _Certify screen_ of any TrustedForm account. |
| TrustedForm Consent | The Consent subscription allows you to verify consent language, check email and phone fingerprints against your lead, and retain/claim the certificate for future use. |
| TrustedForm Insights (Metadata) | The [TrustedForm Insights](https://community.activeprospect.com/posts/4709758-trustedform-insights) subscription provides [metadata characterizing the consumer session captured in the TrustedForm certificate](https://community.activeprospect.com/posts/4709758-trustedform-insights), for use in validation decisions. |
| Fingerprints | When making a claim (i.e., retaining) a certificate,  the email and phone numbers included with a [lead will be hashed (encrypted) as ""fingerprints"" and checked against the email and phone recorded by TrustedForm during the consumer web session.](https://community.activeprospect.com/posts/4077176-lead-fingerprinting) |
| Page Scan | When making a claim (i.e., retaining) a certificate, [you can specify text that must be included](https://community.activeprospect.com/posts/4078890-page-scan), or must not be included, in the consumer session. |
| Event Log | On a tab of the TrustedForm Certificate, the Event Log [documents the consumer keystrokes, scrolling, and button presses](https://community.activeprospect.com/posts/4776894-trustedform-session-replay-enhancements). |
| Session Replay | On a tab of the TrustedForm Certificate, the Session Replay allows you to view the customer interaction with the web site.  The Session Replay is a visual reconstruction of the consumer session built from web site images, keystrokes, mouse movements, and scrolling events. |

For a complete introduction to TrustedForm, please see our [developer pages](https://developers.activeprospect.com/docs/trustedform/guidepost/).

Type something
---
URL: https://community.activeprospect.com/memberships/7866421-lavinia-bonamassa
Page Title: Lavinia Bonamassa
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-d44d00a8-e058-4120-b832-f5ec32d27b85.png
Scraped At: 2025-05-30 00:16:23.140
---

![avatar](https://content2.bloomfire.com/avatars/users/1410206/thumb/thumbnail.png?f=1712152099&Expires=1748567774&Signature=XM3kc8iWC0jCxkJIx23eyBkWyb6L2H4PbYm3kRqOqpqwN-p9SSufg80HO9ze8BemW5lewldPqLtzLEZdDG~FoB2ONAizURxbo0fS6qHKiUgede9K8c4mrhQfSMv7QZ81OhC3gqyz1hoce0uNmZkAGyyoa4ecXRvHCDv7NAK7BrPOT9IQV9MwCCxvvf78Bt6PQ~j-gDRqNqKL545Xmk0gveGJlGLp9BswWN~un80zn1FG2TKTkLQMyUm0zGRmAa9JySZ6aHj3VOEbeby3GosCeRy1v7ZRz3D0yjCTQCGg2KQ6CF97cmKcRLIusriZt2FdPjUu-ygZ96NdF1slfSXSLQ__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

# Lavinia Bonamassa

Customer Service Quality Specialist **·** ActiveProspect

0following0followers

AboutContributionsResponses

## About

Nothing to show

Schedule a time \| Chili Piper

Loading

![](https://bat.bing.com/action/0?ti=4018451&Ver=2&mid=d2bcb696-b211-48fa-b19a-4af90dad28e8&bo=1&sid=4c1fa6d03ceb11f0a6204bf3e5c080b0&vid=4c1f85a03ceb11f0b0a57b3265c25319&vids=1&msclkid=N&pi=918639831&lg=en-US&sw=1280&sh=1024&sc=24&p=https%3A%2F%2Fcommunity.activeprospect.com%2Fmemberships%2F7866421-lavinia-bonamassa&r=&lt=787&evt=pageLoad&sv=1&cdb=AQAQ&rn=20671)![](https://bat.bing.com/action/0?ti=4018451&Ver=2&mid=d2bcb696-b211-48fa-b19a-4af90dad28e8&bo=2&sid=4c1fa6d03ceb11f0a6204bf3e5c080b0&vid=4c1f85a03ceb11f0b0a57b3265c25319&vids=0&msclkid=N&gtm_tag_source=ua&ec=Client%20ID&el=%2Fmemberships%2F7866421-lavinia-bonamassa&gc=USD&tpp=1&en=Y&p=https%3A%2F%2Fcommunity.activeprospect.com%2Fmemberships%2F7866421-lavinia-bonamassa&sw=1280&sh=1024&sc=24&evt=custom&cdb=AQAQ&rn=335387)
---
URL: https://community.activeprospect.com/series/4583478/posts/4583488-leadconduit-pro-tip-use-a-template-to-save-time-configuring-recipient-mappings
Page Title: LeadConduit Pro Tip: Use a Template to Save Time Configuring  Recipient Mappings.
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-1707b9fb-111e-42a7-ba95-0e2c41fd8994.png
Scraped At: 2025-05-30 00:16:23.254
---

1 of 4 [next page](https://community.activeprospect.com/series/4583478/posts/4583514-leadconduit-pro-tip-an-easier-way-to-work-with-lists-of-values-in-rules)

In Series: [LeadConduit Pro Tips](https://community.activeprospect.com/series/4583478-leadconduit-pro-tips)

[![](https://content1.bloomfire.com/avatars/users/1317000/thumb/thumbnail.png?f=1617311121&Expires=1748567752&Signature=X9fj59kSmWD-4zTnYmepc5gKRqn2PVncexDVa9LApbv-iop7C63UHcLx-fmxxAoLfRrlGiNk-rg7X~UUep8r-a8vX6Tk1P1Bra5LYbgpGLC9HWJBpqE5XIPK4BasUHX4ECchDubxZawERW9evx5dHSjZn1wkV9E9~XY8T4kDPRHDwRQn~DCD7Juh~~yOnadsDl-CUOcQZiZBOlTYMLytIDjBPLpNmADr0avpxQbIwEmHzOpMn~QvpKFhZkCn29EcInQ9YaKnmkoXBT-FopoN74PSKZuhnhN8-uhwLbtvlUlJv~uQYG8ise8NP2nQS~BfpVJiWF1xeERmGTQWG1GzSg__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7557680-scott-mckee)

[_Scott McKee_](https://community.activeprospect.com/memberships/7557680-scott-mckee)

Updated January 19, 2022. Published January 19, 2022.

Details

# LeadConduit Pro Tip: Use a Template to Save Time Configuring Recipient Mappings.

Save time by using a template to configure recipient mappings. Instead of creating mappings one at a time, create a template, selecting the right-hand value type (for example “Json Property” or “Form Field”) just once, then replicate the empty mapping as many times as needed by clicking the “copy this mapping” icon.

Collapse

00:00

00:21

![](https://content3.bloomfire.com/thumbnails/contents/003/050/553/_270x180.png?f=1642613793&Expires=1748567775&Signature=GWF4KONvv~oE55UoVCtU97h8V7zttfJ~Nj3d4BgHCWoiAXtEHIXVEY-i8Sce-Umw6bmoRgBUN33-8pZlQjM-mR-zhrq5qOFbgjTEa8rPAzky6fFzGTxoYBqNPPeJw6Hs3jH796e8oA2KgI8ih8P7cDzmOBxK8YjDYPDrQOKGCUuiaAbLKcUcolVLfFNdq8g~iCFUi9EO7tCJt5ZpB4mfpS9eUT3MOfCPPsBFO9dHnIPKQmb4mXnhQ~UhjJYmHDYYRoCow~hiOnwA51cwsgRqqcMsSVatHU~RQ8mhgNjSHJHclHTHq8LDUYiCs02PBKIaE59MpFVd0Hode0CSWjAIVA__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

#### Using\_LC\_Mapping\_Templates.mp4

Type something
---
URL: https://community.activeprospect.com/series/4881972/posts/4112178-trustedform-api-overview
Page Title: TrustedForm API Overview
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-dbcb44af-db78-411f-a9e8-a4a6f67bdc8a.png
Scraped At: 2025-05-30 00:16:23.278
---

2 of 3 [next page](https://community.activeprospect.com/series/4881972/posts/4883927-trustedform-glossary)

In Series: [TrustedForm Overview](https://community.activeprospect.com/series/4881972-trustedform-overview)

[![](https://content3.bloomfire.com/avatars/users/1444674/thumb/thumbnail.png?f=1722355335&Expires=1748567775&Signature=SL4BDL5Qj6q4xRxnrmLW15bthyPUxWJB9bW1BtiJzoyQ6XFNHmeKWUF869dEsgjYpKO1vEm9LoSn8xZOKgYW2BJHZgmcruDtc9nl9hV85dolfXCT2XnspuURrRvle9xrJFWOOS1ATL9jAnw8GHgH9IADAXAclKpo2kWu6~GF2tHBVK3zQjkH9ftCsqYypR1wJAe2P7vLosDW~eqBT7YCDiHEyOfYevb27JoJ~op4yIx6Zu290yl-dYZj4jLsCO4k4FAgl~WE4DHM0C3npn94~zr0oVLfxTcZSjeUeRfbUMILgWDCrX-hMN97Zygaz~6ROxyO~6Vnm7H2EjH2cmtWSg__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/8005854-kami-berge)

[_Kami Berge_](https://community.activeprospect.com/memberships/8005854-kami-berge)

Updated October 10, 2023. Published December 16, 2020.

Details

# TrustedForm API Overview

```
The TrustedForm Certificate API is available to TrustedForm account holders based on the products they have purchased and been given access to. Generating certificates DOES NOT require use of the Certificate API. Instead publishers who desire to create certified leads must use one of the SDKs available as part of the TrustedForm Certify product.

Every account with access to TrustedForm products is assigned to one of three TrustedForm API versions (two of them are being deprecated). You can find your TrustedForm API version at by viewing your settings page.

TrustedForm Certificate API documentation can be found at the following links:
4.0
3.0 - deprecated
2.0 - deprecated
```

Type something
---
URL: https://community.activeprospect.com/series/4583478/posts/4583626-leadconduit-pro-tip-optimize-the-sequence-order-of-alternative-prices-volume-ca
Page Title: LeadConduit Pro Tip: Optimize the Sequence Order of Alternative Prices, Volume Caps, and Mappings
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-395d7191-88ef-4037-9f77-df956dd74938.png
Scraped At: 2025-05-30 00:16:23.283
---

[previous page](https://community.activeprospect.com/series/4583478/posts/4583514-leadconduit-pro-tip-an-easier-way-to-work-with-lists-of-values-in-rules) 3 of 4 [next page](https://community.activeprospect.com/series/4583478/posts/5034662-step-by-step-add-a-new-vendor-or-lead-source-to-your-flow)

In Series: [LeadConduit Pro Tips](https://community.activeprospect.com/series/4583478-leadconduit-pro-tips)

[![](https://content1.bloomfire.com/avatars/users/1317000/thumb/thumbnail.png?f=1617311121&Expires=1748567752&Signature=X9fj59kSmWD-4zTnYmepc5gKRqn2PVncexDVa9LApbv-iop7C63UHcLx-fmxxAoLfRrlGiNk-rg7X~UUep8r-a8vX6Tk1P1Bra5LYbgpGLC9HWJBpqE5XIPK4BasUHX4ECchDubxZawERW9evx5dHSjZn1wkV9E9~XY8T4kDPRHDwRQn~DCD7Juh~~yOnadsDl-CUOcQZiZBOlTYMLytIDjBPLpNmADr0avpxQbIwEmHzOpMn~QvpKFhZkCn29EcInQ9YaKnmkoXBT-FopoN74PSKZuhnhN8-uhwLbtvlUlJv~uQYG8ise8NP2nQS~BfpVJiWF1xeERmGTQWG1GzSg__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7557680-scott-mckee)

[_Scott McKee_](https://community.activeprospect.com/memberships/7557680-scott-mckee)

Updated January 19, 2022. Published January 19, 2022.

Details

# LeadConduit Pro Tip: Optimize the Sequence Order of Alternative Prices, Volume Caps, and Mappings

Sequence order matters when you're creating rules that choose between between multiple prices, volume caps, or mappings. You'll save setup time and your flow will be easier to understand if you put the options with the least-restrictive rules at the top and work down to those with the most restrictive rules at the bottom.

Here’s an example using Source price. We put the default price, with no rules, at the top. Next is a price rule that applies to leads from certain states, and below that is the price for leads received over the weekend.

![](https://content2.bloomfire.com/thumbnails/contents/003/050/679/original.png?f=1642617235&Expires=1748567774&Signature=WR-qTnd93-JuaCCKy-~AxsJ9QHliNrExw~7~g5vAW0HJNZ26-9gM12inWUcrsMynJ4XxIGhIYW6wIltELZdMTw8~GuDFsA1ZEW6wsO4omnVfGDFoDEZHhgC5j-tiFJTW3cxicmGasv2bd-w2H0548mc2xD8Smjxw03hiWI6iC2-RZHfbaPn2aKjhb-ZuxQSZL6pFchBctjXpwfUjRYkTxIq7Qpd3XdmB1Hi1Igqti39dRZHF~obl9TViMQ1aJEY4Vz4QXhzQAh1HAhx7zZZ6LRXZ-Ukx80N0RvPgHbgFJ34mRjFAIl-R3B1Q3YIgyFZdwZXX2YRzFPM66es~EJieMQ__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

Here’s how it might look if we hadn’t paid attention to the sequence. Note that this requires more rules, which wastes time and is confusing to read.

![](https://content3.bloomfire.com/thumbnails/contents/003/050/682/original.png?f=1642617587&Expires=1748567774&Signature=ijvlJFw7iIF3mzCzekqiStN3JSDcExI4ATDU77HyLjILL3Oki97UlnK7Jt4TQoGQOHqqKsSGUzTV9HboHf2yY9aFYzyLjpTnbuBRIYY7HwLwKqUNiecvmWVxnUMAmgHJBgZ6lnjKidFlfvFrIpDK9EVqnSfhyRRA-nFZ2uEVsPwOTrNslYFmpMiXvX1dEEE~LwAbhNlHcn3FY4JgC7u1vTBSz-wWZglf-0WfEW1lmaz1VwPHulvRW6k0MvrsIg4n7rV2D0OkwEdNSnnoGOHaMHboVkOi74IywhhMH9w1T~XRp5rW4HadoUFYDf1vBW2ga7qiRwP5AtTaV-1XMTZKSg__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

Type something
---
URL: https://community.activeprospect.com/series/4051250/posts/5070198-leadsbridge-glossary
Page Title: LeadsBridge Glossary
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-132973cb-9c49-4ea5-89fa-e72319b0a7d6.png
