---
URL: https://community.activeprospect.com/posts/4062063-setting-up-facebook-lead-ads
Page Title: Setting Up Facebook Lead Ads
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-66d6711b-0ef3-4bd4-a7fc-dbdbf0d66c5e.png
Scraped At: 2025-05-30 00:16:09.986
---

[![](https://content1.bloomfire.com/avatars/users/1317000/thumb/thumbnail.png?f=1617311121&Expires=1748567763&Signature=uRq7uiuRbspwjDIIFLEGT0-tREwtCUCQn7Hx3tIVf6KOyQILKFtAzVskpkySVzaDFArtqyIuxlBjZT5c9Hsowo206s4ZgsIHubq8QlqW8208rJL3nzmFt7ViJkcw2oEPSl5cMHnarvszMoVdktofd7mheO00jlxRQ0O9vbkOsUBsUVRfOWBTurAGLdrpty1cP6xt35oU-UpXKeELe3yJlp~W3BZ-ujykWyqpNUggHB2eH~AiShOKp7rUs93sPCzf-jFk-Vvru7AzuZyDxa8v32Ds0as8UN1lgkpDkgwu3ergZo9f2EJAiRyDf9gaq4NswQbuhjWMqWl~uxtn6MSahQ__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7557680-scott-mckee)

[_Scott McKee_](https://community.activeprospect.com/memberships/7557680-scott-mckee)

Updated July 24, 2024. Published November 2, 2020.

Details

# Setting Up Facebook Lead Ads

The LeadConduit Facebook Router integration gives Facebook page owners control over which LeadConduit flows receive leads in real-time.

# Setup Requirements

To connect a Facebook page to LeadConduit, you have to access three different settings interfaces on Facebook, based on how your Facebook leads are managed:

1. Business Manager settings for you (if you have a Facebook Business Manager set up): you must be a full admin with access to the pages and CRMs for the pages, among other permissions.
2. Business Manager settings for the page (if you have a Facebook Business Manager set up).
3. Business Integrations under Settings on **your personal Facebook page**. Setting permissions here is necessary because you are using your personal credentials to connect LeadConduit to the page that contains your lead ads.

Your Facebook account needs to have, and authorize, "" **Manage your ads**,"" "" **Show a list of the Pages you manage**"", "" **Access Leads for your pages**"", "" **Manage accounts, settings, and webhooks for a Page**"", "" **Create and manage ads for your Page**"", "" **Read content posted on the Page**"" (formerly all included in **""Manage your Pages**"").

These permissions ensure that LeadConduit can subscribe to your Lead Ads events, process incoming leads and generate a TrustedForm for Facebook Certificate. Disabling any of these permissions may cause LeadConduit to lose access to your leads, or may cause ""Malformed Certificate"" errors when attempting to view or retain/claim TrustedForm for Facebook certificates.

# Connect a Facebook Page to LeadConduit (or Connect More Pages)

1. Open your flow editor to the Sources tab. If this is a **new flow**, please make sure to click the **Save** button now.
2. Click the **Add Source** button.
3. From the **Select a Source or Integration** section search for **Facebook** and choose the **Facebook Lead Ads Inbound Routed** integration.
4. Follow the prompts to connect LeadConduit to Facebook.
5. A list of possible pages to connect will be provided.
6. Pages connected to a different flow will include a yellow dot adjacent to the connect button.
1. If you choose to connect a page to a flow that was previously connected to a different flow, the previous connection will be broken in favor of this new connection.
2. Please Note: While one Facebook page can only be connected to a single LeadConduit flow, a single LeadConduit flow can have connections to many Facebook pages.
7. Make your connection choices and select Next.
8. You'll be prompted to confirm your changes.
9. Remember to save changes to your flow!

# Disconnect a Facebook Page from LeadConduit

1. Follow the same steps as connecting a Page, except unselect the Connected page
2. Acknowledge you are about to disconnect the page
   - Please Note: The Facebook Source will not be removed from the flow
3. Save the changes to the flow

# Standard Facebook Form Fields

LeadConduit handles most Standard Facebook form fields automatically, meaning you can connect your Facebook pages to LeadConduit and start receiving leads immediately. The two exceptions are: `work_email` and `relationship_status`. If you collect either of these fields, use the Custom Field instructions below.

If you collect any of the following fields, you only need to add them to your LeadConduit flow:

- Phone 2 (Work Phone)
- Company Name
- Country
- DOB
- Gender
- Marital Status
- Military
- Platform (Facebook, Instagram, etc.)

# Custom Facebook Form Fields

When one of your Facebook forms includes a Custom Field, there is one extra step you must take to connect the dots between Facebook Field ID and a corresponding LeadConduit Field.

The easiest way to get the Custom Field ID is to [submit a test lead](https://developers.facebook.com/tools/lead-ads-testing/) after connecting your Facebook page to LeadConduit.

Once you've submitted the test lead, find it in LeadConduit, open the Technical Details section, and search for **facebook\_field\_data\_apros**. For the following example, the Custom Field label is ""how many ads do you run in a month?""

```
""facebook_field_data_apros"": ""[{\""name\"":\""how_many_ads_do_you_run_in_a_month\"",\""values\"":[\""three\""]},{\""name\"":\""email\"",\""values\"":[\""support@activeprospecct.com\""]},{\""name\"":\""full_name\"",\""values\"":[\""HULK SMASH\""]}]""
```

Next, you'll open the flow editor to the Sources tab, find the Facebook Lead Ads source, and click the corresponding button under the **Field Mappings** header.

The left-hand value will be the LeadConduit Field receiving the lead data and the right-hand value will be the custom Facebook Field ID. Using the above  facebook\_field\_data\_apros as an example, this Source mapping will capture the value **three** to the ""Ad Type"" field for this lead:

![](https://content3.bloomfire.com/thumbnails/contents/002/535/855/original.png?f=1613155555&Expires=1748567763&Signature=vELLKk1XNhg1DCEfecx4ZIkWztZbf~tmRY4hyIK-NySOJrCIfeYjGfi5XvWB58h~JbL~dzmH-WxR4ZIp9q2MICloDGYyWMWOGr0EVF7frfIhyFKcMlV6ZaqpaDyROEpGAUN2Q2VObaisfvT32CeJ3Y6tF0NiZhGSMkiixDz2wn2xODOoCr6pKUxXh1gX4lQqp0~rhKk8Np88Q0uQw4icauJODMMJSOIQDxQIBGWIWtAoGalmHWPvZRu3p-8hvvngkVV8mlywRWUTYS3~EuwDxZaKc81m0RKOQYAbkaO83rhNlyJnGYJBl2PMptLDLHaLPZnZ4GOB4tZARCBeNs4Sww__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

Paste the custom Facebook Field ID into the right-hand value field and click the **Insert {Field ID}** button.

Finally, save your flow and resubmit the lead in LeadConduit. You will now see the custom field with the rest of the lead data.

If LeadConduit is still not properly processing the custom field(s), you can chat with support within LeadConduit during business hours to resolve any field mapping issues.

# Routing Leads at a Form or Ad Level

The Facebook Router RUI only supports Page Level routing. Once a lead is received by a flow, Form and/or Ad level routing can be accomplished using flow rules.

# Disconnected Pages

LeadConduit will be automatically deauthorized from receiving leads when the individual who connected the Facebook page:

- Changes their password
- Has their access to the page revoked

To reauthenticate, you'll have to disconnect and then reconnect any affected pages, according to the instructions provided above.

# A Note on Using Facebook Business Manager

If your Business Manager has a customized Leads Access configuration, you will need to grant LeadConduit access in the CRM settings.

1. Go to [Business Manager Settings](https://business.facebook.com/settings)
2. Scroll to the bottom of the page and in the left-hand field list, click Integrations, then click Lead Access
3. Locate your page in the list of pages and click it
4. Click People and confirm that you have Access
5. Click on the CRMs option and select LeadConduit Lead Ads Integration
6. Click Assign Access

More detailed instructions can be found at the [Facebook Advertiser Help Center](https://www.facebook.com/business/help/1440176552713521).

Type something"

