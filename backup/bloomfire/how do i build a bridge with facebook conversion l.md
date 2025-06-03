---
URL: https://community.activeprospect.com/posts/5073048-how-do-i-build-a-bridge-with-facebook-conversion-leads
Page Title: How do I build a bridge with Facebook Conversion Leads?
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-72570c20-64ea-4ef3-ae25-a5ce9673c676.png
Scraped At: 2025-05-30 00:16:13.402
tags:
  - leadsbridge
  - intermediate
  - integrations
  - how-to
  - seller-focused
  - data-management
  - analytics
secondary_tags:
  - flows
  - developer-focused
  - reference
  - technical
  - best-practices
---

[![](https://content2.bloomfire.com/avatars/users/1451136/thumb/thumbnail.png?f=1623686660&Expires=1748567763&Signature=UBNSslGLM1FqjguGtJJriNdu5W1L1c43ZIGiGcfN2STml6Ul4gIlVOF7WaqYTskfjKyvVtcm2Acfju0AON0ryhslrbSkV4QwT9Q1VYPCStySO-cHqnwUiuGSxQMgN24ELmpCoznNdb-15lWZOhW3mNsJhk1B9Ltr478mvGtTvfGmwVCXaasStQMChwn2RMh96mf3NJ9Zl0t-HiPSN2vfzLug8AWSpYXm~KtEEkmw8g-lbsnN6QlGDU7iFuwYZN~N-htRIhXkfUEjlWj9lwrvRkx7ShqZnxk3kdtXLD1zWODvOlwkjwgIJ-mRkho0hHtb4frZWy0wfHMg3UK28PIyBQ__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/8017840-claudia-melis)

[_Claudia Melis_](https://community.activeprospect.com/memberships/8017840-claudia-melis)

Updated November 17, 2024. Published May 29, 2023.

Details

# How do I build a bridge with Facebook Conversion Leads?

By sharing your CRM with Facebook, your business can focus on higher quality (or conversion) leads. (This type of integration ultimately relies on Conversions API or CAPI).

Here’s how it works: You set up your CRM so it sends customer data back to Facebook. Facebook can then analyze the type of leads that are more likely to convert and show ads that result in these higher-quality leads. This optimization for your Lead Gen campaigns is called “Conversion Leads.”

Conversion Leads events refer to what happens to a lead after it is generated inside your CRM. These are often called funnel stages. For example:

1. Lead Generated
2. Marketing Qualified Lead
3. Sales Opportunity
4. Converted
5. Disqualified

Note that these event names can be customized freely. Their name doesn’t actually matter as long as their meaning is clear.

### **Before you start, check if your business is a good fit...**

Before starting the integration, here’s how to know if your business will be a good fit for the optimization model. (The guidelines below are to ensure good performance with the model but can be flexible.)

- Use Facebook/Instagram native Lead Ads (Instant Forms)
- Ensure the 15-16 digit Meta Lead ID is mapped to your CRM
- Generate at least 250 leads per month
- Can upload data regularly at least once per day
- The lead stage you want to optimize for occurs within 28 days from the moment leads are generated
- The lead stage you want to optimize for has a conversion rate between 1% - 40%

### Step-by-step guide on how to build a bridge with Facebook Conversion Leads

01. Click on the **Create New Bridge** button on the top left corner of your LeadsBridge account.

02. Select your source of choice. The most recommended ones are popular CRMs like Salesforce, Hubspot, or Zoho CRM.

03. As the destination, select Facebook Conversion Leads and hit the Continue button.




    ![](https://content0.bloomfire.com/thumbnails/contents/003/910/352/original.png?f=1696319019&Expires=1748567763&Signature=JXEYhoMcVSlOhxWSHl4qSpSImSRq~Um9~4rDt-KNvs-8Eo9yCDtV2a5DvZwmQOgBC2ABV46-W~owKsAgwNCahRcZjkDO6gz6bNvnOQFrdBQBDEDoGrFl3os1QGstTf6V~dzbHYJwgtUm3RIQtkFwC4Y6eSldCssaEvV2xfcTEunBxBSPYPz9dE3zOT5txujYuxY77EHrixtocQXifYpKoQVM6gJq~DpFjwy1w4KAsYg66aGXgwVCRBQ8KG3~O1CJfwDh-OSlo74qxQ~W5NbHTMi983RAxAu~jnBmoYlvpQ1Btz1glEdYDLGuKu2jRVf7nysWZsE89TQS45mim6mymQ__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)
04. The first thing to do is to authenticate the access to your source

    - Click on **Connect** (followed by the name of your source, like Salesforce)

    - Then click on **Create new integration**. As an alternative, you can also select a previously used integration.
05. Follow the steps on the screen to authenticate the access with your source system

06. The configuration steps at this point may change depending on the system you use as the source

    - Generally, you will need to choose which Entity (or record type) we want to retrieve from your source system (e.g., Leads, Opportunities, Contacts, Records, etc. - every integration has different entity options). To do this, select one of the available options from the Manage “Objects”  dropdown

    - Choose your Segment type (e.g., Static or Dynamic List views, Spreadsheets, Files, etc. - every integration has different segmentation options). To do this, select one of the available options from the Use “Segment” as a dropdown

    - Then, depending on the entity and the segmentation chosen, you will need to select your Action. For instance, if you’ve selected Salesforce as your source, Lead as your entity, and List View as your segment, under Action, you will find a list with all the List Views created in your Salesforce instance containing Lead Objects
07. Now it is time to set up the Facebook side. Click on Connect Facebook Conversion Leads and click on Create new Integration

08. Follow the instructions on the screen, and make sure to select the right Business Manager and all the other resources, especially the correct Meta Pixel you want to send events

09. Once this process has been completed successfully, you will need to:

    - Select your Pixel from the **Pixel** dropdown

    - Select your syncing frequency by choosing an option from the **Sync Each** dropdown. We suggest using the default 6 Hours option but feel free to choose a different one depending on your needs

    - Select when you want to start syncing by choosing an option from the **Start Sync** dropdown. We suggest leaving this option as Automatically Detec
      ![](https://content0.bloomfire.com/thumbnails/contents/003/910/353/original.png?f=1696319086&Expires=1748567763&Signature=ZRlPyuyMkCoTgpK8aUb58~D82-LjIw1UCITQUoz5exlCX87e-w0AUNQnhd0dhCefunJA-hBo62e6ZuGKEa27bGFyNNG396TjriU82ha1Bs34vVO0Unpy0Wyzpbnc6niHNVuHJyfAclctaXF2hTAou7h~Qo3zKJJ91M~18CB2lheNz1lkzpe3CjX4bMns35xDDiqJnnFrrpKHWXuY4CvpLu44Os~HkBlJsyzwwNW~HdXNTgxiMl~XusgJu6AENwXYpaSd2mwUwmuvZNxW2VTsiX8D4HwC9I11b4sJetcqnLQUo4~bdcbYbPc~F-fO7x2D06WlRmpQH8MG2j9uXMphtQ__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)
10. When you’re ready, hit the **Continue** button.

11. It is now time to set up the Fields Mapping:

    - **Event Name:**

      1. If you are creating only one bridge because you can retrieve this value from one of your source fields, simply select one of the fields from your source and map its value to the Event Name. We will include it in the payload for Meta.

      2. If this value cannot be found within the fields that come from your source, you will need to set a static value here and create multiple bridges with different hardcoded values. To set a static value for one of the mapped fields, in the mapping of the field, click on the empty source field, type the name of the field and select **Create** text option.
    - **Event Time:** Select from the fields of your source the one that represents the event time for this particular event. Note that we need to select a field with the value of a timestamp of type Date/Time.

    - **Lead Id**: This is an essential step. Select from the fields of your source the one that contains the Facebook Lead ID of that specific record.
12. Click on the **Save & Publish** button.


Now you’re all set! You can access the newly created bridge by going to the CRM Integration section under the Facebook Suite: [https://leadsbridge.com/app/facebookConversionLeads](https://leadsbridge.com/app/facebookConversionLeads).

From here, you can see the status of your Conversion Leads bridges. You can hit the **History** button for each of them. This will show you what happened in all the previous uploads.

For each of these uploads, you can even download a CSV file with a detailed list of all the records we tried (successfully or not) to upload to the Meta Pixel.

If you need additional help, check out our Community, or get in touch with our [Support team](mailto:support@activeprospect.com).

## **Common Questions**

### **How can I retrieve the events I need from my CRM for this optimization?**

Situations are all different. It depends on which CRM you’re using and on the particular workflows that your business has in place. Sales are not made in the same way in every business. Don't hesitate to [reach out to us](https://leadsbridge.com/contact-us/) if you need guidance setting up this integration.

### **What is the CRM Integration?**

The Facebook CRM integration is a way to retrieve events from a CRM and send them via CAPI. According to Facebook, CRM Integration can be performed either manually (with internal technical support) or with the help of a partner (such as LeadsBridge).

With the CRM integration, the only valid leads that will be considered for the Conversion Leads optimization are leads that come from Facebook. In other words, leads generated with a Facebook Lead Generation paid campaign, ones that have a Facebook Lead ID. In fact, all leads generated, for instance, on a Web form or that come into the CRM from sources that are not Facebook campaigns, will not be considered for the Conversion Leads optimization.

### How to check that my campaign is using Conversion Leads Optimization?

Once all of this has been done, you should [follow the steps listed at Meta’s Business Help Center](https://www.facebook.com/business/help/279369167153556) and make sure to:

- Configure the Pixel you used in LeadsBridge as a CRM connection and

- Set up the Sales Funnel and choose which Conversion Leads event you want to optimize for.


If you did this correctly, in Meta’s Events Manager, your Pixel will show up with this icon:

![](https://content1.bloomfire.com/thumbnails/contents/003/910/355/original.png?f=1696319179&Expires=1748567763&Signature=DbJq-LwLeJQ~O9vvgE7n5O1hoyDob~GlzyPNsfPr-IJt3kmepUIjWBS-CkkQhAbuoXJEarTBaM7zXt-1dPz291OZ7tw5m-RsRi0WoP0yXAjZhH6ASuXGxK3qY2UTa9Mkm8nDmGr0-S145wB-phrdtvkUEZNSBS0j3sgz8383wI2VGQCsKoXcEKrHkntJJETdR7LgqbTn3q8G2u8hbyTituRwUNeZXZr83jHCDXonTWlv6e1T9GfHEkvEs2KiEE2tXfn-aXMDMNQNb1LU12~Y~NTIA4RMf5dBUqOwTCOqW5zKeS~TvAhhtlZ6UwID--aeiaeyom3lVDABaQwx2m6J-Q__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

By going into Settings, you should see three blue checkmarks proving that the Sales Funnel was set up correctly:

![](https://content2.bloomfire.com/thumbnails/contents/003/910/356/original.png?f=1696319279&Expires=1748567763&Signature=T9yGN~u5POQMIuxjcZ3qK8NtjIfRsePwJg~sCaNmEoKa19~9lCCfa6rSJPYgCPpq~qXXND8r2Zg0OijywbAHcC8b~ux89-093nj35jJX7YqGqIDdplS5nuvN-RZ85~M7VQpMZ-aFwi-~GH4Pc~TncIOXPSOh7aXpPFLfHuBqzNVRFsB0fPL48WZ0baV1-qURXf2c6BFOwF1impc3QUXkOYqR2GSsMqbFLaycz5au~hQYMszmDxT6mGnJ~Rz431eviXIxJA0GhP0U3htZjF~oEW4aZna4EAhzuySNuaAzFw6EbceBN0GBH88Ro~c6vU3NMNhvpxDKobjf-X9nqk1weA__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

Then, we can create a new Lead Gen Campaign and:

- On the Ad Set level, **Optimization & Delivery** section, select the Conversion Leads optimization.
![](https://content1.bloomfire.com/thumbnails/contents/003/910/357/original.png?f=1696319360&Expires=1748567763&Signature=dyCcHo0UFdprMJda3eJ43pmObVpNzxEAxWHM5n5s56k2RZQTuCiOfQqFRVTuq5~qJgOXqYwvk1RloF0W0OBhCKBNnKiRyaal83zQqjSIAL4weRDRFY5KrnnKVmGll7XR-HxUrw2ZO8MNKwSjNB9l3NgHstOo0Dtfv2-WmuVCP0mPXbuVs9tZLTDhEFOOHOUVubbvQ1ae3G4MXIjht8JR-0pEaoidmcU-xWZXzqgrY26bxVt3fTKaRrqeHdg7T6rMN2o1Y0OhLAZxPVBMI99iTLj-mYDHOmx2A21oK5b99YsyoM9enBOBhv6f466Ym8hU~L1OU0zfYMX4SV1JNKGWew__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)
- On the Ad level, **Tracking** section, make sure that the box CRM Events is ticked. (It should be ticked by default.)
![](https://content3.bloomfire.com/thumbnails/contents/003/910/358/original.png?f=1696319387&Expires=1748567763&Signature=K6e16st4l79imVcsIpY4WY5~Jy2eI~AU8ElcwehAy9-Kw~pZ4YZOn1-0uTkDw96Gtxt77EToVKnrscm2Z~8jsh-6paDVsY-LdL5ewudozur4sjanFtPfRn9FUIRMS3JHjXvqGhVM6k86LyQ59QDJJcz1vpjinGFCLZ7zhqIC9QK8n6BuUXhjksuoI~bhL~Apark2L4iSUwIRnzjerCASfulHxb6xSyaoXYbM10LpJ5YDQYdAzchsuqThq1HV8heARMEfURDT4~0e1ZcgjwiB3UB1z6TOTn7p1V4fMSx78SoZ5dCfa5TbLtaQdD0FUjtQ-kgBVnEjl2qokLZen5iuXA__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

## Additional Resources

- [About Delivery Optimization for Lead Ads (Facebook for Business Help Center)](https://www.facebook.com/business/help/782657799338685)

- [Set Up Your CRM for Conversion Leads (Facebook for Business Help Center)](https://www.facebook.com/business/help/279369167153556)

- [CRM Integration (Facebook for Developers Docs)](https://developers.facebook.com/docs/marketing-api/conversions-api/guides/crm-integration/)


Type something"

