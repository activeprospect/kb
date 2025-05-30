---
URL: https://community.activeprospect.com/series/4113140/posts/5139542-will-the-trustedform-javascript-slow-down-my-site
Page Title: Will the TrustedForm JavaScript slow down my site?
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-8689ffef-7241-4d27-8cd7-274cd50db227.png
Scraped At: 2025-05-30 00:16:18.638
---

[previous page](https://community.activeprospect.com/series/4113140/posts/5139553-do-i-need-to-generate-a-different-trustedform-certificate-for-each-lead-buyer) 11 of 12 [next page](https://community.activeprospect.com/series/4113140/posts/5324636-i-can-t-see-xxtrustedformcerturl-when-running-the-trustedform-javascript-on-my-)

In Series: [TrustedForm Publisher FAQ](https://community.activeprospect.com/series/4113140-trustedform-publisher-faq)

[![](https://content2.bloomfire.com/avatars/users/1966401/thumb/thumbnail.png?f=1692038964&Expires=1748567771&Signature=a5Mg4iPFUmbYPAPBg6nobsdHGRxTr0gGUMSRjd-W4zr-kcOcJuo4bkFN9ARy04C~8FCf-FK3w0zpCk~eqL61QxZtCCN97B0BH7IR1OzrggMJUGAMV-fG0COp0S-OvF3A5GhIKFW4F9joxx2PILWCWXJU09irnWc4TrxgDs2BqhQh3FPK41R6GbuPSGl8DKHqiQknnbC-cSZcXxIX03EfNZ~FeHUcg30A-8dWti0j97V4fz4Ju4O6ZKSU74kd7MYwnTAMVpIFds8438mj1SBsRpF1dekYRuAZ~PA6kICFTFPojP6-CunJhDcI1LkqiDWfhW1UCh8pMPiJVv9OlkBC0A__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/9624817-ayesha-akhtar)

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

