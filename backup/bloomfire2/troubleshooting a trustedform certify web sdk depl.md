---
URL: https://community.activeprospect.com/series/4720459/posts/4290731-troubleshooting-a-trustedform-certify-web-sdk-deployment
Page Title: Troubleshooting a TrustedForm Certify Web SDK Deployment
Screenshot URL: images/screenshots/screenshot.png
Scraped At: 2025-06-02 19:42:59.379
---
FCpaBTblU8-GcJzLqReedM-7~rvXKoz-pbnGHUWAKPm-dh82NuMd3b2P52U1PRLK~1wBa8awaHHHEB8qM-vznAZNepxIr73iUDvKZI71bCChxVV-VvIXaUqv1733UZ-andOZQgR7zP59RpxkNNA__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7846678-christopher-williams)

[_Christopher Williams_](https://community.activeprospect.com/memberships/7846678-christopher-williams)

Updated June 5, 2024. Published May 6, 2021.

Details

# Troubleshooting a TrustedForm Certify Web SDK Deployment

This article is intended for web publishers who are having problems getting the TrustedForm Certify Web SDK to generate a certificate or getting their forms to submit the TrustedForm Cert URL.

What follows are techniques for verifying that the TrustedForm Certify Web SDK is installed and working in your form page, along with some reasons for common problems.

Collapse

00:00

04:49

Basic Troubleshooting of a TrustedForm Certify Web SDK Installation.

![](images/image-1.png)

#### Basic Troubleshooting of a TrustedForm Certify Web SDK Installation.

**Check: Is the Web SDK installed in the web page?**

**How to check this:**

1. Open the form page in your browser.
2. Look at the page source code using your browser’s “view page source” tool or “inspect” tool.
3. The Web SDK's script tags should appear in the form page’s source code. It must be located between the opening “<body>” tag and the closing “</body>” tag. Ideally it will be placed just above the closing “</body>” tag.


**Solution:**

- Make sure that the Web SDK's javascript snippet is placed in the page source code that the web server supplies to users.

**Check: Did the Web SDK insert the hidden TrustedForm fields into the form at run time?**

**How to check this:**

- Open the form page in your browser. Look at the page source code using your browser’s “view page source” tool (not the “inspect” tool). There should not be any fields with names containing the value of the Web SDK’s “field” var in the form.
- Now look at the form code with your browser’s “inspect” tool (not the “view page source” tool).
- There should be three type=”hidden” fields in the form in the “Inspect” view. By default they will be named  named “xxTrustedFormToken”, “xxTrustedFormCertUrl”, and “xxTrustedFormPingUrl”. If the TrustedForm Web SDK has it’s “field” var set to something other than “xxTrustedFormCertUrl”, then the TrustedForm-inserted fields will be named according to the Web SDK’s ‘field” var’s value.
- The value of those hidden fields will be a string in the form of a URL that begins as [https://cert.trustedform.com/...](https://cert.trustedform.com/...) For xxTrustedFormToken and xxTrustedFormCertUrl.


**Solutions:**

- Make sure your browser does not have Javascript turned off.
- Ad Blockers may interfere with the Web SDK. Turn them off.
- Certain browsers, like “Brave” may block the Web SDK.
- Poor internet connection. The TrustedForm Certify Web SDK needs to be able to communicate with the TrustedForm service while the user is on the page.
- Make sure that the Web SDK's javascript snippet is located within the page’s “body> … </body>” tags.
- If the Web SDK's javascript snippet is wrapped in a function, make sure that function executes before the user performs any actions that you want to be captured.
- If the form is within an iframe, make sure that the Web SDK is installed within the page that contains the form, not the iframe’s parent page.

**Check: Are the values of the hidden TrustedForm fields being delivered in the form submit along with the other fields?**

**_How to check this using the Chrome browser:_**

1. Load the page and open your browser’s “inspect” too to its “Network” tab.
2. Fill out and submit the form.
3. Select the “submit” entry in the Inspect tool and scroll down to view the “Form Data” item.
4. You should see the form fields and the hidden TrustedForm fields, named as described above.


**Solutions:**

If you don’t see  fields, then one of the following may be the cause:

- Any of the reasons mentioned earlier in this article.
- You may be using a page creator or form generator application that does not capture fields that aren’t specifically created by that application. Consult your page or form builder’s support for information on how to capture and submit run-time-added hidden fields.

Type something"
