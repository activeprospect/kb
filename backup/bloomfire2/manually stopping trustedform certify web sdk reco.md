---
URL: https://community.activeprospect.com/series/4190127/posts/4090767-manually-stopping-trustedform-certify-web-sdk-recording
Page Title: Manually Stopping TrustedForm Certify Web SDK recording
Screenshot URL: images/screenshots/screenshot.png
Scraped At: 2025-06-02 19:42:56.176
---
acF3rdLY-PvWPenvUAk1HqR0ru2RxmxH1bump1iJoZmX9yLJE1Hd-5j4KvKp0BQEr-J0f1-fePsF6YquE2S--2uaxaEvPmSfqyn4bISjV0pefSA~aGGb5XdB5HcwbSOOYzwJRgnx6GIpE0YdN1A__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7846678-christopher-williams)

[_Christopher Williams_](https://community.activeprospect.com/memberships/7846678-christopher-williams)

Updated December 8, 2022. Published November 20, 2020.

Details

# Manually Stopping TrustedForm Certify Web SDK recording

The default behavior of the TrustedForm script is to load up, scan the page, and begin recording end-user interactions until the page is unloaded, typically because the form is submitted and the end-user is redirected to a Thank You Page.

However, with the proliferation of Single Page Applications (SPA) a web form submission does not necessarily unload the page. The TrustedForm script supports this use case with a built-in global function

**Manual Stop**

Once the TrustedForm script is loaded and is recording the global function

```
trustedFormStopRecording()
```

can be invoked to stop TrustedForm.

**PLEASE NOTE**: Once the stop recording function is called, the recording cannot be restarted.

Type something"
