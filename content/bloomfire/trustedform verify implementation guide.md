---
URL: https://community.activeprospect.com/posts/5253900-trustedform-verify-implementation-guide
Page Title: TrustedForm Verify Implementation Guide
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-02c682fb-cd2d-4a5e-b73a-e9a70e36f147.png
Scraped At: 2025-05-30 00:16:59.203
---

[![](https://content2.bloomfire.com/avatars/users/1405246/thumb/thumbnail.png?f=1620827893&Expires=1748567764&Signature=k2EnCRpiTRmRjLWA5M8R7-Q~ePGyjTegalEZr1l2l~eMY7xFC2FmIo-9OVSnDVpY--Mbi82MQMtP34UG13foga8dMzBCQXPMx9xZ6rTZuOwK4GntN5kl6ltaJW5O5hfTxErw7QwuwLQQFZMhZXzzoxPST5FL4ufGvdNExAJJnrRC0j73E2QDrOgs~ZI-UT83wHw8JAC3dI4sJywxG-Sz8cB8e1bez~Lkv58sV9LFMjjG0AEtHKl9lnpZ18yXsHxZBPQHp93RW96Xf4nR3shGoGD54gzpAp0Fi~UM5eF4kPQBsi-BnI~SwbfUI1KMOXLzmlqBFq7S~atB-d8kmcDaXQ__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7846678-christopher-williams)

[_Christopher Williams_](https://community.activeprospect.com/memberships/7846678-christopher-williams)

Updated May 20, 2025. Published December 18, 2023.

Details

# TrustedForm Verify Implementation Guide

[TrustedForm Verify](https://community.activeprospect.com/posts/4918830-trustedform-verify) should be used as part of every marketers process to ensure the leads they buy are compliant with regulations such as the TCPA. Follow this guide for a quick overview of what needs to be done to use it effectively.

# 1\. Make sure your vendors are passing properly tagged Certificates

To use any TrustedForm product offering, the first step is to make sure your leads come with a TrustedForm Certificate URL. Vendors are required to install [TrustedForm Certify](https://activeprospect.com/trustedform/certify?_gl=1*1a7we61*_gcl_aw*R0NMLjE3NDIyMzA3MzQuQ2owS0NRandrTi0tQmhEa0FSSXNBRF9tbklwSUViTEIwcDRvYkpLN0VIOTZtc3Q4d3NaSFJFVmktZEsxaE9odDFoNkd1aTRMV0pJYXZKMGFBZy1fRUFMd193Y0I.*_gcl_au*MjExMTczODE4OC4xNzQ2NDU0Njc4LjU3ODUxOTg4LjE3NDcwNjkwMTguMTc0NzA2OTAyMA..*_ga*OTA3MjA4OTIuMTY5OTQxNDgwMg..*_ga_QHXBV6N7D1*czE3NDc3NTg2ODUkbzg5JGcxJHQxNzQ3NzYyOTQxJGozNyRsMCRoMjAxNzQ1MDc2NiRkVi1DWGhDbFBDUmpzYzhTeVIzTGo5UGxmRzBVUHZVZ1pyUQ..) and [Add TrustedForm Consent Tags](https://developers.activeprospect.com/docs/trustedform/consent-tagging) to enable all of Verify's features. If leads you are receiving today do not include TrustedForm certificates send those vendors a request with the following message ""Going forward we will require TrustedForm certificates to be sent with all leads we purchase. Please follow these [instructions to implement TrustedForm Certify](https://developers.activeprospect.com/docs/trustedform/implementing-trustedform-certify/) so that we may verify and retain proof that each consumer has consented to be contacted."" along with any requirements you set in the next step.

# 2\. Setup your verification criteria

Before you start using Verify you should establish the rules it will use to determine whether or not leads successfully pass the verification process. Visit your [verification criteria page](https://app.trustedform.com/verification_criteria?__hstc=41051389.86c7248b31df171b527bbdb20070d4fa.1748564213681.1748564213681.1748564213681.1&__hssc=41051389.1.1748564213681&__hsfp=3707738794) and enable the checks you would like perform. Set thresholds and enter any data applicable to each check to properly configure it. Make sure to set the ""Company Legal Name"" to the name that should be shown when consumers grant you consent to contact them if you enabled the [1:1 Consent Check](https://community.activeprospect.com/posts/5471724-trustedform-verify-1-1-consent-check). Communicate these requirements to your vendors so that they understand and agree to the reasons you may reject or otherwise not use leads.

# 3\. Start using Verify on your inbound leads

To use Verify you must use the [verify operation](https://developers.activeprospect.com/docs/trustedform/api/v4.0/tag/Verify/) of the TrustedForm Certificate API. Consult with your development team or software provider to integrate it in such a way that the operation is used on every inbound lead that has a TrustedForm certificate. If you are using LeadConduit, simply add the TrustedForm Add-on to your flow and select the Verify option. Avoid using the result to filter or make any decisions for now.

# 4\. Feed data into Verify

Have your vendors submit test leads from each of their sources or simply allow leads to continue flowing through your process for at least 24 hours to allow Verify to detect the different variations of consent language being used and gauge how well the leads perform against your requirements.

# 5\. Review your results

Visit your [unreviewed consent languages](https://app.trustedform.com/consent_languages/unreviewed?__hstc=41051389.86c7248b31df171b527bbdb20070d4fa.1748564213681.1748564213681.1748564213681.1&__hssc=41051389.1.1748564213681&__hsfp=3707738794) in TrustedForm's consent language manager and read each record to make sure everything needed for consumers to provide meaningful consent is present. If so mark it as approved. Otherwise, marked it as rejected. Review the results of the Verify operation and inform your vendor about any issues found that need to be corrected. If you need help determining how to assess consent languages read [TCPA Consent: The complete guide for marketers](https://activeprospect.com/blog/tcpa-consent/).

# 6\. Begin filtering leads based on the Verify result

Once you are ready, use the result of the Verify operation to route, flag or reject leads. For a custom or 3rd party integration, make sure it takes action when the Verify is unsuccessful. If using LeadConduit simply add a filter or conditional field mappings when success is false. Anytime you find that leads are failing verification, review the results to determine why and reach out to your vendor to request corrective updates.

# BONUS

If you already have examples of consent languages that you have approved you can add them manually to your list of approved consent languages. Simply click the ""Add Approved Language"" button at the top right of your consent language manager.

# That's It! Your Verify implementation is complete.

Be sure to continue checking your unreviewed consent languages and general results anytime you start receiving leads from a new source as well as periodically so that you are aware of any unexpected sources that get added to your intake.

Type something"

