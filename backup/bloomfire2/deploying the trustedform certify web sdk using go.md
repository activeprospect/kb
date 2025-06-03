---
URL: https://community.activeprospect.com/series/4190127/posts/4129671-deploying-the-trustedform-certify-web-sdk-using-google-tag-manager
Page Title: Deploying the TrustedForm Certify Web SDK Using Google Tag Manager
Screenshot URL: images/screenshots/screenshot.png
Scraped At: 2025-06-02 19:43:02.008
---
SWFpsQVCfGkqsPnGkt-tVbnjE8lsrZ7~VmptIfGZ1P1c5BEqDCvLqCOIqWkV6tIWy~97Zs10RuLtaEFy0zMqyBS~RlYYA4LNTTy3Kqn6ZKPVmNXLAW9AJiYddGhfLxhfYj~Xk-OWGItHsGxmQLA__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7846678-christopher-williams)

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

![](images/image-1.png)

Next, create a custom HTML tag named ""TrustedForm"" and place the TrustedForm Certify Web SDK's Javascript Snippet into it. Set the trigger to ""DOM Ready"":

![](images/image-2.png)

Publish the container and Google Tag Manager will handle the rest.

To check that the TrustedForm Web SDK is firing properly, use your browser's inspect feature (right-click on the page and select ""Inspect"" from the menu.) to view the in-memory page source. If the script is loading and executing, you'll see the TrustedForm hidden fields  in the form code, populated with a TrustedForm Certificate URL. The Certificate URL will be different every time the page is loaded:

Collapse

00:00

00:14

![](images/image-3.png)

#### TF\_GTM\_Inspect\_Page2021-01-14.mp4

Type something"
