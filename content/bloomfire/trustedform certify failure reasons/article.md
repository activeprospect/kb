---
URL: https://community.activeprospect.com/series/4190127/posts/4806725-trustedform-certify-failure-reasons
Page Title: TrustedForm Certify Failure Reasons
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-3bb07039-1c7a-4dea-9d25-49b8740f3061.png
Scraped At: 2025-06-02 22:30:02.740
---


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

Type something
