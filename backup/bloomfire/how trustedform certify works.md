---
URL: https://community.activeprospect.com/series/4720459/posts/4128458-how-trustedform-certify-works
Page Title: How TrustedForm Certify Works
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-34e9dcba-5969-43b6-8991-e50ac77cf32d.png
Scraped At: 2025-05-30 00:16:52.437
tags:
  - trustedform
  - intermediate
  - compliance
  - how-to
  - developer-focused
  - data-management
  - technical
secondary_tags:
  - seller-focused
  - analytics
  - universal
  - operation
  - admin-focused
---

1 of 8 [next page](https://community.activeprospect.com/series/4720459/posts/4388124-trustedform-certify-and-multi-step-forms)

In Series: [Implementing TrustedForm Certify on third party form builders](https://community.activeprospect.com/series/4720459-implementing-trustedform-certify-on-third-party-form-builders)

[![](https://content2.bloomfire.com/avatars/users/1405246/thumb/thumbnail.png?f=1620827893&Expires=1748567782&Signature=p0pT1~1wcR-gU81DO8z6IZiv7o~WLLN~4VM~imVO9S8k93mWAt02SeJ40QznEe5d6Ai9pIg8F7Cj-Cf-PtYsqGGz9kltuFc9PZW5VIZ5usj62ZjwCDxc0sQE~eGKLaHogaFAIo7y0O92bwwb5j0-aXxdN97HXq71EOHRsgOAXa6y-lLup33TTtsLcWa75mamconkz6MIiu8qQIGq5CW6tgTvHu~RjCUSCq8hX9ygzZnaI2RrR~mRdiMyTznqQm0hKZieqZCsJGMGmmp1qq4fJZ9j0dA4csGdNfoR5Lu2Ug16n93fzXNCHyzB5kaRl6cbgmNM~5ii9HlDqH8LUVaAlw__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7846678-christopher-williams)

[_Christopher Williams_](https://community.activeprospect.com/memberships/7846678-christopher-williams)

Updated August 31, 2023. Published January 13, 2021.

Details

# How TrustedForm Certify Works

What happens when a consumer views a web page using TrustedForm Certify?

When a consumer visits a web page using a browser, the browser downloads a set of instructions on how to display the page to the consumer. Those instructions are called the Document Object Model, or DOM. The browser retains a copy of the DOM in the computer’s memory and uses it to create the visual elements on screen. The DOM may also instruct the browser to fetch additional files as needed (images, videos, sound, scripts and more).

Here’s the DOM of a simple form page using TrustedForm Certify:

![](https://content1.bloomfire.com/thumbnails/contents/003/870/620/original.png?f=1693503494&Expires=1748567805&Signature=Bja2WK2~q1xhIV-wB~9-ZnKknoIZZgxQmPt1JZuuB2FOjL-04KZGOESD5zVgaXhw4h0eO1vRUU~ZSk4TtdX0uOmeqWIrLnAnFn2hCniIsK8EXWkLkCPuVw8L5~OLOmIBd~l5yQSuVTM~TpshmMHB9gvmgp9itKctPNWGpfTpjKuud5BXis47asO93k0qFHaiFVcSX6LaoSAK-2LD1caJBBvbmso6zYAuudJUKA~~hhb-wJSVZwgR-Rw-r0Yf63~D4TE4957ryG~l9jnYeD~vB9v-4gCP2LGS061zaqRHghiSYgdxsG0H4Ut-s00OujWUKlPySgrJiJ-4B93v6-wLhw__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

The TrustedForm Certify javascript snippet is part of the DOM, placed there by the web site’s developer. It executes once the page has loaded, first establishing a connection between the user’s browser and the TrustedForm service. Then begins a series of exchanges that occur in the background while the consumer has the page open:

- The browser sends to TrustedForm a copy of the DOM and details about the user’s computer environment (operating system, IP address, browser type and more).
- The TrustedForm service sends the script running in the browser a unique identifier string in the form of a URL. This is the TrustedForm certificate URL. The script modifies the in-memory DOM, adding hidden fields to the web forms in the page, and populating them with the TrustedForm certificate URL string, So now, the TrustedForm certificate URL fields become part of the data payload to be submitted to whatever server the form has as its target.

Here's our simple web page with the script-added TrustedForm fields:

![](https://content2.bloomfire.com/thumbnails/contents/002/460/623/original.png?f=1610549173&Expires=1748567805&Signature=fbAxppquyM4VQpkiMTRdLSqd1D7CjyAJBOKG9oLwpKat0iGFnnZ-6yTGozrOm8k0PaxV6RASqnTHltbhZtvbp-J0nGdM4e-EVgyz2ajeI3SD2IyKW8fYzyH92UzH7TZhfCAzFDQFASPn-0yxDUBkuPajvvBdBBeAg-A5VjBjma4KLh7abEs6LyDEyKLLVxgB-NxkYIPMv9DBuydWJJhuQU2rqb9LfPtCIJa2I-OXWAVnFA8PWxV49DCEwZCFVzIVEFY3-GNWO9--ClCQ~HiWogOlBUcVEaobOss8BaYnYM3I75kssZE3cp5qSg3G~zNu~YCsvuBqoPKHasdbIqqH2A__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

- As the consumer moves or clicks their cursor or presses keys, the browser sends a record of those events to TrustedForm.
- When the consumer either abandons the page or submits a form (which also causes page abandonment) the connection between the user’s browser and the TrustedForm service closes.
- At this point TrustedForm saves everything that the browser has sent up to it. This is the TrustedForm Certificate. It retrieves any additional files specified in the DOM from their respective servers and adds them to the Certificate, which is now complete.

TrustedForm will store the certificate for 72 hours. This period will be extended to 90 days if the consumer actively submitted a form indicating their intent to have their information saved. During that period, any one who makes a paid request to retain that certificate will have a copy of it stored in their account for 5 years (unless a different storage length is negotiated). They can then log into their TrustedForm account and visit the  TrustedForm certificate URL using their browser to view the certificate. The certificate displays the metadata about the visit / lead event and a recreation of it by replicating the user’s cursor and key events on top of a copy of the website as it appeared at that time (the “session replay”).

Here’s an example of a certificate created by our example form:

![](https://content3.bloomfire.com/thumbnails/contents/003/007/365/original.png?f=1639594297&Expires=1748567805&Signature=SBXSbN-5V5idjarZpxYTyr~WSB9ezMdwyiKdJysIKrQ-qbBEFnG5Uoy3NVPL5U8BdBqodwQyh3NVSt6-mph2-5poKiZ5FpVCU-7Uqh5ZW4RiFDuZA4oNsyPMGbyLYNeMQVGh~2-yRo5wCtieKhQFFJSPxubyFfU3~roqyVsmLdjX4xxRY9d0jkOiMxoguuZkNMfZEse4OCDCSmlueWBL4YpxBO2mBpI5FC1ysFrekcCD4Ou2LbIHLKWuU3zbFH~iGsblVib1e3~VuxzHqIY~ov0mIWv8TV6~3wLlUDQpyULGxRCkPGRh8EEnvnTp7ZRWPEjRD-PYZvxynh0dyc5BLg__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

Try our live [TrustedForm Demo](https://activeprospect.com/products/trustedform-demo/) to see how it works for yourself and view a live certificate and it's session replay.

Type something"

