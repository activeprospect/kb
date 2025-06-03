---
URL: https://community.activeprospect.com/posts/4812756-trustedform-auto-retain-for-first-party-lead-certification
Page Title: TrustedForm Retain: Using the Auto-Retain method to store certificates for first party leads
Screenshot URL: images/screenshots/screenshot.png
Scraped At: 2025-06-02 19:42:03.660
---
qFTemkuD6GB4Di62WOO1jjq653WXD3btCC8PnxcuMCyN6MfZc83iAHJ9C-9Lg7eshPTpckea9bIKJzpp-CPwemxSvckRlBhGuDYj61faWmHVBz3oDO0f-oQR18s2c79Caje3SG1SAWJOiWai5xQ__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7846678-christopher-williams)

[_Christopher Williams_](https://community.activeprospect.com/memberships/7846678-christopher-williams)

Updated May 27, 2025. Published September 20, 2022.

Details

# TrustedForm Retain: Using the Auto-Retain method to store certificates for first party leads

Automatically retain your TrustedForm Certificates generated from your verified domains without making an API request

Are you struggling to set up an integration to retain TrustedForm Certificates for the leads you generated? Do you wish that you could simply store all the certificates for leads from your websites? If so, then you should use TrustedForm's new solution designed to help you store proof of consent for first-party leads.

Traditionally, our users have always had to make an API request to retain TrustedForm Certificates. This gave technical users a lot of flexibility to integrate this step however they want but created a challenge for those who don't have the experience or resources to develop a process to do this. TrustedForm Auto-Retain seeks to make it easy for anyone to retain proof of consent for the leads they generate.

# How It Works

TrustedForm Auto-Retain works in conjunction with the TrustedForm Certify Web SDK to recognize when a lead is submitted on your website and automatically stores that lead's TrustedForm Certificate to your account. You can set up this process in a just a few steps:

1. **Verify your domains**

In order to know which certificates we should retain in your account, you must prove you own the domain they are generated from. Simply follow the instructions in the [Verify Domain Ownership](https://community.activeprospect.com/posts/4649879-verify-domain-ownership) guide so that you will have the ability to enable TrustedForm Auto-Retain for them.
2. **Open the TrustedForm application**

Auto-Retain can be enabled on the [Issuing Certificates page of the TrustedForm application](https://app.trustedform.com/certificates/issue). Scroll to the bottom, and you will see a section marked ""Auto-Retain Confirmed Domains.![](images/image-1.png)
3. **Enable Auto-Retain** Toggle the Auto Retain switch to 'Enabled' next to each of your verified domains to confirm that you would like to retain all certificates for the leads generated from them. Once Auto Retain is enabled, the switch will update to give you the option to disable it if needed.

If your account has not been configured to use Auto-Retain, you will see a message with instructions on how to proceed so that you can be provided access.



_(New Update) If the **'Subdomain Ownership Status'** is **'Unconfirmed'**, follow the instructions in [Verify Domain Ownership](https://community.activeprospect.com/posts/4649879-verify-domain-ownership?_gl=1*zqdwg8*_gcl_aw*R0NMLjE3NDU2MDAxMjguQ2owS0NRandoWVNfQmhEMkFSSXNBSlRNTVFiaXRYMkdhRFdWemNDYW0wOFJtNXpFNzRLbHpuVEtxMkxjWV9JN2VIRU5wcGZJZFo1dzFOb2FBb2VXRUFMd193Y0I.*_gcl_au*MTI0OTE0OTIxNS4xNzQ0NjM5NjA2LjY1MDQxMjc5OC4xNzQ1ODc5MTYxLjE3NDU4NzkxODE.*_ga*NTQ3NjI0NDQxLjE3MzQ2Mzk3NDQ.*_ga_QHXBV6N7D1*MTc0NTk4Nzc4Ny4xODEuMS4xNzQ1OTkzNjA2LjQ1LjAuNDE0MTA2MzQw) to complete the subdomain verification process (optional). Once the status is set to 'Confirmed' and Auto-retain is enabled, then auto-retain will be enabled for the root domain and **all associated** subdomains._

# Frequently Asked Questions

1. **How do I know that Auto-Retain is working?**

After a lead is **submitted\*** to your website, wait at least 15 minutes and then visit the TrustedForm Certificate URL for that lead. If you are able to view the full certificate, it has been successfully retained your account. It will also appear in your [recent stored certificates](https://app.trustedform.com/claims). You should also monitor your usage on the TrustedForm home page as any sudden increases/decreases could indicate an issue. Reach out to [support@activeprospect.com](mailto:support@activeprospect.com) if your certificates are not being retained.

_**\*Please note there must be a form submission for auto-retain to work.**_

2. **Do I have to store the TrustedForm Certificate URL with the lead?**

Yes, we always recommend storing the TrustedForm Certificate URL in a CRM or similar system alongside all other lead data. In the future, we will release features to help you find certificates without knowing the URL, but it is always a best practice to maintain a record of it.

3. **Will Auto-Retain be included in my current allotment/volume?**

No, Auto-Retain is tracked separately from other methods of storing certificates. Please consult your specific pricing specifications for details.

4. **If I use Auto-Retain will my lead buyers be able to access/view my certificates?**

No, in order for your lead buyers to gain access to view your certificates you must first provide them with the TrustedForm Certificate URL. Then they will have to use the TrustedForm API to retain the certificate in their own account.

5. **If I already use other TrustedForm products, is there an additional cost to use Auto-Retain?**

Auto-Retain is a feature of the Retain product offering. Usage of it will be billed as Retain First Party on your invoice based on your rate.

6. **Will the certificates retained via the Auto-Retain product be used when generating the dashboard that appears on the TrustedForm home page?**

Yes, the TrustedForm home page shows aggregate information pertaining to all the certificates retained in your account regardless of which product was used to do so.

7. **If I use Auto-Retain how can I also use TrustedForm Insights on these certificates?**

TrustedForm Insights is an API product which operates separately from TrustedForm Auto-Retain. Although the two can be used in conjunction, TrustedForm Insights requires its own setup with your development team or through a third party integration. Read the [TrustedForm Insights](https://community.activeprospect.com/posts/4709758-trustedform-insights) article for more information.

8. **What happens to my certificates where TrustedForm Certify doesn't detect a form submission event?**

Any certificates where a form submission is not detected will not be stored to your account as this normally indicates the consumer did not become a lead and does not want to be marketed to. They will expired 3 days after creation and be deleted. If you believe an error has occurred and desire to retain these certificate you will have to do so using the [TrustedForm Certificate API](https://developers.activeprospect.com/docs/trustedform/getting-started/).

9. **How does TrustedForm Certify detect form submission events?**

**TrustedForm Certify listens for events that explicitly indicate a form has been submitted or are associated with elements on a page that behave like a submit button. The script is expected to accurately capture these submit events from any webpage using a standard <form> tag with a submit button embedded inside of it.**


Type something"
