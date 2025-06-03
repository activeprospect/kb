---
URL: https://community.activeprospect.com/posts/5050837-limit-the-lead-age-in-leadconduit-with-trustedform-insights
Page Title: Limit the lead age in LeadConduit with TrustedForm Insights
Screenshot URL: images/screenshots/screenshot.png
Scraped At: 2025-06-02 19:41:32.311
---
WWFqv6CpMvkQYVqgdITTXNV4zH4ht6o3IyEw-4CMQRj6k39IxNmWMRVd-fUEFAfl-t5t4eAc3deZZWdMm7OH6ib~zNKEnK35VAp6PpHsFPlSbOOsnZCeuXDkCyP4-FZ0JxASDvgnDybWSujXBIw__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7557566-ashley-thomas)

[_Ashley Thomas_](https://community.activeprospect.com/memberships/7557566-ashley-thomas)

Updated May 3, 2023. Published May 3, 2023.

Details

# Limit the lead age in LeadConduit with TrustedForm Insights

How to create a filter to limit the lead age in LeadConduit, using TrustedForm Insights

In a LeadConduit flow (and via [the TrustedForm Insights API](https://developers.activeprospect.com/docs/trustedform/api/v3.0/tag/Retrieving-Insights/)), TrustedForm Insights returns a trove of [TrustedForm certificate data characterizing the consumer web session](https://community.activeprospect.com/posts/4112140-data-available-through-trustedform-insights). The certificate Age value will report the number of seconds since the last user interaction, and then can then be used to identify and accept leads that were created within a designated time. To filter your leads on Age, follow these instructions. Please note that an Insights subscription is necessary to implement this process.

## Edit your flow

To limit the age of successful leads, first we have to edit your flow so that it identifies the age of the certificate included with the lead.

1\. Log into LeadConduit and edit the flow

## Add TrustedForm Insights to your LeadConduit flow

2\. Pull down  ""Add Step"" to ""Enhancement Step"" and search for ""TrustedForm Insights""; pick ""Add to Flow"" on the tile. Click Next and Next, and Finish. You do not need to further edit the TrustedForm Insights step at this time.

3\. Scroll down in the flow steps to find the new TrustedForm Insights step at the bottom;  drag it upwards into a position early on in the flow.

![](images/image-1.png)

## Add a Filter to limit the TrustedForm Age of your leads

4\. Pull down  ""Add Step"" to ""Filter Step"". Scroll down to the bottom of the flow, where there will be a new filter.

5\.  Drag the filter step upwards and position it just after the TrustedForm Insights step. Click the step to expand it, if needed

6\. For Description, enter a name for the filter such as ""Filter out leads older than 20 minutes""

7\. Under ""Stop processing the flow for a lead that matches the following rules:"", type ""Age"" in the left blank and select the appended field, ""TrustedForm Age."" Then select ""is greater than"" and on the right, enter ""1200"" or whatever limit in seconds you would like; 1200 is twenty minutes expressed in seconds. Replace ""Failed Rules"" with something like ""Lead age is over the maximum""

![](images/image-2.png)

8\. Save your flow at the top right.

## How your leads will show the age results

**F****ailure**(lead is too old): For leads with TrustedForm Certificates that are over the maximum age, processing will stop after the filter and the lead Outcome will be updated to ""Failure"". When viewing a lead in the Lead Events viewer you'll see a step in red displaying the Reason for the failure:

![](images/image-3.png)

**Success**(lead is under the maximum age): For leads with TrustedForm Certificates that meet the Age requirement, in the Lead Events viewer you'll see:

![](images/image-4.png)

Type something"
