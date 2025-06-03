---
URL: https://community.activeprospect.com/series/4190127/posts/4090767-manually-stopping-trustedform-certify-web-sdk-recording
Page Title: Manually Stopping TrustedForm Certify Web SDK recording
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-cf810c4f-80a1-4f4e-99f5-1cdfe1c52192.png
Scraped At: 2025-05-30 00:16:42.886
tags:
  - trustedform
  - intermediate
  - compliance
  - developer-focused
  - technical
  - universal
  - operation
secondary_tags:
  - seller-focused
  - advanced
  - how-to
  - semi-technical
  - analytics
---

[previous page](https://community.activeprospect.com/series/4190127/posts/4076826-manually-triggering-trustedform-certify-web-sdk-delayed-execution) 5 of 8 [next page](https://community.activeprospect.com/series/4190127/posts/5066541-what-can-i-do-if-my-trustedform-certificate-does-not-capture-a-submit-event-and)

In Series: [Advanced options when implementing the TrustedForm Certify Web SDK](https://community.activeprospect.com/series/4190127-advanced-options-when-implementing-the-trustedform-certify-web-sdk)

[![](https://content2.bloomfire.com/avatars/users/1405246/thumb/thumbnail.png?f=1620827893&Expires=1748567764&Signature=k2EnCRpiTRmRjLWA5M8R7-Q~ePGyjTegalEZr1l2l~eMY7xFC2FmIo-9OVSnDVpY--Mbi82MQMtP34UG13foga8dMzBCQXPMx9xZ6rTZuOwK4GntN5kl6ltaJW5O5hfTxErw7QwuwLQQFZMhZXzzoxPST5FL4ufGvdNExAJJnrRC0j73E2QDrOgs~ZI-UT83wHw8JAC3dI4sJywxG-Sz8cB8e1bez~Lkv58sV9LFMjjG0AEtHKl9lnpZ18yXsHxZBPQHp93RW96Xf4nR3shGoGD54gzpAp0Fi~UM5eF4kPQBsi-BnI~SwbfUI1KMOXLzmlqBFq7S~atB-d8kmcDaXQ__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7846678-christopher-williams)

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

