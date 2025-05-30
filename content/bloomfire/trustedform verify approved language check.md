---
URL: https://community.activeprospect.com/posts/5474009-trustedform-verify-approved-language-check
Page Title: TrustedForm Verify Approved Language Check
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-c849180f-aefc-4cd8-bba8-9b6ed9c0cdf4.png
Scraped At: 2025-05-30 00:16:59.830
---

[![](https://content2.bloomfire.com/avatars/users/1405246/thumb/thumbnail.png?f=1620827893&Expires=1748567764&Signature=k2EnCRpiTRmRjLWA5M8R7-Q~ePGyjTegalEZr1l2l~eMY7xFC2FmIo-9OVSnDVpY--Mbi82MQMtP34UG13foga8dMzBCQXPMx9xZ6rTZuOwK4GntN5kl6ltaJW5O5hfTxErw7QwuwLQQFZMhZXzzoxPST5FL4ufGvdNExAJJnrRC0j73E2QDrOgs~ZI-UT83wHw8JAC3dI4sJywxG-Sz8cB8e1bez~Lkv58sV9LFMjjG0AEtHKl9lnpZ18yXsHxZBPQHp93RW96Xf4nR3shGoGD54gzpAp0Fi~UM5eF4kPQBsi-BnI~SwbfUI1KMOXLzmlqBFq7S~atB-d8kmcDaXQ__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7846678-christopher-williams)

[_Christopher Williams_](https://community.activeprospect.com/memberships/7846678-christopher-williams)

Updated May 8, 2025. Published September 13, 2024.

Details

# TrustedForm Verify Approved Language Check

Obtaining meaningful consent from a consumer can be extremely complicated as there are many interpretations of the laws that govern how advertisers perform marketing outreach. These generally result in every business establishing their own set of requirements for the language consumers must consent to in order to become a valid lead. Due to this the best way to ensure that your requirements are met is to review the aforementioned language and only contact leads if you approve of it. TrustedForm Verify's Approved Language Check makes it simple to do this in a scalable manner for all your leads and all the variations of consent language they are shown.

# How It Works

First, ask your lead vendors to implement [TrustedForm Certify](https://activeprospect.com/trustedform/certify) and send a TrustedForm Certificate URL along with the leads you purchase from them. This will give you access to the consent languages shown to each lead. Next use the [Certificate API](https://developers.activeprospect.com/docs/trustedform/api/v4.0/tag/Certificate-URL/) and make a [Verify request](https://developers.activeprospect.com/docs/trustedform/api/v4.0/tag/Verify/) which will extract the consent languages and make them accessible in the response. It will also add new variations to your [consent language manager](https://community.activeprospect.com/posts/5474006-trustedform-consent-language-manager) as long as there you have less than 1000 unreviewed consent languages. Make sure to review all the consent languages found in the unreviewed section and determine whether future leads using them should be approved or rejected. Once classified, the Approved Language Check will use this to determine if future leads were shown an approved consent language or not. Keep in mind that Verify searches for your approved/rejected consent language within the overall consent language found. This means if you approve the short phrase ""I consent"" then any consent language found that contains that will successfully pass Verify's consent language check (e.g. ""I consent to receive marketing messages""). Passing this check requires an exact match, ignoring case differences, unless you add flexibility using wildcards. You can rely on this to create filters or rules to prevent your business from taking unnecessary risks.

![A consumer filled out a form with a new consent language and you are sent the lead.](https://content2.bloomfire.com/thumbnails/contents/004/484/813/original.png?f=1726271882&Expires=1748567811&Signature=NBjNhI1Vbf3R1XJx66FlHEmnAFKvdLdmcEx0qZEPityKaK5E~Vm5SMgTDXFtHMphlDHucXeskhrXH0wvFruyCLfrZMjzxgP1wA4Z0kPhJMEO7OlPw8NEKM5tAgtKf579PhetcjdUjb7VVgyMz~oiwrIYPvThMsewr9hO~axwZxhFvIvJdS2GUZZD8N9UUMIDXe~O3OHJYpRABhcYkS71Bemaxa2dhyHVD70FsSRCk~WIDbTd44NKqEq-LjWR9OoCsql0x00tXUnlkWVYut-S6uFukvii7akvZHEg6429zWeQzwDGCwbYYnE89aq~e9hGdJXksibooxTQjXny0rHr7A__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)A consumer filled out a form with a new consent language and you are sent the lead.![You see that new consent language in your consent language manager and move it to approved.](https://content0.bloomfire.com/thumbnails/contents/004/484/814/original.png?f=1726272036&Expires=1748567811&Signature=LSdhwApHrvdIJhPCpyxGHrbFzqXGnyS6ae0urrdJZS8lgAoyLc4jkY3La6nCysHNObr-xVQqGtQMeJ~ihXaoSR7-XlMCS5WfpaSJfxZl1D-LhLOXoBcUX4cQwq4bLlnrgNFFRlBPujx5MpLHqnmY1FKS4yUrKfORaNES8S3FYEOoSblp5CkbuSUY-irYadBI0kwY9vMWB6oQD2EyWfDmiZ7TS56dxGFtxXMna0SvWpgNsj9eug5P-rExveQuaK0LHKSN2kl-BwuCPLvi2thViIQ9TRe9qpRk4UuJZvJ5PEDhRK-seRTBWCrAcxWB3tj9p2nLsBqJ3zqcgG~MTs~aaQ__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)You see that new consent language in your consent language manager and move it to approved.![You receive another lead with that is shown the same consent language and make an API request to confirm that the language is now approved.](https://content3.bloomfire.com/thumbnails/contents/004/484/810/original.png?f=1726270601&Expires=1748567811&Signature=Rphvc4~KL2-7QGZ9bk4Sz-FG6OhLXuWm4jdF~luZ-ZUeOSLU8YaeX28VUonP5NrI-c3zK4KQERTgCvk2iAA6NeZu5eJxwV3u0ePpsHRzsIlFTTVSBhgBxf-T1xpDQifsZ2cZydgi51kOkrV5g5bmJclw5LtDcLj-xw9cDwiMaKwwmFY4y0mMg7LfuhDNKFdeSYzM~yAAWBlEfdNK1ibWlwYTZPVA56SSqc794RvmlpcpTWRJ3t9A4j9mzbtMB6m68rnWI3FnJyxOaqJsYplSgEvpo2FVXMhGOZDa~U7esKmlNW9nCM7dhEk4NBWrmPkjAiGLznL5hUHWcHf3EWebBA__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)You receive another lead with that is shown the same consent language and make an API request to confirm that the language is now approved.
Collapse

00:00

01:40

![](https://content1.bloomfire.com/thumbnails/contents/004/537/207/_270x180.png?f=1729093803&Expires=1748567811&Signature=XAwvV43o4~vLE8NMEWU6ysogkGOhYF3cIaYQm7ViGch3NSC1znCBB-4YtjUQDkAJK3woIMFMC~YLuf4jYBhAeUZJO343IKwr~nTAhM4gpUsfwXxnL46~pX9LVv5~oCk4DGfoeGO2l~deuqgTw44u1kA3HyPgiyvgkqkDf6bIDB2s304K9EOK7wXIYQ8JilhIXXUEdA5O2AjNXA~AmPE9reQkYjCP2v2tWSMQlEK26zhXKrNBYgzTk3fMgIDtplQMw9QdBrlikDAz5GGZmpG6MtAtKjYjYRe3QzIEFT-bIWcfdqHDioZV8ixnEfh-lg9Y3DjrhCVOryD7caf4ow1H~Q__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

#### Verify.mp4

# Frequently Asked Questions

1. **Can I approve new consent languages so that they don't get rejected?**

No. New consent languages are just as risky as rejected consent languages which is why they both return ""false"" when the approved language check is used. We recommend having your vendors send test leads anytime they make changes to their consent language so that your have an opportunity to approve it and avoid unnecessary rejections.

New consent languages will come in under the unreviewed section in your [consent language manager](https://community.activeprospect.com/posts/5474006-trustedform-consent-language-manager).
2. **What happens if the lead isn't shown a consent language?**

In this case the approved language check will return ""false"" since an approved consent language was not present. In addition the reason property will contain ""Consent language not detected in the certificate."" to give you additional details if you are investigating why leads fail this check.
3. **Is this the same thing as the page scan feature that is part of TrustedForm Insights?**

No. Page scan is intended to be used if you are looking for the presence of certain words or phrases to infer how the lead was incentivized to complete the form. If you are trying to determine that express written consent was obtained from your leads use Verify. It is specifically designed to search for consent and reduces the workload involved with managing multiple variations of it. Verify will also continue to add features which help manage compliance overall.
4. **Can I manually add consent languages so they are approved before they are shown to my leads?**

Yes. You can [manually add approved language to your consent language manager](https://community.activeprospect.com/posts/5448162-manually-add-approved-language-to-trustedform-verify-consent-language-manager).
5. **Can I add a wildcard to account for parts of a consent language that may change for each consumer?**

Yes. When adding or editing a consent language you can use the ""Insert Wildcard"" button to replace a dynamic portion of text with our wildcard character. This make consent languages that are the same except for the text represented by wildcards match.
6. **Are consent languages in spanish or other languages automatically translated to english?**

No. All consent languages are preserved as they were displayed. This means that if a consent languages that translate to one of your approved languages will fail is they are written in a different language. To prevent this you'll have to approve consent language variations in all the languages they will be displayed in.


Type something"

