---
URL: https://community.activeprospect.com/posts/5619028-trustedform-verify-opt-in-type-check
Page Title: TrustedForm Verify Opt-in Type Check
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-b1a49eb3-c647-4af5-b6df-afd5e6c70ba3.png
Scraped At: 2025-05-30 00:16:59.506
tags:
  - trustedform
  - intermediate
  - compliance
  - business-logic
  - buyer-focused
  - data-management
  - technical
secondary_tags:
  - developer-focused
  - reference
  - seller-focused
  - intermediate
  - operation
---

[![](https://content2.bloomfire.com/avatars/users/1405246/thumb/thumbnail.png?f=1620827893&Expires=1748567764&Signature=k2EnCRpiTRmRjLWA5M8R7-Q~ePGyjTegalEZr1l2l~eMY7xFC2FmIo-9OVSnDVpY--Mbi82MQMtP34UG13foga8dMzBCQXPMx9xZ6rTZuOwK4GntN5kl6ltaJW5O5hfTxErw7QwuwLQQFZMhZXzzoxPST5FL4ufGvdNExAJJnrRC0j73E2QDrOgs~ZI-UT83wHw8JAC3dI4sJywxG-Sz8cB8e1bez~Lkv58sV9LFMjjG0AEtHKl9lnpZ18yXsHxZBPQHp93RW96Xf4nR3shGoGD54gzpAp0Fi~UM5eF4kPQBsi-BnI~SwbfUI1KMOXLzmlqBFq7S~atB-d8kmcDaXQ__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7846678-christopher-williams)

[_Christopher Williams_](https://community.activeprospect.com/memberships/7846678-christopher-williams)

Updated May 20, 2025. Published April 29, 2025.

Details

# TrustedForm Verify Opt-in Type Check

Ensuring that consumers knowingly opt in before you contact them is the foundation of consent-based marketing—and critical to your business. Lead generation forms use a variety of methods to collect opt-ins, so it’s essential to define which methods are acceptable, communicate those standards to your lead sources, and confirm they’re being followed. For example, [a rule from the Centers for Medicare & Medicaid Services (CMS)](https://www.federalregister.gov/documents/2024/04/23/2024-07105/medicare-program-changes-to-the-medicare-advantage-and-the-medicare-prescription-drug-benefit#p-1610) requires that consumers take _affirmative action_ to share their data—pre-checked boxes or passive consent aren't enough. TrustedForm Verify’s new Opt-in Type Check feature helps you enforce this standard by programmatically verifying that each lead opted in using an allowed method, such as those defined by CMS.

# How It Works

First, ask your lead vendors to implement [TrustedForm Certify](https://activeprospect.com/trustedform/certify?_gl=1*1svxali*_gcl_au*NzQzNzM3ODgwLjE3Mzg1OTY4NTUuMTE5Mzg3NzEzLjE3Mzg4ODY5MzQuMTczODg4Njk1Mg..*_ga*OTA3MjA4OTIuMTY5OTQxNDgwMg..*_ga_QHXBV6N7D1*MTczOTkxNjE0OC42MC4xLjE3Mzk5MjA4NjEuNjAuMC4w) and send a TrustedForm Certificate URL along with the leads you purchase from them. This is necessary to give you the required transparency into each lead. Next enable the opt-in type requirement on your [verification criteria page](https://app.trustedform.com/verification_criteria?__hstc=41051389.6062023944b4e6cfc3d72621639c26c5.1748564214438.1748564214438.1748564214438.1&__hssc=41051389.1.1748564214438&__hsfp=3707738794) and click Save.

![](https://content2.bloomfire.com/thumbnails/contents/004/943/364/original.png?f=1745940705&Expires=1748567811&Signature=XOiXXsQvNy02zm3vyO5ItMzU~pRgYD79oTp7SebDLoUZtUtH92MbXMOfCVSErpyBiQam~D4VbHnrZ9K1RAMFUrd~OEUQgHAfy2YfLDU~hSjRm82C6eGRN6iEgP~TDOK5OxCT--2g3HJe3-t2YAmzz5KpJsdrI~Sg1yzVwRJUiNF6En82F-UXTnzYV9G0stgB1pdCZd~PqOoKOAnzVD0FI0RShVRBWwfrPDoYD~4oZ6nHWLWrhk3dZi2Vi4K3Rb-hrXJZA4roMnhZTcMfgDbPmHaUe-XIBtRkbBkrfAP7MfpjvliWcX~Q35NfkRkFLuuz7N3AsrhnfvgSr0ldrnjAjQ__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

Next use the [Certificate API](https://developers.activeprospect.com/docs/trustedform/api/v4.0/tag/Certificate-URL/) and make a [Verify request](https://developers.activeprospect.com/docs/trustedform/api/v4.0/tag/Verify/) which will run all of the checks you have enabled (note you can also modify your requirements per query using request parameters). Send the results to the system you use to make purchasing decisions or your CRM depending on where you want to use this data. If you don't have a system that is able to integrate with this feature consider purchasing [LeadConduit](https://activeprospect.com/leadconduit).

The results will include a ""success"" property that should be used to determine how to proceed.

- If ""success"" equals false then that means one of your checks has failed and you should not contact this lead or at least avoid using regulated technology. The ""reason"" property will explain which checks failed and why. Use this along with a potential manual review of the certificate to inform your vendor(s) of the issue(s) that need to be resolved for future leads.
- If ""success"" equals true then that means all of your checks have passed and this lead should continue to progress through your normal processes.

_Note: This check cannot be performed on__certificates generated from Meta Lead Ads or native mobile applications._

# Frequently Asked Questions

1. **What does the CMS rule say about the type of opt-in used?**

""TPMOs should use a consent method where the default selection is that the beneficiary chooses to not share their data; there should be an affirmative action by the beneficiary to acknowledge that sharing their data with another TPMO is permitted. By being able to consent to each listed TPMO through a clear and conspicuous disclaimer, beneficiaries can make informed decisions that best fit their personal preference."" [Source](https://www.federalregister.gov/documents/2024/04/23/2024-07105/medicare-program-changes-to-the-medicare-advantage-and-the-medicare-prescription-drug-benefit#p-1610)
2. **What opt-in types should I allow?**

If you are attempting to comply with the CMS rule mentioned above then you should only allow manual opt-ins as this is the only option where sharing data / giving consent is not the default selection. Otherwise we recommend you consult your compliance/legal teams and industry best practices to determine suitable standards for your business.
3. **Does using the Opt-in Type Check satisfy all of the CMS rule's requirements?**

No, complying with all of the requirements requires a broad strategy that should be discussed with your compliance/legal teams. However, using the Opt-in Type Check is an essential defense against noncompliant leads.

Type something"

