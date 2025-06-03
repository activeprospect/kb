---
URL: https://community.activeprospect.com/posts/4078890-trustedform-page-scan
Page Title: TrustedForm Page Scan
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-ec872669-166b-4d23-b5a3-7e5345cd2e83.png
Scraped At: 2025-05-30 00:16:30.535
tags:
  - trustedform
  - intermediate
  - compliance
  - flows
  - data-management
  - developer-focused
  - how-to
secondary_tags:
  - technical
  - integrations
  - best-practices
  - semi-technical
  - universal
---

[![](https://content2.bloomfire.com/avatars/users/1405246/thumb/thumbnail.png?f=1620827893&Expires=1748567764&Signature=k2EnCRpiTRmRjLWA5M8R7-Q~ePGyjTegalEZr1l2l~eMY7xFC2FmIo-9OVSnDVpY--Mbi82MQMtP34UG13foga8dMzBCQXPMx9xZ6rTZuOwK4GntN5kl6ltaJW5O5hfTxErw7QwuwLQQFZMhZXzzoxPST5FL4ufGvdNExAJJnrRC0j73E2QDrOgs~ZI-UT83wHw8JAC3dI4sJywxG-Sz8cB8e1bez~Lkv58sV9LFMjjG0AEtHKl9lnpZ18yXsHxZBPQHp93RW96Xf4nR3shGoGD54gzpAp0Fi~UM5eF4kPQBsi-BnI~SwbfUI1KMOXLzmlqBFq7S~atB-d8kmcDaXQ__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7846678-christopher-williams)

[_Christopher Williams_](https://community.activeprospect.com/memberships/7846678-christopher-williams)

Updated January 27, 2025. Published November 10, 2020.

Details

# TrustedForm Page Scan

TrustedForm can perform a real-time scan of lead generation forms to identify whether or not text specified by a user is present. The page scan works by searching the form's text that has been stored in a TrustedForm certificate. When you make a request to the TrustedForm service you are able to input the text snippet you would like to search for. The output will then include each supplied snippet and whether or not it was found. This can be used to ensure that leads were shown required text like disclosure languages, terms of service or intended data use are present or to filter out leads that were incentivized by free offers, part of deals with undesirable partners or unaware that you intend to contact them. As a best practice, when configuring page scan we highly recommend storing your text snippets in a single document that you can copy and paste from to avoid typing mistakes to have an easy to access record of the text you are scanning for.

**PLEASE NOTE:** TrustedForm Facebook Lead Ads certificates only supports page scan of the [custom disclaimer text](https://www.facebook.com/business/help/1550411888622740?id=735435806665862) and checkbox questions.

# Page Scan using TrustedForm API

[Required scan terms](https://developers.activeprospect.com/docs/trustedform/api/v3.0/tag/Claiming-Certificates/#tag/Claiming-Certificates/operation/ClaimerWeb.ClaimController.create!path=required_scan_terms&t=request) or [forbidden scan terms](https://developers.activeprospect.com/docs/trustedform/api/v3.0/tag/Claiming-Certificates/#tag/Claiming-Certificates/operation/ClaimerWeb.ClaimController.create!path=forbidden_scan_terms&t=request) must be provided as parameters when the API request is made in order to use this feature. After this the results of which were found and not found will be returned in the API response. Visit [developers.activeprospect.com](https://developers.activeprospect.com/) for more information.

# Page Scan using LeadConduit

You can set required and/or forbidden text in the TrustedForm step in LeadConduit, to add TrustedForm step to your flow, follow the steps [here](https://community.activeprospect.com/posts/5098468-trustedform-leadconduit-add-on?_gl=1*ahjo2d*_gcl_au*MTI1NTg1MTA5NS4xNzM2NzgxNDA4LjE2Mjg3NTExMjQuMTczNzc0OTExOC4xNzM3NzQ5MTE4*_ga*NTQ3NjI0NDQxLjE3MzQ2Mzk3NDQ.*_ga_QHXBV6N7D1*MTczODAxNjEzMy4xNTIuMS4xNzM4MDE2NzUyLjM5LjAuMA..).

If you selects Insights, chose **Page Scan** data point to be appended to your flow. Once that is selected,  you'll be prompted to specify the Required and Forbidden texts in the subsequent configuration step.

![](https://content1.bloomfire.com/thumbnails/contents/004/786/623/original.png?f=1738017711&Expires=1748567781&Signature=N0q0tM-iPoVdez5zPN3Xw7~0sKeQ1hRJefQ5l3hIlD6k~-bkgbb-OmyZb-kg~gUxONEE0T6bD30eWtYnQrB~TfcRiOnNPGa6UWHhOxMXVtGgvPRjFwMbDi0fAgx7vxjR15e1SGtX2xHMmgTjEvSB97HKQOBxK~Vk0Z38uooVHUV87kGHgPFDP5SkLzD4s8tTCfdbhbMNkY5rq3las23XDEdmiG5u2wSvO7JSD~GgiDMt0N-1YQ9GeIVeItDMrm13Vhb0xdorpvPJ4ufHO33Ts-lK97ZyIaRiUSP770eO8Z1B6~gKJbPQRHbu0KeUfKvl9GCtRO0wYN-rGTHj2BvhHg__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

You can specify them here, or do it later via the Edit Field Mappings button (you can add new or edit existing field mapping settings and define what you want to require or forbid), like shown below:

![](https://content2.bloomfire.com/thumbnails/contents/004/786/592/original.png?f=1738017288&Expires=1748567781&Signature=bj6snwpVdHKhFwKL8rCH~78tLUixvMWUvkWhlm3b4mOFcW~Pcq~oNo7qW7N1iJdL3NmAyYDZiI790C2YpIc9E4ohT8TGq0zszAPr9QVvukDysXRRGKJyFsYiKaT0sVo9aaADNrafEjQ-XYK1Rs0TD1YakRhyBR869Hv98TdCNdcNR9kuK93IquiVA2XXwdcP79CdIBpE-m7n6cXMBfJU-lIUkmHrzEtu8DCsosyyJQzBC8cJxce9n2CvrxEHlPK3G6uOiOwdMU2NARFHllzd~EBvLIIbabCnOGdY0oxCmMtr3gWD5-QuWxTjf651xiGJkd1l0XIebRo70ehSZJUy5w__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

In the example screenshot below, the required text is **solar** and **offer** and the forbidden text is **free**.

![](https://content3.bloomfire.com/thumbnails/contents/004/786/642/original.png?f=1738018422&Expires=1748567781&Signature=M-0VAXdTEx1sEEH-ZgBhNZ2lemf6ciYECUK606Rd16odBS1mOncQ9yO4OLnxIvvY293ZHHdDZ28jPTDdzWkq4JDfWPeFiYThUNVhH7ipBjHtzGb6-7e7dBl3cwCV9j89e~cxNvKFghFF-fP11zFPm1V9B4D1VcDIskj7S2XvgKPtdlj9bdCfVejevg2xOB-Nr06YxaJ7fCmITYaSRoP8TE0GftLm4dy0YXjknUC9RSSHO160lW-7lPn4YediLip8vsiRG1NzGiwNuZ7mA9Wr~wK9bVsxADn2jOs3Ms9FK8BHR2w9Ak8aoE8tsnO4GXUICO6Sr8L99jLn0ZcIEVkaYQ__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

If you set up a filter which uses the outcome of this step,  then you will fail all leads that were not generated from a page which contains **solar** AND **offer** but does not contain **free**.

If you would like to accept leads with **solar** OR **offer** (a.k.a. only fail leads when none of the required text is found) the filter must check that **Trustedform Amount Required Matched** is equal to none.

That filter looks like this:

![](https://content3.bloomfire.com/thumbnails/contents/004/786/682/original.png?f=1738019321&Expires=1748567781&Signature=cwN4KwrZ3O7SnzT-rO6JQoDIZ2P4CvGPnMp--nXekbfWgkQBWj24XIwyxc623JHd9BAEtlOdc4lufwBnPeEVsHb2xSewW48clnVMaqrsfvCauoha3IEb-a6jmrbGcuhvOyFX8PPiHrMaK4caE-COWgGSXYiAa1HNkCeeiK4jnYkl-v4bHscv3tU-sDrs6k2ILJ3x~goI7ePxHvgZfKmwMsSh2GbOw6NfIvneDBAYvc1i0jJF0DSc1Ce~hk4WEe5DTYKo4WoX5l8tUMfeTKRxGJJUiZWKPMQEPzbLzvGoafF2lrr~xnI0gOon5MPcK~EJ1V5a2zNq-QbhrjLnB1LLoQ__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

- Amount Required Matched: How many of the required strings were matched? (all, some, none)
- Amount Forbidden Matched: How many of the forbidden strings were scanned? (all, some, none)

**Example Scenarios**

**NOTE:** Required and Forbidden text ignores casing and multiple whitespaces, but the text must otherwise be an EXACT MATCH.

- **Scenario 1:** You configure the required text "" **Telemarketing** **CALLS**"" and the page has "" **Telemarketing** **calls**""
  - **Outcome:** **PASSES** the required text audit.

- **Scenario 2:** You configure the required text "" **Telemarketing** **CALLS**"" and the page has "" **Telemarketing** **calls**""
  - **Outcome:** **FAILS** the required text audit because there is a required white space between **Telemarketing** and **calls**

- **Scenario 3:** You require the text "" **prerecorded telemarketing calls.**"" and the page instead has "" **pre-recorded telemarketing calls!**""
  - **Outcome:** **FAILS** the required text audit because:

1. the hyphen in the text and
2. the exclamation mark instead of the period at the end of the text.

Type something"

