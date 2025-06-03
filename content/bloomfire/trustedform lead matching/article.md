---
URL: https://community.activeprospect.com/posts/4766190-trustedform-lead-matching
Page Title: TrustedForm Lead Matching
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-ee8cb5c4-8df1-48d8-a75f-f308a2e20bb8.png
Scraped At: 2025-06-02 22:29:49.418
---


[_Christopher Williams_](https://community.activeprospect.com/memberships/7846678-christopher-williams)

Updated April 11, 2025. Published July 29, 2022.

Details

# TrustedForm Lead Matching

Lead matching allows you to confirm that a TrustedForm certificate contains input that matches the contact information for your lead.

**Beginning July 5, 2023 TrustedForm certificates began hiding all form input data in session replays until lead matching is performed if a lead's email address or phone number is recorded by the certificate as part of our new Enhanced PII Protection. [Read more](https://activeprospect.com/blog/trustedform-new-data-security-enhancement/).**

# Overview

If you buy a lead with the (123) 456-7890 as their phone number but the TrustedForm certificate shows that (555) 555-5555 was entered as their phone number wouldn't you want to know? TrustedForm's matching feature is designed to empower you to identify cases like this and ensure your certificates match with their lead. If you don't you are making your business susceptible to [lead fraud](https://activeprospect.com/blog/what-is-lead-fraud/).

As TrustedForm collects user input from the page, form data matching an email address or phone number is securely hashed and stored with the certificate. When you make a request to the TrustedForm Certificate API, you can pass your lead's email address and/or phone number as parameters in the request. TrustedForm compares the values stored within the certificate with the values passed in the request and the response tells you whether or not they match.

View the API documentation base on the API version you are using to automate this:

- [Version 4.0: Use the Match Lead operation to perform lead matching.](https://developers.activeprospect.com/docs/trustedform/api/v4.0/tag/Match-Lead/)
- [Version 3.0: Use the fingerprints request parameter to perform lead matching](https://developers.activeprospect.com/docs/trustedform/api/v3.0/tag/Claiming-Certificates/#tag/Claiming-Certificates/operation/ClaimerWeb.ClaimController.create!path=fingerprints&t=request)
- [Version 2.0:](https://developers.activeprospect.com/docs/trustedform/api/v2.0/tag/Claiming-Certificates/#tag/Claiming-Certificates/operation/ClaimerWeb.ClaimController.create!path=fingerprints&t=request) [Use the fingerprints request parameter to perform lead matching](https://developers.activeprospect.com/docs/trustedform/api/v2.0/tag/Claiming-Certificates/#tag/Claiming-Certificates/operation/ClaimerWeb.ClaimController.create!path=fingerprints&t=request)

When none of the values match it means that the certificate does not prove that you have consent to contact that lead. In response you should do one or more of the following:

- Classify this lead as non-compliant and take proper precautions to avoid litigation (e.g. reject the lead)
- Manually review the TrustedForm certificate's session replay to make your own determination of whether you have been given consent to contact this lead.
- Reach out to your lead vendor and ask them to only send you leads where the TrustedForm certificate shows the consumer inputting their contact information.

# Certificate Match Statuses

TrustedForm Certificates can have one of four possible statuses with regards to lead matching:

1. Matched - Lead matching was performed and the lead data you supplied matched lead data found in the certificate. This happens automatically for certificates generated from one of your [verified domains](https://community.activeprospect.com/posts/4649879-verify-domain-ownership) as these are first party leads where the data source for the certificate and lead are the same.
2. Not Matched - Lead matching was performed but the lead data you supplied **DID NOT** match lead data found in the certificate.
3. Match Not Possible- Lead matching is not possible because no lead data could be found in the certificate.
4. Match Not Attempted - Lead matching is possible but has not been performed yet.

# What Fingerprinting means in Software

In the non-digital world fingerprint identification is a reliable way to match archived records to a person so law enforcement or other agencies can identify who they are. [Fingerprinting in software](https://en.wikipedia.org/wiki/Fingerprint_(computing)#:~:text=In%20computer%20science%2C%20a%20fingerprinting,uniquely%20identify%20people%20for%20practical) works in a similar way but instead of storing actual fingerprints it stores unique data about a person such as their contact information in the form of a digital fingerprint. TrustedForm certificates detect any email addresses or phone numbers entered in form fields and stores a secure version of them that can be used to identify if a lead matches our records.

# Technical Details of the Mechanics of Matching in TrustedForm

During the marketing process consumers are often taken to a page with a form for collecting their contact data. Here TrustedForm Certify runs in the background to create a TrustedForm certificate and begins checking for any email address or phone numbers. [Regular expressions](https://en.wikipedia.org/wiki/Regular_expression) are used to search the source code and user interactions for patterns that match contact information.

```
/[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}/
Regular expression used to detect phone numbers
```

```
/^[^,@\s]+@[-\w]+\.[a-z]{2,}$/
Regular expression used to detect email addresses
```

This means any emails or phone numbers found on the the web page or entered into form fields should be found and will be converted into a SHA1 hash to be stored as part of the certificate.

In addition to using regular expressions to search for contact information, TrustedForm also leverages consent tags to capture phone numbers and email addresses from various form elements, including those outside of traditional form fields (such as in consent text). Any form elements tagged with **consent-grantor-phone** or **consent-grantor-email** will have their values captured as fingerprints, which can then be used in match lead requests to enhance the lead verification process, ensuring more comprehensive and accurate lead matching.

For detailed instructions on how to implement and configure these consent tags, refer to our [developer documentation](https://developers.activeprospect.com/docs/trustedform/consent-tagging/).

|     |
| --- |
| **Example of a phone number converted to a SHA1 hash:** |
| (512)555-1234 -> 60BFA1AD1B29521A7014B95157A2128DCD092E11 |

Before being converted to a hash to be stored, emails and phones are normalized. Email are simply downcased while  phone numbers remove all whitespace, hyphens, brackets and parenthesis. This normalization is also applied to the values of lead matching parameters to help legitimate matches be made when the formatting is different.

## Qualifying Phone Numbers

TrustedForm Certify considers data to be a phone number when it meets the following criteria:

- It is in a field whose name doesn’t reference “postal,” “zip,” “IP addr,” or “time.”
- The field doesn’t contain alphabetical characters.
- The field contains at least three consecutive numbers.
- The field, when  stripped of everything but numbers, is 10 digits , or 11 digits if it includes the country code '1' .
- The field is an NANP phone number (a 10-digit phone number used in North America, the Caribbean, and some Pacific territories).

## Qualifying Email Addresses

TrustedForm Certify considers any @ symbol with text on both sides to be an email address.

# Checking for Matches

When a customer makes a request to the TrustedForm Certificate API, they have the option to have TrustedForm check the contact information between the certificate and that of the lead data. There are two options to do this:

## Requests via LeadConduit

TrustedForm enhancement steps use the standard email and phone fields to perform lead matching and append the results to the lead by default. You can map custom values to the Lead Email, Lead Phone 1, Lead Phone 2 or Lead Phone 3 fields to override this behavior.

## Request directly via the TrustedForm API

Customers can pass email addresses, phone numbers or SHA1 hash values of the same, as described in the [Match Lead Operation](https://developers.activeprospect.com/docs/trustedform/api/v4.0/tag/Match-Lead/).

# Possible Outcomes

Values passed will be classified as either matching or non-matching. When all values match you can be confident that the certificate belongs with your lead. If not, you should review the certificate's session replay to confirm the data entered in the replay matches the data submitted and investigate why no matches were found.

Here are a few examples of why this might occur to help with the troubleshooting process:

- **The email(s) or phone number(s) entered into the form do not match the data provided in the request.**

The certificate doesn’t match the lead for some reason. If emails or phone numbers don't match, there's a chance that the lead seller is providing an invalid cert. For example, a seller may provide customer information with a previously generated certificate for a different customer.
- **The form didn't generate any fingerprints.**

This happens if the script doesn’t detect any populated email or phone number fields, which could happen if a vendor has a dynamic form and initializes the TrustedForm script at a later step when the consumer’s personal information is no longer on the page.
- **The request included a typo or improperly hashed values.**

Lead matching only works if you supply the correct values. If your request includes a typo then that is what will be used and it won't result in a match. Or if you are hashing values before including them in the request make sure you are correctly generating the SHA1 hash for each email address and phone number they’re trying to match.

# Frequently Asked Questions

1. **Does matching cost extra?**

No, it is included with the TrustedForm base subscription.
2. **Does TrustedForm support fingerprinting on the ping?**

Yes, when using the TrustedForm Insights product you can perform matching on the ping.
3. **Does a mismatched fingerprint guarantee my lead is fraudulent?**

No, Matching isn't foolproof. It is a useful signal to flag leads for further auditing. We recommend you perform an investigation and only reject leads using this after you have noticed a pattern and worked with your vendor to resolve it.
4. **Can I hash my matching inputs to avoid send raw values across the web?**

Yes, you can use SHA1 to hash your values before sending them in your API request. TrustedForm will recognize this and still be able to use to values to perform matching.
5. **Does lead matching work on masked certificates?**

Yes, lead matching work with masked certificates. Though with [masked certificates](https://community.activeprospect.com/posts/4889858-what-is-a-masked-trustedform-certificate), you do not see the session replay or event log.

Type something
