---
URL: https://community.activeprospect.com/posts/4078890-page-scan
Page Title: TrustedForm Page Scan
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-772887ba-e0e9-4408-8cfb-05b19797943e.png
Scraped At: 2025-05-30 00:16:30.986
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

[![](https://content2.bloomfire.com/avatars/users/1405246/thumb/thumbnail.png?f=1620827893&Expires=1748567782&Signature=p0pT1~1wcR-gU81DO8z6IZiv7o~WLLN~4VM~imVO9S8k93mWAt02SeJ40QznEe5d6Ai9pIg8F7Cj-Cf-PtYsqGGz9kltuFc9PZW5VIZ5usj62ZjwCDxc0sQE~eGKLaHogaFAIo7y0O92bwwb5j0-aXxdN97HXq71EOHRsgOAXa6y-lLup33TTtsLcWa75mamconkz6MIiu8qQIGq5CW6tgTvHu~RjCUSCq8hX9ygzZnaI2RrR~mRdiMyTznqQm0hKZieqZCsJGMGmmp1qq4fJZ9j0dA4csGdNfoR5Lu2Ug16n93fzXNCHyzB5kaRl6cbgmNM~5ii9HlDqH8LUVaAlw__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7846678-christopher-williams)

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

![](https://content1.bloomfire.com/thumbnails/contents/004/786/623/original.png?f=1738017711&Expires=1748567782&Signature=eqYuCOzYhp00uYldFPullFQuDQqEtwnF~jvN2zgb0NKzdQ3D9sen7cmPb7JA1OpF~PCXWwIdB3waouJtU3qsEicDbmj6t~4gMQ-ky2OyITWoHKXKac112lPVKCTa4Tqq1Ggg8XYyx4kqsDrchnRzM3uSXvFv~JblLm7Q1r-YiC4yrdckMkdGX-b4AJWbs4wJUvSuX6tpVg5bhGJn5WyS9cS~V4wcNFXiq72HhsrMn5MKFk4ZhwZgnM1qiCZrtTIaSJwjOdix9RF~qVsdcvkkGBZ7FOXv4LbUxCgMdwmUVPkdvBjflMt0a~JEbGwCuiYIGWEkq13FMS1uyUR5vxqatg__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

You can specify them here, or do it later via the Edit Field Mappings button (you can add new or edit existing field mapping settings and define what you want to require or forbid), like shown below:

![](https://content2.bloomfire.com/thumbnails/contents/004/786/592/original.png?f=1738017288&Expires=1748567782&Signature=gOThI17yV3g7-dN2ChY1sqUbftf5pXu-XpdYqasihPA1Lwx9gYa97pqoroP62Lg2tkD4Recq6yyF02SMpCfKXedOofGb8PpOUIoljBR5D3EAIIaMQxMJMV~QkFG0KgeTq1~FdQerEcNCJx3PUm2Z5S3O4KLQsQ1axbgnkzcIoi4en2dvF3OEJmxOfS40aPkOytXSshLM~aGL-LFGr9280dBg~XeDY-RHE1HRmkqTK~xijLofLioujwXDk-Dvakhs4lMTTgX5yt9~g66JVhtc-7U2qD76Fgsol-yt5E581AwGTR0EhED2mrrnkRGicfNQjKwF0~SqesL0ZfmQA84Rug__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

In the example screenshot below, the required text is **solar** and **offer** and the forbidden text is **free**.

![](https://content3.bloomfire.com/thumbnails/contents/004/786/642/original.png?f=1738018422&Expires=1748567782&Signature=s2IBmRVQJ6iOoBp1VqizWdJjajnKUHcu0OXMnw2TARv19nq-ln3LI3YxwzGM~m5HdDVdAj1vXg-QWYKYIb8tnKHK8D0W3hsbB--MRHn-6lKbqwL9p8ismNvVGO~-Qsdx6DY8oMD02TSurw7ZL4tp6xLrVEtn~~y0BfXgWlo9TrG~fh4r2J0gLkaprkE686AK0V0DSNoaF~c4oI1EiadP45VQ0dDQXMAfd~8wM4qbBDRe22v8WsUftrsWe-NGECp0xAC5nXMmAsQwLtBkiWUAB96coAELT67Xd7~bDF6f6sDoRTxhLSbJldxIWo7D73WTrDlaFj4zV~91V0wPIvbytg__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

If you set up a filter which uses the outcome of this step,  then you will fail all leads that were not generated from a page which contains **solar** AND **offer** but does not contain **free**.

If you would like to accept leads with **solar** OR **offer** (a.k.a. only fail leads when none of the required text is found) the filter must check that **Trustedform Amount Required Matched** is equal to none.

That filter looks like this:

![](https://content3.bloomfire.com/thumbnails/contents/004/786/682/original.png?f=1738019321&Expires=1748567782&Signature=lI7G4n~Dz-wVyBiHBwAGY5sr3ZaO~cs34sj1rKeD6EJF5-jaMr-mUtFeBdA2Q-NMaw6dBeA9K7NT8mg7rG8s~zBBC2L0ciWNFVUwKfBf3JEUyesZihj3HJBAZzc1Yl29QJOctaw~PEdgEc3Ngpgtn78WPBsRoFP8YH0K7LR~Vf0ZPhX1Xp5~xW9uyfN5KWrFlJdtdxP5f6btQchAUcCs9xJmwUEEiPlFGwQJxWFLB82GGf0ZjIpCiAwu~Z~3A66d9lkn3MPk4K6a6rGKZtOa~9FUu9bMTkKnCM2Ptu~84V~xvo~IVAqcrsidioPIz~94TqVTbP4VE6mP9FlpKYGA-w__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

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

