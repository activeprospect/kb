---
URL: https://community.activeprospect.com/posts/5474059-how-do-i-add-trustedform-consent-tags-when-using-tiles-instead-of-checkboxes-to
Page Title: How do I add TrustedForm Consent Tags when using tiles instead of checkboxes to obtain one-to-one consent?
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-6a7e161f-3df0-4a95-80b1-867ef6281438.png
Scraped At: 2025-05-30 00:16:59.589
tags:
  - buyer-focused
  - intermediate
  - trustedform
  - compliance
  - data-management
  - universal
  - operation
secondary_tags:
  - developer-focused
  - how-to
  - reference
  - technical
---

[![](https://content2.bloomfire.com/avatars/users/1405246/thumb/thumbnail.png?f=1620827893&Expires=1748567763&Signature=alHhfFQV-UMWuFs15-bPc7qgqqz9Y1Ab4IgozHpxQiAhUo5QAAfSvWdRMIbB-MjATp6xhtpy160bLJAeVRgeskGV6MRnGOAwxIiDv1NLbxQpjUuDhS5Vt-l~KwdeeAMZgfCDN4LcKieNhNH4RbxIi6u1G~0SyfSGnkzJqf3njztU2IzGkJDjQsMkzypIQ59gvF-EaavxIbiQesisFxK7Q~j3ndfecobcl-VICoo2k3tgVlDxWQqPmwd0v9jDcjRFdgts8tflhT-tEdM39EcA7SqgmO-mxBW3tKWEPOlqpW0hGRQtnYW4LysnPUkvFwr4sktBEmx8QIq7B~E2z5EwjQ__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7846678-christopher-williams)

[_Christopher Williams_](https://community.activeprospect.com/memberships/7846678-christopher-williams)

Updated January 13, 2025. Published September 15, 2024.

Details

# How do I add TrustedForm Consent Tags when using tiles instead of checkboxes to obtain one-to-one consent?

When [adding TrustedForm consent tags](https://developers.activeprospect.com/docs/trustedform/consent-tagging/) you are instructed to add a tag to the checkbox used to allow consumers to select which advertisers they consent to be contacted by. This may seem confusing because some forms visually use selectable tiles instead of checkboxes to get the consumer's input. In these cases, you are still required to maintain a checkbox that represents the consumer's selection in order to add consent tags appropriately. If you do not want to display the checkbox to the consumer, hide it's parent element from view. This allows TrustedForm Certify to document it while maintaining the desired experience for consumers. Ensure that the checkbox accurately represents the consumer's selection to avoid potential disruption or loss of service.

See the below code snippet for inspiration of how to use tiles using checkboxes in your form.

​x

31

1

```
<style>
```

2

```
  .tile label {
```

3

```
    width:100px;
```

4

```
    display:flex;
```

5

```
    align-items:center;
```

6

```
    justify-content:center;
```

7

```
    height:100px;
```

8

```
    border:2px solid #ddd;
```

9

```
    text-align:center;
```

10

```
  }
```

11

```
​
```

12

```
  .tile div:has(input:checked) + label {
```

13

```
    border:2px solid #0d0df1;
```

14

```
  }
```

15

```
</style>
```

16

```
​
```

17

```
<div>Please select the advertisers you would like to hear from:</div>
```

18

```
  <div style=""display:flex;gap:20px;"">
```

19

```
    <div class=""tile"">
```

20

```
      <div style=""display:none""><input data-tf-element-role=""consent-opted-advertiser-input-1"" type=""checkbox"" id=""advertiser1""></div>
```

21

```
      <label for=""advertiser1"">
```

22

```
        <div data-tf-element-role=""consent-opted-advertiser-name-1"">Advertiser 1</div>
```

23

```
      </label>
```

24

```
    </div>
```

25

```
    <div class=""tile"">
```

26

```
      <div style=""display:none""><input data-tf-element-role=""consent-opted-advertiser-input-2"" type=""checkbox"" id=""advertiser2""></div>
```

27

```
      <label for=""advertiser2"">
```

28

```
        <div data-tf-element-role=""consent-opted-advertiser-name-2"">Advertiser 2</div>
```

29

```
      </label>
```

30

```
    </div>
```

31

```
  </div>
```

![](https://content2.bloomfire.com/thumbnails/contents/004/486/173/original.png?f=1726503668&Expires=1748567811&Signature=lgi3S0bOFgpUjSrYAjq2r7VQobesOVje7XPSLyPL0OjRScInMEBAoqZAqfbK3Mq0RoOZ~~OOUWkv4WtXKTare1y4pb8vGia4iIuQ~FmMofEkASp46SDbqH3Xz-KAZEX4ELR~GAJzHN-n5Vp8jcUrFtyeuk0ZOertlDpW0YM02WT59gvrXQmplsMI1JOLeSEJP2UMjVBFSp3bj1cLSpLKCq8s-CraNikLgcg73RQhucJqc4rFOd65LFETonGmciH5X0Hc4aQ752LsfJZ4anI3EX1v1oMGc-qhDJ7rGeH6PVJCQrkseOnOENfoXiiK1vVnoHJvc7gXhTZfGQdmQmGo5A__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

Type something"

