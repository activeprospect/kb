---
URL: https://community.activeprospect.com/posts/5415514-trustedform-possible-failure-outcomes-on-api-v4-0
Page Title: Trustedform possible failure outcomes on API v4.0
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-f789335b-6499-4969-9875-c3fb44f6515c.png
Scraped At: 2025-05-30 00:17:00.385
---

[![](https://content2.bloomfire.com/avatars/users/1505912/thumb/thumbnail.png?f=1717166947&Expires=1748567810&Signature=NkuwQ-OHTy0LDB0Pi5zVUUJsAnOSJ2N8AjrsSkLalQFqaak7NkoSzE7n3cpLFGe3yU6xNCvr3gw032PMPbTeXfmENVsGB2hYjt-cNkmSCuiJuMDELXO-VMd0n91xaU7JjFBUefpFHfrfjTw81CnUyRHEY1HqKTrrkzjbF2sotxusjM5FAuo5JuhNVWY0KZ9ioAHDgqc0hHWBJuMYQllu9nyyI92cjfjrjMZNXHRW0A-5Eh41qma6XLR3t372z3kCQpwd6e65MoKZHHp2dsfrl2I-R47yzt~1CgC927RVh3tetVM-mm9kRRvzVZnyxnTx9aQ9m286z9nUvOZ2-wG2Rg__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/8180819-luis-ferreira)

[_Luis Ferreira_](https://community.activeprospect.com/memberships/8180819-luis-ferreira)

Updated January 22, 2025. Published May 31, 2024.

Details

# Trustedform possible failure outcomes on API v4.0

keywords: verify errors, errors, failures, 4.0 failures, possible errors, error responses, failure outcomes, responses

Covers the various errors and failures returned by the API v4.0, specifically focusing on the \`outcome\` and \`reason\` fields. These fields indicate the result of the API request and provide details about any issues encountered.

### Introduction

This document provides a comprehensive guide to understanding errors and failures returned by the API v4.0. It focuses specifically on the fields `outcome` and `reason`, detailing the various scenarios in which an error or failure might occur. By categorizing the errors by product and function, this documentation aims to assist developers and users in diagnosing and addressing issues effectively, ensuring smoother integration and operation of the API.

#### Error Response Format

Errors and failures are returned in a structured JSON format with the following fields:

- **outcome**: Indicates the result of the request (e.g., ""error"", ""failure"").
- **reason**: Provides a detailed message explaining the error or failure.

**Example format:**

​x

1

```
{
```

2

```
  ""outcome"": "":error"",
```

3

```
  ""reason"": ""No valid products detected""
```

4

```
}
```

#### Generic Errors

These errors are common across multiple API endpoints.

**No valid products detected**

- **Outcome**: ""error""
- **Reason**: ""No valid products detected""

**Certificate has expired or could not be found**

- **Outcome**: ""error""
- **Reason**: ""Certificate has expired or could not be found.""

**Request does not meet the expected schema**

- **Outcome**: ""error""
- **Reason**: ""The request cannot be processed because it does not meet the expected schema.""

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

_When implementing consent verification, each tag in the consent-advertiser-name and consent-opted-advertiser-name-n series must uniquely correspond to a single advertiser name. Tags cannot be reused to represent multiple advertiser names. For example, the same tag, such as consent-opted-advertiser-name-1, cannot be shared by multiple advertisers (e.g., Advertiser A and Advertiser B). In addition an offer with consent-opted-advertiser-name-n elements cannot also have a consent-advertiser-name element._

- **Outcome**: ""failure""
- **Reason**: ""Advertiser name elements don't allow for one-to-one consent verification.""

#### Retain Product Errors

These errors are specific to the Retain product.

**Unavailable product requested: Retain**

- **Outcome**:  ""error""
- **Reason**: ""Unavailable product requested: Retain""

**Missing Lead fields**

- **Outcome**: ""error""
- **Reason**: ""Match Lead fields not included in request.""

**Sandbox certificates cannot be retained**

- **Outcome**: failure
- **Reason**: ""Sandbox certs cannot be retained""

**Expired certificate**

- **Outcome**: ""failure""
- **Reason**: ""The cert has expired""

**Certificate claimed too many times**

- **Outcome**: ""failure""
- **Reason**: ""The cert has been claimed too many times""

**Certificate retention failure**

- **Outcome**: ""failure""
- **Reason**: ""The cert could not be retained""

#### Match Leads Errors

These errors are specific to the Match Leads functionality.

**Requires a web certificate**

- **Outcome**: ""error""
- **Reason**: ""match\_lead requires a web certificate""

**Missing phone or email keys**

- **Outcome**: ""error""
- **Reason**: ""match\_lead must contain either phone or email keys""

**Invalid phone numbers list**

- **Outcome**: ""error""
- **Reason**: ""match\_lead phone must be a list of 3 or less phone numbers""

**Invalid email addresses list**

- **Outcome**: ""error""
- **Reason**: ""match\_lead email must be a list of 3 or less email addresses""

**No email addresses or phone number matched**

**Outcome**: ""failure"",

**Reason**: ""No matches found""

#### Insights Product Errors

These errors are specific to the Insights product.

**Unavailable product requested: Insights**

- **Outcome**: ""error""
- **Reason**: ""Unavailable product requested Insights""

**Invalid property keys**

- **Outcome**: ""error""
- **Reason**: ""Invalid property key(s) requested""

**Invalid delimiter with whitespace**

- **Outcome**: ""error""
- **Reason**: ""Invalid delimiter contains whitespace characters""

**Invalid delimiter length**

- **Outcome**: ""error""
- **Reason**: ""Invalid delimiter length""

**Page scans unsuccessful**

- **Outcome**: ""failure""
- **Reason**: ""Insights page scans unsuccessful""

#### Conclusion

This documentation provides a comprehensive overview of the various errors and failures that can be encountered when using API v4.0. Proper error handling and understanding of these messages can help in debugging and resolving issues more efficiently. For more information visit TrustedForm [API documentation](https://developers.activeprospect.com/docs/trustedform/getting-started/).

Type something"

