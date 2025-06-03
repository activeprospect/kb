---
URL: https://community.activeprospect.com/series/4093977/posts/4064667-response-parsing-overview
Page Title: Response Parsing Overview
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-0365e6f4-6a56-43bc-9bfc-2150208f26fe.png
Scraped At: 2025-06-02 22:29:40.378
---


[_Scott McKee_](https://community.activeprospect.com/memberships/7557680-scott-mckee)

Updated August 9, 2023. Published November 4, 2020.

Details

# Response Parsing Overview

# What is Response Parsing?

When a LeadConduit Recipient step  sends a request to a CRM or other web service, the recipient usually replies back to LeadConduit with a message (the response body) that describes the outcome of the request.

Every recipient's response body is different. The response body's format and content is determined by the programmer who designed the recipient's platform. While there are some common formats (Json, Query String, XML, plain text) there is no universal, standard response content.

If you know your recipient's response format and its content options you can configure LeadConduit's Custom integrations to parse each lead's response to identify whether the recipient has accepted or rejected the lead and, in the case of rejected leads, extract the rejection reason (if the recipient supplies it). You can find this information in the recipient's posting instructions, or you can send test leads to the recipient and examine the resulting responses.

This series outlines basic concepts and parsing techniques for common response formats. Since each implementation is unique its unlikely that you will be able to simply cut and paste a solution, so understanding the concepts and data structures are essential.

# Before We Begin: Content-Types

LeadConduit needs to know what format the response body will be in so it can use appropriate pattern-identifying rules to parse the response. The recipient may include a ""Content-Type"" header specifying the data format of the response body, such as ""application/json"", ""application/x-www-form-urlencoded"" (query string), or ""text/xml"". If so, LeadConduit will expect the content of the response body to be formatted as the header specifies. If no Content-Type header is present, LeadConduit will examine the response body and attempt to guess the Content-Type.

**What are these ""pattern-identifying rules""?**

If the response Content-Type is Json and the response body is in fact well-structured Json, use ""Dot Notation"" to locate the outcome and rejection reason portions of the response body. If the Content-type is XML and the response body is in fact well-structured XML, use ""X-path"" notation. If HTML, then use CSS selectors. Finally, if Content\_Type is plain text, is not discernible or is not well-structured according to the response's Content-Type header, use ""Regular Expressions"". These notation methods are explained in detail in the following articles in this series.

**What if the response's Content-Type header and the response body don't match?**

Some recipient APIs behave badly. They respond with a Content-Type header that isn't accurate for the actual content provide. For instance, they may specify Content-Type: text/HTML but put XML in the response body. Or they may specify Content-Type: text/plain but put Json in the body. This is not uncommon, and often causes response parsing problems.

Fortunately, LeadConduit let's you override the recipient's Content-Type header declaration. To do this, add a ""Response Content-Type Override"" mapping to the recipient step. Here's an example that tells LeadConduit to treat the response body as Json, no matter what the response's Content-Type header says:

![](images/image-1.png)

# The Response-Related Mappings

Three special mappings in your Delivery step tell LeadConduit how to parse the response body:

**Outcome Search Term** is whatever string value in the response body indicates that the lead was accepted by the recipient. It is often a simple word like ""accepted"" or ""success"".

**Outcome Search Path** is a Dot Notation, Xpath, Regular Expression or CSS selector that defines a location in the response body where LeadConduit should expect to find the Outcome Search Term. If an Outcome Search Path is mapped, then LeadConduit will only look at that location for the Outcome Search Term. If you are certain that the Outcome Search Term will occur only in the response body for accepted leads and never otherwise, you may optionally not map the Outcome Search path and LeadConduit will by default search the entire response body for the Outcome Search Term. However, best practice is to map an Outcome Search Path whenever possible to avoid false positives.

**Reason Path** is a Dot Notation, Xpath, Regular Expression or CSS selector that defines a location in the response body where LeadConduit should expect to find the rejection reason string. Reason path is only invoked if the Outcome Search Term is not found.

Type something
