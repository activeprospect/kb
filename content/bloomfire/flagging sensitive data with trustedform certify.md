---
URL: https://community.activeprospect.com/series/4190127/posts/4076729-flagging-sensitive-data-with-trustedform-certify
Page Title: Flagging Sensitive Data with TrustedForm Certify
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-cc29d883-4525-462e-8380-191bbf7c4f36.png
Scraped At: 2025-05-30 00:16:44.007
---

[previous page](https://community.activeprospect.com/series/4190127/posts/4065187-implementing-trustedform-certify-web-sdk) 2 of 8 [next page](https://community.activeprospect.com/series/4190127/posts/4129671-deploying-the-trustedform-certify-web-sdk-using-google-tag-manager)

In Series: [Advanced options when implementing the TrustedForm Certify Web SDK](https://community.activeprospect.com/series/4190127-advanced-options-when-implementing-the-trustedform-certify-web-sdk)

[![](https://content2.bloomfire.com/avatars/users/1405246/thumb/thumbnail.png?f=1620827893&Expires=1748567764&Signature=k2EnCRpiTRmRjLWA5M8R7-Q~ePGyjTegalEZr1l2l~eMY7xFC2FmIo-9OVSnDVpY--Mbi82MQMtP34UG13foga8dMzBCQXPMx9xZ6rTZuOwK4GntN5kl6ltaJW5O5hfTxErw7QwuwLQQFZMhZXzzoxPST5FL4ufGvdNExAJJnrRC0j73E2QDrOgs~ZI-UT83wHw8JAC3dI4sJywxG-Sz8cB8e1bez~Lkv58sV9LFMjjG0AEtHKl9lnpZ18yXsHxZBPQHp93RW96Xf4nR3shGoGD54gzpAp0Fi~UM5eF4kPQBsi-BnI~SwbfUI1KMOXLzmlqBFq7S~atB-d8kmcDaXQ__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7846678-christopher-williams)

[_Christopher Williams_](https://community.activeprospect.com/memberships/7846678-christopher-williams)

Updated July 24, 2024. Published November 9, 2020.

Details

# Flagging Sensitive Data with TrustedForm Certify

# Overview

Per the [TrustedForm EULA](https://activeprospect.com/trustedform-eula/), the TrustedForm service may not be used to capture sensitive consumer data. Examples of sensitive data include credit card numbers, bank account numbers, social security numbers (SSNs), and driver's license numbers. If you use [TrustedForm Certify](https://activeprospect.com/trustedform/certify/) to collect sensitive data, you **must** flag these fields as sensitive.

# How Do I Protect Fields with Sensitive Data Flagging?

TrustedForm Certify allows you to flag any part of a form that contains sensitive data. When this feature is used, we apply a cryptographic hash to the flagged fields making it infeasible for anyone, including us, to store, retrieve, reverse-engineer, or utilize the data that was volunteered by the end-user in that flagged data field.

When a TrustedForm session replay is viewed, the data in a flagged field will be seen only as a series of asterisks or removed completely. In order for you to protect sensitive data and still have a recognizable certificate for compliance, we recommend only flagging fields that truly collect sensitive data.

# Implementation

## Flagging Individual Fields as Sensitive Data

By default, field data collected in form inputs are not considered sensitive by TrustedForm Certify. If you use it as provided and do not flag any fields as sensitive, it will capture any fields filled out while it is active.

![](https://content2.bloomfire.com/thumbnails/contents/003/597/213/original.png?f=1676399425&Expires=1748567794&Signature=jvKV-PdXYt0H1W4kpHmEcYJ1l80RNgFc8ZY4ysAS2NWHFOlQt2NIUx~k36zkLM4OXP~tF-xy~u7bDQIa6D0FQsdO9pl9C0kUhisxNqLhREwPnWk8Gd3UkKCzRng1DA3BX4F59zrYaWhGpJ358dqSDBpTHDGPTYWR8GuwYQuqg7HXDcUXLh9j2d-19lsRg3tWsBOuaNhUSaNv0XFJCkPm~z6zGJApLcx7wAOXKshpkrjd2BStE4GatD7Z91cOU7YViX2T8FbCVWusFtCKMEWOw4b26kWfjbcyDmQHi0bqZU4NuXbr1pbq-NMYZh~1TNe9R3aD1RsHa0a6ENnMF6PTfg__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)Sensitive Fields in a TrustedForm Certificate

To protect the value of a field flag it as sensitive using the below attribute:

`data-tf-sensitive=""true""`

Example: Sensitive field

`<input type=""text"" name=""ssn"" data-tf-sensitive=""true"" />`

_Note: Checkboxes and widgets such as date-pickers will have their value protected but will still show visual indication of what the consumer clicked. To hide this completely please flag their parent element as sensitive._

## Flagging Content as Sensitive Data

By default, all content on the page is captured as part of the session replay. If you wish to hide more than the field value you may use the `data-tf-sensitive=""true""` attribute on a content tag(e.g. div, img, p, span) to obscure that tag and all of its child elements. The content will be replaced by a placeholder that indicates it has been hidden by you.

![](https://content2.bloomfire.com/thumbnails/contents/003/597/202/original.png?f=1676399203&Expires=1748567794&Signature=CxvB20CKqWjePaSGka7adPqAe9ZBNh74yAk9k0AVEYNReBTDSxLlryhcrBqJ8w92Q4ytILbd4kQSbaKQIBG2uisIexYmeZF~my42bhqXFNAz2B8UbDUyhnB~BUepYg~tA7Bi~Bzs1kJkDMLbJreDLpU77sGIpgoR-DZPuguNAwcLMUhXiHCN2BwMRTcU27bbGZVPt8NuKxZIRqkPLsuKIl6Zn-dEQIoStpgoVFZg7Y8~Ew-PW0jIEEmTtwfgG-uxrcIH3nRVkA81bKrk2mg4sa5Nx9xBdJTlzW~swecNtRpBDYdb3liWgB6lledCKe-S4W~pvDmAO-bt51oUiJjd~g__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)Sensitive Content in a TrustedForm Certificate

Example: Sensitive image

`<img src=""graphic.jpg"" data-tf-sensitive=""true"" />`

Example: Sensitive div containing a checkbox

`<div data-tf-sensitive=""true"">`

`  <input type=""checkbox"" />`

`</div>`

## Treating All Fields as Sensitive Data

TrustedForm also supports the ability to treat all fields as sensitive data. When this option is selected, you can flag individual fields that you don't want to be treated as sensitive.

In order to switch to this option, toggle the **invertFieldSensitivity** variable in the TrustedForm Certify Web SDK to true.

When the **invertFieldSensitivity** variable toggle is enabled, you must explicitly mark fields you want the TrustedForm Certify to capture:

`<input type=""text"" name=""phone"" data-tf-sensitive=""false"" />`

_Note: This only applies to standard input tags. Other elements you use to collect user input will not be treated as sensitive._

Type something"

