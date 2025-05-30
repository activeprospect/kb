---
URL: https://community.activeprospect.com/posts/5448162-manually-add-approved-language-to-trustedform-verify-consent-language-manager
Page Title: Manually Add Approved Language to TrustedForm Verify Consent Language Manager
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-81b4902a-c29c-4e86-be43-4093d0bcb6b3.png
Scraped At: 2025-05-30 00:17:12.091
---

[![](https://content2.bloomfire.com/avatars/users/1405246/thumb/thumbnail.png?f=1620827893&Expires=1748567764&Signature=k2EnCRpiTRmRjLWA5M8R7-Q~ePGyjTegalEZr1l2l~eMY7xFC2FmIo-9OVSnDVpY--Mbi82MQMtP34UG13foga8dMzBCQXPMx9xZ6rTZuOwK4GntN5kl6ltaJW5O5hfTxErw7QwuwLQQFZMhZXzzoxPST5FL4ufGvdNExAJJnrRC0j73E2QDrOgs~ZI-UT83wHw8JAC3dI4sJywxG-Sz8cB8e1bez~Lkv58sV9LFMjjG0AEtHKl9lnpZ18yXsHxZBPQHp93RW96Xf4nR3shGoGD54gzpAp0Fi~UM5eF4kPQBsi-BnI~SwbfUI1KMOXLzmlqBFq7S~atB-d8kmcDaXQ__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7846678-christopher-williams)

[_Christopher Williams_](https://community.activeprospect.com/memberships/7846678-christopher-williams)

Updated January 30, 2025. Published July 30, 2024.

Details

# Manually Add Approved Language to TrustedForm Verify Consent Language Manager

[TrustedForm's Consent Language Manager](https://community.activeprospect.com/posts/5474006-trustedform-consent-language-manager) includes a manual option to add approved consent languages. This should only be used if you already know the text that will be used as the consent language for leads you are purchasing and are unwilling to feed data into Verify as described in the [implementation guide](https://community.activeprospect.com/posts/5253900-trustedform-verify-implementation-guide). This method is not recommended. Any discrepancy in the expected consent language versus the actual received consent language will result in duplicates. However, this approach may be necessary to meet unique business requirements.

# How It Works

All manually-added consent languages will appear under the Approved tab. This is because there is no value in manually adding a rejected consent language since the Verify operation will have the same outcome for rejected and new consent language. To do this click the ""Add Approved Language"" button in the top right corner of your Consent Language Manager.

![](https://content2.bloomfire.com/thumbnails/contents/004/404/786/original.png?f=1722271363&Expires=1748567822&Signature=NZTVXDCEX7LhLvDP3nC2FE4YfsIf2mafxy7vnCe8DjSIPYoHwwz693BNeeg-AbEWt-J6b7GoS0y4BioRbfH9ov1RoEEyAbv7nfq2bK~HfKMana0Gplry8wLrFjVEMy2~VMQ0Jk6HU5V3kaQP0eZ-bPKpHkI75hFGMpWmDlgWCajsU6iPVy5fslpSr-IJF28gwJAv9HuIm376LnqED319AnJWMBWeX7U6xhN~RXIwEkePnDZK6AKW2bn4D3SMq-i8dhCmVAz7ltqvNlJcu6WfWzsw1qFGr5C9jAV0OxeAdzI14UnOFbOCkoi7C~kvhuAL55HVux7iGKvYe3VI7X1BVg__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

Specify the name, text and optionally any notes for each consent language. Choose a name that describes unique details about the consent language you would use to identify it later such as the vendor who uses it, the website it appears on, the date it was put into use, etc. Ensure you use the same text that your legal/compliance team has approved and that your vendor has confirmed will be presented to the leads you purchase.

If there are parts of the consent language that are dynamic (e.g. consumer information, button text, advertiser information), insert a wildcard in their place by clicking the ' **Insert Wildcard {{\*}}**' button. You can also use new placeholders like **{{phone}}** for phone numbers and **{{email}}** for email addresses to ensure consistency across variations. Using a wildcard or placeholder will allow consent languages detected from your certificates to be matched with your approved consent languages regardless of what text appears in their place. Make sure the rest of the text constitutes valid consent language and that you don't expect the portion captured by the wildcard or placeholder to affect that. Add notes with any other useful information you may want to keep track of, like who created the consent language and when.

![](https://content2.bloomfire.com/thumbnails/contents/004/791/591/original.png?f=1738255778&Expires=1748567822&Signature=L2PRz803lKh~yymtQrJihXBcuFwx4ctQ-JUHKx6aD1iCPkm3t0sfrr7vbpckxDVA4AIzH97Uo9tEq52-S6prNZ~TofbvJhHX7PcPa~h28gqrGSvibMKfXgMMzTr1C9gJWwx8MgI7~yk4cQ~QeSlZbcGK4ptazcWZbUlpKhuI8PBgStUqc4VJyKbk0258n0Fhw0ZrcMKR0L8vjDYykuCkxz0DHf~bEmd-bEZqrv7YNuEQq3WYMlvNr3juX-IS52kSnoSxCJxxT51JH2uCaLNUO00Np9-Ue5MZckaXMjjfe~8Nsj7NUoMnkAo85n5WSqB18f-Nmj6fZi3RySr3v~cgag__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

Finally, click the ""Add Consent Language"" button and your new consent language will be created and approved!

# Frequently Asked Questions

1. **Why do I have to name my consent languages?**

Naming your consent languages makes it easier for you and your colleagues to identify them later.

2. **Can I add a wildcard without using the button?**

Yes. The wildcard button simply inserts {{\*}} into your consent language text. If you add that yourself it will still be treated as a wildcard.

3. **Can I add consent languages in bulk?**

This is a feature that we are working on. It will allow you to upload a .csv file with all the approved consent languages you want to add. Keep an eye on [whatsnew.activeprospect.com](https://whatsnew.activeprospect.com/) to find out when this becomes available.


Type something"

