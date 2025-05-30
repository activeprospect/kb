---
URL: https://whatsnew.activeprospect.com/en/trustedform-api-consent-failure-outcome
Page Title: TrustedForm API Consent Failure Outcome
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-e033244a-88fd-4ffe-8989-21df06514c3b.png
Scraped At: 2025-05-30 01:37:59.139
---
trustedform




New






leadconduit





integrations



February 01, 2022

### TrustedForm API Consent Failure Outcome

TrustedForm API users with a subscription that includes Consent features are now able to take advantage of the outcome field to do more than tell whether or not a claim was successful. The API also considers factors that affect your ability to verify that consumer has given expressed written consent to be contacted. Currently this will cause the outcome field to respond as ""failure"" if none of the provided fingerprints match, forbidden scan terms ware found or required scan terms were missing. In the future we plan to consider additional factors to increase your confidence that consent was provided. If you want to ensure that your lead has consent be sure to review or filter out leads when the outcome is failure.

\-\-\-

As such the description of the outcome field has been updated to the following:
""The result of the attempt to verify consent. Success indicates that the certificate was claimed and did not generate any warnings related to consent verification. Failure indicates that the certificate was claimed but generated warnings because no fingerprints matched, forbidden scan terms ware found or required scan terms were missing. Error indicates that the certificate was not claimed and the request should be reviewed and potentially retried.""

![emoji negative reaction for 'TrustedForm API Consent Failure Outcome'](https://app.getbeamer.com/images/emojiNeg.svg)![emoji neutral reaction for 'TrustedForm API Consent Failure Outcome'](https://app.getbeamer.com/images/emojiNeut.svg)![emoji positive reaction for 'TrustedForm API Consent Failure Outcome'](https://app.getbeamer.com/images/emojiPos.svg)

Thanks for your feedback

[We are ⚡by Beamer](https://www.getbeamer.com/?ref=watermark_MErKJCnu12412_public&company=ActiveProspect&watermarkRef=powered&utm_term=MErKJCnu12412&utm_content=ActiveProspect&utm_source=standalone&utm_medium=footer&utm_campaign=powered)"

