---
URL: https://community.activeprospect.com/series/4881972/posts/4883927-trustedform-glossary
Page Title: TrustedForm Glossary
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-211b628d-c038-41e8-9462-172677d1981a.png
Scraped At: 2025-05-30 00:16:22.974
tags:
  - trustedform
  - compliance
  - developer-focused
  - technical
  - reference
  - analytics
  - beginner
secondary_tags:
  - implementation
  - seller-focused
  - admin-focused
  - conceptual
  - how-to
---

[previous page](https://community.activeprospect.com/series/4881972/posts/4112178-trustedform-api-overview) 3 of 3

In Series: [TrustedForm Overview](https://community.activeprospect.com/series/4881972-trustedform-overview)

[![](https://content2.bloomfire.com/avatars/users/1316943/thumb/thumbnail.png?f=1612413648&Expires=1748567774&Signature=tsFtG~3CS8rKexQYYCpX8QYxwgEhFZOSEkl7kW4wID3Q1yk03sG2DZ~3PZHuSIGqT93Y1dVJjTuj1IMPk0fWpzaZnFn4WdV0IjRj41mywbEuoJC8hxVJqqNpqqIpG3Ik~IUFcIT2f77mwzloqLDLpXVn7SGpchgN88VONmskliEzqR1FlfqMCZ8aOdB6yxQGt6Z0yy9MhZnMFpRMkOZII04lDV2ysYEB5pVQ-0ou4RxolvhglLUINZSGtI3IXeRwNcyXx1crhYBWQeKyoBsW-0yRGUBQlWOPJMLbjEzHz74JSxN6tAAh~0BAPMNm6sseItnmWdESFhEVG4jcHHpX-Q__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7557566-ashley-thomas)

[_Ashley Thomas_](https://community.activeprospect.com/memberships/7557566-ashley-thomas)

Updated November 15, 2023. Published December 6, 2022.

Details

# TrustedForm Glossary

TrustedForm terms and what they mean

|     |     |
| --- | --- |
| Claim or Retain \[a TrustedForm certificate\] | Claim, also called Retain, is the [action required to save a TrustedForm Certificate](https://developers.activeprospect.com/docs/trustedform/getting-started-with-claiming/) (for a default 5 years) in your ActiveProspect account for later use. This action is taken by API or LeadConduit on the full certificate URL of 69 characters in the format https://cert.trustedform.com/<cert\_token>. |
| Extend \[a TrustedForm certificate\] | Managed customers can extend the Claim Window for a certificate to be claimed to 90 days [by API,](https://developers.activeprospect.com/docs/trustedform/api/v3.0/tag/TrustedForm-Certificate-Check-in/) or it may be done automatically [by Auto Extend.](https://community.activeprospect.com/posts/4488105-extended-retention-window-for-submitted-leads) The Extend API is available by special permission arranged by your AP team for managed customers. |
| Claim/Delete Window | A TrustedForm certificate can be claimed/retained for [a limited window of time after certificate creation](https://community.activeprospect.com/posts/4488105-extended-retention-window-for-submitted-leads). This amount of time is displayed when a claimable TrustedForm Certificate URL is viewed in a web browser. For example, a certificate that can be claimed for the next 12 weeks might display ""Unless claimed, this certificate will be deleted in: 12 weeks."" |
| Auto Extend | When a TrustedForm certificate is created, [if a submit event can be identified, the Claim/Delete window is automatically extended](https://community.activeprospect.com/posts/4488105-extended-retention-window-for-submitted-leads) to 90 days. |
| Auto Retain | [Register your web site so that](https://community.activeprospect.com/posts/4812756-trustedform-auto-retain-for-first-party-lead-certification) TrustedForm automatically claims/retains the TrustedForm Certificate to your ActiveProspect account. |
| TrustedForm Certify Web SDK | [The javascript snippet is embedded on a web site in order to generate the TrustedForm certificate](https://community.activeprospect.com/series/4190127-implementing-the-trustedform-script-in-a-form-page), which can be configured to your specifications in the _Certify screen_ of any TrustedForm account. |
| TrustedForm Consent | The Consent subscription allows you to verify consent language, check email and phone fingerprints against your lead, and retain/claim the certificate for future use. |
| TrustedForm Insights (Metadata) | The [TrustedForm Insights](https://community.activeprospect.com/posts/4709758-trustedform-insights) subscription provides [metadata characterizing the consumer session captured in the TrustedForm certificate](https://community.activeprospect.com/posts/4709758-trustedform-insights), for use in validation decisions. |
| Fingerprints | When making a claim (i.e., retaining) a certificate,  the email and phone numbers included with a [lead will be hashed (encrypted) as ""fingerprints"" and checked against the email and phone recorded by TrustedForm during the consumer web session.](https://community.activeprospect.com/posts/4077176-lead-fingerprinting) |
| Page Scan | When making a claim (i.e., retaining) a certificate, [you can specify text that must be included](https://community.activeprospect.com/posts/4078890-page-scan), or must not be included, in the consumer session. |
| Event Log | On a tab of the TrustedForm Certificate, the Event Log [documents the consumer keystrokes, scrolling, and button presses](https://community.activeprospect.com/posts/4776894-trustedform-session-replay-enhancements). |
| Session Replay | On a tab of the TrustedForm Certificate, the Session Replay allows you to view the customer interaction with the web site.  The Session Replay is a visual reconstruction of the consumer session built from web site images, keystrokes, mouse movements, and scrolling events. |

For a complete introduction to TrustedForm, please see our [developer pages](https://developers.activeprospect.com/docs/trustedform/guidepost/).

Type something"

