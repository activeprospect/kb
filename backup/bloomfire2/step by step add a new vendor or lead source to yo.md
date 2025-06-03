---
URL: https://community.activeprospect.com/series/4583478/posts/5034662-step-by-step-add-a-new-vendor-or-lead-source-to-your-flow
Page Title: Step by step, add a new vendor or lead source to your flow
Screenshot URL: images/screenshots/screenshot.png
Scraped At: 2025-06-02 19:41:44.258
---
icWvry-6NFtx-vsOyBTOplx1vJt0vhDWQS05AJ2f1v6fbOQEEPv2KhWb07QP4vk9WwYHzGy5ZrIGODE5nP5Sr8xtHbw2Sq3PUXETDekc4BwV2UFfEJJz9KVM-C28ye~SW1NwPB15D3q6s04Hcag__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7557566-ashley-thomas)

[_Ashley Thomas_](https://community.activeprospect.com/memberships/7557566-ashley-thomas)

Updated April 21, 2023. Published April 14, 2023.

Details

# Step by step, add a new vendor or lead source to your flow

How to add a source for a new lead supplier (e.g., a vendor, partner, or site) to an existing LeadConduit Flow

Periodically, you'll want to set up a new Source in your LeadConduit flow for a new partner, vendor, or web site to send in leads. Here are the steps in that process.

# Gather information

To set up a new source, you'll need to gather the following information:

1.  The name of the vendor, partner, web site or campaign you need to set up. Here we'll call this a ""Vendor"" or ""Source"" but it may be a partner, web site, campaign, or lead supplier.
2. Requirements you have for the data in the leads

# Examine existing sources

If other sources pre-exist in the flow,  assess how existing vendors appear on the Sources tab. You'll want to set up the sources (vendors) consistently in your flow in order to get the most out of your data. Specifically, if you have other sources already:

1. Click the Sources tab. Are there any acceptance criteria that are present and/or customized for each source?
2. Are there mappings that are present for most of the sources, and may need to be duplicated/customized in the new source?
3. Are there mappings that are specific to this particular source that need to be identified out of LeadConduit, such as a value used for particular campaigns or lead sources in your CRM?
4. Does the pricing column for other sources read ""Buyer Price""?

# Adding a Vendor - Details

Now set up the source for the new vendor:

## A. Edit the flow and add the new lead source

1. Click on the flow from the LeadConduit Home or Flows list and pick “Edit Flow.”
2. Click the Sources tab and click “Add Source” at top right
3. Search on the vendor name
4.  If there is a source name already available for this vendor, it will pop up and it's best to click it. Otherwise, enter a vendor name under ""create a new custom source""
5. Pick “LeadConduit Standard” if you are creating a new custom source, in the vast majority of cases
6. Select “Other” as the source classification so that if you want to, you can create a test lead in LeadConduit
7. Click ""Finish""

## B. Set up the acceptance criteria and mappings, if applicable

Set up any acceptance criteria and mappings that mights be needed/requested;  examine whether  other vendors have mappings if you're unsure

## C. Set up the pricing parameters

1. You may need to check whether the pricing of other sources shows ""buyer price"" or the customer has specified pricing that you need to track
2. If the vendor will send in the price of the lead in the ""price"" field, you need to enable ""Buyer Price"" for your new source, click the pricing link to the right of the source in the sources tab;  pick “Vendor.” Click “Save Pricing""
3. If the price is static, you can edit the pricing link, which is initially “$0.00”, and click ""Save Pricing""

## D. Check for (Rare) Source Specific Rules in Your Flow

(Rarely) If your flow is complex in logic, you may benefit from clicking on ""Steps"" and checking for delivery step criteria or filters that reference particular sources - a quick check may identify a rule where you need to include your new Source

## E. Save your changes

Save the flow at top right. Don't forget to save your changes; probably the most common error is forgetting to save your work!

## F. Send submission document

1. Send the new submission document URL out to the team, asking the new vendor to send in a test lead.
2. Click the flow name in the path at top left, in the navigation
3. Click the source name from the drop down list at top right to find the submission doc for the new source.
4. Copy the URL of the Submission Doc from your browser. Here's an example: https://app.leadconduit.com/flows/5e6faa784b842808342a4d25/sources/640a98819d091a08e2/docs
5. Then, send a note back similar to this one to the new lead vendor and the team:



Dear \[Lead Vendor\],

We’ve completed the integration needed for you to submit leads to our lead process. To ensure a smooth and successful collaboration, we would like to provide you with the necessary guidelines for submitting leads to our system via LeadConduit. You should submit the leads to the webhook provided in the Submission Docs, which can be found at: \[insert the submission docs url such as [https://app.leadconduit.com/flows/5e6faa784b842808342a4d25/sources/640a98819d099c468e2/docs\]](https://app.leadconduit.com/flows/5e6faa784b842808342a4d25/sources/640a98819d099c468e2/docs%5D)



Please ensure that all data is formatted correctly and that the required fields described in your Submission Docs are included. Examples are in the Submission Docs; just pick the format from the drop-down and you can see formats and fields included for different submission formats.



Please send over a test lead when you are ready; if you have any questions or concerns regarding lead submission or lead requirements, please do not hesitate to contact us.

# Field any questions that arise during testing

Check LeadConduit each day to see if there are test leads; if a test comes in for the new source and encounters an error, report back the error to the vendor, and request a retry correcting the leads until things are working correctly. Generally, when a lead is successful and you can see it in your CRM or other systems correctly delivered from LeadConduit, you can call the process complete.

# Other Resources

More detailed information about adding sources is available through the following community articles:

- [Adding a Source](https://community.activeprospect.com/posts/4098888-adding-a-source)
- [Adding an Account Source to your Flow](https://community.activeprospect.com/posts/4122047-adding-an-account-source-to-your-flow)
- Video: [Adding Sources to a Flow](https://community.activeprospect.com/posts/4541251-adding-sources-to-a-flow?video_markers=source%2C%2Csource%2Csources%2Csource.%2Csources.)

Type something"
