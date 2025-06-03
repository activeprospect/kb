---
URL: https://community.activeprospect.com/series/4093977/posts/4065058-parsing-html-and-plain-text-response-bodies-using-capture
Page Title: Parsing HTML and Plain Text Response Bodies Using ""Capture""
Screenshot URL: images/screenshots/screenshot.png
Scraped At: 2025-06-02 19:41:59.834
---
6NfAYpt~hcTJBagMa1WhGSI9w7ZKTskaAhx1avRNz~stjWw7w0lYzpIukGinSsbjz4ECx-eq77AgI26YRv34OG8EnzQHPCXa1LdxTdSqr8yp9UeKsQPHMBUG40m9YGXWcJyzJdmjKh-4LtxXvaQ__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7557680-scott-mckee)

[_Scott McKee_](https://community.activeprospect.com/memberships/7557680-scott-mckee)

Updated February 2, 2021. Published November 4, 2020.

Details

# Parsing HTML and Plain Text Response Bodies Using ""Capture""

In recipient steps with well-formatted XML or Json response bodies, LeadConduit automatically captures the values of properties or tags as ""appended data"", but what if the response body is not well-formatted Json or XML?

For plain text or HTML responses (but _not_ XML or JSON), string values can be extracted into appended data by mapping regular expressions to ""capture"" variables.

For example, with a response like:

![](images/image-1.png)

and this mapping in the outbound step:

![](images/image-2.png)

The value from the regular expression's match group will be appended to the lead data:

![](images/image-3.png)

**Note**: The formulation of expression can be tricky, especially for long or multi-line responses. Mapped regular expression values are lowercased, so take that into consideration, or use syntax like `/.../i`.

Line-separators in the response may not match anchors ( `^` & `$`) as expected, so the ""multiline"" modifier may be needed ( `/.../m`).

Another example, which will result in `title` being set with ""The Raven"":

Response:

![](images/image-4.png)

Mapping:

![](images/image-5.png)

Result:

![](images/image-6.png)

**Mapping captured parameters into rules or outbound steps.**

Parameters that have been appended using ""Capture"" don't show up in the field dropdown as do other appended parameters. Here's how to map them:

Collapse

00:00

00:58

Mapping ""Capture"" Parameters

![](images/image-7.png)

#### Mapping ""Capture"" Parameters

Type something"
