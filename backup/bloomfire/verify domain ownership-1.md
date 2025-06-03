---
URL: https://community.activeprospect.com/posts/4649879-verify-domain-ownership?_gl=1*zqdwg8*_gcl_aw*R0NMLjE3NDU2MDAxMjguQ2owS0NRandoWVNfQmhEMkFSSXNBSlRNTVFiaXRYMkdhRFdWemNDYW0wOFJtNXpFNzRLbHpuVEtxMkxjWV9JN2VIRU5wcGZJZFo1dzFOb2FBb2VXRUFMd193Y0I.*_gcl_au*MTI0OTE0OTIxNS4xNzQ0NjM5NjA2LjY1MDQxMjc5OC4xNzQ1ODc5MTYxLjE3NDU4NzkxODE.*_ga*NTQ3NjI0NDQxLjE3MzQ2Mzk3NDQ.*_ga_QHXBV6N7D1*MTc0NTk4Nzc4Ny4xODEuMS4xNzQ1OTkzNjA2LjQ1LjAuNDE0MTA2MzQw
Page Title: Verify Domain Ownership
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-a603d328-a02b-4ac8-a715-eb50807dc812.png
Scraped At: 2025-05-30 00:16:22.115
tags:
  - trustedform
  - admin-focused
  - technical
  - compliance
  - best-practices
  - troubleshooting
  - intermediate
secondary_tags:
  - developer-focused
  - semi-technical
  - how-to
  - flows
  - integrations
---

