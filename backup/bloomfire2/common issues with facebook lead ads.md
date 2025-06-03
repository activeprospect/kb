---
URL: https://community.activeprospect.com/posts/5073005-common-issues-with-facebook-lead-ads
Page Title: Common Issues with Facebook Lead Ads
Screenshot URL: images/screenshots/screenshot.png
Scraped At: 2025-06-02 19:42:02.159
---
0GLHTBOFe9kz~hX~VW8LYuca2UW8fW84095H3FOBtTWLkNAxYiVBZaKtbYL~8k9xZA6IDr8afhDdroTLKKs1NZNsbLTBbhy4H-rlcvcdhIykKRQhNLj4ZYf-dcePPH4fM0iywT-0WAkbbUGIxmw__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/8017840-claudia-melis)

[_Claudia Melis_](https://community.activeprospect.com/memberships/8017840-claudia-melis)

Updated July 2, 2024. Published May 29, 2023.

Details

# Common Issues with Facebook Lead Ads

When using Facebook integration on LeadsBridge, you may come across some known and easy-to-fix errors. We’ll explain how to troubleshoot these and get everything back on track.

### **Custom Audience Facebook Error (TOS)**

To fix it, it's necessary to accept the TOS by clicking on the **Accept TOS** button inside LeadsBridge.

You’ll then be redirected to Facebook Custom Audience GUI to accept them, or you can follow this link: [https://www.facebook.com/ads/manager/audiences/manage/](https://www.facebook.com/ads/manager/audiences/manage/)

Please note that the **TOS should be accepted for every Facebook Ads account separately.**

### **LeadsBridge App Permissions**

LeadsBridge should have all of the app permissions enabled to work properly on your account. To make sure they’re enabled, just follow the steps below:

1. Log into your Facebook Account
2. Go to **Settings** » **Business Integrations**
3. Click on **View and edit** under **LeadsBridge** to modify its permissions

[Make sure to give all the permissions to the LeadsBridge App](https://community.activeprospect.com/posts/5070199-why-are-leads-not-pushed-in-real-time-from-facebook-lead-ads-to-my-crm) and click on **Save**.

### **Multi Hashes**

This is an error message that comes directly from Facebook and it says:

_“Failed to update the custom audience: **This audience was created from data source** FILE\_IMPORTED.MULTI\_HASHES, **which does not support data source** FILE\_IMPORTED.HASHES\_OR\_USER\_IDS.”_

It means that the creation method of the Audience doesn’t match the update method on LeadsBridge. Basically, this error comes up when you try to update an Audience previously created from another platform or with a manual upload on Facebook.

To fix this, you should create a new Custom Audience inside LeadsBridge, which will then be automatically updated. If you wish to use an already created Custom Audience as well for your advertisement, you may select both of them when setting up your campaigns.

### The Facebook test didn’t come into my CRM

The _[test@fb.com](mailto:test@fb.com)_ is a fake lead that is not accepted by a lot of autoresponders/CRMs and this could be the reason why you don’t see it inside your platform.

Please follow these steps to insert a lead with real data:

1. Click here [https://developers.facebook.com/tools/lead-ads-testing](https://developers.facebook.com/tools/lead-ads-testing).
2. Choose your Facebook Page where you want to insert the test lead
3. Click on the **Delete lead** button
4. Click on **Preview form** (DO NOT CLICK ON **Create lead** BUTTON)

5\. Insert any valid email and data

6\. Click on **Submit**

Basically, you need to use the [**Lead Ads Testing Tool**](https://community.activeprospect.com/posts/5073014-facebook-lead-ads-how-do-i-send-a-test-lead-from-facebook) provided by Facebook to insert a test lead that you will use to verify that everything works great.

## Error validating access token: user changed the password

The following error shows up when the password for the account has been changed, as it stops LeadsBridge from accessing it:

- _“Api \[190\] “(FacebookResponseException) \[190\] Error validating access token: the user has changed the password”_
- _“(FacebookResponseException) \[10\] (#10) To use ‘Page Public Content Access’, your use of this endpoint must be reviewed and approved by Facebook”_

To fix this you should **Reauthorize** the **Ad Account** from which you have changed the password.

Check [this guideline](https://community.activeprospect.com/posts/5075230-how-can-i-reauthorize-my-facebook-ad-account) on _How to reauthorize your Facebook Ad Account._

## **Lead not pushed in real-time from Facebook Lead Ads**

There’s a well-known issue with the Facebook Business Manager. The following guideline will help you set the correct permissions inside the Business Manager: [https://community.activeprospect.com/posts/5070199-why-are-leads-not-pushed-in-real-time-from-facebook-lead-ads-to-my-crm](https://community.activeprospect.com/posts/5070199-why-are-leads-not-pushed-in-real-time-from-facebook-lead-ads-to-my-crm)

## **(FacebookResponseException) \[100\], \[200\] or \[278\]**

If you get one of the following error messages:

- “( _FacebookResponseException) \[100\] Unsupported get request. Object with ID ‘….’ does not exist_“
- “ _(FacebookResponseException) \[200\] (#200) To subscribe to the leadgen field, one of these permissions is needed: leads\_retrieval_“
- _“(FacebookResponseException) \[278\] (#278) Reading advertisements requires an access token with the extended permission ads\_read”_

You should check which is the Ad Account that returns this error by going to the **Ad Accounts** section of LeadsBridge.

It could be that the Ad Account has expired or some information has been changed on the Facebook side.

To fix this, you should **Reauthorize** the Ad Account involved. Check [this guideline](https://community.activeprospect.com/posts/5075230-how-can-i-reauthorize-my-facebook-ad-account) on _How to reauthorize your Facebook Ad Account._

## Why do I have to enable Two Factor Authentication?

If you get the following error message:

- _Facebook Permission Error. The Facebook Page you’re trying to connect has Two Factor Authentication enabled._

This means that the Facebook Page, or the Business Manager to which the Page belongs, has Two Factor Authentication enabled. In order to solve this issue, you should enable Two Factor Authentication in your Ad Account and then follow the Reauthorization process. Check [this guideline](https://community.activeprospect.com/posts/5075230-how-can-i-reauthorize-my-facebook-ad-account) on _How to reauthorize your Facebook Ad Account._

**Why my Facebook Page isn’t showing up inside the bridge?**

If you can’t see the _Facebook Page_ inside the bridge setup, it means that your connection is outdated. In order to update it, you should **re-authorize** your _Facebook Ad Account_ following [this guideline](https://community.activeprospect.com/posts/5075230-how-can-i-reauthorize-my-facebook-ad-account).

Once done, your _Facebook Page_ will show up on the drop-down.

## Why can’t I see my Facebook Form under the Facebook step?

To be able to manage _Ad Forms_ and related leads, the Facebook Page containing the Ad Forms must be managed by **at least** one _Business Manager_.

Users also have to be managed within the _Business Manager_ of the Facebook Account that is being used. The Page that is used should also be assigned to that user.

If you aren’t able to see the list of Ad Forms inside LeadsBridge as shown below, you could have one of the following cases:

1. The _Facebook Account_ isn’t associated with a _Business Manager_
2. The _Facebook Page_ isn’t associated with a _Business Manager_
3. The _Facebook Account_’s user ( _People_) isn’t associated with the _Facebook Page_ inside the _Business Manager_

To troubleshoot the above issue, we suggest following these steps:

1. Create a _Business Manager_ associated with your _Facebook Account_
2. [Add the _Page_](https://www.facebook.com/business/help/720478807965744?helpref=faq_conten) to at least one _Business Manager_
3. [Connect your _Account_](https://www.facebook.com/business/help/166896210924641?helpref=faq_content)( _People_) to the _Facebook Page_ within the _Business Manager_


The _Page_ that you want to manage inside LeadsBridge needs to be included in **at least** one _Business Manager_ associated with the _Facebook Account_. The same _Page_ should also be assigned to the _Account_ which is used inside the Bridge.

## Why can’t I see my Facebook Campaign Name?

First of all, [make sure your Campaign is activated on the Facebook side](https://www.facebook.com/business/help/650774041651557?id=649869995454285). The Delivery column of the Ads Manager is where you can check the status of your Campaigns and find information about any problems.

When your Campaign is active, you’re able to see more information about its delivery (it's active when the toggle switch is blue). When your Campaign is deactivated, it shows as Off status in the Delivery column, and the Campaign Name won't be triggered in LeadsBridge.

## **Why do I receive the Campaign ID instead of the Campaign Name?**

If you receive the _Campaign ID_ instead of the _Campaign Name_ is because the _Ad Form_ connected to the bridge is associated with a _Campaign_ owned by another _Ad Account_ and not by the one connected to the bridge.

This happens because the _Campaign_ is associated with a single _Ad Account_, while the _Ad Form_ could be visible from different _Ad Accounts_ because the _Ad Form_ is related to a Facebook _Page_.

In this case, the best practice is to use a single _Ad Account_ for a _Campaign_ and _Ad Form_.

If you are using the Facebook Account connection with LeadsBridge, please ensure your Facebook Business Account is connected to the correct Facebook Ad Account.

Please refer to our community article to [authorize my Facebook Ad Account](https://community.activeprospect.com/posts/5075230-how-do-i-reauthorize-my-facebook-ad-account).

If you have any questions about Facebook, [contact Support](mailto:support@activeprospect.com) for further assistance.

Type something"
