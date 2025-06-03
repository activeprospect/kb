---
URL: https://whatsnew.activeprospect.com/en/new-message-for-trustedform-certificates-that-can-not-be-found
Page Title: New message for TrustedForm certificates that can not be found
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-f1789822-de5e-4452-8864-1aea968b7dc5.png
Scraped At: 2025-05-30 01:37:58.577
---

trustedform
Coming Soon
January 13, 2022

### New message for TrustedForm certificates that can not be found

TrustedForm certificates must be claimed in order to persist past the duration of the period it is eligible to be claimed. If it hasn't been claimed and an API request is made for a valid certificate URL we have historically returned the message ""certificate not found"". This message is often sent as the rejection reason for the lead and has caused some confusion. Some lead vendors would assume this meant the certificate never existed and that something was wrong with their implementation of the TrustedForm Script. In order to clarify what has occurred in these scenario we are changing the message to ""TrustedForm certificate has expired or could not be found"".The message found in a TrustedForm API response should only be used for informational purposes as it is subject to change to improve our overall user experience. Please ensure that any business decisions that need to be triggered when a certificate can not be accessed use the HTTP response status codes or outcome property.

![emoji negative reaction for 'New message for TrustedForm certificates that can not be found'](https://app.getbeamer.com/images/emojiNeg.svg)![emoji neutral reaction for 'New message for TrustedForm certificates that can not be found'](https://app.getbeamer.com/images/emojiNeut.svg)![emoji positive reaction for 'New message for TrustedForm certificates that can not be found'](https://app.getbeamer.com/images/emojiPos.svg)

Thanks for your feedback

[We are ⚡by Beamer](https://www.getbeamer.com/?ref=watermark_MErKJCnu12412_public&company=ActiveProspect&watermarkRef=powered&utm_term=MErKJCnu12412&utm_content=ActiveProspect&utm_source=standalone&utm_medium=footer&utm_campaign=powered)
