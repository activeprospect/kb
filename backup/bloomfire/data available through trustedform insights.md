---
URL: https://community.activeprospect.com/posts/4112140-data-available-through-trustedform-insights
Page Title: Data available through TrustedForm Insights
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-a8ecf71d-5e87-40d2-af18-0d716fa04892.png
Scraped At: 2025-05-30 00:16:49.152
tags:
  - analytics
  - intermediate
  - trustedform
  - compliance
  - data-management
  - developer-focused
  - technical
secondary_tags:
  - reference
  - universal
  - operation
  - buyer-focused
  - conceptual
---

[![](https://content2.bloomfire.com/avatars/users/1405246/thumb/thumbnail.png?f=1620827893&Expires=1748567795&Signature=kNJA7HSLiajLaZYLiDo1O-hQhrYQxsRqV-OmV0bK32tCNiqXDwNuyHed~ahOeBh5VvK1fTrkmNAtUL3hXcb322dRcjVPT7YsxqwRYl-SK3GHblfiUyLM-CNKQC~E0g6fKPgTdPKl8KKzTy4T-EN-TZQ4S2sOWtWSp2y07i99T7eRGwQWvgc96R2WXZnLHvUlGXVFtBs5Faw3eBH1YHcEio0wTcc3nR4tQBr7Mj5z7iUjwOhswc0SXvuNeMxlfpRsqBvVW5VKfVC5y2lAM1TJyUpK-oa~nCG1YoxC7esOGuvhk~LMroPAQ1sgQOs2jPbgbVSPneLxTGLg3rgRd1mSgQ__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7846678-christopher-williams)

[_Christopher Williams_](https://community.activeprospect.com/memberships/7846678-christopher-williams)

Updated December 18, 2024. Published December 16, 2020.

Details

# Data available through TrustedForm Insights

This is a list of the data that is currently available via the TrustedForm Insights.

|     |     |     |     |
| --- | --- | --- | --- |
| Name | API Property | Description | Potential Use Case |
| Age | insights.properties.age\_seconds | The amount of time, in seconds, since the last user interaction with certificate. Serves as an approximation of lead age. | Only accept leads with an acceptable lead age that allows you to have a chance to contact them while they are still fresh. |
| Browser | insights.properties.browser | The name and version of the browser used during the lead event. | Track trends/correlations between KPIs and Browser. |
| Created Timestamp | insights.properties.created\_at | The timestamp of the creation of the TrustedForm certificate, in ISO 8601 format. | Record the date and time the lead event took place for record keeping. |
| Domain | insights.properties.domain | The name of the website the lead event took place on. | Track trends/correlations between KPIs and Domain. |
| Expiration Timestamp | insights.properties.expires\_at | A timestamp indicating when this certificate will no longer be available for API requests. | Reject leads where the TrustedForm certificate has expired and can no longer be retained/claimed for protection against TCPA complaints. |
| Framed | insights.properties.is\_framed | Whether or not the lead event took place inside of an [iframe](https://www.techtarget.com/whatis/definition/IFrame-Inline-Frame). |  |
| ```<br>Form Input Method<br>``` | insights.properties.form\_input\_method | A list of ways the consumer input their data onto the form including one or more of the following: typing, paste, autofill | Reject leads who only used copy and pasting to fill out a form as way to identify potential fraud. |
| Form Input KPM | insights.properties.form\_input\_kpm | The consumer’s typing speed on the form, in keystrokes per minute. | Track trends/correlations between KPIs and KPM. |
| Form Input WPM | insights.properties.form\_input\_wpm | The consumer’s approximate typing speed on the form, in words per minute. This is calculated by using the Form Input KPM and assuming five characters represent a word. | Use typing speed information to infer attributes about a consumer. A buyer might reject leads that don’t fall within the desired range. |
| IP Address | insights.properties.ip | The public IP address of the consumer during the lead event captured from the X-Forwarded-For (XFF) request header. | Identify lead events originating from non-unique IP addresses that may not have been completed by the expected consumer. |
| Location | insights.properties.approx\_ip\_geo | The city, state, postal code, country, timezone, latitude and longitude of the consumer's location during the lead event based on IP address. | Accept leads within a specific geographic area. |
| Masked | insights.properties.is\_masked | Whether or not the TrustedForm certificate is masked. | Route leads with masked certificates to a different system. |
| Mobile | insights.properties.is\_mobile | Whether or not the consumer was using a mobile device. | Track trends/correlations between KPIs and Mobile. |
| Sensitive Content | insights.properties.num\_sensitive\_content\_elements | Count of how many content elements (e.g. input, textarea) are marked sensitive and hidden from the session replay | Flag certificates with sensitive content for manual review to ensure the lead event is shown adequately. |
| Sensitive Form  Fields | insights.properties.num\_sensitive\_form\_elements | Count of how many form fields (e.g. input, textarea) are marked sensitive and hidden from the session replay | Flag certificates with sensitive form fields for manual review to ensure the lead event is shown adequately. |
| Operating System | insights.properties.os | The name and version of the operating system for the device used during the lead event. | Infer attributes about a consumer, and accept or reject a lead accordingly. |
| Page Scan | insights.scans | Results indicating whether specified text was found on the web page that created the certificate. [Learn more](https://community.activeprospect.com/posts/4078890-trustedform-page-scan) | Accept leads where the desired language was found on the page through the use of page scanning. |
| Page URL | insights.properties.page\_url | The URL of the page where the lead event took place. | Trace leads back to their original source regardless of where they were purchased. |
| Parent Page URL | insights.properties.parent\_page\_url | The URL displayed in the consumer's browser if the Page URL was displayed in an [iframe](https://www.techtarget.com/whatis/definition/IFrame-Inline-Frame). | Trace leads back to the webpage the originated from when the form is hosted somewhere else. |
| Time On Page | insights.properties.seconds\_on\_page | The amount of time  that the consumer spent on the page during the lead event. | Track trends/correlations between KPIs and Time On Page in conjunction with Domain or Webpage URL for best results. |

Type something"

