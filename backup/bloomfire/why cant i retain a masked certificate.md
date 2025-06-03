---
URL: https://community.activeprospect.com/posts/4887952-why-can-t-i-retain-a-masked-certificate
Page Title: Why can't I retain a Masked Certificate?
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-4c84d16f-8691-4bb6-a4dc-c12b69c046c6.png
Scraped At: 2025-05-30 00:16:49.750
tags:
  - seller-focused
  - intermediate
  - trustedform
  - compliance
  - conceptual
  - universal
  - operation
secondary_tags:
  - reference
  - troubleshooting
---

[![](https://content2.bloomfire.com/avatars/users/1316943/thumb/thumbnail.png?f=1612413648&Expires=1748567772&Signature=KAotkB~iZPVlU5vF6k3sjIruGPNNzti5gYGhyqZXKi8PGwUhEWk~hbXEubN2gHd4P7MU85pYqMXLLlE4CiywRIVIBVNXCX47WqcR8a2mzhCmjdLKDxS~-XnqYFRAdhNckoAB7LiJNM7Gu~iJj1UrhbKPaNavBQgDSih699SfeEfvnF4zldhkhClubYPeWDR66yhXtKwqKXTyRMfIBqQkaUO-5XcpK70nam7V21v3eA-2-dRvN7QDAJ23-0xoNrpKzy5VwDx-HsL0yrcMVDJMXxxBY6OfsppcxBcRvzoQ55Jq5w9jeGbKuTuG16Sh9iiDGts66tQk0cm9FkzOJb6EVA__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7557566-ashley-thomas)

[_Ashley Thomas_](https://community.activeprospect.com/memberships/7557566-ashley-thomas)

Updated August 30, 2023. Published December 12, 2022.

Details

# Why can't I retain a Masked Certificate?

A masked certificate is just like any other TrustedForm certificate in many ways. The format of the Certificate URL is the same and the certificate is proof of a session giving the location and much other information about the consumer who filled out the web form. A masked certificate is like any certificate, except: the masked certificate doesn't list the Page URL for the form and excludes the session replay showing the consumer session.

If you can't retain a masked certificate, it's likely to be because of these two factors:

#### A. Short Retain Window

Masked TrustedForm Certificates have a 72 hour retain window. They cannot be extended. This means that they must be retained within 72 hours of their creation.

B. Your retain always has outcome ""failure"" with the reason ""None of the provided fingerprints match""

This message is a cautionary message because the web session html is missing in a masked certificate, and it is impossible to check that the email and phone  in a masked certificate matches the lead information.

#### Check whether you should be able to retain the Masked certificate:

1\. Bring up the full Certificate URL, beginning with [https://cert.trustedform.com](https://cert.trustedform.com/), in your browser.

2\. If the certificate can be retain, the page will show a banner giving the retain window, as in the below example.

![](https://content3.bloomfire.com/thumbnails/contents/003/867/959/original.png?f=1693420590&Expires=1748567803&Signature=eW6WjjGFujKf0SUaC2de-CXzyose5gjwQ1lR6-UmsP2ZXxcNkOm0a-Bxz11LfrPeqazm63U3ssIX1rhYVYRvlQuPAa3Cc~RGDEq~mF4xFQbqUyn0kkdqzcCExKhF9vEhAHzTn0Rnw0eFarrnQpnjTJECF2kLtPuMhU9tonfZMYzl-E-cNRIFDuWBSP~TEld83VgQFtT8xRZ79oearqahxcabtL2eUhHb~f4SR9ACJ4pnLLieef~okdhUR141XBF4OSGpNm-sMS7B-HS4fuLGqVXYTaelOVY1-65a5rI8~xvERuZXt9l5gFIgwqEfyKxjsXn4TEIC6lGYlClp0ln~Dw__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

For more information about masked certificates, [check out our Community pages](https://community.activeprospect.com/series/4882045-troubleshooting-trustedform-masked-certificate).

Consult our Community pages for [information about retaining a certificate](https://developers.activeprospect.com/docs/trustedform/getting-started-with-claiming/).

Type something"

