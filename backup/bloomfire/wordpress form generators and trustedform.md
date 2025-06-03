---
URL: https://community.activeprospect.com/series/4720459/posts/4062119-wordpress-form-generators-and-trustedform
Page Title: WordPress Form Generators and TrustedForm
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-201ac2fc-4102-4f98-96cc-d3785e288f05.png
Scraped At: 2025-05-30 00:16:52.759
tags:
  - trustedform
  - intermediate
  - compliance
  - developer-focused
  - technical
  - how-to
  - data-management
secondary_tags:
  - seller-focused
  - operation
  - integrations
  - semi-technical
---

[previous page](https://community.activeprospect.com/series/4720459/posts/5189112-implementing-trustedform-on-123formbuilders) 4 of 8 [next page](https://community.activeprospect.com/series/4720459/posts/4067743-activeprospect-compatible-landing-pages-form-builders-and-chat-platforms)

In Series: [Implementing TrustedForm Certify on third party form builders](https://community.activeprospect.com/series/4720459-implementing-trustedform-certify-on-third-party-form-builders)

[![](https://content2.bloomfire.com/avatars/users/1405246/thumb/thumbnail.png?f=1620827893&Expires=1748567782&Signature=p0pT1~1wcR-gU81DO8z6IZiv7o~WLLN~4VM~imVO9S8k93mWAt02SeJ40QznEe5d6Ai9pIg8F7Cj-Cf-PtYsqGGz9kltuFc9PZW5VIZ5usj62ZjwCDxc0sQE~eGKLaHogaFAIo7y0O92bwwb5j0-aXxdN97HXq71EOHRsgOAXa6y-lLup33TTtsLcWa75mamconkz6MIiu8qQIGq5CW6tgTvHu~RjCUSCq8hX9ygzZnaI2RrR~mRdiMyTznqQm0hKZieqZCsJGMGmmp1qq4fJZ9j0dA4csGdNfoR5Lu2Ug16n93fzXNCHyzB5kaRl6cbgmNM~5ii9HlDqH8LUVaAlw__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7846678-christopher-williams)

[_Christopher Williams_](https://community.activeprospect.com/memberships/7846678-christopher-williams)

Updated November 30, 2020. Published November 2, 2020.

Details

# WordPress Form Generators and TrustedForm

There are probably a thousand WordPress form generators out there, with old ones disappearing and new ones appearing faster than anyone can keep track. Some of them deal with script-inserted fields gracefully, and some do not.

# Adding the TrustedForm Script to Your Form Page

Our customers have some success by placing the TrustedForm script either in the same place allotted in WordPress for Google's SEO tool, and also some success placing it using the WordPress Headers and Footers Scripts tool.

These screen shots illustrate where to find those options in your WordPress dashboard.

WordPress for Google's SEO tool:

![](https://content2.bloomfire.com/thumbnails/contents/002/303/032/original.png?f=1604351388&Expires=1748567804&Signature=hD21efU1hfVxSvJhZ-NcrrRHHtEwDY8OpmTiS32bT5PH0r-gYigT~S7ZCHk1eDGRkqoDRz4XS-eXU9LXJE0fIfq40ZutYiK7AeReRQItQ8XoXy4n83LlgUeJ6BOib6HKJcUzzEF4yf39Npk3Mo98upjQ-B55pBa-~rgnMXS58hZbp~-n10QTYi3RU-4rKsoszOtgoD~Vj~FUm~Qhn1PJgVvVGv-mWqymTx-yFynaN4WJJEs0h0W05qYmVTYAlhUXO7XMLi7BVnK7FZpZAkOr-dhLHImg4QEiBxBvq9V0q-pLM5EL0P4GmQYYMjR4WUBr6-8dIJCip4a0fGKMlif18Q__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

WordPress Headers and Footers Scripts tool:

![](https://content0.bloomfire.com/thumbnails/contents/002/303/042/original.png?f=1604351417&Expires=1748567804&Signature=NdGsqjm0XdArZiUQLvqZ5bcKmIFTVzJFLC4Kl1kwhn6KseHWHilYz7DRCUAfK0qxLoklymLS5icCyx9UZPnXTDcaZybmk-fJB0-63duKdT5ClldVPG5IM1Jsd~PBW4uncwv2Mqw7lDXwA0gkcNO~cN0SEAPC-U4XoJC23v-~gVhFD4TFrbHiuut1C45rTVjQR6qi9tYrIuhZxxi6yJnM8pYhiD95JH71OH6qx7jQlIre9T4ifrJDsK0QKxdXE44yrhBPCEXjkm1y25iG7UDo3Arn5cyrZvWFbFrPkBK~idDvh3RGQqCQPmCPnEc~gMKlZ3lb~XfIqWhzE1WMLIqC-A__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

# Don't Include a TrustedForm Field in Your Form

You should not, in general, create a TrustedForm hidden field in your form using your form generator. The TrustedForm script will add the necessary hidden field to the form in the user's browser memory at run time. Any same-named field already in place could interfere with that process.

# Checking Whether the Script Is Working

You can check a loaded form page for the presence of a populated hidden field named ""xxTrustedFormCertUrl\_0"" in the browser's page DOM by using the browser's ""inspect"" feature. (It will not be visible in the ""view page source"" feature because it exists only in memory, not in the source code.)

# Capturing and Submitting the TrustedForm Certificate URL field

There's still no guarantee that the field added by the TrustedForm script will be processed and submitted. That depends on how any scripts that are products of the form generator interact with the form.

Type something"

