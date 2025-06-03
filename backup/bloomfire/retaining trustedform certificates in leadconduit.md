---
URL: https://community.activeprospect.com/series/4114377/posts/4100506-retaining-trustedform-certificates-in-leadconduit
Page Title: Retaining TrustedForm Certificates in LeadConduit
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-6b20b47d-d74d-4bd9-a788-5c35beed6605.png
Scraped At: 2025-05-30 00:16:21.775
tags:
  - trustedform
  - intermediate
  - compliance
  - flows
  - leadconduit
  - troubleshooting
  - admin-focused
secondary_tags:
  - operation
  - seller-focused
  - how-to
  - data-management
  - developer-focused
---

1 of 2 [next page](https://community.activeprospect.com/series/4114377/posts/4114383-how-to-retrieve-your-retained-trustedform-certificates)

In Series: [Retaining TrustedForm Certificates with LeadConduit](https://community.activeprospect.com/series/4114377-retaining-trustedform-certificates-with-leadconduit)

[![](https://content2.bloomfire.com/avatars/users/1316943/thumb/thumbnail.png?f=1612413648&Expires=1748567773&Signature=SJ9HupwoINzVYX0ZKinKAOLGJv6UJ~hDD4lh4jTTwIahs9E2zsssLq1vbovV0dxe44skeyQxe3HvLM4jvWH4JqFHuBH8UBa7deM6FpFMJ6U~OKR3wMs-wk54EhIvkmvv9Maq6R79qfmCfdIUAdjt3XlP8oxtvqrRSNVyzTaeCmNp8yUbyRmYnErjBrClKYwKLVRVTcJIs6cylkSMnc2Cp3PyBgH82u1f~AGJZP~JQx5k6LC2SdzSPjWG4~q4MqYwtdhliEis8syoxdMm77fz5SMzrEtJI17B3Tj~gFdY0wy8oRtIjqug~tgOFMwR4iDsAPX-L9w6n8VnnzUF9RQVSQ__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7557566-ashley-thomas)

[_Ashley Thomas_](https://community.activeprospect.com/memberships/7557566-ashley-thomas)

Updated June 20, 2023. Published December 3, 2020.

Details

# Retaining TrustedForm Certificates in LeadConduit

ActiveProspect account holders with TrustedForm and LeadConduit subscriptions can easily retain TrustedForm certificates by adding a TrustedForm Add-on step to their flow.

If the TrustedForm step is successful (or even if it's a failure based on Page Scan requirements), we'll store your certificate for the amount of time you've specified in your account (5 years is the default). If the TrustedForm step produces an error, the certificate may have passed the retention period, the certificate URL may be invalid or missing, or the retain process may have encountered an error.

# Before We Begin

This article assumes you're able to post the TrustedForm certificate URL to your LeadConduit flow correctly. If you need a refresher, please see the Submission Docs located on the Source tab.

# Steps

**Step 1**: On the ""Flow Steps"" page in the flow editor, go to **Add Step** and select **Add-on**.

![](https://content3.bloomfire.com/thumbnails/contents/003/763/247/original.png?f=1687312482&Expires=1748567773&Signature=kgNdhnDAqi~g0I2k5bbBcYedn79vsfFI-YkqVIF5MF3TneMGnpaF50dPWzCjS9CUo2xd92AHGrluk2eKCgWOXkfjyOVhAYpu2KwUBWhx8ZEu2QFGaocoP~RnndXd1nnFtK4JmqO7db8b9o1c1Fe6-L7kp-lnuCT~xXcVgB~L62OwZ50TScVIZx9ZCI-BXyuVc0yyYe8nov2O5oQjxhjJvjrB0~aEwVEpbla8uKYn9xX7EPUOuDSV0jH6hYw~p8Bro1MAsgyyeo2L5r72qCb7eWQZDN9nRvIkYSD~4KGhhKLBa3ACMC8WViJmESqOxasWWeOsZyWviM4FtClEqoZ4~Q__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

**Step 2**: Select the TrustedForm Add-on by clicking the **Add To Flow** button.

![](https://content2.bloomfire.com/thumbnails/contents/003/763/253/original.png?f=1687312799&Expires=1748567773&Signature=Tp7oPGFnlKSTjsSdgoSRazYzXAabkHAHqPMGR8ilK9XMdtkMAb7JLwEqfI~QTSx6nthn3LVrvU3PhSQ5hgEE9pVCfJ~R1fN6LC-UUcqYjApY04ZpEmKvX9EeXUY-GGm0K4LzQe6CA-P97d8zWmDNHkvgsdEE2IkVt4Ea9ZqonYIMSJvC3Yx0utBcFa9zCSODWmOT7RJbMwf30fUi9ytcNNaj3vAyr-~lduEso4f8N~NmU~KbEhHMJSaIsgNhZBlGrjMHtU9GTaW0~JpyYkI5xyKt~ElgajKPKUYdHIcn1-AYK1nbROHch7AzUqctPALph35pJk63AQGTWtF2iUskBQ__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

**Step 3:** Select Retain and click Finish.

![](https://content3.bloomfire.com/thumbnails/contents/003/763/255/original.png?f=1687313073&Expires=1748567773&Signature=EytXzxV~iZmUGMsc-hlLNVCLUB6YPGRweMDAljpPyRexLubFZotuDQj5PORdJMgB9o4MYi44z01tpPvJ7lZ0-8B7IKzrqQm3Mgq2AmL~jejMZ3Q05L7qqE2BfE4njg9NrpopcEdERXuywqU0bcgS8cxJB9yBGV7OsPE8sP4RkAxt-URpzLkHQ2Z8FEWmOKO~tXDuWdQyI7Ndbc-CWD4Tcde9f~mSB8InXeIC8zXznZZbUZ-nKQxesi1ON9CbxctI0WHZQTnEp5x~qd7rfEpLKnblAa~wenOSuOC14n0ssTh~SZMd4SZlc-QUdyirQGqYxKDs415F8nUDPubRl7yfSA__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

**Step 4**: Decide where the TrustedForm step should occur in your flow and move the step to that location. Typically you'd want to retain/claim the certificate on leads that have passed other validations, such as duplicate-checking and phone validation.

To simply retain a certificate for your account, the step is ready to go. No mappings are necessary. The TrustedForm step will automatically look for and use the TrustedForm Cert Url field to retain/claim the certificate.

**NOTE:** The configuration of an Optional Filter step depends on how you choose to use TrustedForm.

# Filtering Examples

When the TrustedForm outcome is not a success (errors, skips, failures), you could to add a filter after the TrustedForm step to stop the flow and return a **Failure** response for the lead. Otherwise, LeadConduit will respond with a **Success** outcome, even though the TrustedForm certificate was not retained.

![](https://content2.bloomfire.com/thumbnails/contents/003/763/256/original.png?f=1687313614&Expires=1748567773&Signature=cPPQGRwITETPv60cDxyB3zkyoY6Xrueg6wXloLARusBzEjDivxYBBPnoPaKU7pb5DU5RjKDANW8Ev7R0gNcOWVtzHL01oYSCXH3qBd11YflLZxV-kRAtMNrp-FEJOIR~QWB-y9i~WIhZHspUkA6Tm2zkTVQktjXam6Myo5oqDuSBYKVKLrPBcAmCnp9kiZqg3aOSlRSEFxOpVfZVwMYYhlBUMFoBa4yFUXdigDByVi2Em8dMXh6Ovpp62ZRA40xt2js3-noME1G8QqqgsnAyvebkGNJl7UjEe1IuItbS51lyIpyHrTov0sFldBHJwKl60expl4Niv-6h3DIkkm4cLw__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

Another popular filtering example is:

- Fail a lead only when the TrustedForm step returns a **Error**, allowing TrustedForm Failures (and Skips) to pass through the flow.

Type something"

