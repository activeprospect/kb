---
URL: https://community.activeprospect.com/posts/4488105-extended-claim-window-for-submitted-leads
Page Title: Extended Retention Window for Submitted Leads
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-9851e8a4-c683-45a1-ac5c-8d77c03030be.png
Scraped At: 2025-05-30 00:16:51.902
tags:
  - trustedform
  - intermediate
  - seller-focused
  - analytics
  - compliance
  - how-to
  - integrations
secondary_tags:
  - buyer-focused
  - troubleshooting
  - universal
  - operation
  - non-technical
---

[![](https://content2.bloomfire.com/avatars/users/1405246/thumb/thumbnail.png?f=1620827893&Expires=1748567764&Signature=k2EnCRpiTRmRjLWA5M8R7-Q~ePGyjTegalEZr1l2l~eMY7xFC2FmIo-9OVSnDVpY--Mbi82MQMtP34UG13foga8dMzBCQXPMx9xZ6rTZuOwK4GntN5kl6ltaJW5O5hfTxErw7QwuwLQQFZMhZXzzoxPST5FL4ufGvdNExAJJnrRC0j73E2QDrOgs~ZI-UT83wHw8JAC3dI4sJywxG-Sz8cB8e1bez~Lkv58sV9LFMjjG0AEtHKl9lnpZ18yXsHxZBPQHp93RW96Xf4nR3shGoGD54gzpAp0Fi~UM5eF4kPQBsi-BnI~SwbfUI1KMOXLzmlqBFq7S~atB-d8kmcDaXQ__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7846678-christopher-williams)

[_Christopher Williams_](https://community.activeprospect.com/memberships/7846678-christopher-williams)

Updated May 9, 2024. Published October 8, 2021.

Details

# Extended Retention Window for Submitted Leads

TLDR; By default certificates are only available to retained for 3 days. If a submission event is detected this gets extended to 90 days.

Once a certificate has been created, there is a limited window of time after which the certificate can no longer be retained. If you are planning to retain a certificate in long-term storage, you must do so before this retention window expires.

TrustedForm now extends the period a certificate is eligible to be retained if a submit event is detected on its lead generation form. By default certificates are only able to be retained for 3 days following their creation. This creates problems when you purchase aged leads / warm transfers as you often obtain the lead data after the retention period has ended. This means you miss out on having the opportunity to store the certificate and be protected. Extended certificates are able to be retained for 90 days which should give you more than enough time to retain relevant TrustedForm certificates. Prior to this change the only ways to extend a certificate required that you reach out to your lead vendor so they could implement the necessary steps to extend certificates. Now this happens automatically for leads that TrustedForm can validate were submitted!

## How it Works

TrustedForm Certify has been updated with new abilities that allow it to listen for events that explicitly indicate a form has been submitted or are associated with elements on a page that behave like a submit button. Certify is expected to accurately capture these submit events from any webpage using a standard <form> tag with a submit button embedded inside of it. Unfortunately, when publishers use less conventional means to submit lead data these events become more obscured and may not be caught. If a submission event is detected with high confidence, TrustedForm will automatically send this event and trigger the process to extend the certificate. We have observed that ~80% of certificates acknowledged to contain submitted leads are automatically extended. This process will take at least 15 minutes before it begins to ensure that all user activity is captured. Once it is complete you will see a longer time until the certificate is deleted if you visit the certificate URL before retaining it.

## Caveats

- Using the expiration of certificates as a means to avoid purchasing aged leads is no longer a reliable solution.

- The format of certain forms may prevent TrustedForm Certify from capturing submit event data.

- If a certificate does not get extended, that should not be considered a definitive indicator that the form wasn’t submitted.

- Certificate extension does not happen immediately after the lead submits their data which could lead to false assumptions that the certificate will not be extended.

- Certificates generated from Facebook Lead Ads always have a 12 week retention window.


## Frequently Asked Questions

- **How can I avoid reaching out to old leads that weren't generated recently?**

Check the lead age on TrustedForm certificates to determine if the lead was created recently.
- **How can I tell if Certify is detecting submit events for my certificates?**

View one a certificate for a lead from each of the forms you want to check. View the Event Log and search for ""submitted form"" event. If this event exists then it means a form submission was successfully captured.

![](https://content3.bloomfire.com/thumbnails/contents/003/874/793/original.png?f=1693947682&Expires=1748567804&Signature=h2i2mc3E41oBwgXJ4nXaXZ7wq34geIw6tFPx5GEvAK-uG40km~Qt~H69SEaLgYeatbIJwqVaNDGTHg1xBKtUxIlGlNyzfMNcFfzQWYCJOGK0mxM4rfxeafHo~deawR915V9jlPPkwNh0xBuY00hJ0ImbaF7O-4r4vSIPPBgXcc5zzSAvLBLivdNzIr3NKdwn7f3Evr8lSY0M5ZGdGpDfQDlfVqkVGjkiZmvkeqgSLYAcI0So3x8xloBbhSrSoQW7dCk9-qYOuT-2KNJTDEzA4sBRBEEjSrpOAvQThs9wjWjzGlCyOV8cjClLWedbQUM3lTx2uBHU0VeWEyGem8E4Dg__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

- **What can I do to make sure that the certificates I generate get extended?**

Reach out to support@activeprospect.com if certificates you generate are not being extended automatically and you would like to troubleshoot why.
- **I just received a certificate and it says it will be deleted in 2 days, is this feature working?**

Wait at least one hour after the certificate was generated before expecting to see an extended deletion date on the TrustedForm certificate UI. If the certificate has not been extended after this period have your vendor reach out to us so we can help them troubleshoot.

![](https://content1.bloomfire.com/thumbnails/contents/002/907/107/original.png?f=1633387296&Expires=1748567804&Signature=auXryIk-QemsulM8j30n~N-63EUJ9X9jn3JBawVRCslwKOEHzOkBepyUIIfreJrGgpNmSHgrMTy42miby9NMAMOgb8rO5VTFBUVGG6mUbKqxQ7Dvg-gPkqckbba80nO~164MBmtCpPAvYAUDDNgh5T8myqxXguopf1mbl7BlZL0GojojECgicH0Y3D8sQD45p4wb8zn5KbWR5uReVSQEVQ0HssNIhP9FT-1i~XrCj9Ow-RKdxt~qo2fkiUdV0BTxjCwFOFRSO9XtGB67ptaxhOe3h4mpWtQwy5YjQ7dAxgdOxNzlVuna8BRxVw39nUSgBWSYXnPoU2k2lT-f0J4ApA__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)Standard Certificate

![](https://content3.bloomfire.com/thumbnails/contents/002/907/108/original.png?f=1633387338&Expires=1748567804&Signature=sHBCkAXoH8EcL2JPqoI7ICOYsMot~FRsVQSJ-Lu2vIAJ2nautABu4JKXoXlNC-XCrvx05VmZmY~q-JB6KaxuXrv-bv5QKBgAWJR8Tn4wPzb-Bg5h9xNaFrf1fVRM-1qJP8e2lvyst5hX6rPLlPnot1qFIUazasSO9KYMoZ-6bQl2vdLMwFr-uirUvHDO4hgnxQT37T3mNzTI~7PsbuuEF6AKqmKxbvofve~FCiEdao9K6Mhm-aO7mhWLQIbPfQkLYHGyQOeMWM1ajdZevJPcW86D9AkKLeUfV6mW76ba8B-9HcL77coFnpS3ramwqkO0cUSlMUqq9DLbcmGDZI5ExQ__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)Extended Certificate

Type something"

