---
URL: https://community.activeprospect.com/series/4539489/posts/4149927-recipe-for-a-delivery-step-form-post-example
Page Title: ""Recipe"" for a Delivery Step: Form POST Example
Screenshot URL: images/screenshots/screenshot.png
Scraped At: 2025-06-02 19:41:42.788
---
WWFqv6CpMvkQYVqgdITTXNV4zH4ht6o3IyEw-4CMQRj6k39IxNmWMRVd-fUEFAfl-t5t4eAc3deZZWdMm7OH6ib~zNKEnK35VAp6PpHsFPlSbOOsnZCeuXDkCyP4-FZ0JxASDvgnDybWSujXBIw__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7557566-ashley-thomas)

[_Ashley Thomas_](https://community.activeprospect.com/memberships/7557566-ashley-thomas)

Updated February 1, 2021. Published February 1, 2021.

Details

# ""Recipe"" for a Delivery Step: Form POST Example

This article addresses how to build a delivery step for the most common type of delivery-point API, often called a ""Form POST"" .

When you are planning to add a delivery step in a LeadConduit flow, the first thing is to check for an existing integration on [www.activeprospect.com/integrations](http://www.activeprospect.com/integrations). If you do not find your delivery step, the next step is to learn what format is expected; for this you will want to read the posting instructions provided by the party to which you will deliver the lead.

This article addresses how to build a step when the Content-Type expected is “application/x-www-form-urlencoded"". From this information we know that we want to configure a ""Form POST"".

# Example of reci **pient-sup** plied docs for a Form POST API

To illustrate how to build a basic delivery, we’ll use an example. Here are the posting specifications for a delivery:

## POST URL

https://api.converzate.com/v1/user

## HEADERS

|     |     |
| --- | --- |
| X-API-Key | YOUR\_API\_KEY |
| Content-Type | application/x-www-form-urlencoded |

## PARAMETERS

All query parameters must be URL encoded. The parameters and descriptions/values shown below in the left column are not URL encoded. The bolded parameters are required.

|     |     |
| --- | --- |
| **projectid** | 135793a |
| **phone** | phone number |
| **firstName** | first name |
| **lastName** | last name |
| **userId** | Unique user id. If you don’t have a user id, use phone, e.g +14151234567 |
| **channel** | SMS |
| **source** | lemonads |
| **email** | valid email address |
| **address1** | e.g., 100 main st # 1 |
| **city** | city, e.g., Chicago |
| **state** | state code, e.g., IL |
| **postalcode** | postal code, e.g., 60321 |
| **subid** | subid for tracking |

## RESPONSES

A valid lead submission will receive a response such as the following:

<?xml version=""1.0"" encoding=""utf-8""?> <Response> <IsValid>True</IsValid> <ResponseCode>NoError</ResponseCode> <ResponseDetail>The lead was posted successfully</ResponseDetail>   <LeadId>57820f7f-3e79-481d-8774-fbbc8e6246f6</LeadId> </Response>

An invalid lead submission will receive a response such as the following:

<?xml version=""1.0"" encoding=""utf-8""?> <Response> <IsValid>False</IsValid> <ResponseCode>DuplicateLead</ResponseCode>   <ResponseDetail>The lead provided is already in our system</ResponseDetail> </Response>

# Create the Delivery Step

To implement this delivery, take the following steps:

1\. Log into LeadConduit and Edit the flow; click on the Steps tab

2\. Click Add Step -> Recipient Step -> search for Custom. Click on the LeadConduit custom integration.

![](images/image-1.png)

3\. You will be prompted to name your integration. The best practice is to give every recipient a unique, meaningful name. Select whether you are sending to your own system or another company and click Next.

4\. Select a Custom Form from the list of integration types on the next screen, and click Finish.

![](images/image-2.png)

5\. Your new delivery will be added at the end of the flow, but you can drag an drop it to a more appropriate location.

**Add Mappings**

6\. Click the new delivery to expand it and click “Edit Field Mappings” to start.

7\. Add the URL to which you will send the request in the first line of the delivery step.

8\. Add your header fields as in the screen shot, picking “Header” from the right-hand dropdown and filling in the name of the header to include. In this example we have set the Content-Type and the X-API-Key field.

![](images/image-3.png)

9\. Add your parameters as in the screen shot below. Pick ""Form Field"" from the right-hand dropdown in the right hand side with each of the parameters from the submission instructions above, and LeadConduit fields on the left. The parameters that you enter will be sent as URL Encoded values.

![](images/image-4.png)

10\. After you have entered all of the fields, save the mappings by clicking “OK” at the bottom of the dialog. Drag your new delivery step to the appropriate position in the flow (which will execute its steps from top to bottom). Save your flow by clicking “Save” at top right.

**Configure Response Parsing**

11\. Now you are ready to put in “Response Parsing” to your delivery, which will tell LeadConduit how to interpret the response from your lead delivery. Specifically, you have to tell LeadConduit where to look in the response to determine if your lead delivery is a success and where to look for the reporting of errors or failure, when they occur. In short, you'll want to add three relevant mappings:

|     |     |
| --- | --- |
| Outcome Search Term | the characters to look for in the Outcome Search Path for a successful lead. E.g., ""success"" |
| Outcome Search Path | where to look in the response to find the Outcome Search Term |
| Reason Path | the path to the error reason given in the response to a rejected/failed lead |

See also the series [""Response Parsing Overview""](https://community.activeprospect.com/posts/4064667-response-parsing-overview).

For this example delivery, using XPATH parsing to identify a successful outcome, you would add these three mappings after all of your field mappings. In order to interpret the successful and failure responses give in the submission instructions above.

To start, we examine the successful response that is included in the submission instructions. We can expect to receive the word ""True"" in the ""Isvalid"" mapping:

<?xml version=""1.0"" encoding=""utf-8""?>

<Response>

    <IsValid>True</IsValid>

    <ResponseCode>NoError</ResponseCode>

    <ResponseDetail>The lead was posted successfully</ResponseDetail>

    <LeadId>57820f7f-3e79-481d-8774-fbbc8e6246f6</LeadId>

</Response>

From this, we know that we can map the ""Outcome Search Path"" to look in the IsValid value in the response, and the ""Outcome Search Term"" to indicate success will be ""True"".

Likewise, we need to examine the failure response included in our submission instructions. We can expect the error to be in the ResponseCode value.

<?xml version=""1.0"" encoding=""utf-8""?>

<Response>

<IsValid>False</IsValid>

<ResponseCode>DuplicateLead</ResponseCode>

<ResponseDetail>The lead provided is already in our system</ResponseDetail>

</Response>

We indicate this to LeadConduit by setting the ""Reason Path"" to /Response/ResponseCode/text(). Alternatively, we can set it to /Response/ResponseDetail/text() in order to print the value ResponseDetail as the error reason.

Edit the Field Mappings as you did above and add three mappings, picking the germane value--Outcome Search Path, Outcome Search Term or Reason Path--from the dropdown on the right hand side.

![](images/image-5.png)

12\. Click OK to save the mappings, and Save your flow once again at top right.

**Test**

13\. Send a test lead and verify the delivery, checking the lead in the Leads -> Explore Lead Events display for the status of your tests and adjusting your delivery as needed until it is working.

Tip for test leads: Before testing a new delivery in an existing flow that is already processing many leads, you can limit the leads that enter to a particular source or email reserved for tests with Step Criteria entered on the step.

**Filter on the outcome**

14\. Finally, your response parsing won't have any effect on the lead unless you have a means to evaluate the success/failure of your new delivery and stop the lead if it has failed, which is usually desired. This is accomplished by adding a Filter step.

Pick Filter Step from the Add Step drop down at the top right. A step will be added to the end of the flow. Click to expand it. Configure it to stop processing if your delivery step's Outcome is not a Success.

Type something"
