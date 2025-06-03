---
URL: https://community.activeprospect.com/posts/5196535-trustedform-certify-sdk-sending-the-trustedform-certificate-url-with-your-lead
Page Title: TrustedForm Certify SDK: sending the TrustedForm Certificate URL with your lead
Screenshot URL: images/screenshots/screenshot.png
Scraped At: 2025-06-02 19:42:04.885
---
JvZMB5cxYtdFmHfHrLf-eHTdBzo78s3r8~bJ~pYoiosNC1va3PCTWXl36erR~LujZUguIWhbwfzA-8xCnLn~hFu~b994enR71nqzSxh7Njh8pBnG0BOkQowJbOIQ9paPPH0t~Zi1JqcYvceB3Ag__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7557566-ashley-thomas)

[_Ashley Thomas_](https://community.activeprospect.com/memberships/7557566-ashley-thomas)

Updated November 15, 2023. Published October 23, 2023.

Details

# TrustedForm Certify SDK: sending the TrustedForm Certificate URL with your lead

When implementing the TrustedForm Certify SDK, web site implementers have to include the TrustedForm Certificate URL value with the lead data.

Background: When added correctly, the TrustedForm javascript snippet (Certify Web SDK) will create a new, unique certificate each time a browser loads the page. Then, the web site will send the TrustedForm Certificate URL  along with the lead data as documentation of that consumer visit to the page.

By default, the javascript snippet--as initially presented on the Certify screen of the TrustedForm app-- records a full certificate URL starting with ""https://cert.trustedform.com/"" in the ""xxTrustedFormCertUrl"" field.

This is the value you'll need to send as a field in your lead when the consumer submits the form.

**But what if your web form doesn't automatically discover and send the xxTrustedFormCertUrl field?**

If you are using a site builder platform and your web form doesn't automatically discover the xxTrustedFormCertUrl field, you'll need to create a field for the certificate URL value. To set the value in your new field to what is generated in the TrustedForm javascript, first consult the documentation for your web site platform for any tips for including values from an external script.  Then, in light of what is suggested, you can also try these tips.

1\. Inspect your site for the field name for a field you've created, and change the TrustedForm javascript accordingly.  For example, let's say your web form package uses ""custom-field-25"" as the name of the new field you created; you'll want to substitute this name for ""xxTrustedFormCertUrl"" in the script. This instructs the script to write to the field you've created. You can do this under ""Script Configurations"" on the Certify screen:

![](images/image-1.png)

2\.  TrustedForm provides a callback function that can be used to return the TrustedForm Certificate URL value. Please see the [documentation giving an example of the callback function](https://community.activeprospect.com/posts/4076703-callback-function-after-the-certificate-is-inserted-into-your-form) for more information. Many platforms today such as React sites will require this function in order to discover the TrustedForm Certificate URL.

For related and supporting information and instructions, see the articles included in these series:

[Implementing TrustedForm Web Certify SDK](https://community.activeprospect.com/series/4720459-implementing-trustedform-certify-web-sdk)

[Implementing the TrustedForm Certificate Web SDK in a Form Page](https://community.activeprospect.com/series/4190127-implementing-the-trustedform-certify-web-sdk-in-a-form-page)

Type something"
