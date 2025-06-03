---
URL: https://community.activeprospect.com/series/4190127/posts/5066541-what-can-i-do-if-my-trustedform-certificate-does-not-capture-a-submit-event-and
Page Title: What can I do if my TrustedForm Certificate does not capture a Submit event and my certificates are not extended?
Screenshot URL: images/screenshots/screenshot.png
Scraped At: 2025-06-02 19:42:55.566
---
QRTLXUFMMp~k6EUnqaskuLALQ-5mgO15ougnOsWfDdfvCxY8Irp9dkF7TKe0D0Y-RwsgupeIS19KT7A0EHMjGqZWHthl0Y4lY5-XhI19apuqg5JYFOfZJpL8jML9DDmu2Mb8WA3GZAZTv-Re0cg__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7557566-ashley-thomas)

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
