---
URL: https://community.activeprospect.com/series/4093977/posts/4064984-parsing-html-response-bodies-using-css-selectors
Page Title: Parsing HTML Response Bodies Using CSS Selectors
Screenshot URL: images/screenshots/screenshot.png
Scraped At: 2025-06-02 19:41:51.715
---
h1I6gvH4zedJ68ex-jaTCqDqcU0MrAHoBcVRJAk7uwgNyuCwxmGqSJS992FBZHnpUrkBwl8qFOsQHXOjlKQWorgezGSM-KtEIgcearIObR97axX5hADiNn3yqnMKBbmLeeGRyAbK~KCR5iZMkUw__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7557680-scott-mckee)

[_Scott McKee_](https://community.activeprospect.com/memberships/7557680-scott-mckee)

Updated September 17, 2021. Published November 4, 2020.

Details

# Parsing HTML Response Bodies Using CSS Selectors

HTML is a structured page description language. While HTML and XML have similarities (Both use angle-bracket enclosed tags in a hierarchical structure (Both allow similarly-structured attributes within opening tags.) there are many differences between them, enough that HTML cannot be parsed using XPath.

HTML response bodies can be parsed using CSS Selectors. This article will provide an example of the use of CSS Selectors to parse a simple HTML response.

Getting the most out of CSS selectors requires an understanding of HTML and CSS. To learn more about HTML, see this [""Introduction to HTML"" tutorial](https://developer.mozilla.org/en-US/docs/Learn/HTML/Introduction_to_HTML). To learn more about CSS see this [""Introduction to CSS"" tutorial](https://developer.mozilla.org/en-US/docs/Learn/CSS/Introduction_to_CSS).

For more detailed information about CSS selectors, see this [""Simple Selectors"" tutorial](https://developer.mozilla.org/en-US/docs/Learn/CSS/Introduction_to_CSS/Simple_selectors).

Recipients may respond to a lead submission with a thank-you page. Here's the HTML code for one such response:

HTTP/1.1 200 OK

**Server**: Cowboy

**Connection**: close

**Content-Type**: text/html; charset=utf-8

**Date**: Thu, 26 Jan 2017 19:49:14 GMT

**Via**: 1.1 vegur

```
<HTML>
  <HEAD>
    <TITLE> transmission complete page. </TITLE>
  </HEAD>
  <BODY>
    <title>Thank You.</title>
    <p><h3>Thank you!</h3></p>
  </BODY>
</HTML>
```

Note the Content-Type header ""text/html"". If this is the header received in the response, LeadConduit will by default expect to see CSS Selectors in the Outcome Search Path, Outcome Search Term, and Reason Path mappings.

The Outcome Search Path mappings for this example look like this:

![](images/image-1.png)

And would yield a Success response

# Response Content-Type Override

If you find that properly-configured parsing is not working, the response's ""Content-Type"" header, which tells LeadConduit what format the response is supposed to be in, may not have been set correctly by the recipient system. You can override the actual header and force LeadConduit to parse the response as a different type by setting the desired Content-Type in the Response Content Type Override mapping:

![](images/image-2.png)

# No Failure Reason Retrieval

Using ""Reason path"" to capture the reason for a failure response is not supported when parsing using HTML Entities.

# Caution: Multiple Same-Type Entities

If the response body contains more than one HTML Entity of the Selector type being used for Outcome Search Path, LeadConduit will search ALL of those entities for the Outcome Search Term, even if the entities have different IDs.

Example: For this response body

**Response**

```
HTTP/1.1 200 OK
Server: Cowboy
Connection: keep-alive
Date: Thu, 00 Any 20∞ 07:47:00 GMT
Content-Type: text/html; charset=UTF-8
Content-Length: 2299
Via: 1.1 vegur

```

```
<!DOCTYPE HTML PUBLIC ""-//W3C//DTD HTML 4.0 Transitional//EN"">
  <HTML>
  <HEAD>
    <title> Response</title>
    <META data-fr-http-equiv=""Content-Type""   content=""text/html"">
  </HEAD>
  <BODY>
    <FORM>
      <h1>Result:</h1>
      <TABLE>
          <TD>Error Description:</TD>
          <TD><p id=""para1"" >First paragraph</p></TD>
          <TD><p id=""para2"" >Second paragraph</p></TD>
        </TR>
      </TABLE>
    </FORM>
  </BODY>
</HTML>
```

This mapping will return a success outcome:

![](images/image-3.png)

And this mapping will also return a success outcome:

![](images/image-4.png)

Type something"
