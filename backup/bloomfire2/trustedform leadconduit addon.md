---
URL: https://community.activeprospect.com/posts/5098468-trustedform-leadconduit-add-on?_gl=1*ahjo2d*_gcl_au*MTI1NTg1MTA5NS4xNzM2NzgxNDA4LjE2Mjg3NTExMjQuMTczNzc0OTExOC4xNzM3NzQ5MTE4*_ga*NTQ3NjI0NDQxLjE3MzQ2Mzk3NDQ.*_ga_QHXBV6N7D1*MTczODAxNjEzMy4xNTIuMS4xNzM4MDE2NzUyLjM5LjAuMA..
Page Title: TrustedForm: LeadConduit Add-On
Screenshot URL: images/screenshots/screenshot.png
Scraped At: 2025-06-02 19:42:48.597
---
l-DadzpMRdmMVYUTCQ6sDl4-hzEwMCvEhrT5T9-wrSQP6dKJGLujC8Ru-Fd9PCUyS2B9i-EKeCyP7mEUwQgsimR8k7GaVt~CEdQSkRFRIxxLE9nwzqgG7f~xkFLm9HGowI-sWyIZUQV53OMPE-w__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7866389-leandro-estrella)

[_Leandro Estrella_](https://community.activeprospect.com/memberships/7866389-leandro-estrella)

Updated May 20, 2025. Published June 29, 2023.

Details

# TrustedForm: LeadConduit Add-On

The TrustedForm add-on provides unbiased third-party documentation of consent and real-time actionable insights about the leads you’re acquiring.

## TrustedForm

The [TrustedForm](https://activeprospect.com/add-on-services/trustedform/trustedform/) add-on provides unbiased third-party documentation of lead events and real-time actionable insights about the leads you’re acquiring. It performs a call to TrustedForm Certificate API so that you don't have to!

With this add-on [lead matching](https://community.activeprospect.com/posts/4766190-trustedform-lead-matching) with be performed by default and you'll be able to use the following TrustedForm products:

- **Retain**: Store TrustedForm certificates to document lead events for legal (TCPA) compliance. [Learn more](https://community.activeprospect.com/posts/4986362-trustedform-retain-coming-soon).
- **Insights**: Identify the leads that are most likely to convert and effectively manage returns and rejections. [Learn more](https://community.activeprospect.com/posts/4709758-trustedform-insights).
- **Verify**: Real-time TCPA compliant language management and the ability to know if one-to-one consent was properly obtained. [Learn more](https://community.activeprospect.com/posts/4918830).

This add-on provides you **Legal Protection** by documenting lead events for compliance with regulations like TCPA, CASL, etc.; **Brand Protection** by enabling you to audit your vendors's campaigns to ensure your brand is being presented properly and leads are coming from approved sites; **Data Insights** by helping you identify and understand the attributes of your ideal leads; **Actionability** by optimizing your data buying strategies and increase the actionability of your leads; and **Better Leads** by capturing a breadth of data about every lead creation event.

#### **What constitutes a ...**

| **Success** | **Failure** | ****Error**** |
| --- | --- | --- |
| Used when the request was successfully processed and the certificate meets the criteria.<br>A successful outcome indicates that there were no issues with the data provided in the request, and the products were executed successfully. | When the request was successfully processed, but the certificate contained undesirable data specific to the operation performed.<br>A failure outcome can occur, for example, when the fingerprints do not match or verify operation did not find adequate evidence of express written consent.<br>In general, a failure outcome indicates that after checking the certificate, something was discovered that indicates it does not meet the user's needs. [Learn more](https://community.activeprospect.com/posts/5146237). | When there is an issue with the request, that prevents it from being processed.<br>An error outcome can occur for various reasons, such as an invalid request schema, invalid certificate ID, or an unexpected internal error.<br>In general, an error outcome indicates that the issue with the request is not related to the specific data in the request but rather an issue with the request itself. |

## How does it work?

Simply edit your LeadConduit flow, switch to the ""Steps"" tab, and Add an ""Add-On"" Step.

![](images/image-1.png)

Search for this Add-On and select ""Add To Flow""

![](images/image-2.png)

Once you click on ""Add To Flow"", you'll be requested to specify the TrustedForm products you would like to use in your Flow![](images/image-3.png)

If you select **Insights**, you'll be prompted to select each data point you would like to append to your Flow; for further information on Insights Data Points, check [this](https://community.activeprospect.com/posts/4112140-data-available-through-trustedform-insights) article

![](images/image-4.png)

Also, if you have selected Insight's **Page Scan** feature to search the originating source for Required or Forbidden Text, you'll be prompted to specify those texts in the subsequent configuration step; for further information on Page Scan, review [this](https://community.activeprospect.com/posts/4078890) article

![](images/image-5.png)

If you select **Verify**, you'll be prompted to specify the name of the legal entity for an advertiser that will be used to determine if they were given consent in a one-to-one manner; this step is optional, and you should leave it blank if you don't want to check for one-to-one consent; for further information on Verify 1:1 consent check, review [this](https://community.activeprospect.com/posts/5471724) article

![](images/image-6.png)

Ultimately, click on ""Finish""; your flow is ready to use TrustedForm

![](images/image-7.png)

### Appended Data

The Add-On returns the following information:

| **Appended Field** | **Description** |
| --- | --- |
| Outcome | The request's outcome indicates whether the call succeeded, failed, or resulted in an error. The value of the outcome is determined by the result of each operation specified by the caller. ""success"" is returned if all results resulted in success. ""failure"" is returned if any result is unsuccessful. If an error occurs during any operation, the outcome is an ""error"". |
| Reason | Provides an explanation for failure or error. |
| Matched Email | The email or hashed value provided in the request is believed to be that of the consumer recorded in the certificate. |
| Matched Phone | The phone number or hashed value provided in the request is believed to be that of the consumer recorded in the certificate. |
| Successful Match | A boolean indicating if any matches were found during the lead matching operation. A null value indicates that lead matching was not performed. |
| Email Fingerprint Matched | A boolean indicating if any email matches were found during the lead matching operation. A null value indicates that no emails were provided. |
| Phone Fingerprint Matched | A boolean indicating if any phone matches were found during the lead matching operation. A null value indicates that no phone numbers were provided. |
| Reference Code | The parameter provided in the request is intended to be a reference to help you identify the lead associated with the certificate. |
| Vendor | The parameter provided in the request is intended to be the company's name that provided the lead associated with the certificate. |
| Previously Retained | A boolean indicating whether your account has already retained this certificate. |
| Expires At | The UTC ISO8601 formatted date and time when this certificate will no longer be available for API requests. |
| Masked Cert Url | The certificate url that masks the lead source url and snapshot |
| Share Url | The expiring share URL of the certificate |
| Scans Result | A boolean indicating if all required text was found and none of the forbidden text was found. |
| Required Scans Found | A list of required scan terms was found in the recorded content. |
| Required Scans Not Found | A list of required scan terms that were not found in the recorded content. |
| Forbidden Scans Found | A list of forbidden scan terms was found in the recorded content. |
| Forbidden Scans Not Found | A list of forbidden scan terms that were not found in the recorded content. |
| Amount Required Matched | How many of the required strings were matched? (all, some, none) |
| Amount Forbidden Matched | How many of the forbidden strings were scanned? (all, some, none) |
| Age In Seconds | Number of seconds since the last user interaction with the certificate. |
| City | City name based on consumer's public IP address |
| Country Code | Country code based on the consumer's public IP address |
| Latitude | Latitude based on the consumer's public IP address |
| Longitude | Longitude based on the consumer's public IP address |
| Postal Code | Mailing address postal code based on the consumer's public IP address |
| State | State/Province or Political Subdivision abbreviation based on the consumer's public IP address |
| Time Zone | Timezone name based on consumer's public IP address |
| Browser Full | A human-friendly version of the browser parsed from the user-agent |
| User Agent | The consumer's browser user-agent |
| Created At | The UTC ISO8601 formatted date and time when the TrustedForm script was loaded |
| Domain | The domain displayed to the consumer during the page visit |
| Time On Page In Seconds | The time in seconds between when the script was loaded and when the most recent event was received |
| Kpm | The average number of keystrokes per minute is based on the consumer’s rate of form input. |
| Form Input Method | The detected input method(s) the consumer used to fill out the form, such as ""autofill"" if the form was filled out using browser autofill; ""paste"" if the form was filled out pasting text; and ""typing"" if the form was filled out by typing. |
| Wpm | The approximate number of words per minute is calculated by using the form\_input\_kpm and assuming five characters represent a word. |
| Ip | The consumer's public IP address |
| Is Framed | A boolean indicating if the form was displayed within an iframe |
| Is Masked | A boolean indicating if the certificate is masked and does not show source information nor a session replay |
| Sensitive Hidden Content Elements | Count of how many content elements (e.g., img, div) are marked sensitive and hidden from the session replay |
| Sensitive Hidden Form Elements | Count of how many form elements (e.g., input, textarea) are marked sensitive and hidden from the session replay |
| Os Full | A human-friendly version of the operating system information parsed from the user-agent |
| Is Mobile | A boolean indicating that the form was filled out on a mobile device or tablet, based on user-agent |
| Os Name | Operating system name |
| Page Url | The URL of the page hosting TrustedForm Certify. |
| Parent Page Url | The parent URL of the page hosting TrustedForm Certify, if framed. |
| Bot Detection | A determination of whether the events documented were likely produced by a non-human entity based on ActiveProspect’s proprietary algorithms. This data point is currently undergoing Alpha testing. |
| One To One | A boolean indicating if the cert structure satisfied the requirements for 1:1 consent. |
| Verify Languages | A list of the consent languages detected within the certificate |
| Verify Language Approved | A boolean indicating if any of the consent languages found have been approved in your account's consent language manager. |
| Verify Form Submitted | A boolean indicating whether the form was successfully submitted by the consumer. |
| Verify Font Size | A boolean indicating whether the consent language meets or exceeds the required minimum font size configured in TrustedForm. |
| Verify Contrast Ratio | A boolean indicating whether the contrast ratio between the consent language text and background meets or exceeds the required minimum contrast ratio configured in TrustedForm. |
| Verify Opt-in Type | A boolean indicating whether all opt-in types on the form match one or more of the values configured in TrustedForm. |
| Verify Success | A boolean indicating if any of the consent languages found meet the success criteria defined for your account. |

Type something"
