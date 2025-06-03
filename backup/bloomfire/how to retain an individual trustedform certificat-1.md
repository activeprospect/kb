---
URL: https://community.activeprospect.com/posts/4885100-how-to-retain-an-individual-trustedform-certificate
Page Title: How to retain an individual TrustedForm certificate
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-e5022ff8-a23b-4b0a-9259-0245dfce68c9.png
Scraped At: 2025-05-30 00:16:10.174
tags:
  - trustedform
  - intermediate
  - compliance
  - developer-focused
  - technical
  - how-to
  - data-management
secondary_tags:
  - universal
  - operation
  - admin-focused
  - analytics
  - semi-technical
---

[![](https://content2.bloomfire.com/avatars/users/1316943/thumb/thumbnail.png?f=1612413648&Expires=1748567753&Signature=P3xB0av-YFWmxhmHudN4yB60keRIy3JYC3qf80R5GOQ9TSVkAegqytHgah~HXaFkr0HPfiFXsGZ9b6iNl1U6grxFxrGuvaLXUYarh7aeq793MTgHRPaVNgcxPf3tXvS4Q9ZZXxWLME9-W2yZAgzq0L0GMNPTFlvc9oO1iO1PU9TrBSC25TEHbYSET99L~lHlcBVRE7tTGtgwb0R80ow-T12yyoGeZN019kfqLtOpZqkgFuJ5HJjDNnM~xcIlmomBGycOk8pMGGp2HjpY4Y2km26tye~lwDiWNSTPjGpWMOeMCpW6MIUZa2ZphmkgrbSA~1kolDSOW-uWWaXTUegeYA__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7557566-ashley-thomas)

[_Ashley Thomas_](https://community.activeprospect.com/memberships/7557566-ashley-thomas)

Updated July 24, 2024. Published December 7, 2022.

Details

# How to retain an individual TrustedForm certificate

As part of your lead management process, you will want to automate the retention of TrustedForm certificates via the TrustedForm API or via ActiveProspect's LeadConduit product. But every once in awhile, or as you're preparing your automated process, you may need to retain a certificate manually.

## The quick method to retain: Click ""Retain Certificate""

By far the easiest method to retain the certificate for future viewing is to

- Display the certificate in your browser, and
- Click ""Retain Certificate,"" the green button displayed prominently on the certificate.

![](https://content0.bloomfire.com/thumbnails/contents/004/287/028/original.png?f=1714593333&Expires=1748567764&Signature=P892ZGZLJoNbC4QGIkqt70A97sLtMjFOdVCCXfXuQlI4IwcW29xi3zj1elKoen61WeX8dzJOu3yUTXlQe9uJtqq7QUX4UC24V26S8LZNVtDT2GjCBtNoZS1kj96KL6kJyi4AL7KQtl08aUHBN9yK-NBjv87oCzM9En2k0DcQT6kqGDB247wThTQmZ45hyyR6~r5t-3CjxJkZndVnO0NpxNiaX4rUMwbTkEa1v5atlq4DHqwYGZ-XFt10qX92PfzlkXWMREoYJhnZFua1OKLwgKnw6l6KCCDjB2Q9tjO9QekLfNTAw63mB~jQ60fAy-Qy2sMttbszFY0p8BNrBrRJzA__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

## Manually Retain and Perform Lead Matching

You might want to perform lead matching to make sure you confirm the email and phone that should be retained in the certificate. In order to do this, retain the certificate via one of the following methods.

To retain a certificate manually, in both of the examples given below, substitute your API key from the TrustedForm Settings instead of ""9e46a3b3c2456f33bec5ec51b7cb68"", the TrustedForm Certificate URL instead of ""[https://cert.trustedform.com/b3220852042971a00f5d05766254e6b0747e24dc](https://cert.trustedform.com/b3220852042971a00f5d05766254e6b0747e24dc?__hstc=41051389.f70ea3dd8ebe8bf10bb706a3f2138ee4.1748564165452.1748564165452.1748564165452.1&__hssc=41051389.1.1748564165452&__hsfp=3707738794)"", the lead's phone number instead of ""5555555555"" and the lead's email instead of ""example@gmail.com"".

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

