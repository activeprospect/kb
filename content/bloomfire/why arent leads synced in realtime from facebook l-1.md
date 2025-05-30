---
URL: https://community.activeprospect.com/posts/5070199-why-aren-t-leads-synced-in-real-time-from-facebook-lead-ads-to-my-crm
Page Title: Why aren’t leads synced in real-time from Facebook Lead Ads to my CRM?

Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-98d607df-e060-49c7-b485-a297c6248250.png
Scraped At: 2025-05-30 00:16:19.744
---

[![](https://content2.bloomfire.com/avatars/users/1451136/thumb/thumbnail.png?f=1623686660&Expires=1748567764&Signature=Q7x0EwlxES0hvUgBHOYTTGeGR3odqFWLEzt7O-xmCXlP96mar1s5oe9tW3fMpzluxTm11P9GYwlqaEZzVQoiPHx5Em9I8Zg9SieGpWMPxP~zejUlB9Kdkje0AR2sl6YPYOEivTAjQuDSX6l6GvCgOgDMNLH3WzK0p~K6PLRhSIJngXS~mM3tMk1CaX4yCakXlTKQROVt2bZuKLbAWOlp742ugbt4wRxc4nnSEG1pEjwuFGnUeOvPdFljX9y1m6mzKMdH73FRM3yhu285pMQf4YR6ClB1L2SbAju0wVyUrSU5OlrMU1~sZloQeSNNUoeqkHR2feRCiE-B4cGRd5-r9A__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/8017840-claudia-melis)

[_Claudia Melis_](https://community.activeprospect.com/memberships/8017840-claudia-melis)

Updated October 22, 2024. Published May 24, 2023.

Details

# Why aren’t leads synced in real-time from Facebook Lead Ads to my CRM?

If you are experiencing an issue retrieving leads in real-time from Facebook, you may need to make sure you granted to LeadsBridge the Lead Access permission from your [Facebook Business Manager.](https://www.facebook.com/business/help/442345745885606?id=180505742745347)

The Business Manager is a Facebook tool designed to improve assets management: with this tool, you’ll be able to manage your Pages, Ad Accounts, Apps, Partners, etc., giving specific Asset permissions to Users and Partners.

As a result of this management, if permissions are not properly configured, you could encounter one of the following situations:

- You are not able to fetch any lead when opening the Leads Table of your bridge.

- You’re only able to see the test leads sent from your Facebook account.

- You’re able to see the leads, but they are not being automatically synchronized in real-time by LeadsBridge


If one of the above-mentioned situations arises, the following guidelines will help you set the correct permissions inside Business Manager. Be sure to follow the step-by-step instructions carefully.

### **Do you have access to a Business Manager?**

**NO** → You should contact the Owner/Admin of the Business Manager that owns the Page you want to connect with LeadsBridge and ask them to follow the steps below on your behalf.

**YES** → Log into the Business Manager and go to [Business Settings](https://business.facebook.com/settings/).

### **Can you see Integrations » Leads Access on the left side of the screen?**

**NO** → You should contact the Owner/Admin of the Business Manager that owns the Page you want to connect with LeadsBridge and ask them to follow the steps below on your behalf.

**YES** → This means that you are the Owner/Admin of the Business Manager.

### **Once you’re inside the Business Manager and you know you’re the Owner/Admin**

1. Go to **Accounts » Pages**. Do you want to give access to a User or a Partner?

1. **USER**

      1. Go to Users » People

      2. Click on the User name

      3. Make sure that the BM User has a role (ADS, LEADS, CONTENT: Create, Manage or Moderate) inside the Facebook Page
2. **PARTNER**

      1. Go to Users » Partners

      2. Click on the Partner name

      3. Make sure that the Business Manager Partner has a role inside the Facebook Page

Collapse

Facebook BM Permissions Admin

![Video Thumbnail](https://fast.wistia.net/embed/medias/8bqvj65gdk/swatch)

![Video Thumbnail](https://embed-ssl.wistia.com/deliveries/1a7552d0fedfba086a316fedfb13936baed56505.webp?image_crop_resized=960x542)

Click for sound

0:39

1. Go to **Integrations » Leads Access**

1. HELP! I can’t see “Integrations » Leads Access” This means that you’re not a Business Manager Owner/Admin → Go back to the beginning of the guide

2. Click on the Page

3. Do you want to give access to a User or a Partner?

      - **USER** → Make sure the User has been added to the People section, otherwise add it using the Assign People button

      - **PARTNER** → Make sure the User has been added to the Partners section, otherwise, add it using the Assign Partners button.

Collapse

Facebook BM Permissions Leads Access People

![Video Thumbnail](https://fast.wistia.net/embed/medias/yyu2xzmvpj/swatch)

![Video Thumbnail](https://embed-ssl.wistia.com/deliveries/a82021787ef4e23cf3d267472ae3b05523bc0ede.webp?image_crop_resized=960x473)

Click for sound

0:23

1. Do you see the **CRMs** tab?

1. **NO** → Contact the Business Manager Owner/Admin that Owns the Page and ask them to follow the steps described in this guide.

2. **YES** → Click on CRMs: Is LeadsBridge listed under the Apps section?

      1. **YES** → GREAT! Everything has been set up correctly!

      2. **NO** → Click on Assign CRMs, is LeadsBridge listed under Add CRMs and Set Permissions?

         1. **NO** → Log into your LeadsBridge application and Publish a bridge connecting the Page you’re working with

         2. **YES** → Select LeadsBridge and click on Assign

Collapse

Facebook BM Permission Leads Access App

![Video Thumbnail](https://fast.wistia.net/embed/medias/ippx2mi0xe/swatch)

![Video Thumbnail](https://embed-ssl.wistia.com/deliveries/0893733dd9ceb951dbde7770e6a3e0971064ffaf.webp?image_crop_resized=960x539)

Click for sound

0:49

Type something"

