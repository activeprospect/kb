---
URL: https://community.activeprospect.com/posts/5474057-how-do-i-add-trustedform-consent-tags-when-using-logos-images-instead-of-text-t
Page Title: How do I add TrustedForm Consent Tags when using logos/images instead of text to obtain one-to-one consent?
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-d3fb8385-376a-4489-ada9-339729eac505.png
Scraped At: 2025-05-30 00:17:07.290
tags:
  - buyer-focused
  - intermediate
  - trustedform
  - compliance
  - data-management
  - universal
  - operation
secondary_tags:
  - how-to
---

[![](https://content2.bloomfire.com/avatars/users/1405246/thumb/thumbnail.png?f=1620827893&Expires=1748567774&Signature=WTTOqztRC7U-S55SOSIf9P3hqE6TNryUy3kqOV4rwBHGDb0Ckl8tieyFbTt9JkDhY5eT2-0nExUlIdUHmcbo~MLaS3OfaLy640OprXvFuAj8jiiiAKvuaNvNO~5TB5YvqgdhNVMxIEoumXqj0k4QPs~MzWZsTWVsufLlvfbmqiCJodrggo81OdQLyzMKVl3rcVUyhjdXKypx89V831oePVWQhGNETN6RZ96OOquiqMR7h2lXD4s7wxNUu2TgO8TUVHu65sI0F~1cswXJqCN9PzSusja9hm7~xyvDe~RncAW3QgSB9IO809B0dAFmhhUJzh-2tQ65jH3MfYLjgzSrzA__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7846678-christopher-williams)

[_Christopher Williams_](https://community.activeprospect.com/memberships/7846678-christopher-williams)

Updated January 10, 2025. Published September 15, 2024.

Details

# How do I add TrustedForm Consent Tags when using logos/images instead of text to obtain one-to-one consent?

When [adding TrustedForm consent tags](https://developers.activeprospect.com/docs/trustedform/consent-tagging/) you are instructed to add a tag to the text identifying the advertiser being granted consent to contact. This may seem confusing because some forms use the advertiser's logo or an image to show the consumer who may contact them. However, you must still include text that contains the advertiser's name as shown to the consumer to properly add consent tags. If you prefer not to display this text to the consumer, you can hide it's parent element it from view. This allows TrustedForm Certify to document it while maintaining the desired experience for consumers. Ensure that the text accurately represents the advertiser name shown in the image or logo to avoid potential disruption or loss of service.

See the below example for inspiration of how to add this to your form.

​x

11

1

```
<div>Please select the advertisers you would like to hear from:</div>
```

2

```
<label style=""display:flex;align-items:center;"">
```

3

```
  <input type=""checkbox"" data-tf-element-role=""consent-opted-advertiser-input-1"">
```

4

```
  <img src=""https://spaclysprokets.com/logo.png"">
```

5

```
  <div style=""display:none""><span data-tf-element-role=""consent-opted-advertiser-name-1"">Spacely Sprockets</span></div>
```

6

```
</label>
```

7

```
<label style=""display:flex;align-items:center;"">
```

8

```
  <input type=""checkbox"" data-tf-element-role=""consent-opted-advertiser-input-2"">
```

9

```
  <img src=""https://cogswellcogs.com/logo.png"">
```

10

```
  <div style=""display:none""><span data-tf-element-role=""consent-opted-advertiser-name-2"" style=""display:none"">Cogswell Cogs</span></div>
```

11

```
</label>
```

![](https://content0.bloomfire.com/thumbnails/contents/004/486/117/original.png?f=1726502313&Expires=1748567811&Signature=Ws-AQLtAkfNSQILqEWy1O2JyaNpQgjlSvwGs~8znMUe2fyLzh6m82rgApfk5fesjY7hvC5kD2~mYbnd3-7XZhekfBRz7Hvbp1Si~Pvaq8X-KDpgTxTiGy0txKqJY25gVL5E2-OrmM6rD1pNrXlUN6ueeDU4y7Jq-SdACTUJFrMlgQAC7JXLMkh09b~xyz0TktPKDOOesifVv49E4Dd9ohZxxXrs~POsSBma4TFGZVRnnpxq8KDYP0rryu52n-PL8BhaypOkzUV-DNei~240pBCdtZx8slzQ3jmO~26N3KqNxkD5yvdaRGR7INk7EmlkXAHx2uvV3V4CRWjJ8X8jHcw__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

Type something"