[![](https://content2.bloomfire.com/avatars/users/1316948/thumb/thumbnail.png?f=1606147181&Expires=1748567773&Signature=N1XtN~uVAegVWQUQbdNNW7Ug8tyFooXE0EjJD~WiWPniL5EQJ1s6XzB-1ms0vHRDifcqTNei~WffVItjr2-2GhRXIbH~SEs1P8edAHTDGsYe03ia7dHdVWq8DU5eFdR62s06dlCFEtbQSvhzoT72Ath2vj4~rkz~mjKi5LoGYOIbnE7uAgtbodhmxF6Lzw7VRnrQHc5Q9zfky3Bka~QgAB95XcB37qUmEb1TwWPN2Z8o9w2UBedGGc5RwyyZc2i-FTYS9W2lha~0A8i8ISz3NDKcEe-cHcs9VBLalrP2xJocmcbZN2msgNoeeoy9bMtjX-jy8JLi-YwuPWZwBPWUtQ__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7557576-caitie-clarke)

[_Caitie Clarke_](https://community.activeprospect.com/memberships/7557576-caitie-clarke)

Updated May 14, 2025. Published March 29, 2022.

Details

# Verify Domain Ownership

Verify your domains in your ActiveProspect Account to start gaining domain specific insights.

### Why Verify?

As a site-owner generating TrustedForm certificates, we want to provide you insights into domain specific certificate volume and give you credit for TrustedForm certificates claimed from your domains. To do that, all you have to do is verify you are the domain owner.

Verifying ownership of domains and sub-domains where you have implemented the TrustedForm Script, lets us positively verify that you created a lead associated with the TrustedForm Certificate.

Once your domain is added, no other account can claim ownership of that domain.

### Verification Process

The process of verifying your domains is simple; we generate a unique code per domain that you add to your domain's dns record and we check for a match in the background.

### 1\. Add your domains to ActiveProspect Account

1. Navigate to the Domain section in [My Account](https://account.activeprospect.com/domains) (if you do not see a Domains, please talk to your admin, this is a permission setting)
2. Select Add Domains
3. List all domains you want to verify
1. If you are verifying subdomains, you can individually add and verify subdomains. Or you can just add the root domain and you'll have an option in step 2 to verify all subdomains.

### 2\. Get your verification code from ActiveProspect Account

1. Under Actions, select the Verify Ownership link for the domain you are ready to verify
2. Copy the unique code

![](https://content3.bloomfire.com/thumbnails/contents/004/944/170/original.png?f=1745956313&Expires=1748567773&Signature=azKb8lxzOYkes20OkFf3HrV5aRkyQkL9lAYbEXvU3b9A-yvRhShRmBoiHXJ~sDuU7MtyOM~R-nFeTcfnLJpCkm1Dtz9tvQaymLaETpiK2wzu-xpnurqOJZnoyV2pP5e0lZGtVIB82e9rm5MxdMF-c~~IGS639lj3Bn29eO775RVu269VbmfYbNK4z3HzuqGxHXS6qdtA~ttbhL8~1ISudakDXLJsKvDj2FHu0RKt1Wl8MOxSao3ggdUGDWEdG8LLXJLnpRkItGayah0LwrvDii51mVbAVFPD7uvxXyQ4ZLVV4LrejzD3oykK5CCUzpBtjJX1p54YEGdfHgWSxO2ivw__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

### 3\. Add a TXT record in your domain's DNS registrar

1. In a second browser window or tab, sign in to your domain's DNS registrar/host
2. Go to your domain’s DNS records. The page might be called something like DNS Management, Name Server Management, Control Panel, or Advanced Settings.
3. Select the option to add a new TXT record
1. If you're verifying an individual subdomain, you'll want to add the TXT record to the root domain in your DNS. If you're verifying multiple subdomains for one root domain, your root domain should have multiple TXT records.
4. In the TXT record, set the unique code as the value/answer/destination (the field names vary based on your registrar).

### 4\. (Optional) Verify all subdomains - NEW

If you're verifying a root domain, you'll see an option to also verify all subdomains (STEP 3). If this is selected and auto-retain is enabled for the root domain, auto-retain will also be enabled for **all** subdomains.

_**This will also be reflected under the 'Auto Retain Confirmed Domains' section in [TrustedForm Certify tab](https://app.trustedform.com/certificates/issue?__hstc=41051389.35fac6c93cef7b38a5359d0547f3275d.1748564175270.1748564175270.1748564175270.1&__hssc=41051389.1.1748564175270&__hsfp=3707738794), as follows:**_

![](https://content2.bloomfire.com/thumbnails/contents/004/944/754/original.png?f=1745989144&Expires=1748567773&Signature=nGUEWtGGnboQKlYnV2LeEpwXM9Af8T4p~obXoiQWLg~8hqiVmkAJD1qm0ifUIyDYuAYwJDtsO~lr20lAPOQyTrbCyuKG4ZdWTC4n3cWZjGwzF3ZXP6VDU-qB-yiUkDAm9gOr9KIB4XeA4rR6Veux5bBUzpjJX1N1OFGNIL~ThMKpEv5id1ERvMvbbwTg6fHlHGquFQTD5m-L0ZwRWCJ7P3caLc8MuO3H0BgO27icAxtHZCd2D5kvPd5FKYnSEOvQAU66jUEmFwbaH7q7fedhHXsB6ZnVJdlUzDSA8itoFxcBt3IpvsE-ZOJs-ezIpSg4lkVjAaFiNgG0oqKvtvwo5Q__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

**_Subdomain Ownership Statuses Explained:_**

- **Confirmed:** This status appears when the option to also verify all subdomains is checked for the given domain. Ownership of subdomains is confirmed.
- **Unconfirmed:** This status appears when ownership of subdomains has not been confirmed (the option to also verify all subdomains is not checked).
- **N/A:** This status appears when the domain itself is a subdomain. Subdomain ownership confirmation is not applicable here because the option to verify subdomains only applies to root domains.

### 5\. Tell ActiveProspect Account to check your verification code

1\. Navigate back to your ActiveProspect Account tab, and select Begin Verification. Once selected, we will star the process of verifying your domain.

2\. Refresh the page to check for updated ownership status

### Do you have a CNAME record on the domain you want to verify?

CNAME records are common for subdomains and TXT records can't be added to domains with CNAME records. If you're verifying a subdomain, add the TXT record to the root domain. If you're verifying multiple subdomains, your root domain can have multiple TXT records (one for each subdomain).

### Domain Statuses

Once you have initiated the verification process, we will continuously check and update the domain status until you remove the domain.

![](https://content1.bloomfire.com/thumbnails/contents/003/147/093/original.png?f=1648485804&Expires=1748567773&Signature=b4MpLhKFK9lD-Ookt5nODVj1D5a6kLBbFLmcudJ3L93D809mmqPYj0z81Nqz8JHSpjgqRECVZ-8hdQ1sUs3sGOSG~43KhQhVsFVBjXfxw1LkBZg2Tbd628s0i7vDahQia6ixuRbv-aEvpuBQh5MOGq1Xe0DhotRxo3ax7bXqn2Gc8LNQGvwud83RgLK5QVrGppmLBGz4nxXSZDlLFV7yUzdTAa5fuj62kJAz8wtRD5xC5lhMXHvU0lWtVnNj8WKj9zdvp6Lw1QG3s~tiCltAowzG24oTB4zlys0knbzq7SCkGnZaQXWIagGAMA6AVcRZoSmTs2Ho6H4iCWxyez1k4w__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

Ownership Status:  represents the current status of the domain. Refresh the page to see the most up-to-date ownership statuses.

Last Checked: timestamp of the last time we checked the verification status of the domain (every time we attempt a verification)

Last Verified:  timestamp of the last successful verification of the domain

### Ownership Status Reasons Explained

- **Verified**: You have proved ownership of the domain! We successfully matched the unique code with your domain's dns record
- **Unverified**: We have not proved ownership of the domain.
  - Ownership not yet verified: you have not started the verification process for this domain
  - Verification pending: you have initiated the verification process but we have not yet verified ownership
  - Code Not Found: you have begun the verification process but no code is found on the dns record.
  - Connection error: there has been a timeout. If an already verified domain receives a connection error, then we will retry verification 10 times using exponential backoff. After 10 connection errors, the domain will be marked as unverified.
  - Domain not found: Domain doesn't exist
  - Code not found: We successfully checked the domain, but there was not a TXT record with the correct code

### Troubleshooting Tips:

- We run a domain verification check in the background at different cadences once you have started the verification process for a specific domain
  - We check **unverified** domains every 5 minutes.
  - We check **verified** domains once a day at midnight (Central Standard Time)
- If the ""Last Checked"" and ""Last Verified"" timestamps are different, the verification has failed.  Meaning, we did not receive a successful verification when last checked.
- A domain is marked unverified if it hasn't been verified in three days.
  - The ownership status will stay verified for a 3 day grace period, if after 3 days of attempts to reverify the ownership status successfully, the verified status will change to unverified with a reason. This grace period is to provide time for you to make planned updates to your domain records and not have your ownership status impacted.
- The Ownership Status - \[reason\] will provide information for you to investigate possible causes of the change in verification status.
- Domains rarely become unverified, common reasons that ownership status changes from verified to unverified;
  - the code is deleted from the TXT record answer
  - loss of ownership of the domain
- If you delete the code in the TXT record answer, all you need to do is re-add the same code back in. No need to generate a new domain code in your ActiveProspect Account.
- Make sure to verify your sub-domains if you wish to auto claim from those domains.
- Only users with the permission, ""Manage user and domains for this account"" will be able to see and manage domains. If you need permissions, please contact your account admin or [support@activeprospect.com](mailto:support@activeprospect.com)





**FAQ**
1. **Can I use the \`verify all subdomains\` checkbox if I’ve already verified some subdomains individually?**
     - Yes. If you have already verified subdomains and then use the \`verify all subdomains\` checkbox on your root domain, it will be duplicative, but that's alright. You can choose to delete the individual subdomains and the related TXT records from your DNS, but it’s not required.
2. **Does the TXT record now only need to exist on the root domain?**
     - The TXT record used to confirm ownership, whether for the root domain or a subdomain, should be placed on the root domain in your DNS. But now, with the \`verify all subdomains\` checkbox, you only need to add your root domain, grab the single TXT record, and add it to the root domain’s DNS entry. This avoids having multiple TXT records on the root domain for different subdomains.
3. **Will the \`verify all subdomains\` checkbox include verification of sub-domains of a sub-domain?**
     - Yes, it should confirm ownership of all subdomains under the root domain. For example, if the root domain is example.com, then both blog.example.com and shop.blog.example.com would be covered.
4. If I’ve already verified my root domain, do I just need to check the box to \`verify all subdomains\`, or is there more to it?
     - That’s correct, you just need to enable the \`verify all subdomains\` checkbox and save. No additional steps are required.

Type something"

