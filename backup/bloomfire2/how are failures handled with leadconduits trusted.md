---
URL: https://community.activeprospect.com/posts/5146237
Page Title: How are failures handled with LeadConduit's TrustedForm Add-on step?
Screenshot URL: images/screenshots/screenshot.png
Scraped At: 2025-06-02 19:42:56.854
---
GY5BA2iqC3U1LK9YAcr-IgaDD-oV-RFGKYv3HP5PQDf0bVy5jjJvBgki2zNlwHu6xi1I-ncHd-HerT3MgKin2pp~sWXwCLOobBPC7xR~7KBn5~EqVL1qNitkrpDYGSwTAUWD7-rrtVx9UF17Vsw__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/9624817-ayesha-akhtar)

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

Type something"
