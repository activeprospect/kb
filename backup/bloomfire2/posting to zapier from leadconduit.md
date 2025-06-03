---
URL: https://community.activeprospect.com/posts/4161946-posting-to-zapier-from-leadconduit
Page Title: Posting to Zapier from LeadConduit
Screenshot URL: images/screenshots/screenshot.png
Scraped At: 2025-06-02 19:41:37.339
---
65Y6CQUthWd1mmIrwdfYs4ZjFBH6g~MU-VA0ij45wYtWOrIHf373~v~5Aak1kt6xFXG4jQWH0KYx2bil8xJ37I-QPuX0YluSyLs7N6IiaagmL0hQx25hDLaMn7ZcWY~9YAzp4seFeI7TgQ3jrgA__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7557566-ashley-thomas)

[_Ashley Thomas_](https://community.activeprospect.com/memberships/7557566-ashley-thomas)

Updated February 8, 2021. Published February 8, 2021.

Details

# Posting to Zapier from LeadConduit

This example creates a delivery to Zapier from LeadConduit.

### In Zapier

To send leads to Zapier from a Leadconduit flow, first create a webhook trigger in your Zap. Or you may already have a Zap created that should receive your leads, like the one in this example:

![](images/image-1.png)

Make a note of the Webhook URL in the trigger. This is the Zapier URL where LeadConduit needs to send leads.

Go ahead and complete your Zap, configuring whatever actions you'll want it to take when it receives a Webhook delivery from LeadConduit.

### In your LeadConduit Flow

To create a LeadConduit delivery that will send a Webhook to your Zap, do the following.

01. Log into LeadConduit and edit the flow where you want to delivery leads to Zapier (or create a new one).
02. Click Steps tab -> Add Step -> Recipient Step -> search for Custom. Find and click on the generic ""Custom"" integration with the icon.

    ![](images/image-2.png)
03. You will be prompted to name your integration. The best practice is to give every recipient a unique, meaningful name. Select whether you are sending to your own system or another company and click Next.
04. Select Custom Json from the list of integration types on the next screen, and click Finish.
05. Your new delivery will be added at the end of the flow.
06. Click the new delivery to expand it and click “Edit Field Mappings” to start.
07. Add the Custom Webhook URL (from Zapier) to which you will send the request in the first line of the delivery step, on the left hand side, adjacent to ""Url"".
08. Add fields as in this image. Note that the mappings for lead data require you pick ""Form Field"" from the right hand drop down before entering the field name:

    ![](images/image-3.png)
09. The last two mappings have special meaning. They use the Outcome Search Path/Search Term options for identifying a successful delivery on the right hand side. This is called ""Response Parsing"" and sets up the content of the ""status"" key as the place to look for ""success"" to signal an acceptable lead in the Zapier response to a received webhook, as in this example:



    {

    ""id"": ""88a54d9e-df4d-44c0-971c-094a90a8ddd9"",

    ""request\_id"": ""60203d9f-5070-44c0-bba5-5a5f2234bbd0"",

    ""attempt"": ""60203d9f-5070-44c0-bba5-5a5f2234bbd0"",

    ""status"": ""success""

    }
10. After you have entered all of the fields, save the mappings by clicking “OK” at the bottom of the dialog. Drag your new delivery step to the appropriate position in the flow (which will execute its steps from top to bottom). Save your flow by clicking “Save” at top right.



    Send a test lead and verify the delivery, checking the lead in the Leads -> Explore Lead Events display for the status of your tests and adjusting your delivery as needed until it is working.



    Tip for test leads: Before testing a new delivery in an existing flow that is already processing many leads, you can limit the leads that enter to a particular source or email reserved for tests with Step Criteria entered on the step.
11. Finally, your response parsing (see above) won't have any effect on the lead unless you have a means to evaluate the success/failure of your new delivery and stop the lead if it has failed, which is usually desired. This is accomplished by adding a Filter step.

    ![](images/image-4.png)
12. Once again, edit the flow. Pick Filter Step from the Add Step drop down at the top right. A step will be added to the end of the flow. Click to expand it. You'll want to configure it like this:
13. Don't forget to save your flow.

Type something"
