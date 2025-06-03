---
URL: https://community.activeprospect.com/series/4190127/posts/4806725-trustedform-certify-failure-reasons
Page Title: TrustedForm Certify Failure Reasons
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-c08b79d7-6841-409d-b9c6-f3b39196fbc6.png
Scraped At: 2025-05-30 00:16:41.190
tags:
  - trustedform
  - intermediate
  - compliance
  - how-to
  - developer-focused
  - reference
  - technical
secondary_tags:
  - seller-focused
  - universal
  - operation
  - advanced
  - semi-technical
---

[previous page](https://community.activeprospect.com/series/4190127/posts/5066541-what-can-i-do-if-my-trustedform-certificate-does-not-capture-a-submit-event-and) 7 of 8 [next page](https://community.activeprospect.com/series/4190127/posts/4076811-form-whitelist)

In Series: [Advanced options when implementing the TrustedForm Certify Web SDK](https://community.activeprospect.com/series/4190127-advanced-options-when-implementing-the-trustedform-certify-web-sdk)

[![](https://content2.bloomfire.com/avatars/users/1405246/thumb/thumbnail.png?f=1620827893&Expires=1748567774&Signature=WTTOqztRC7U-S55SOSIf9P3hqE6TNryUy3kqOV4rwBHGDb0Ckl8tieyFbTt9JkDhY5eT2-0nExUlIdUHmcbo~MLaS3OfaLy640OprXvFuAj8jiiiAKvuaNvNO~5TB5YvqgdhNVMxIEoumXqj0k4QPs~MzWZsTWVsufLlvfbmqiCJodrggo81OdQLyzMKVl3rcVUyhjdXKypx89V831oePVWQhGNETN6RZ96OOquiqMR7h2lXD4s7wxNUu2TgO8TUVHu65sI0F~1cswXJqCN9PzSusja9hm7~xyvDe~RncAW3QgSB9IO809B0dAFmhhUJzh-2tQ65jH3MfYLjgzSrzA__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7846678-christopher-williams)

[_Christopher Williams_](https://community.activeprospect.com/memberships/7846678-christopher-williams)

Updated January 7, 2025. Published September 13, 2022.

Details

# TrustedForm Certify Failure Reasons

Are there any specific reasons as to why a TrustedForm certificate wouldn't be created and therefore the URL wouldn't be captured?

Yes, as with any product there's always the possibility for something to go wrong that causes it not to work. The known scenarios that would prevent a TrustedForm certificate URL from being created are:

- The consumer is preventing TrustedForm Certify from running by using a browser or ad blocker extension that uses a filter list which has flagged TrustedForm code. Make sure your implementation of the Web SDK does not include the ""provide\_referrer"" parameter as this is specifically targeted by [EasyList's EasyPrivacy list](https://easylist.to/) , the most notable filter list which powers [Adblock Plus](https://adblockplus.org/), [uBlock Origin](https://ublockorigin.com/), [AdBlock](https://getadblock.com/), [AdGuard](https://adguard.com/), [Brave](https://brave.com/), [Opera](https://www.opera.com/), [Vivaldi](https://vivaldi.com/) and other ad blockers.
- Google Tag Manager was used to implement TrustedForm Certify and is being blocked.
- The consumer disables JavaScript from running on their browser.
- The consumer has a bad internet connection that causes the TrustedForm Certify to fail, timeout or take so long that the form gets submitted before it is created.
- A bot fills out the form and doesn't trigger TrustedForm Certify.
- The TrustedForm Certify is implemented incorrectly.
  - It gets initiated before the form is added to the page
  - The page has other scripts that must run before the TrustedForm Certify and the form is submitted before it gets its turn.
- ActiveProspect has an outage or a bug in the TrustedForm Certify.

Type something"

