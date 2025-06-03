---
URL: https://community.activeprospect.com/posts/5189112-implementing-trustedform-on-123formbuilders?_gl=1*yvtfuy*_ga*NjUzMTIyNjYwLjE2ODk3ODYwNTc.*_ga_QHXBV6N7D1*MTY5NzEzNDE2My45LjEuMTY5NzEzNjMxNS41MS4wLjA.
Page Title: Implementing TrustedForm on 123FormBuilders
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-58d93780-0fa3-47c0-bc4e-dbeacb90ce0e.png
Scraped At: 2025-05-30 00:17:05.853
tags:
  - trustedform
  - intermediate
  - how-to
  - compliance
  - developer-focused
  - technical
  - universal
secondary_tags:
  - admin-focused
  - beginner
  - advanced
  - data-management
---

[![](https://content2.bloomfire.com/avatars/users/1966401/thumb/thumbnail.png?f=1692038964&Expires=1748567763&Signature=pqYVymhuFdxVd6qV1whgGIc~5VUmkQClQB0gVaidLLHR7FiCV3zeOUp3sV5APOD93naAYyOUIKCuGuDEEPCjVMCg30BizJsLcwYx-VI9lQrGwsE0SkcaMKVEUcu~~sg-KQnDqgE-7K6~6eVuE7DNnsYoVw0ZhkCOAjrggazFG2eVeD4FkZszgbl89MoxkCdWYz35sEgOIswza3Asryq--lnv9Vt1ukMH8RyvIYUlWKLrp0z0vE9jIYB8M32UEJtfSPXP2aJN0mE11nqO0De0D6LTHPxy~KXdZUwzDGB4WDXfeh5hEwUYofPRigSUjHiyqZk4U77dLlMglDl2oAOtkw__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/9624817-ayesha-akhtar)

[_Ayesha Akhtar_](https://community.activeprospect.com/memberships/9624817-ayesha-akhtar)

Updated February 21, 2024. Published October 12, 2023.

Details

# Implementing TrustedForm on 123FormBuilders

How to add TrustedForm to a 123FormBuilders form.

Begin by logging into your FormBuilders account.

Select the form you want to use with TrustedForm by clicking edit or create a new form:

![](https://content2.bloomfire.com/thumbnails/contents/003/923/768/original.png?f=1697076499&Expires=1748567816&Signature=mgQmybwg0-jJ7BZONT7HK4USKvhwO3h93SXO05c8WXW4wrzX5jI-zaHrCIPVOl3mK0je4YYD9NSC7KKham3guK49KjhXTK3GNcE6MeOrDOnIdihq0CQshx9PW-KXNICExUMx6Z~55uZEW8dTF4s8-1eP-iGLZEp8GDxafnxdd8n2Ixuvt99Eho6E55Qr07ABYGr-JRNNvPEf4EyKbk0OlWwqQclwwA712hP6Jn8BQjYBiNiR~bjphp7KwmOjWGGtbCympztoOMPd9YwFam2HHa45hpql8AlwPHj8oUSU1gROQm2FlwGbVl9IvjVF9tPNVd7D8WyxeaQNGq8kNnmqsg__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

Click on the 'Set up' tab:

![](https://content2.bloomfire.com/thumbnails/contents/003/923/769/original.png?f=1697076862&Expires=1748567816&Signature=mRO0mI8QOKUarG6t0~zOuxFaAdEQyddrFkw--EnSYRYAnZ8LNdK1gl1Nm8~yPkOvfa5AC7pRZgBCVBhRB5fhrLX6ebXhmebfyF2JK4Kkdj-9H6-k1qsLB2cADjn74RZe7xO-bwe35oZ3ihOf2bBIR~ZnGuBfKPumekeIPtuf0ihfwqokelKzr3h5~NJmnZTRPcvYrHSO6N7Ve2IOv8bso8toprfVduesuF2USHKyOjwEqEJ481kYgtQ1zi88oMZVHY2UCb7uLWLXT5zqYnWrpuv6c6WmmwZ9BCV9l9koXRBcq8HsNfqFaZcYnEIVWBW9Rgfs4Nm-lYV-l8UIONmfQg__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

Then click on 'Advanced' on the left side bar:

![](https://content3.bloomfire.com/thumbnails/contents/003/923/778/original.png?f=1697077120&Expires=1748567816&Signature=QNOYypcwsYAd4yx8KTtkMa3dW-5u8Sjgw6hLTyXr3pGBIIq4dnTQR5p8nBA3ujflnAqNcoAIMiGZA2ktXI1Df0mY8cj-tYc9bGhEszwtbXoSZPGNKuT3NQbZPebILAq-CKa8-rkn5qo9GtA6sfx1o0l-lpnX3IGzGBguW8d5zYVY-k2OkEgRmsg1BGTpetWHIoIaVJznJJTyBEhwosB6WAD~dyuxe-sxg7E5RFRRFUERWGn3DXR8wnJw5YeUm8pcEZqVWxBVBqaCvzAfJNGu-~0KUcSdQ2LsRg~t898rHWI5r3XDq0NDDBR74guN3DJEWHB5NhDBq9~U9I58d1qB3A__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

Then click on the 'Form' tab. Then select 'Add a JS script to your form'.

Here we will be entering the URL of a .js file which holds the TrustedForm script.

To do that, first create a JS file that holds our TrustedForm script, then upload the JS file on a trusted web server or your own and use the URL where the file is located (e.g. https://mydomain.com/my-javascript.js). There are web services that host JavaScript files for you, but they represent certain risks, such as data corruption or service retirement. That’s the reason why it is best to host them on a web service where you have administrative access.

Once you have entered the URL of the JS file, click on 'Save', as follows:

![](https://content3.bloomfire.com/thumbnails/contents/003/923/784/original.png?f=1697077679&Expires=1748567816&Signature=PA1qs9AAYrzwEPf9golfWZL3k-3g2GequM-rAsCZwoRaP2M9ZmxbPItRYCnerdQ2qlf~gL8ALtwHjIjH~AhuSt3GmmnyFjNwdhCHyMeE~QY6MxTdhUau8JHUa9SpJ4pZeiEJ8Ca5~C~ZPoHrZvcsdOdO2D3v8RE-41UW3~KTRDWtM2mTMtASXESVXBByzDVpOfI01X3QRG77k42ni-hKf57fmPQTKEKKabKl5q3gsum-uT~SwWOwZTm398O9P2-CxN2rejpKS6QrvtzWrIbn-qETsRTEmSzkw9OxLR0LTFb4qsueDhAw-RCloevEo5iXu3UULtGrLxbCX~uwXD56hQ__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

That's it! Now you should be able to publish and test the form, and the certificates should be created successfully.

Type something"

