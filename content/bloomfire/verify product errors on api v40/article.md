---
URL: https://community.activeprospect.com/posts/5549054-verify-product-errors-on-api-v4-0
Page Title: Verify Product Errors on API v4.0
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-ad7875e1-118b-4afc-b2ee-5060854656b9.png
Scraped At: 2025-06-02 22:30:02.121
---


[_Ayesha Akhtar_](https://community.activeprospect.com/memberships/9624817-ayesha-akhtar)

Updated January 27, 2025. Published January 22, 2025.

Details

# Verify Product Errors on API v4.0

Covers the various errors and failures specific to the Verify product returned by the API v4.0, focusing on the outcome and reason fields. These fields indicate the result of the API request and provide details about any issues encountered. keywords: verify errors, verify failures, verify product errors, error responses, failure outcomes

**Introduction**

This document provides a detailed guide to understanding errors and failures specific to the Verify product within the API v4.0. It focuses on the outcome and reason fields, helping developers diagnose and resolve Verify-specific issues efficiently. Proper understanding of these error messages ensures smoother API integration and operation.

**Error Response Format**

Errors and failures related to the Verify product are returned in a structured JSON format with the following fields:

- **outcome**: Indicates the result of the request (e.g., ""error"", ""failure"").

- **reason**: Provides a detailed message explaining the error or failure.
**Example Format:**

​x

1

```
{
```

2

```
  ""outcome"": ""failure"",
```

3

```
  ""reason"": ""Consent language not detected in the certificate.""
```

4

```
}
```

#### Verify Product Errors

These errors are specific to the Verify product.

**Unavailable product requested: Verify**

- **Outcome**: ""error""
- **Reason**: ""Unavailable product requested: Verify""

**Consent language not detected**

- **Outcome**: ""failure""
- **Reason**: ""Consent language not detected in the certificate.""

**Unapproved consent languages**

- **Outcome**: ""failure""
- **Reason**: ""Consent languages found were not approved in the account's consent language manager.""

**For Verify: One to One Consent Check**

**If** use\_tagged\_consent **is set to false or not used in script**

- **Outcome**: ""failure""
- **Reason**: ""This form has not been setup to allow use of One to One Consent Check.""

**Form not submitted or form submission was not detected.**

- **Outcome**: ""failure""
- **Reason**: ""Submission of the form is required for one-to-one consent verification.""

**advertiser\_name passed is not present in the consent.**

- **Outcome**: ""failure""
- **Reason**: "" #{advertiser\_name} was not granted consent in a one-to-one manner.""

**Opt-in not selected for the** advertiser\_name **passed**

- **Outcome**: ""failure""
- **Reason**: ""The opt-in was not selected for #{advertiser\_name}, therefore one-to-one consent check was not satisfied.""

**Form is missing the required tags**

- **Outcome**: ""failure""
- **Reason**: ""Consent elements required for one-to-one consent verification are missing.""

**Forms** consent-advertiser-name **and** consent-opted-advertiser-name **tags not used properly**

_When implementing consent verification, each tag in the consent-advertiser-name and consent-opted-advertiser-name-n series must uniquely correspond to a single advertiser name. Tags cannot be reused to represent multiple advertiser names. For example, the same tag, such as consent-opted-advertiser-name-1, cannot be shared by multiple advertisers (e.g., Advertiser A and Advertiser B). In addition an offer with consent-opted-advertiser-name-n elements cannot also have a consent-advertiser-name element._

- **Outcome**: ""failure""
- **Reason**: ""Advertiser name elements don't allow for one-to-one consent verification.""

**Conclusion**

This document outlines the various errors and failures specific to the Verify product in API v4.0. Understanding these error messages allows developers to identify and resolve issues effectively, ensuring better API integration and functionality. For further details, refer to the [TrustedForm Verify API documentation.](https://developers.activeprospect.com/docs/trustedform/api/v4.0/tag/Verify/)

Type something
