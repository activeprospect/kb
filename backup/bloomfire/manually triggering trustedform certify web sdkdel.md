---
URL: https://community.activeprospect.com/series/4190127/posts/4076826-manually-triggering-trustedform-certify-web-sdk-delayed-execution
Page Title: Manually Triggering TrustedForm Certify Web SDK(Delayed Execution)
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-54363637-3942-415a-b490-88cde12efd60.png
Scraped At: 2025-05-30 00:16:41.506
tags:
  - trustedform
  - intermediate
  - developer-focused
  - compliance
  - technical
  - data-management
  - universal
secondary_tags:
  - seller-focused
  - advanced
  - how-to
  - analytics
  - semi-technical
---

[previous page](https://community.activeprospect.com/series/4190127/posts/4129671-deploying-the-trustedform-certify-web-sdk-using-google-tag-manager) 4 of 8 [next page](https://community.activeprospect.com/series/4190127/posts/4090767-manually-stopping-trustedform-certify-web-sdk-recording)

In Series: [Advanced options when implementing the TrustedForm Certify Web SDK](https://community.activeprospect.com/series/4190127-advanced-options-when-implementing-the-trustedform-certify-web-sdk)

[![](https://content2.bloomfire.com/avatars/users/1405246/thumb/thumbnail.png?f=1620827893&Expires=1748567774&Signature=WTTOqztRC7U-S55SOSIf9P3hqE6TNryUy3kqOV4rwBHGDb0Ckl8tieyFbTt9JkDhY5eT2-0nExUlIdUHmcbo~MLaS3OfaLy640OprXvFuAj8jiiiAKvuaNvNO~5TB5YvqgdhNVMxIEoumXqj0k4QPs~MzWZsTWVsufLlvfbmqiCJodrggo81OdQLyzMKVl3rcVUyhjdXKypx89V831oePVWQhGNETN6RZ96OOquiqMR7h2lXD4s7wxNUu2TgO8TUVHu65sI0F~1cswXJqCN9PzSusja9hm7~xyvDe~RncAW3QgSB9IO809B0dAFmhhUJzh-2tQ65jH3MfYLjgzSrzA__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7846678-christopher-williams)

[_Christopher Williams_](https://community.activeprospect.com/memberships/7846678-christopher-williams)

Updated August 8, 2023. Published November 9, 2020.

Details

# Manually Triggering TrustedForm Certify Web SDK(Delayed Execution)

The following article covers technical guidance to trigger the TrustedForm Certify Web SDK. We suggest you use this method only if you want to avoid recording data until a specific event on your web page or flow happens. This may be use as way to collect consent before recording, trim the session replay or ensure your page has loaded first to reduce the SDK's impact on site performance.

**This article assumes you're familiar with HTML, Javascript, and jQuery.**

By wrapping the TrustedForm Certify javascript snippet in a function, you make it available to be called by a specific action later - simply trigger the function:

```
function beginTrustedFormRecording() {
// Get the TrustedForm Certify javascript snippet at
// https://activeprospect.com/trustedform/certify/
}
```

When recording begins, it collects the current state of the webpage's Document Object Model (DOM). We recommend that you coordinate this function to execute before the user begins completing required fields, or with the loading of a pop-up window that displays the disclosure language so that important events are captured.

It is important to note that you need to give the TrustedForm Certify Web SDK time to load and populate the TrustedForm Certificate URL field. Usually, this happens in under a second but you should never try to call the begin recording AND submit your form at the same time or you risk causing the certificate generation to fail. For best results you'll want to trigger the recording with one action (an onblur or onfocus of an element, clicking a button, etc) and then trigger the submission of the form with a separate action.

Type something"

