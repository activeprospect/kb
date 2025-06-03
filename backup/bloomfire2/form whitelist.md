---
URL: https://community.activeprospect.com/series/4190127/posts/4076811-form-whitelist
Page Title: Form Whitelist
Screenshot URL: images/screenshots/screenshot.png
Scraped At: 2025-06-02 19:42:55.384
---
gLBQPi~if1U0FVbIVH6z1BnKHDUrEnr9uOe~CM3p658tj5jASjq~Gwj29OXJVWn3jfEsIrf5f7bgxOTv4YscFsT0bchltn0a9syF1lS0R2Ge-dVcyKADwaEeVOp9q9nzMvxwXvisgnfPYQtIlEw__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7846678-christopher-williams)

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
