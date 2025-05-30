---
URL: https://community.activeprospect.com/posts/4078890
Page Title: TrustedForm Page Scan
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-99ba5256-af6a-4641-9379-2124c64cb5a4.png
Scraped At: 2025-05-30 00:16:51.446
---

[![](https://content2.bloomfire.com/avatars/users/1405246/thumb/thumbnail.png?f=1620827893&Expires=1748567802&Signature=EsZDWCcQ90gjY757GOKKxTX6ewy4iVikvfVtgJ9Q2zNPavvuY-98g9HrFj4BtMdEF2aQR0VZxUb1Cis3VWnH91SnA2T2fkzyFENqkWvoxIgM5No9~uKQzD0VRNJF4Uagl2tJdSgLOA9NmTM~huZdGoG3Yltn8nMFwLejFUZ1xNQ8R~R0Y50NlMXLqeIrKxGWuSTTO56oCjVbB7l7b52cS5LKRsKMpVqR12C0clF3AFMcLi3NSsLfvWeiwFKHdLS~pyuSet5lpbtTxjU4cWxotKqOeGZ31IoxSFFZJ~r8j4qtBcdgKxLkXS-vpE-oM3PA01I1B5n64oy-jMjXzOqeUQ__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7846678-christopher-williams)

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

![](https://content1.bloomfire.com/thumbnails/contents/004/786/623/original.png?f=1738017711&Expires=1748567802&Signature=Rf~daUD7nk7Zx7kl6GE9g5mogNUUt2ZdfQHZEEa4g2SvoOTn8XoU1DJD-CPJofVbuO0DPPveS8GiqICN9NLIHab~Eq05dSURVi7pkd26niwo8LcbbmbdhS-2bgY7MrtyX3~WwvvWC-~JTNwKy3VqUFAg66R8ldSSH4Unazvjkq7JlmywJjwmHDsIdnRCgmwNYMrUHVCNLsAsnFWqbBLK6hNd988sP-nMX-8rS~bdgfpTFzTrnywVyKd3fmBRbZcW3l88XkGG4FqTMhHFHZ~tLIR0QRE2SF8OO9Ex66zgEfRJCwZ5kds8Q~OCoV0yF0iKjoYEnaDRMn8wxwMXpOZ39Q__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

You can specify them here, or do it later via the Edit Field Mappings button (you can add new or edit existing field mapping settings and define what you want to require or forbid), like shown below:

![](https://content2.bloomfire.com/thumbnails/contents/004/786/592/original.png?f=1738017288&Expires=1748567802&Signature=p7FYt7rNOPPHrAsxonORr-OypXfXOLsxqP2RaHPwlc~6OF0qTZtuC7HdIYFXS-fVv6l-G1LDZvbXvoXSogu7ATIs5XKjE-oHddNbhPtL-S98PwwkXFHlYXtFkTy~NCZvZZUphHjSd37Q8dLFM2QOEqMvsPxhQSrTUUBIwQ6muTq183xsQfMlqle3F9PUtnIekM4XcoHdI-N4M2cUhL9~XMV9jOstizSc8Q27MqJpna4H0FUnk3gmVwlXbgD~zEZxrCL-kjgwCwdyBQlr42YWJ5HaeYiZhqFGVrCJKx4Gmjw7bg7iRmrPYuZotN5fUFLB7fHMvynZg5JgrZvJrgdEfQ__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

In the example screenshot below, the required text is **solar** and **offer** and the forbidden text is **free**.

![](https://content3.bloomfire.com/thumbnails/contents/004/786/642/original.png?f=1738018422&Expires=1748567802&Signature=YH6uc3SzeeyM9k0LcNfR3EB-K3HIyyw7auywk34ErUD-JzPHv16HmesnkYx6Etx5n-Aylq-YKqPjCgy0spaWmpitAcQ-YRRIXbb6GgUgs2HU3JutlrUItK9bD4FssDZoaMI46ljJLEmczn95GUEzbYST0gsTGF1EqBnfVsDglPYhBmzb1SN4Ibdw3OXq699wDi85aFzbMHO05ydU0yonVgZnBsFFHaCHo~D~HpmOd9wsTiX9QMuAo~RfKPfETHUoagS0mylDHU5WOYVFATiiTFt121s8mYJ5t6J3vpZpMCbyFvlKcKUF~K7VFhz5Gl6eTNlu1Xtr9bazwEsK5Qk~Wg__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

If you set up a filter which uses the outcome of this step,  then you will fail all leads that were not generated from a page which contains **solar** AND **offer** but does not contain **free**.

If you would like to accept leads with **solar** OR **offer** (a.k.a. only fail leads when none of the required text is found) the filter must check that **Trustedform Amount Required Matched** is equal to none.

That filter looks like this:

![](https://content3.bloomfire.com/thumbnails/contents/004/786/682/original.png?f=1738019321&Expires=1748567802&Signature=hM7gBtiPRndFM5UYUTmHySAj-Wn3jB8y7EvoF8xbxKPLgWKDQhWulY7C5vMy5GCQx73HODcAuDQvzoDPBTPC5JCBlT9k51J~eByuD8uCOg~I8RBOy6~DHt~shMKYahVOpZhSnuyypyXa-WBctyXow7OI~XAsZh4RaPsEve5dj5fZ8z8Njbnzu9jUxMRSImnEZHlguczl3PypU54HrvICVv-kW-1fM35kn56H~HAagxIsmBn6d0rFPSo-rRN6uLYeBwuFCPauRKzFQVae0cPkKegBNtaBjEJE84Y5atRxySGg260~EA7HPfKdLNYorPN4IvFW2rdz9jt~Fq6WJUxqFQ__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

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

