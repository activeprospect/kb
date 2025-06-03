---
URL: https://community.activeprospect.com/series/4093977/posts/4064935-parsing-xml-response-bodies-using-xpath
Page Title: Parsing XML Response Bodies Using XPath
Screenshot URL: images/screenshots/screenshot.png
Scraped At: 2025-06-02 19:41:55.368
---
l9ACz-v4o6YOlBtkkkypMVulpAKfsExCVnDbVP1jL7dyoR9WnPHiCdPrKel1dDHVb~wxygvqqytfubsjI8TNrNquBJMMK6MesSVmnmKoyDUhsOkTefVI7SukJ10uRuaVbbPbQz374nkQCpQGjWw__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7557680-scott-mckee)

[_Scott McKee_](https://community.activeprospect.com/memberships/7557680-scott-mckee)

Updated January 21, 2021. Published November 4, 2020.

Details

# Parsing XML Response Bodies Using XPath

XML is a hierarchically structured, human-readable format for representing data. It is not within the scope of this article to teach XML. To learn more about XML, see [this tutorial](https://www.tutorialspoint.com/xml/).

XPath is a shorthand technique for drilling into an XML document to extract the contents of a particular parameter, or node. Beginning with the outermost (root) level of the XML document, drill down into it by specifying the names of ever-deeper nodes, delimiting between each with a ""/"" between parent and child, until you reach the one you need to extract.

For example, if the response body for an accepted lead looks like this:

![](images/image-1.png)

Then these mappings would identify the lead as accepted:

![](images/image-2.png)

And if a rejection response body looks like this:

![](images/image-3.png)

This mapping would extract ""Quota filled for red cars"" as the rejection reason:

![](images/image-4.png)

Note the use of ""/text()"" as a capture group in the Reason Path mapping. Why is it used here but not in the Outcome Search Path? Because Success Outcome mappings are only looking for a match with what is in the response, while Reason Path mappings are tasked with extracting a copy of the XML tag's value and incorporating it into the flow as appended data.

# Repeating Nodes

Now look at this response:

![](images/image-5.png)

The same mappings used above will capture both reasons as an array and will report them all as a single string in the reason field. But they are also appended to the flow individually as an array of fields, indexed by integer values beginning with zero:

![](images/image-6.png)

This is consistent with how LeadConduit automatically attempts to parse all of the information it can from a response body, making it available as appended data. If a parent node contains several identically-named child nodes, LeadConduit treats them as an array by using an integer to identify which particular node of the set to select for that level of the traverse, zero for the first node in the set, 1 for the second, and so on.

But what if you wanted to ignore the first error node and capture only the contents of the second error node as your reason? Add a (1-based) position index to the node name in your reason path:

![](images/image-7.png)

resulting in this:

![](images/image-8.png)

# Node Attributes

An attribute is a key=value pair within a node's opening tag. You can match or capture attributes also. For instance, in this XML the success/rejection term is in the value of the ""outcome"" attribute of the ""result"" node.

![](images/image-9.png)

Use an ""@"" to indicate that an XPath term is an attribute, not a child node, of the node just preceding it:

![](images/image-10.png)

# Namespaced XML

You may encounter a response that includes one or more attributes that have colons in their keys and urls as their values and which also may prepend the right-hand part of those attribute names to node names using a colon. Those attributes define what are called ""namespaces"". Take a look at this:

![](images/image-11.png)

The particular sample is a variant of XML known as SOAP, but you may see namespacing on non-SOAP XML also. This article is not concerned with what namespacing is or how it works. The only reason we mention it here is because most XPath parsers, including LeadConduit's, do not deal gracefully with namespacing.

But fear not, there is a solution. We can tell our XPath parser to simply ignore the namespaces prepended to the node names. The technique to do this looks messy, but is actually simple.

To make the parser ignore namespaces use

```
/*[name()='nodename'] instead of /nodename
```

in your mapping.

For example, the ""CreateResponse"" tag and all tags it includes are affected by the namespace attribute xmlns=""http://waytoocomplicated.com/wsdl/partnerAPI"". To map the ""OK"" in the StatusCode tag as a success response, map ""OK"" to the Outcome Search Term and use:

```
*[name()='soap:Envelope']/*[name()='soap:Body']/*[name()='CreateResponse']/*[name()='Results']/*[name()='StatusCode']
```

to the OutCome Search Path.

# Response Content-Type Override

If you find that properly-configured parsing is not working, the response's ""Content-Type"" header, which tells LeadConduit what format the response is supposed to be in, may not have been set correctly by the recipient system. You can override the actual header and force LeadConduit to parse the response as a different type by setting the desired Content-Type in the Response Content Type Override mapping:

![](images/image-12.png)

Some common XML Content-Types are:

- application/soap+xml; charset=utf-8
- text/html
- application/xml

For an online XPath expression tester, [click here](http://codebeautify.org/Xpath-Tester).

For a brief tutorial about xPath [click here](https://www.tutorialspoint.com/xpath/index.htm).

Type something"
