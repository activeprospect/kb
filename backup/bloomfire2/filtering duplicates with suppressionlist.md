---
URL: https://community.activeprospect.com/series/4539489/posts/4116582-filtering-duplicates-with-suppressionlist
Page Title: Filtering Duplicates with SuppressionList
Screenshot URL: images/screenshots/screenshot.png
Scraped At: 2025-06-02 19:42:15.090
---
4jvSygeYmAY1ldtCtp31eXWStDnN~iPD-q2sCnWabr5-kbB-JVTwnVO7Pq6Dc5b8Z-ogixPXuZhKWaJ18yBMQpA~ubfuEEb~fvyH3a5LGFnOF~doFMzG3srM0fHroau37MMRQQja4zkJBK7RTDA__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7557680-scott-mckee)

[_Scott McKee_](https://community.activeprospect.com/memberships/7557680-scott-mckee)

Updated June 5, 2023. Published December 22, 2020.

Details

# Filtering Duplicates with SuppressionList

Use SuppressionList to filter duplicate leads based on any flow field.

For this example we'll be filtering to ensure that each lead's Phone 1 value is not contained in a list of previously-accepted leads' phone numbers. First create and optionally pre-populate the list of phone numbers in SuppressionList:

Adding Simple Duplicate Checking to Your Flow

Duplicate checking involves two SuppressionList steps and a Filter step.

![](images/image-1.png)

The Query Step

First, a SuppressionList Query step checks a list to find out if it contains the queried item.

SuppressionList responds to the query with either one or three data values, which are appended to the flow.

If the item was not found in the queried list, SuppressionList adds “suppressionlist\_query\_item\_found=false” to the flow’s appended data.

![](images/image-2.png)

If the item was found in the list, SuppressionList adds “suppressionlist\_query\_item\_found = true”, “suppressionlist\_query\_item\_found\_in=\[\[the name of the list\]\]” and “suppressionlist\_query\_item\_added\_at=\[\[timestamp when the item was last added to the list\]\]” to the flow’s appended data.

![](images/image-3.png)

The outcome of the Query step is set to “success” whether the item is found or not.

Filter on the Query Results

Next, use a filter step to stop the lead if “suppressionlist\_query\_item\_found = true”.

![](images/image-4.png)

The filter step can optionally include a rule that uses the “suppressionlist\_query\_item\_added\_at” timestamp to limit the query’s lookback period.

![](images/image-5.png)

TIP: If there are more than one Suppressionlist Query steps in your flow, consider including a rule to your filter that also identifies the suppressionlist in which an entry was found, ""SuppressionList Query Item Found In"" as illustrated in the article [Querying Multiple lists](https://community.activeprospect.com/posts/4111212-querying-multiple-lists-for-one-value-simultaneously-in-suppressionlist).

Add the Accepted Lead to Your List

If the lead, having survived the Duplicate-checking filter, also survives any subsequent validation steps you’ll want to add that lead’s key value to the duplicate-checking list. This step should be placed at the point at which it's known the lead will be accepted. Do this with a SuppressionList “Add to List” step. It’s best to locate this step as close to the end of the flow as possible, and certainly after the last lead-rejecting filter in the flow.

![](images/image-6.png)

Important Note About Capitalization and Punctuation

If you pre-populate a list of phone numbers from your existing customer base, be sure to standardize them to 10-digits-only format (2125551212) before importing into SuppressionList. Do this because the “Add new entries” and “Replace list entries” buttons in the SuppressionList UI will not strip out punctuation or spaces when storing new values. But LeadConduit converts phone fields to 10-digit format for both Query steps and Add-to steps. If you manually added “(212) 555-1212” to your list, it’s stored in exactly that format. If LeadConduit later queries on that same phone number, it will be use the standardized “2125551212” for the query. This will not match the “(212) 555-1212” that you’d manually added, so the query result with be “not found”. This isn’t a problem for phone field values added from a flow by a SuppressionList “Add to list” step because LeadConduit steps use the standardized value.

SuppressionList lowercases capitalized letters in a value before storing or querying it, so ""Ted"" and ""ted"" would be seen as the same value in a query. What SuppressionList does not do is remove white space or punctuation to standardize against the possibility of variations in those characteristics. So ""John O'Hara"" and ""John Ohara"" would be treated as different values because of the apostrophe.

Best Practice For Filter Placement

When referencing SuppressionList step outcomes, a Filter will always see only the appended data from the most-recently-executed Query step. For instance, If your flow has two or more Suppression list Query steps, a filter located after (below) those steps will only be able to evaluate the ""Query Item Found"" value appended by the step that last executed a query.

Note that If a Query step in such a Flow doesn't execute (Outcome is ""skip"") the ""Query Item Found"" value will be that of the last Query step that DID execute, since the skipped step had no ""Query Item Found"" value to overwrite the previous result.

Obviously this can get complicated, so Best Practice is to always locate a filter immediately after the Query step it's evaluating, and if the Query step is subject to step rules, take that into account in your Filter's rules.

Type something"
