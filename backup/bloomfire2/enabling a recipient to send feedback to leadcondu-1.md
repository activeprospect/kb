---
URL: https://community.activeprospect.com/series/4180128/posts/4096395-enabling-a-recipient-to-send-feedback-to-leadconduit
Page Title: Enabling a Recipient to Send Feedback to LeadConduit
Screenshot URL: images/screenshots/screenshot.png
Scraped At: 2025-06-02 19:44:20.524
---
gdsh2Gfi-sdi59jpY4gkbHJuT2g1P9zXBSKPevrkDemb1alWm8Ni6upq3YAHCJmRu0f1C~0PwXG6DmhnNzrtGdZcEfzgn1b2Xho8TG2iZ2wLK8K-Hos6u~QtP6W6-p249Bn5~CGFOFo4S-8EqmQ__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7557680-scott-mckee)

[_Scott McKee_](https://community.activeprospect.com/memberships/7557680-scott-mckee)

Updated September 8, 2021. Published November 30, 2020.

Details

# Enabling a Recipient to Send Feedback to LeadConduit

Feedback is not enabled by default. You must configure each delivery step to allow the recipient of that step to send feedback.

To enable LeadConduit to accept feedback from a delivery (recipient), feedback must be enabled on that step. Once feedback is enabled, LeadConduit will store feedback events each time feedback is given. Here's how you do that:

1. Select the **Flows** tab in LeadConduit
2. Click **Edit** on an existing flow
3. Find the delivery step you want Lead Feedback enabled for, click **Edit Field Mappings**, and add **Event ID** in the outbound mappings for your delivery.
1. Event ID _must_ be included for feedback to work
2. Event ID **does not** need to be added to your fields tab in the flow
4. Click **Feedback Settings** to enable Feedback
5. Select the Lead Returns check box to enable Lead Returns
6. For Returns, optionally choose the maximum lead age for which you want to allow Feedback. Feedback for leads older than the selected age will not be accepted.
7. You can optionally use Advanced mode to create and apply LeadConduit rules to validate the Feedback received. Feedback for leads that meet the rules you create will be processed. Feedback that does not meet the rules' conditions will not be processed.

For example, if your agreement with your sellers requires you to try to contact each lead for at least three days, you'd create a rule like this:

![](images/image-1.png)

To enable Lead Conversions, follow the same process as detailed in steps 5 and 7, but checking ""Lead Conversions"" in step 5. Step 6 does not apply to Conversion Feedback.

Type something"
