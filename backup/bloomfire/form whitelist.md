---
URL: https://community.activeprospect.com/series/4190127/posts/4076811-form-whitelist
Page Title: Form Whitelist
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-b5b7fe98-b26d-4777-82e7-bbd767e3c023.png
Scraped At: 2025-05-30 00:16:43.638
tags:
  - trustedform
  - intermediate
  - compliance
  - developer-focused
  - technical
  - reference
  - how-to
secondary_tags:
  - universal
  - operation
  - advanced
  - semi-technical
  - best-practices
---

[previous page](https://community.activeprospect.com/series/4190127/posts/4806725-trustedform-certify-failure-reasons) 8 of 8

In Series: [Advanced options when implementing the TrustedForm Certify Web SDK](https://community.activeprospect.com/series/4190127-advanced-options-when-implementing-the-trustedform-certify-web-sdk)

[![](https://content2.bloomfire.com/avatars/users/1405246/thumb/thumbnail.png?f=1620827893&Expires=1748567782&Signature=p0pT1~1wcR-gU81DO8z6IZiv7o~WLLN~4VM~imVO9S8k93mWAt02SeJ40QznEe5d6Ai9pIg8F7Cj-Cf-PtYsqGGz9kltuFc9PZW5VIZ5usj62ZjwCDxc0sQE~eGKLaHogaFAIo7y0O92bwwb5j0-aXxdN97HXq71EOHRsgOAXa6y-lLup33TTtsLcWa75mamconkz6MIiu8qQIGq5CW6tgTvHu~RjCUSCq8hX9ygzZnaI2RrR~mRdiMyTznqQm0hKZieqZCsJGMGmmp1qq4fJZ9j0dA4csGdNfoR5Lu2Ug16n93fzXNCHyzB5kaRl6cbgmNM~5ii9HlDqH8LUVaAlw__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7846678-christopher-williams)

[_Christopher Williams_](https://community.activeprospect.com/memberships/7846678-christopher-williams)

Updated November 30, 2020. Published November 9, 2020.

Details

# Form Whitelist

The default behavior of the TrustedForm script is to inject a hidden field containing the value of the TrustedForm Certificate URL into every form on the page.

However, it's possible to create a whitelist of one or more forms to inject the hidden field into, with only a couple of minor modifications to the script.

1. Add a new variable named formId
2. Add a new parameter and value (see below) to the line beginning with '://api.trustedform.com.

```
<script type=""text/javascript"">
 (function() {
...
 var formId = 'hello';
...
 '://api.trustedform.com/trustedform.js?form_selector='+escape(formId);
...
</script>
```

The value provided to the variable **formId** can be a form name, class, or ID applied to a form using the following patterns:

```
<form name=""hello"">
var formId = 'hello';

<form class=""howdy"">
var formId = '.howdy';

<form id=""bonjour"">
var formId = '#bonjour';
```

Multiple forms can also be targeted by providing a comma-delimited list of targets.

```
<form name=""hello"">
<form class=""howdy"">
<form id=""bonjour"">
var formId = 'hello,.howdy,#bonjour';
```

**FYI**: If no targeted forms can be located, the hidden field will not be injected into any form. It is the responsibility of the form owner to maintain the accuracy of the form target.

Type something"

