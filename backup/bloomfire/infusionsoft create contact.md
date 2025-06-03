---
URL: https://community.activeprospect.com/posts/4125039-infusionsoft-create-contact
Page Title: Infusionsoft: Create Contact
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-033aaa39-1c80-4d10-ade9-f3c3fe9a5578.png
Scraped At: 2025-05-30 00:15:59.993
tags:
  - how-to
  - intermediate
  - data-management
  - integrations
  - seller-focused
  - troubleshooting
  - flows
secondary_tags:
  - universal
  - operation
  - reference
  - developer-focused
  - admin-focused
---

[![](https://content1.bloomfire.com/avatars/users/1317000/thumb/thumbnail.png?f=1617311121&Expires=1748567752&Signature=X9fj59kSmWD-4zTnYmepc5gKRqn2PVncexDVa9LApbv-iop7C63UHcLx-fmxxAoLfRrlGiNk-rg7X~UUep8r-a8vX6Tk1P1Bra5LYbgpGLC9HWJBpqE5XIPK4BasUHX4ECchDubxZawERW9evx5dHSjZn1wkV9E9~XY8T4kDPRHDwRQn~DCD7Juh~~yOnadsDl-CUOcQZiZBOlTYMLytIDjBPLpNmADr0avpxQbIwEmHzOpMn~QvpKFhZkCn29EcInQ9YaKnmkoXBT-FopoN74PSKZuhnhN8-uhwLbtvlUlJv~uQYG8ise8NP2nQS~BfpVJiWF1xeERmGTQWG1GzSg__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7557680-scott-mckee)

[_Scott McKee_](https://community.activeprospect.com/memberships/7557680-scott-mckee)

Updated January 8, 2021. Published January 8, 2021.

Details

# Infusionsoft: Create Contact

ActiveProspect integrates with Infusionsoft to offer [the Create a Contact action of the Infusionsoft service](https://developer.infusionsoft.com/docs/rest/#!/Contact/createContactUsingPOST) directly through LeadConduit.

InfusionSoft is found in the list of Recipient Integrations:

![](https://content0.bloomfire.com/thumbnails/contents/002/452/203/original.png?f=1610131262&Expires=1748567752&Signature=nQCFh6s~cI7SYpHqrE6fvQwQyjsxyDa-u8dELnzMI3T0UnScGFiKubi5TgU-n~DKAl1cQhwW4fZPSa5tlE~s70Hbjdagpdy0U2eD7MibY3Hzj9HF08Yj4CPyS0QB6E9sueOZGi3BSIjhw5DFALVvpiGCI-F~mCQUts0JiJn2d6ZXpCKOshoeTRttGWRIiIUtpuQxtQZTJddHbdGIGkwA2Dmht1r-B~zwSlXu8195OQqlh623waA5KbpykUsQ0VOAkrIkL1WTxChuqX8aY5AXEKyFgqQlljIWjHJjHH2jsic5etibtA9EfBazk-1w5EzOO2iAS34vvWf90~NLuojauQ__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

# Finding What You Need

The UI will prompt you for the following:

- An Infusionsoft account

The integration will prompt you for your Infusionsoft credentials.

![](https://content1.bloomfire.com/thumbnails/contents/002/452/204/original.png?f=1610131291&Expires=1748567752&Signature=t6u-kULzjBrLNAO1jv9ZS8XxdJ9-iGBqXU1FWf2Ia~hQ8Kzy-9eoVlFmm8b~S-Pjs0bPNtjpqbEKiUJbe9pzgnDlzA-9cU4Dj4j1DnpVlEYhRH5CdfqiF0hdXpwAZ9Oygm8ZJxpZ3Qjgw47fqE8VLUmpqCJ7A4gjtogidcP5NCv9QWwHC1KxkHArTQfyt9joJ6I-~6BCr89OFT2W7bBrHFFCICjxPpTj0EwEpCCYuygo9uoNWg2aX6bX~VaFB5HUPChJL4aLbBywOTP10~iY-zgCzPf02uJX8BVmNdijaaiiXDrutg3pUayjCVRWLdo4KC5klzD6BkOF1tfPKLmJHA__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

Log in and the integration will take care of the rest!

![](https://content3.bloomfire.com/thumbnails/contents/002/452/208/original.png?f=1610131317&Expires=1748567753&Signature=bauJAX~wDHV1zab9Q2pRbkle4PrXij7J6AIa9WiKYJYN0Rw51Q9X7nr0EdEty1cIoKk7GaSczDjduy4MjdZ7hUDg8E8poIh7nKUwebwvHRlvKmCavunBtdcOpMWg4nmm8~g2GjPigjxdFzAlSinGdbzzdEB7OercyGUwONRIXJdegY73t-jFVWf9vyAeHnr5M8Wqzt75SyNJejyDjIcR3ExC41Ay7x-yx3rQMp80AtxzRxINFUlrUr177LXZ75oZYqFpaqpDah06y3ceGXzT6o64O2fXEnKT2ipms3xQufzOH3Byzjs6bhqQohUg~oInBKC9HWI9qIxXg95idrGO4g__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

# Making a Decision

A filter must be added after the step in order to make any decision based on the outcome of the delivery. Usually, you'll want to stop the flow when the outcome of the delivery is anything other than Success. A filter that catches Failures, Errors, and Skips will do the trick. Here's what that looks like:

![](https://content3.bloomfire.com/thumbnails/contents/002/452/212/original.png?f=1610131373&Expires=1748567753&Signature=J--ju9I7pTRMw3bHhaLXZbh6rkxIVrkM4VU40Usw9oAfIq~5EXs4NXx0dl4oZsRjSNTz~ZmHPloGUfxFSzWY22gYfTplWe-NgEWGbuD-wmYOqPsB-x8tlHDjF7F22hiMbctwD57JSoicuRrYr~B5D4zV6vDCmnvLGryrKpmVcAB7U55Nqc9YFwURf~tJ5vU8QJyReUDXLKo7TRhFhl7Xntya3dFmJb6K8UWZuLVUyKdUefi7WTtUxpegM9Htx~IpFK5pP6SQ08AScdmRmbpk4ycu4o1mz1qRiHBP8oZ8qwZ3CPTEhSIqpnMeBzcgSVvK6f5gVr1TBMii-ood4FEUEQ__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

**Save the Flow** and you're done!

# Automatically Mapped Fields

The following fields will be mapped automatically, meaning you don't need to do anything to send them to Infusionsoft:

- First Name
- Middle Name
- Last Name
- Name Suffix (Jr. Sr. Esq. etc.)
- Email
- Phone 1
- Phone 2
- Phone 3
- Address 1
- Address 2
- City
- State
- Postal Code
- Website
- Comments
- Title (Job Title)
- Date of Birth (DOB)

# Manually Mapped Data

The following data can be mapped manually in the field mapping section:

- **Address Type:** Default is BILLING
- **Contact Type:** Infusionsoft contact type
- **Lead Source ID:** Infusionsoft Lead Source ID
- **Owner ID:** Infusionsoft Owner ID
- **Preferred Locale** Infusionsoft Preferred Locale
- **Source Type:** Infusionsoft Source Type
- **Custom:** Any other fields not listed here

# Integration Fields Returned

- **Outcome:** Integration outcome (success, failure, or error)
- **Reason:** The reason if the outcome is Error, Failure, Skip

Type something"

