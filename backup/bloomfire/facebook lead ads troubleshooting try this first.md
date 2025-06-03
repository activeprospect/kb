---
URL: https://community.activeprospect.com/posts/4164984-facebook-lead-ads-troubleshooting-try-this-first
Page Title: Facebook Lead Ads Troubleshooting: Try this first.
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-fef266d5-cc21-484a-a67f-ecfa062dfa78.png
Scraped At: 2025-05-30 00:16:27.681
tags:
  - integrations
  - leadconduit
  - flows
  - beginner
  - troubleshooting
  - admin-focused
  - semi-technical
secondary_tags:
  - seller-focused
  - universal
  - operation
  - how-to
  - reference
---

[![](https://content2.bloomfire.com/avatars/users/1316943/thumb/thumbnail.png?f=1612413648&Expires=1748567771&Signature=axAV0hhLiLnmzZHambvtBgO5Pyubo6LeJ7yLpJAZHkjIr8p3KMfvVATa~YUqXJG7lMyziECL9iWyw3HdWsP5heuh76Vg3xixkpxD0ZDlAgbxi-jppKa8rNZBamSvbUoCwnPed9vo2h0L0IzyPiJ0JSqo403ANGDeys-Sr2GalFqpHCj8Tsq6e4nk2lArdreHPF-rzDs6dyssWVG3MdKmkYzXfa2T3wFpkomNK9JBrSQr43wCWFnStquqeRLsf85DvsjmX~u8I~dFqccoHbUeCRcgDGvlhAiE1tBtZTa6YoA8MDlG6uJLCn0evCF9kn1br7Pnq5VW5Wao3IeuAtEDhg__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7557566-ashley-thomas)

[_Ashley Thomas_](https://community.activeprospect.com/memberships/7557566-ashley-thomas)

Updated April 11, 2023. Published February 10, 2021.

Details

# Facebook Lead Ads Troubleshooting: Try this first.

If your Facebook Lead Ads are not reaching LeadConduit, try this first. This process confirms and reauthorizes the flow's Facebook integration.

To collect and process Facebook Lead Ads, LeadConduit's authorization to collect leads from your Facebook pages must be up-to-date. When there is a change in Facebook administrative access, which occurs even when no action is taken by the Facebook admin user, or it the Facebook password for the user who initially connected LeadConduit changes, you may need to reauthorize the connected pages. This document describes how to do this.

**A. Disconnect  your Facebook Pages from the flow.**

1. Edit the flow, click on the Sources tab, and click Add Source. Note: Don't remove the existing Facebook Lead Ads source from your LeadConduit flow. What you're doing here will just temporarily disconnect your Facebook pages from the flow. You'll reconnect them in the part B.
2. Search for and click on Facebook Lead Ads Routed Inbound.
3. Authenticate if not already logged into your Facebook page.
4. Disconnect all pages connected to this flow by clicking off the pages.
5. Click Continue and Finish.
6. Save the flow at top right.

**Optionally (Try this after ""A"" as a second resort):**

You can optionally also disconnect your Facebook Pages from the Facebook Account side. This is something to try after performing ""A"", if steps A and B performed alone do not successfully start the leads flowing again.

1. Go to your [Profile Settings](https://www.facebook.com/settings) on Facebook.
2. Click **Business Integrations** in the left menu.
3. In the **Business Integrations** section, select the **Active** tab.
4. Find the LeadConduit integration you need to remove in the list that appears or use the search.
5. Select the box next to LeadConduit and click **Remove**.
6. To confirm you want to remove it, click **Remove**.

**B. Reconnect  your Facebook Pages to the flow.**

1. Repeating the process above, edit the flow, click the Sources tab and click Add Source; search/click Facebook Lead Ads Routed Inbound.
2. Connect pages that need to be connected to this flow by clicking them one by one.
3. Click Continue and Finish.
4. Save the flow at top right.
5. Send a test lead from https://developers.facebook.com/tools/lead-ads-testing/ to test that the page is now sending in leads.
6. Your mappings should be intact after this operation and you should see new Facebook leads coming in.
7. If Facebook leads are still not showing up in the flow, check all of the permissions as described in the article "" [Setting Up Facebook Lead Ads](https://community.activeprospect.com/posts/4062063-setting-up-facebook-lead-ads)"".

Type something"

