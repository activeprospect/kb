---
URL: https://community.activeprospect.com/posts/4885100-how-to-claim-an-individual-trustedform-certificate
Page Title: How to retain an individual TrustedForm certificate
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-7cda9a62-c7ba-4b71-b81d-0c89c150d93b.png
Scraped At: 2025-05-30 00:16:49.746
---

[![](https://content2.bloomfire.com/avatars/users/1316943/thumb/thumbnail.png?f=1612413648&Expires=1748567772&Signature=KAotkB~iZPVlU5vF6k3sjIruGPNNzti5gYGhyqZXKi8PGwUhEWk~hbXEubN2gHd4P7MU85pYqMXLLlE4CiywRIVIBVNXCX47WqcR8a2mzhCmjdLKDxS~-XnqYFRAdhNckoAB7LiJNM7Gu~iJj1UrhbKPaNavBQgDSih699SfeEfvnF4zldhkhClubYPeWDR66yhXtKwqKXTyRMfIBqQkaUO-5XcpK70nam7V21v3eA-2-dRvN7QDAJ23-0xoNrpKzy5VwDx-HsL0yrcMVDJMXxxBY6OfsppcxBcRvzoQ55Jq5w9jeGbKuTuG16Sh9iiDGts66tQk0cm9FkzOJb6EVA__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7557566-ashley-thomas)

[_Ashley Thomas_](https://community.activeprospect.com/memberships/7557566-ashley-thomas)

Updated July 24, 2024. Published December 7, 2022.

Details

# How to retain an individual TrustedForm certificate

As part of your lead management process, you will want to automate the retention of TrustedForm certificates via the TrustedForm API or via ActiveProspect's LeadConduit product. But every once in awhile, or as you're preparing your automated process, you may need to retain a certificate manually.

## The quick method to retain: Click ""Retain Certificate""

By far the easiest method to retain the certificate for future viewing is to

- Display the certificate in your browser, and
- Click ""Retain Certificate,"" the green button displayed prominently on the certificate.

![](https://content0.bloomfire.com/thumbnails/contents/004/287/028/original.png?f=1714593333&Expires=1748567803&Signature=iDOZQPxyloPc1MPV1bIUtoqihVuB9w8JQWgYkbV2XIiPX29CAfRWPPEV3mGVlL9sEOroI2HYZ0uCyp9MxLoGtghPLUxMW~i~-Uv5tH2PZ6B-Gr0d8pzr6tK0CSH9UzG0OHiw6NO0Xgj~avNoUoHBZac7sMbE9NdRtBSYRNyE1~VrL8ETG~on7voS-ddlc8LyIjILkTD058NZCf8pAniwUpJH5VSJDU-6fnEdeztpJMACqei-7Z6Yvj1Iif3Nk-OCReEztJA33AiJ8DWjQ5ZWK~92meqvEbCoWxGJR6JkrO9kcm5Zc--i~ilzQBmeCrZU8sysGIVwBWoz4jrkHnROqw__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

## Manually Retain and Perform Lead Matching

You might want to perform lead matching to make sure you confirm the email and phone that should be retained in the certificate. In order to do this, retain the certificate via one of the following methods.

To retain a certificate manually, in both of the examples given below, substitute your API key from the TrustedForm Settings instead of ""9e46a3b3c2456f33bec5ec51b7cb68"", the TrustedForm Certificate URL instead of ""[https://cert.trustedform.com/b3220852042971a00f5d05766254e6b0747e24dc](https://cert.trustedform.com/b3220852042971a00f5d05766254e6b0747e24dc?__hstc=41051389.ca004fe17407d98c67c1fb1d809a1916.1748564204628.1748564204628.1748564204628.1&__hssc=41051389.1.1748564204628&__hsfp=3707738794)"", the lead's phone number instead of ""5555555555"" and the lead's email instead of ""example@gmail.com"".

A. On MacOS X:

1. Open the ""terminal"" app.

2. At the command line, substituting for the API key and TrustedForm Certificate URL, enter this and press Enter:


/usr/bin/curl-XPOST-H'Content-type:application/json'-H 'Accept: application/json' \

-u'API:9e46a3b3c2456f33bec5ec51b7cb68' -H 'api-version: 4.0' \

--data '{""retain"":{}, ""match\_lead"":{""phone"":""5555555555"", ""email"":""example@gmail.com""}}' \

https://cert.trustedform.com/b3220852042971a00f5d05766254e6b0747e24dc

Please note that the above request uses api-version of 4.0. If you have 3.0 (and please check your TrustedForm Settings to determine this) you will need to change the format slightly, making the same substitutions for email, phone, and the TrustedForm Certificate URL you want to retain:

/usr/bin/curl-XPOST-H'Content-type:application/json'-H 'Accept: application/json' \

-u'API:9e46a3b3c2456f33bec5ec51b7cb68' -H 'api-version: 3.0' \

--data '{""phone"":""5555555555"", ""email"":""example@gmail.com""}' \

https://cert.trustedform.com/b3220852042971a00f5d05766254e6b0747e24dc

B. You can use [Postman’](https://identity.getpostman.com/login)s web client on any browser and do the following:

1. After signing in, navigate to the “My Workspace” page.

2. Select the import button on the left side panel and import the Postman collection that matches your API version.
   - [Version 3.0 Collection](https://drive.google.com/uc?id=1pk9ut9e8Y8l_c_UMpP7UxVAq-45iPFWk&export=download)

   - [Version 4.0 Collection](https://drive.google.com/uc?id=1kaHFx1ZnSoKya_zqirzkepF8bG0kiqTK&export=download)
3. Expand “TrustedForm Certificate API” collection and select the “Retain Certificate” POST request below.

4. Enter the TrustedForm certificate URL into the labeled field next to POST.

5. Enter the lead's phone number and/or email in the labeled fields in the body section (if applicable).

6. Select the authorization tab, and enter your API key into the Password field.

7. Click the **Send** button to retain the certificate.


For more information:

- Consult our developer articles on the TrustedForm [Retain operation](https://developers.activeprospect.com/docs/trustedform/api/v4.0/tag/Certificates/#tag/Certificates/operation/ClaimerWeb.ClaimController.create_retain).

- Consult our community articles on [retaining TrustedForm certificates via LeadConduit](https://community.activeprospect.com/series/4114377-retaining-claiming-trustedform-certificates-with-leadconduit).


Type something"

