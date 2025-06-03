---
URL: https://community.activeprospect.com/posts/5073048-how-do-i-build-a-bridge-with-facebook-conversion-leads
Page Title: How do I build a bridge with Facebook Conversion Leads?
Screenshot URL: images/screenshots/screenshot.png
Scraped At: 2025-06-02 19:41:47.122
---
jMArE3wIPRtrQArbESrIGwUPTDkSkxaLdh5HnNR7PprvvZkgyORiQ9sBmyzfL7vm~uem6x1rmmE66NY2L6kelJMdaleWNpLhkug3Gu5uNKPMDm6X88cQ44wpDjO4XZSXXfTO26a2Vvhr9JO6y~w__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/8017840-claudia-melis)

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




    ![](images/image-1.png)
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
      ![](images/image-2.png)
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

![](images/image-3.png)

By going into Settings, you should see three blue checkmarks proving that the Sales Funnel was set up correctly:

![](images/image-4.png)

Then, we can create a new Lead Gen Campaign and:

- On the Ad Set level, **Optimization & Delivery** section, select the Conversion Leads optimization.
![](images/image-5.png)
- On the Ad level, **Tracking** section, make sure that the box CRM Events is ticked. (It should be ticked by default.)
![](images/image-6.png)

## Additional Resources

- [About Delivery Optimization for Lead Ads (Facebook for Business Help Center)](https://www.facebook.com/business/help/782657799338685)

- [Set Up Your CRM for Conversion Leads (Facebook for Business Help Center)](https://www.facebook.com/business/help/279369167153556)

- [CRM Integration (Facebook for Developers Docs)](https://developers.facebook.com/docs/marketing-api/conversions-api/guides/crm-integration/)


Type something"
