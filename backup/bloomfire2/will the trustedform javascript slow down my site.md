---
URL: https://community.activeprospect.com/series/4113140/posts/5139542-will-the-trustedform-javascript-slow-down-my-site
Page Title: Will the TrustedForm JavaScript slow down my site?
Screenshot URL: images/screenshots/screenshot.png
Scraped At: 2025-06-02 19:42:31.136
---
N~odx8jRIWWuYhhWdc2m~0-NBVwUw1w0gp2VjL18XcEDB6kwmLCU8mkVzGskH0zMNJziByxHacEPLaZBr2SbaCEQhxEVlZBI~bSV6UjFS0JZd64xMhDFtNl2-jnneUgOWGAPYXGztBZqlc-Qn8A__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/9624817-ayesha-akhtar)

[_Ayesha Akhtar_](https://community.activeprospect.com/memberships/9624817-ayesha-akhtar)

Updated August 17, 2023. Published August 17, 2023.

Details

# Will the TrustedForm JavaScript slow down my site?

No, for several reasons:

- The script is designed to operate in the background. If properly installed it will not begin communicating with the TrustedForm service before the page has loaded.
- Initial and ongoing communications between the browser and TrustedForm are very lightweight, occur in the background, consume very little network bandwidth and almost no user CPU/memory load.
- The transmission of user actions between the browser and TrustedForm occurs only after the user action has occurred. During the user action there is no TrustedForm activity or load.
- TrustedForm retrieves remotely-hosted page assets independently, not via the user's machine, and begins that process after the form has been submitted.

Type something"
