---
URL: https://community.activeprospect.com/posts/4100303-retaining-a-trustedform-certificate-via-the-api
Page Title: Retaining a TrustedForm Certificate Via the API
Screenshot URL: images/screenshots/screenshot.png
Scraped At: 2025-06-02 19:41:48.434
---
ZkYvX5dN99Ie9gMaRx0gEyjC3l0l6-6LsbyjgF3FZiw3-BJQa5phNp7ur3Mve-8FbzYFBFxb6l0FZlvv0mafjWQDs9zoYqTQgtjOkIDmDPIRhldAQbC8G8INylhUuGSmGuU~zY-oa2l8BZwvmLg__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7846678-christopher-williams)

[_Christopher Williams_](https://community.activeprospect.com/memberships/7846678-christopher-williams)

Updated March 13, 2025. Published December 3, 2020.

Details

# Retaining a TrustedForm Certificate Via the API

ActiveProspect account holders who are subscribed to TrustedForm and have added a payment method who are able to use the TrustedForm Certificate API to retain the certificates provided with certified leads. Doing so

1. Confirms the legitimacy of the certificate
2. Gives your account access to view the certificate
3. Stores the certificate for future reference


See our [full API documentation](https://developers.activeprospect.com/docs/trustedform/api/v4.0/tag/Certificate-URL/) for additional detail.

To retain a certificate using the TrustedForm API, send an HTTP POST request to the certificate URL which should be provided with your leads's data. (If not, ask you lead vendors to implement [TrustedForm Certify](https://activeprospect.com/trustedform/certify))

- Do not make a request unless the URL starts with `https://cert.trustedform.com`, otherwise you may expose your TrustedForm credentials to someone else
- Use a POST request — any other type of request will not retain the certificate
- Use the `Accept: application/json` request header
- Use the `Content-Type: application/json` or `Content-Type: application/x-www-form-urlencoded` header, and encode the request body accordingly.
- In the Authorization header, use [HTTP Basic Authentication](https://en.wikipedia.org/wiki/Basic_access_authentication) and pass the API key provided on the ""Settings"" tab in the [TrustedForm Application](https://app.trustedform.com/#settings) as the password and 'API' as the ID.

# Reference

When you retain a certificate, you can include an optional parameter `reference` We will store this value in the certificate's history record. A use case for the reference parameter is to add your unique lead identifier to the history record, which will provide a reference point from the certificate to the certified lead that you received.

This will indicate which lead a certificate belongs to just by examining the certificate data. If you retain a certificate from a LeadConduit flow, the LeadConduit Lead ID will be automatically assigned as the reference. This allows you to refer back to the lead with which an individual certificate was collected.

# Vendor

When retaining a certificate, you can pass the optional `vendor` parameter. We will store this value  in the certificate's history record. Some TrustedForm reporting will be grouped by vendor.

If you use our LeadConduit platform, the vendor parameter will be automatically set as the Source name with each certificate retain request.

# Response Codes

- If you successfully retain a certificate, an HTTP 200 OK status code will be returned with the JSON representation of the certificate in the response body. Beware that using an HTTP GET will also return an HTTP 200 along with the HTML representation of the certificate — your cert will not be retained with an HTTP GET.
- If the certificate has expired or never existed, then an HTTP 404 Not Found status code will be returned.
- If you have not authenticated correctly using your API key, an HTTP 403 Forbidden status code will be returned.
- If you receive a 5XX Server Error status code, please retry the retain request. If it continues to fail, please contact support@activeprospect.com

If you receive any response code other than those above, please [let us know](mailto:support@activeprospect.com).

# Logging and Support

Customers must maintain their own logs of requests made to the TrustedForm API. ActiveProspect does not maintain logs of API requests, and ActiveProspect Support cannot ""look up"" API requests to provide diagnostic assistance.

If your requests to the TrustedForm API are failing and you can provide us with the raw Http request and the raw Http response returned, ActiveProspect Support may be able to identify the nature of a malformed request. ActiveProspect Support generally cannot instruct you in how to configure your application to make an API request.

Type something"
