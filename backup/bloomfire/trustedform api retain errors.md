---
URL: https://community.activeprospect.com/posts/4148100-trustedform-api-retain-errors
Page Title: TrustedForm API Retain Errors
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-b91bdc91-6ebc-4b4c-93a4-bbc181ed2b12.png
Scraped At: 2025-05-30 00:16:19.771
tags:
  - trustedform
  - intermediate
  - troubleshooting
  - compliance
  - developer-focused
  - technical
  - best-practices
secondary_tags:
  - flows
  - data-management
  - how-to
  - universal
  - operation
---

[![](https://content2.bloomfire.com/avatars/users/1316943/thumb/thumbnail.png?f=1612413648&Expires=1748567764&Signature=YCs828HV1gr4R6pC7PmU01~8gOAVpMRd-fU~pKKqc-aWth12mYtZbmkfA29bPbR4nGRBVnLlTHK8BnkCuvHZEDPxAoKEmblZsTpI3jd07BlfwkUv03AEq~pK09VZZ3bxRUlQayLRw8bTvCI7mgwiTC0i~CWdPsgBYkXgYwXe2SUfiKHlK~rh5iF3cNvIoNbiCc34HmALNw4OnYnz~0P4PgLxEKnSyL1W3botDbPxvRXhh5wsF6lpe1JU17wJ3KxF~F6kcSmNKY9wYvsK0JqMCBUkViunRPczdZ1zt74Q9p35m3-h2urFK5iJSJeS2qnrs2v9hSoprJoDFUNkRQhJzQ__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7557566-ashley-thomas)

[_Ashley Thomas_](https://community.activeprospect.com/memberships/7557566-ashley-thomas)

Updated May 2, 2025. Published January 29, 2021.

Details

# TrustedForm API Retain Errors

While we would like to think that all data is perfect and will never display an error, we know that is not usually the case. Here we have gathered together some best practices and frequently returned errors and http codes - along with their causes - to help you identify and fix issues and get back to business.

# TrustedForm API Best Practices

Here are some best practice tips to help you proactively avoid some failures/errors when retaining (formerly known as claiming) certificates. Failures mean that a validation process was unsuccessful but the certificate was still retained. Errors mean that there was an issue that prevented the certificate from being retained and the operation should be reviewed and retried. If you have any other tips let us know by sending your suggestions by [reaching out our Support](https://community.activeprospect.com/posts/5116014-how-to-contact-activeprospect-support) and we'll be happy to share them here!

- **Automate the process of retaining**. Less manual work also means less likelihood of user error... and automation gives you time back in your day! (Using a TrustedForm retain/claim step in a LeadConduit flow to retain certificates is automated retaining.)
- **Take action on your certificates within the retain window**. Attempting to retain a certificate after the window has closed will lead to an error (multiple codes, such as 404 and 410 below, deal with expired items).
- Permanently store the full TrustedForm Certificate URL in your system along with the lead's contact data. The Certificate URL is the only means by which a retained certificate can be retrieved in the event of a consumer complaint.
- **Monitor your retained certificates for errors regularly**. You can't fix what you don't know is broken, and most errors are easier to fix the sooner you see them.
- **Maintain a process that logs every retain** and saves the data in the response to the retain request so that, if you encounter an issue, you have some way of looking back over what happened. (Retaining Certificates using a TrustedForm retain/claim step in a LeadConduit flow makes this information available for up to 3 months, the limit that LeadConduit holds flow data.)

#### Common Failures seen that still result in retention of the certificate

Successful TrustedForm retain operations can result in failures that provide information.

- ""None of the provided fingerprints match” - the TrustedForm certificate was retained, but [neither the submitted phone number or submitted email match what's on the certificate](https://community.activeprospect.com/posts/4766190-trustedform-fingerprint-lead-matching). These email and phone parameters, if they are included on a request, are not required to match what was captured from the web session, but it's a good idea to make sure those match to ensure you're claiming high-quality leads.
- ""Required scan text not found"" - this error means that the TrustedForm certificate was retained but TrustedForm did not find the [required scan text](https://community.activeprospect.com/posts/4078890-trustedform-page-scan) that was specified in the request.

# Error HTTP Codes and Their Definitions

- **0**: This is a client side error, which means it would be something you would need to look into on your side. For example, it could mean a network issue on your side or a client side timeout (ex: If you have the timeout set to 5 seconds and TrustedForm takes more than 5 seconds, it could be an HTTP 0). Please correct and retry the retain.
- **201**: Success! This code is _not_ an error. If you successfully retain a certificate, ""HTTP 201 Created"" will be returned with the JSON representation of the values included in the certificate in the response's body.
- **400**: If the certificate id is formatted incorrectly, ""HTTP 400 Bad Request"" or ""HTTP 406 Not Acceptable"" will be returned as the server cannot process the request because of the incorrect formatting. Please correct and retry the retain.
- **402**: Usually an issue with account payment or service subscription causes ""HTTP 402 Payment Required"". Please correct and retry the retain.
- **403**: If you have not authenticated correctly using your API key, ""HTTP 403 Forbidden"" will be returned. Please correct and retry the retain.
- **404**: If the certificate is older than 3 days or if the certificate URL is invalid, then ""HTTP 404 Not Found"" will be returned. Please correct and retry the retain. NOTE: These can be retried and may succeed for a very, very small number of certificates, but the usual case is that the retry is not successful.
- **405**: Method not allowed. This occurs when you are trying to retain a certificate produced in Sandbox mode.
- **406**: If the certificate id is formatted incorrectly, ""HTTP 400 Bad Request"" or ""HTTP 406 Not Acceptable"" will be returned as the server cannot process the request because of the incorrect formatting. Please correct and retry the retain.
- **410**: If the certificate has expired and is pending deletion because of age after creation, you will receive ""HTTP 410 Gone"". Do not retry.
- **500, 502, 503**: If you receive ""HTTP 500 Internal Server Error"", ""HTTP 502 Bad Gateway"", or ""HTTP 503 Service Unavailable"", please retry the retain.
- **Timeouts**: Please retry the retain.

# Logging and Support

Customers must maintain their own logs of requests made to the TrustedForm API. ActiveProspect does not maintain logs of API requests, and ActiveProspect Support cannot ""look up"" API requests to provide diagnostic assistance.

If your requests to the TrustedForm API are failing and if you can provide us with the raw Http request and the raw Http response returned, ActiveProspect Support may be able to identify the nature of a malformed request. ActiveProspect Support generally cannot instruct you in how to configure your application to make an API request.

Type something"

