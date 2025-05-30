---
URL: https://community.activeprospect.com/series/4190127/posts/4129671-deploying-the-trustedform-certify-web-sdk-using-google-tag-manager
Page Title: Deploying the TrustedForm Certify Web SDK Using Google Tag Manager
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-167930a5-3943-4467-accd-c286e6fd64cb.png
Scraped At: 2025-05-30 00:16:41.971
---

[previous page](https://community.activeprospect.com/series/4190127/posts/4076729-flagging-sensitive-data-with-trustedform-certify) 3 of 8 [next page](https://community.activeprospect.com/series/4190127/posts/4076826-manually-triggering-trustedform-certify-web-sdk-delayed-execution)

In Series: [Advanced options when implementing the TrustedForm Certify Web SDK](https://community.activeprospect.com/series/4190127-advanced-options-when-implementing-the-trustedform-certify-web-sdk)

[![](https://content2.bloomfire.com/avatars/users/1405246/thumb/thumbnail.png?f=1620827893&Expires=1748567774&Signature=WTTOqztRC7U-S55SOSIf9P3hqE6TNryUy3kqOV4rwBHGDb0Ckl8tieyFbTt9JkDhY5eT2-0nExUlIdUHmcbo~MLaS3OfaLy640OprXvFuAj8jiiiAKvuaNvNO~5TB5YvqgdhNVMxIEoumXqj0k4QPs~MzWZsTWVsufLlvfbmqiCJodrggo81OdQLyzMKVl3rcVUyhjdXKypx89V831oePVWQhGNETN6RZ96OOquiqMR7h2lXD4s7wxNUu2TgO8TUVHu65sI0F~1cswXJqCN9PzSusja9hm7~xyvDe~RncAW3QgSB9IO809B0dAFmhhUJzh-2tQ65jH3MfYLjgzSrzA__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7846678-christopher-williams)

[_Christopher Williams_](https://community.activeprospect.com/memberships/7846678-christopher-williams)

Updated December 26, 2024. Published January 14, 2021.

Details

# Deploying the TrustedForm Certify Web SDK Using Google Tag Manager

Use Google Tag Manager to simplify deploying TrustedForm across multiple web pages

Google Tag Manager (GTM) can be used to be used to manage tags/scripts deployed on your websites in a central location without changing their source code. Users often use this to simplify implementation of TrustedForm Certify across multiple web pages but doing so comes with risk. GTM may be blocked for a number of reasons including:

- Ad blockers: Ad blockers can block GTM by default or manually.
- Browser settings: Some browsers, like the latest version of Opera, block GTM completely.
- Safari Incognito Mode or Advanced Tracking protection: These settings block GTM and other scripts.
- Exception triggers and additional consent checks: These are common causes of blocked tags.


Reports indicate that as much as 5% of traffic blocks GTM which. If TrustedForm Certify is implement using GTM this would prevent it from creating certificates for that traffic. As such, **ActiveProspect recommends adding the the Web SDK directly into source code of your websites rather than using GTM**. If you still would like to use GTM follow the instructions below.

# How It Works

First, be sure your container is configured for your domain and its scripts are installed in the source code of your site's form pages:

![](https://content2.bloomfire.com/thumbnails/contents/002/463/801/original.png?f=1610650552&Expires=1748567794&Signature=IAUKLuHMo~w~gZxbu-J-URcH41j~J13POZ3lKZGOAfY9bbjnMB-tWyHTyV~C8IloRiayyNyCuGi6f9W3DLBDHSrq6yIRwYcp2k5am-qlXYCPijJoGOCVuoxPve9pNg380hkz9LFxar9~K0dd7VWzm9i1sK49UfOPlvJ7YArX2p-RAdJwWba1eBF5qnl-XlFyaIp27VYwRbSNlkjkTWmYYWy5Vn7M28~qQTMGTj5ba~WE4eeIw30my7elWRtD1~I-MKYCOj5smIhZOK1d6KEB-HbTSAjAc-IYR1phpEuFB50omTRJLpoHWOofPcjhSfp9-ZhRpotndckdM-BYDs-bbA__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

Next, create a custom HTML tag named ""TrustedForm"" and place the TrustedForm Certify Web SDK's Javascript Snippet into it. Set the trigger to ""DOM Ready"":

![](https://content1.bloomfire.com/thumbnails/contents/002/463/805/original.png?f=1610650661&Expires=1748567794&Signature=in3vyMRMcdyBo1SOM3i4ypja5iN0I3mVTo7dDSKxzvvjtHSYVBN~oTpR8QN2uWDKXizpy4Yj8oSwODzW9KLBC23KNEVef0KofbuQvAOHiHiAHSEHMGEdUXvsaDeBTWARs1jUblBkv~zIvYlHAGp~XJ9mfxcq2E78p4qZp6kbIvOgwfxNKf72R0yamZ4LrpbQbLV8KRPnOjcs6uhBtCmnNfYEtTQS0-3ycQtN4LWdnWi6Xz2kTwa4KX5Y15HRySLeEBfJ8jvZbKejdjetpdVaRr5Ixi1vrr-kswItxRjm4vlWpg-Wb3g02mynFRNg2XDWPKL3QQdaH6ZOjMkQY548Og__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

Publish the container and Google Tag Manager will handle the rest.

To check that the TrustedForm Web SDK is firing properly, use your browser's inspect feature (right-click on the page and select ""Inspect"" from the menu.) to view the in-memory page source. If the script is loading and executing, you'll see the TrustedForm hidden fields  in the form code, populated with a TrustedForm Certificate URL. The Certificate URL will be different every time the page is loaded:

Collapse

00:00

00:14

![](https://content1.bloomfire.com/thumbnails/contents/002/463/834/_270x180.png?f=1610651393&Expires=1748567794&Signature=eE93kR0ayQ6GG03p7N4yqW7GWjNguR7thPzKmkLI1VfR0BPcOtj0eZyzoDIOaDTIG58R3eoCwHxPQpPlSMSPLQa0~CZbhjFr-BhRDlmVo1ApGf0891dvcpBHsNNK6FmXXC6QwqIZx91TcSSB-sTlcsVFdmQrS~WIwS5MAlNoOD00YBvsH9MJWo-vWzEJViZawQ0afkgW7X7anSC1TGUIKu6gpt-3cEAyIl6zTtS-zS-UaSXN9X8OTiSHd3oLb~6Fu~1Hx-Ys-YWHvjXmYHJswtP99B~MGrGydfop5CwCF9bBxTjAl6Y4mZhmRN5hE04UTWqDcfV3-OoBgm8DQOY~Sw__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

#### TF\_GTM\_Inspect\_Page2021-01-14.mp4

Type something"

