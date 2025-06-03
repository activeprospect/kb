---
URL: https://community.activeprospect.com/series/4190127/posts/5066541-what-can-i-do-if-my-trustedform-certificate-does-not-capture-a-submit-event-and
Page Title: What can I do if my TrustedForm Certificate does not capture a Submit event and my certificates are not extended?
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-c4ad8dad-e687-45b3-9b34-02f241d33bf2.png
Scraped At: 2025-05-30 00:16:42.442
tags:
  - trustedform
  - intermediate
  - compliance
  - seller-focused
  - analytics
  - technical
  - universal
secondary_tags:
  - developer-focused
  - advanced
  - how-to
  - semi-technical
  - intermediate
---

[previous page](https://community.activeprospect.com/series/4190127/posts/4090767-manually-stopping-trustedform-certify-web-sdk-recording) 6 of 8 [next page](https://community.activeprospect.com/series/4190127/posts/4806725-trustedform-certify-failure-reasons)

In Series: [Advanced options when implementing the TrustedForm Certify Web SDK](https://community.activeprospect.com/series/4190127-advanced-options-when-implementing-the-trustedform-certify-web-sdk)

[![](https://content2.bloomfire.com/avatars/users/1316943/thumb/thumbnail.png?f=1612413648&Expires=1748567764&Signature=YCs828HV1gr4R6pC7PmU01~8gOAVpMRd-fU~pKKqc-aWth12mYtZbmkfA29bPbR4nGRBVnLlTHK8BnkCuvHZEDPxAoKEmblZsTpI3jd07BlfwkUv03AEq~pK09VZZ3bxRUlQayLRw8bTvCI7mgwiTC0i~CWdPsgBYkXgYwXe2SUfiKHlK~rh5iF3cNvIoNbiCc34HmALNw4OnYnz~0P4PgLxEKnSyL1W3botDbPxvRXhh5wsF6lpe1JU17wJ3KxF~F6kcSmNKY9wYvsK0JqMCBUkViunRPczdZ1zt74Q9p35m3-h2urFK5iJSJeS2qnrs2v9hSoprJoDFUNkRQhJzQ__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7557566-ashley-thomas)

[_Ashley Thomas_](https://community.activeprospect.com/memberships/7557566-ashley-thomas)

Updated May 18, 2023. Published May 19, 2023.

Details

# What can I do if my TrustedForm Certificate does not capture a Submit event and my certificates are not extended?

Simple measures to increase the percentage of extended certificates

A TrustedForm Certificate's claim window will be extended (following a short delay after creation) to 90 days if the TrustedForm servers successfully receive an event showing that the visitor to the lead generation page has pressed Submit. To maximize the percentage of extended certificates:

1\. Check for a Submit event on the Event Log tab of several certificates from your web site.

2\. If the Submit event is never present on the Event Log of certificates generated on the web site:

- In order to be detected by TrustedForm, a Submit button must be within a standard <form> tag on the page; check our [community article](https://community.activeprospect.com/posts/4488105-extended-claim-window-for-submitted-leads) for more details
- The visitor to the site must click the button in order to submit the lead (and/or advance to a new page)


3\. If the Submit event is sometimes, but not always, present on the Event Log tabs:

- In some cases, the user’s submit event may not have time to be sent before the page changes or the TrustedForm script stops recording the page. If you see a Submit event on on the Event Log intermittently,  it may be helpful to introduce a slight delay before advancing to a new page or ending the TrustedForm recording

Type something"

