---
URL: https://community.activeprospect.com/posts/5448162-manually-add-approved-language-to-trustedform-verify-consent-language-manager
Page Title: Manually Add Approved Language to TrustedForm Verify Consent Language Manager
Screenshot URL: images/screenshots/screenshot.png
Scraped At: 2025-06-02 19:43:54.239
---
Wuz6z2FWJgYPjh19vTspQRQb0mtwY1DrUfv75cDCwPx-MyzfgtiWd1Q~E5Itwqxz~BP63IBvfL7oKegZhBvb3ziGaA0yg6fVh---COaku8DIjcNtdIzd6p2a1QQpWQN29PkgpnIf8xvl-EKmrmA__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7846678-christopher-williams)

[_Christopher Williams_](https://community.activeprospect.com/memberships/7846678-christopher-williams)

Updated January 30, 2025. Published July 30, 2024.

Details

# Manually Add Approved Language to TrustedForm Verify Consent Language Manager

[TrustedForm's Consent Language Manager](https://community.activeprospect.com/posts/5474006-trustedform-consent-language-manager) includes a manual option to add approved consent languages. This should only be used if you already know the text that will be used as the consent language for leads you are purchasing and are unwilling to feed data into Verify as described in the [implementation guide](https://community.activeprospect.com/posts/5253900-trustedform-verify-implementation-guide). This method is not recommended. Any discrepancy in the expected consent language versus the actual received consent language will result in duplicates. However, this approach may be necessary to meet unique business requirements.

# How It Works

All manually-added consent languages will appear under the Approved tab. This is because there is no value in manually adding a rejected consent language since the Verify operation will have the same outcome for rejected and new consent language. To do this click the ""Add Approved Language"" button in the top right corner of your Consent Language Manager.

![](images/image-1.png)

Specify the name, text and optionally any notes for each consent language. Choose a name that describes unique details about the consent language you would use to identify it later such as the vendor who uses it, the website it appears on, the date it was put into use, etc. Ensure you use the same text that your legal/compliance team has approved and that your vendor has confirmed will be presented to the leads you purchase.

If there are parts of the consent language that are dynamic (e.g. consumer information, button text, advertiser information), insert a wildcard in their place by clicking the ' **Insert Wildcard {{\*}}**' button. You can also use new placeholders like **{{phone}}** for phone numbers and **{{email}}** for email addresses to ensure consistency across variations. Using a wildcard or placeholder will allow consent languages detected from your certificates to be matched with your approved consent languages regardless of what text appears in their place. Make sure the rest of the text constitutes valid consent language and that you don't expect the portion captured by the wildcard or placeholder to affect that. Add notes with any other useful information you may want to keep track of, like who created the consent language and when.

![](images/image-2.png)

Finally, click the ""Add Consent Language"" button and your new consent language will be created and approved!

# Frequently Asked Questions

1. **Why do I have to name my consent languages?**

Naming your consent languages makes it easier for you and your colleagues to identify them later.

2. **Can I add a wildcard without using the button?**

Yes. The wildcard button simply inserts {{\*}} into your consent language text. If you add that yourself it will still be treated as a wildcard.

3. **Can I add consent languages in bulk?**

This is a feature that we are working on. It will allow you to upload a .csv file with all the approved consent languages you want to add. Keep an eye on [whatsnew.activeprospect.com](https://whatsnew.activeprospect.com/) to find out when this becomes available.


Type something"
