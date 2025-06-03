---
URL: https://community.activeprospect.com/series/4113140/posts/5139542-will-the-trustedform-javascript-slow-down-my-site
Page Title: Will the TrustedForm JavaScript slow down my site?
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-b7f711e9-6a9d-43cd-9942-876e5b3a296c.png
Scraped At: 2025-06-02 22:29:49.299
---


[_Ayesha Akhtar_](https://community.activeprospect.com/memberships/9624817-ayesha-akhtar)

Updated August 17, 2023. Published August 17, 2023.

Details

# Will the TrustedForm JavaScript slow down my site?

No, for several reasons:

- The script is designed to operate in the background. If properly installed it will not begin communicating with the TrustedForm service before the page has loaded.
- Initial and ongoing communications between the browser and TrustedForm are very lightweight, occur in the background, consume very little network bandwidth and almost no user CPU/memory load.
- The transmission of user actions between the browser and TrustedForm occurs only after the user action has occurred. During the user action there is no TrustedForm activity or load.
- TrustedForm retrieves remotely-hosted page assets independently, not via the user's machine, and begins that process after the form has been submitted.

Type something
