---
URL: https://community.activeprospect.com/series/4720459/posts/4388124-trustedform-certify-and-multi-step-forms
Page Title: TrustedForm Certify and Multi-step Forms
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-c982ba56-5f58-4a3d-bb18-e9fa4073630e.png
Scraped At: 2025-06-02 22:30:41.485
---


[_Christopher Williams_](https://community.activeprospect.com/memberships/7846678-christopher-williams)

Updated November 6, 2024. Published July 19, 2021.

Details

# TrustedForm Certify and Multi-step Forms

TrustedForm Certify works with any form as long as you (the publisher) has the ability to add custom html & javascript to it. Multi-step forms are fine but there are some considerations you’ll want to make based on whether each step is a separate web page or not.

#### If each step is a separate web page

A certificate can be created for each web page. Most customers only want to retain one certificate per lead so we recommend creating a certificate on the page which collects the consumer’s consent. If the consumer’s data (e.g. name, phone) was collected earlier, then we recommend displaying that information again on this page so the consumer can confirm it as they give their consent. If showing the actions conducted on previous pages is a requirement then we recommend using a single page application (SPA) to display multiple steps/views within a single web page so that they are all captured in the same certificate.

#### If all the steps are a part of the same web page

In this scenario all the steps will normally be shown in one certificate. If you have steps that contain information you don’t want to be share with lead buyers (or anyone else you plan to send the certificate to) then we recommend you take advantage of our [Certify for Offer Paths Implementation with TrustedForm Next](https://community.activeprospect.com/posts/5291010-certify-for-offer-paths-implementation-with-trustedform-next) to separate the steps into multiple certificates.

Type something
