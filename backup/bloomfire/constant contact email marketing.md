---
URL: https://community.activeprospect.com/posts/4124761-constant-contact-email-marketing
Page Title: Constant Contact: Email Marketing
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-083a1d91-7538-42be-a625-52ddcb7f0e24.png
Scraped At: 2025-05-30 00:16:01.287
tags:
  - developer-focused
  - intermediate
  - technical
  - reference
  - data-management
  - leadconduit
  - how-to
secondary_tags:
  - seller-focused
  - flows
  - integrations
  - semi-technical
  - universal
---

[![](https://content1.bloomfire.com/avatars/users/1317000/thumb/thumbnail.png?f=1617311121&Expires=1748567734&Signature=DJBoOB3p04E1jLkbQIL6yKppC4~rckxfjVi9c~fMhSoQ2-CD1RaVzJsqgzOm71G4n~BXKqAHfKbm0BXWDo-~TNXF44l9JNt0NEo6k-bgx2npT-nVV6~pcLNmNPVzInzfAcjgLG3-w37KP99zVLPKZfcVqzlSM8PMB3GHE6c0Pt0WR23tIBwoHlrz8RjInlI2P1Eg0qqjD085osL0zTgQkayd-23FequdIQyNUm8eWSKlNk75QjkGsevLuKPwmHybz0O6UPjWgqRLH1dC53pM5I12rAWV49LiiVLdaA2YDDxOt2FcYI-ob8KHeZPj3Qrb92i1j1m-diXg6GrRSV4xlg__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7557680-scott-mckee)

[_Scott McKee_](https://community.activeprospect.com/memberships/7557680-scott-mckee)

Updated January 8, 2021. Published January 8, 2021.

Details

# Constant Contact: Email Marketing

ActiveProspect partners with Constant Contact to offer sections of the [Constant Contact API](https://developer.constantcontact.com/) directly through LeadConduit.

You can use the LeadConduitConstant Contact Integration to Add a Contact to an existing List.

What you'll need to get started:

- A Constant Contact account
- An API Key
- An Access Token
- A List ID

The documentation below will show you where to find the List ID and how to generate an API Key.

# Finding What You Need

First, you'll need an **API Key** from Constant Contact. They have extensive online documentation for how to [generate a Constant Contact API Key](https://developer.constantcontact.com/api_guide/getting_started.html).

![](https://content2.bloomfire.com/thumbnails/contents/002/451/552/original.png?f=1610118280&Expires=1748567755&Signature=iP5lo5e2JsPezTYSf9SzZe01CKJXeuY6Wp0A6nbGmg7~cNF0LcLQgc3IdJW7nWVfXNi4jkGCqskhQPVeeZS-4imRldPuNZy0OhNlvLpQnVGGVqYTzTVjECpcG9mBiedkbWkSG0zt1LbhVxp4ZmxP17pv-U0mKhWvuyqm7elq53SsKonEEVkMKOntqNe6dG4AfPAjXNRUi-AE56Cwz59S1j6SfMmXcFytJFRpkDUMc58Sr-J2zMZ1o2dpdhv49GvwKPdQk3WF9kmjp~-78CudxZOw~~8xsAnax2MNiS0g-dhTjuSz4O2nqxYQjSBnjm6KWgyxC-rBlU4TvKZW6HadGg__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

Once you have an API Key, you will need to generate an **Access Token**, using the [Constant Contact API Tester](https://constantcontact.mashery.com/io-docs).

![](https://content1.bloomfire.com/thumbnails/contents/002/451/562/original.png?f=1610118314&Expires=1748567755&Signature=F-Wqh-yS5rc3SqIFhmv5ZVsmqlZtOVGXRCFiV78U-5pjq49dAE60eaVi9V8TzDSHnMWRAGq7ccXKX7zGAlVKaaTivObCrhUHbl6iVYGmLxOm2u7jK5WScdJpd1w6ENys025oSmlwmYbjCHFrPJMa2GMmd1XsgS9dOd~MexZz-e7dJW82PMFTjIa2RncMNTW954VqhY-6QtzpSMaaGz2fA3mnW9GA-OvlFA1p0KKcC20omel9yXLOnAuORvaMmF3YDJ2dAgcUKyYb5c6gZE4OBDNrHSKFXUshgux3Q0~rr06JnvLnY~6NbM2IHuumVt1izI4WmJQiwA55IQZi16tcUg__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

Finally, use the [Contact List endpoint](https://developer.constantcontact.com/docs/contact-list-api/contactlist-collection.html) to determine the **List ID**. Unfortunately, Constant Contact does not reveal the List ID in the UI so you _must_ use the API to determine the appropriate list ID.

# Configuring Constant Contact in LeadConduit

From your selected Flow, choose Edit, scroll to the bottom of the **Steps** tab, select the **Add Delivery** option, and search for/scroll to Constant Contact and select.

Next, you'll need to provide some information so LeadConduit can communicate with Constant Contact.

The email you collect with the lead will automatically be sent to theConstant Contact API and you don't need to manually map it in the field mapping section.

At a minimum, this is all that is required to add an email to your Constant Contact list. Congrats!

Click **Ok** and **Save** the flow.

# Advanced Configuration Options

The following Optional fields are also supported:

- First Name
- Last Name
- Middle Name
- Salutation
- Phone 1
- Fax
- Address 1
- Address 2
- Postal Code
- Country
- Country Code: The Country Code
- State: The State Code
- City: The City
- Company Name: The Consumer Employer Name
- Company Phone: The Company phone number
- Title: The Job title
- Company Address: The Company Address
- Company Address 2: The Company address 2
- Company City: The Company Address City
- Company Country Code: The Company Address Country Code
- Company State: The Company Address State Code
- Company Postal Code: The Company Address Postal Code

These field values are available from the Right-Hand menu in the MailChimp field mapping section.

# Interpreting the Results

A success response means that the lead was successfully added to the list.

Failure response means that the lead was not successfully added to the list. It could have been a duplicate. You can check the reason logged in LeadConduit to determine the exact reason.

The integration returns the following fields:

- **Outcome:** Integration outcome (success, failure, or error)
- **Reason:** If the outcome is an error, the error reason
- **Contact ID:** The ID of the contact that was added to the contact list
- **Contact Status:** Contact Status
- **Source:** How the contact was added, from an application, web page, etc. e.g. API
- **Confirmed:** If the contact has confirmed their email subscription
- **Email Address:** Email address added to the list
- **Email Address ID:** ID of Email address added to the list
- **List ID:** Constant Contact List-Id
- **List Status:** Constant Contact List Status
- **Opt-In Date:** Email Address(Constant Contact) Opt-in Date
- **Opt-In Source:** Email Address(Constant Contact) Opt-in Source
- **Source Details:** Name of the application used to add contact, if added using the API

Type something"

