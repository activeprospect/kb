---
URL: https://community.activeprospect.com/posts/5146237
Page Title: How are failures handled with LeadConduit's TrustedForm Add-on step?
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-4400424d-b91e-4b07-b5f4-40362193160a.png
Scraped At: 2025-06-02 22:29:55.663
---


[_Ayesha Akhtar_](https://community.activeprospect.com/memberships/9624817-ayesha-akhtar)

Updated August 24, 2023. Published August 24, 2023.

Details

# How are failures handled with LeadConduit's TrustedForm Add-on step?

TrustedForm Certified Leads were designed to be accessed via API so that the Certificate of Authenticity data can be appended to the lead data. In other words, it was designed to integrate with your lead management system. If you are using [LeadConduit](http://activeprospect.com/products/leadconduit/) to process your Internet leads, it is very simple to append the Certificate data.

When a Certified Lead is submitted to LeadConduit, LeadConduit automatically captures the Certificate URL with the lead. If your flow includes a TrustedForm add-on step, LeadConduit also contacts the TrustedForm API in order to verify the authenticity of the certificate and append the Certificate data to the lead record.

The TrustedForm add-on integration step will result in failure if:

- The certificate URL that you receive is invalid or
- The certificate's Retain Window has expired

If you would like to halt delivery to other destinations, you should configure the ""delivery failure"" event to stop delivering the lead.

Type something
