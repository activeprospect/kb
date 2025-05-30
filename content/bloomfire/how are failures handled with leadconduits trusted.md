---
URL: https://community.activeprospect.com/posts/5146237
Page Title: How are failures handled with LeadConduit's TrustedForm Add-on step?
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-c87512e0-0553-4a87-8b5d-a404920c610f.png
Scraped At: 2025-05-30 00:16:48.106
---

[![](https://content2.bloomfire.com/avatars/users/1966401/thumb/thumbnail.png?f=1692038964&Expires=1748567794&Signature=O~E3Clo1Ap8DJDlSoTa3BX8Ea~8ZTGYQ0TrK~VQsf1wiZijm94l1IXZM-TP5CI7lmmWsl7~Bv8ud8cXyC2i0njVKO-~R-Efn7eQ4~lVo-DElO2Iw9NcqIZoA21pFOExQ0i0wADsaEUEPDD~2270xuUf-CD1IEKldvhegCD~pbJbf3~XveOiQ-Mp-bKufO4ZdR8Q5TXwL5AnxxZzNbsVWp6-DlJARhJU9O4ptnNVmJKUBjFHHdXe-7NRciO-NMQwQtf6e~lrqBFVhzvLblpDkVutRBRmKvfemFiDTCPuA5deqN3mSOyRy2IlQsrEkSbodEthGcNlo2-W5UfUz1TZ1JA__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/9624817-ayesha-akhtar)

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

