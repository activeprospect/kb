---
URL: https://community.activeprospect.com/posts/4886991-introduction-to-trustedform
Page Title: Introduction to TrustedForm
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-93d41228-f0cb-44b1-b201-5b162c110bd4.png
Scraped At: 2025-05-30 00:16:13.246
tags:
  - trustedform
  - compliance
  - data-management
  - seller-focused
  - conceptual
  - technical
  - beginner
secondary_tags:
  - developer-focused
  - analytics
  - legal
  - implementation
  - how-to
---

[![](https://content2.bloomfire.com/avatars/users/1405246/thumb/thumbnail.png?f=1620827893&Expires=1748567764&Signature=k2EnCRpiTRmRjLWA5M8R7-Q~ePGyjTegalEZr1l2l~eMY7xFC2FmIo-9OVSnDVpY--Mbi82MQMtP34UG13foga8dMzBCQXPMx9xZ6rTZuOwK4GntN5kl6ltaJW5O5hfTxErw7QwuwLQQFZMhZXzzoxPST5FL4ufGvdNExAJJnrRC0j73E2QDrOgs~ZI-UT83wHw8JAC3dI4sJywxG-Sz8cB8e1bez~Lkv58sV9LFMjjG0AEtHKl9lnpZ18yXsHxZBPQHp93RW96Xf4nR3shGoGD54gzpAp0Fi~UM5eF4kPQBsi-BnI~SwbfUI1KMOXLzmlqBFq7S~atB-d8kmcDaXQ__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7846678-christopher-williams)

[_Christopher Williams_](https://community.activeprospect.com/memberships/7846678-christopher-williams)

Updated July 26, 2023. Published December 8, 2022.

Details

# Introduction to TrustedForm

Trustedform 101: What does it do? Who needs it and why?

Collapse

00:00

08:18

![](https://content3.bloomfire.com/thumbnails/contents/003/811/973/_270x180.png?f=1690410741&Expires=1748567764&Signature=RVRWaoPJC6mPc6WKTTQh~3q5ACW6Zkmf4Q~altRqzTfMXeR~IcGU1culTnoByu0VxHDCY-qoCLufLkahRPe5qZgIjPIjlLMl6uVQR3fcAOLLRbzFW98LPogDcn4v~F-F9hODsN9M8~iQOp8D2Sx~0XYyj9Li6qHD5jHgqUo8gI1cvLDXfUMjm0xaGNqkKjKm-zh5x3MeQ6MhR~dOSyvjgNyItHgTWiPgkdM-rgcgOkWIWXa3~w7E-snN6yfbnAMi~RbLbuc2lA5l8tGOOU1E7A1c4toXpNKxTgCV7kelqktENcLUxIEZ83W5~dGDgVhe2RZ~r5CKDY2B9RkfdID9PQ__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

#### How\_Does\_TrustedForm\_Work\_2023-07-26.mp4

#### Transcript:

TrustedForm is ActiveProspect's solution for independently documenting and storing lead events, which are the actions that a consumer performs on a web page. TrustedForm stores the record of these events in a certificate. If the lead events show properly obtained user consent, then the TrustedForm certificate can be used as proof of consent. TrustedForm interacts directly with the consumers device, recording what they did and saw as they filled out and submitted a web or mobile app form. It stores information about the user's device and activity during their visit to the page and can generate a visual playback of that consumer's experience on request.

The certificate contains a copy of the web page's source code, associated files like style sheets, JavaScript, images and videos, and metadata, which is information about the consumers device, their browser, the host of the web page, IP address and user performed events like mouse movements and clicks, screen resizes and key presses. From this data, TrustedForm also calculates and stores other useful metadata like typing speed, time on page and more.

The information that TrustedForm collects remains stored only within TrustedForm's data warehouse and can't be modified by any other party.

When a person views a TrustedForm certificate, it's displayed on a TrustedForm-hosted Web page. Let's look at how TrustedForm works.

First, the publisher of the web page includes a small JavaScript snippet on the page.

When the consumer loads the page into their device’s browser,

that script contacts the TrustedForm service directly from the user's device and begins sending TrustedForm the information that will become the certificate.

At the same time, TrustedForm sends a unique ID, the TrustedForm certificate URL, down to the user's browser where it's added to the web form as a new hidden field.

This exchange of information continues until the user submits the form or abandons the web page.

That closes the connection to TrustedForm, which temporarily stores the certificate. When the consumer submits the form, the information they typed into the form’s fields, plus any hidden fields like the TrustedForm cert URL field, is sent to the form’s target, which could be LeadConduit, a CRM, or any other application,

and the connection to the user’s browser closes.

Up to this point in the process, no charges have accrued. There was no cost to the web publisher for including the script on their form page, nor is there a cost for the certificate that was created. The TrustedForm service will retain the certificate for a specified number of days, but its contents can't be accessed for free.

During that period, any TrustedForm customer who has the certificate URL can tell TrustedForm’s “Retain” service to store the certificate in their account for long term protection against future consumer complaints. Per their ActiveProspect contract, they're charged a fee for retention and storage. A typical storage interval is five years to allow for legal statutes of limitations. The retain action was formerly called claiming.

Every entity that handles a lead, be they a web publisher, broker, or advertiser, should protect themselves by retaining their TrustedForm certificates.

Retaining a certificate also enables TrustedForm’s session replay and share URL features. We'll talk about Session Replay in a minute.

If you received a lead with a phone number of 123-456-7890, but the TrustedForm certificate shows that 212-555-1212 was entered as their phone number in the form. Wouldn't you want to know? TrustedForm's lead matching feature formerly known as Fingerprinting is designed to empower you to identify cases like this and ensure your certificates match with the lead. How does lead matching work? As TrustedForm collects user input from the page, e-mail address or phone number form data is securely hashed and stored within the certificate.

When you make a match lead request or Retain a Certificate you can pass your lead's e-mail address and phone number as parameters in that request. TrustedForm compares the values stored within the certificate with the values passed in your request and the response tells you if they match.

Session replay is a re-creation, displayed on a TrustedForm hosted Web page, of the consumer's experience. On the left is a consumer filling out a form. TrustedForm has added the hidden TrustedForm cert URL field to the form, has received the page source code from the user's browser, and is recording the user's mouse actions and key presses as they occur.

On the right you can see the certificate for that page visit. Clicking the ""Session Replay"" button recreates the web page from the source code and other files in the certificate then overlays a recreation of the mouse movements, clicks, key presses, and screen changes the consumer made. It looks like a video of the consumer's screen while they were on the page.

TrustedForm enforces a data security enhancement which limits access to TrustedForm Session Replays to parties who already have access to the submitted consumer data. This ensures that all parties involved in the lead generation process are better protected. Due to this, lead matching must be performed when retaining a certificate. When viewing a certificate's Session Replay, you'll be prompted to enter the consumer's e-mail address or phone number.

By default, only the TrustedForm customer can view their retained certificates. But retention also creates a unique share URL that the customer can give to legal counsel or others in the event of a complaint.

With the share URL, they can view the certificate, including the playback. Often simply showing the playback to a complainant in a compliance lawsuit is enough to make them drop the complaint.

Metadata is information about the consumers device, their browser, the host of the web page, IP address and user performed events like mouse movements, clicks, screen resizes and key presses. From this data, TrustedForm also calculates and stores other useful metadata like typing speed, time on page and more. To evaluate a certificate's metadata, customers can select and retrieve the specific items they wish via TrustedForm's Insights service.

Insights also provides page scan. In this feature, TrustedForm scans the web page for claimant-specified text. This is handy for ensuring that the web publisher has included the advertiser specified opt-in or privacy language on the page. It can be useful for detecting unwanted incentivizing language that the web publisher may have added. Here you see a web form on the left with consent language highlighted and on the right is part of TrustedForm's response indicating that the text it scanned for was found on the page.

TrustedForm provides the highest standard of user-experience documentation, with independent, secure collection and storage of the user experience. Every web page or mobile app that collects contact data should implement the TrustedForm script, and every business that handles that contact data should be claiming TrustedForm certificates.

Type something"

