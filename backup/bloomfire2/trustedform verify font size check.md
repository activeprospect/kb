---
URL: https://community.activeprospect.com/posts/5561944-trustedform-verify-font-size-check
Page Title: TrustedForm Verify Font Size Check
Screenshot URL: images/screenshots/screenshot.png
Scraped At: 2025-06-02 19:43:24.877
---
cYGJrGOQcO7lUwQ3Vjof316eKd1ZIEeSCoKBo0fIaoIJwg0qp07ZbTdc08IKdA1To6t~AdMmh0CsEGyklkTBjvuJwNThaF3HVLEpcbtvtSYjmn4va9oH4LtodlI-EheBcmHN227TtsyRLkfezPg__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7846678-christopher-williams)

[_Christopher Williams_](https://community.activeprospect.com/memberships/7846678-christopher-williams)

Updated May 20, 2025. Published February 18, 2025.

Details

# TrustedForm Verify Font Size Check

Ensuring that the font size of consent language used to generate leads meets the clear and conspicuous requirement of the Telephone Consumer Protection Act (TCPA) is crucial for compliance and risk mitigation. If the font size is too small, it could be deemed insufficiently clear, leading to potential regulatory violations, legal challenges, and financial penalties. TrustedForm Verify's Font Size Check is a new feature that enables you to programmatically verify that each lead was shown a consent language of at least a certain size. This can be used to meet [R.E.A.C.H. standards](https://www.reachmbc.com/reach-standards) which require consent language ""must appear in not less than 10 point font"" and confirm this for every lead before you contact them.

# How It Works

First, ask your lead vendors to implement [TrustedForm Certify](https://activeprospect.com/trustedform/certify?_gl=1*1svxali*_gcl_au*NzQzNzM3ODgwLjE3Mzg1OTY4NTUuMTE5Mzg3NzEzLjE3Mzg4ODY5MzQuMTczODg4Njk1Mg..*_ga*OTA3MjA4OTIuMTY5OTQxNDgwMg..*_ga_QHXBV6N7D1*MTczOTkxNjE0OC42MC4xLjE3Mzk5MjA4NjEuNjAuMC4w) and send a TrustedForm Certificate URL along with the leads you purchase from them. This is necessary to give you the required transparency into each lead. Next enable the minimum font size requirement on your [verification criteria page](https://app.trustedform.com/verification_criteria) and click Save.

![](images/image-1.png)Next use the [Certificate API](https://developers.activeprospect.com/docs/trustedform/api/v4.0/tag/Certificate-URL/) and make a [Verify request](https://developers.activeprospect.com/docs/trustedform/api/v4.0/tag/Verify/) which will run all of the checks you have enabled **(note you can also modify your requirements per query using request parameters)**. Send the results to the system you use to make purchasing decisions or your CRM depending on where you want to use this data. If you don't have a system that is able to integrate with this feature consider purchasing [LeadConduit](https://activeprospect.com/leadconduit).

The results will include a ""success"" property that should be used to determine how to proceed.

- If ""success"" equals false then that means one of your checks has failed and you should not contact this lead or at least avoid using regulated technology. The ""reason"" property will explain which checks failed and why. Use this along with a potential manual review of the certificate to inform your vendor(s) of the issue(s) that need to be resolved for future leads.
- If ""success"" equals true then that means all of your checks have passed and this lead should continue to progress through your normal processes.

_Note: This check cannot be performed on__certificates generated from Meta Lead Ads or native mobile applications._

# Frequently Asked Questions

1. **Does the Font Size Check account for zoom level currently applied to a web page?**

No, the font size reported is based on the computed size of the text and does not change based on the zoom level of the web page.
2. **Does using the Font Size Check satisfy all of the FCC’s  clear and conspicuous requirements?**

No, complying with all of the requirements requires a broad strategy that should be discussed with your compliance/legal teams. However, using the Font Size Check is an essential defense against common allegations that consent language is unclear or inconspicuous.
3. **If there are multiple consent languages which one does the font size check compare against?**

All of them. The logic used by the font size check looks at all the consent languages shown and finds the font size of the smallest one. If this font size is smaller than what you have set as your minimum then the result will be a failure.

Type something"
