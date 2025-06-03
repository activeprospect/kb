---
URL: https://community.activeprospect.com/series/4190127/posts/4076826-manually-triggering-trustedform-certify-web-sdk-delayed-execution
Page Title: Manually Triggering TrustedForm Certify Web SDK(Delayed Execution)
Screenshot URL: images/screenshots/screenshot.png
Scraped At: 2025-06-02 19:44:46.460
---
lTZ-L3psBMlS5Uykx6p0TRqtSqRkV8w7YL8cwb1E89RFvFetaVctjy2MaP92PHgdutUyMrn2HFsQuSqVi4C4m-sg3Er~wO0BRoHPPDFnS1GTTv1bSCgCRFdUurepMm6pUGb76G~D1MGXb-yC6~g__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7846678-christopher-williams)

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
