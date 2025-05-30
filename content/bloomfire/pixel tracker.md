---
URL: https://community.activeprospect.com/posts/4125183-pixel-tracker
Page Title: Pixel Tracker
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-cba2fa6c-a638-4dde-bf58-d1b2d1d3f2dd.png
Scraped At: 2025-05-30 00:15:59.051
---

[![](https://content1.bloomfire.com/avatars/users/1317000/thumb/thumbnail.png?f=1617311121&Expires=1748567752&Signature=X9fj59kSmWD-4zTnYmepc5gKRqn2PVncexDVa9LApbv-iop7C63UHcLx-fmxxAoLfRrlGiNk-rg7X~UUep8r-a8vX6Tk1P1Bra5LYbgpGLC9HWJBpqE5XIPK4BasUHX4ECchDubxZawERW9evx5dHSjZn1wkV9E9~XY8T4kDPRHDwRQn~DCD7Juh~~yOnadsDl-CUOcQZiZBOlTYMLytIDjBPLpNmADr0avpxQbIwEmHzOpMn~QvpKFhZkCn29EcInQ9YaKnmkoXBT-FopoN74PSKZuhnhN8-uhwLbtvlUlJv~uQYG8ise8NP2nQS~BfpVJiWF1xeERmGTQWG1GzSg__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7557680-scott-mckee)

[_Scott McKee_](https://community.activeprospect.com/memberships/7557680-scott-mckee)

Updated January 8, 2021. Published January 8, 2021.

Details

# Pixel Tracker

Sometimes you'll need to fire a web beacon (also commonly known as a tracking pixel) for a third-party service (e.g. Google Analytics, HasOffers). You can use LeadConduit's built-in Pixel Tracker integration to call the service.

In the **Steps** section of the Flow editor, choose **Add Recipient** and select the **Pixel Tracker** integration from the options.

![](https://content2.bloomfire.com/thumbnails/contents/002/452/582/original.png?f=1610138070&Expires=1748567753&Signature=cdTZPEF8lnuPzAzHgTUZT8HbBLE6OaV9JK8luKx5s~ddu941pJvBY9vxOurFJ-I25N~Q5Z5cvth5xOr8p0VeFSNxVLGzs5ewXClzFY-nlzOJdJ7lLmbKyIvtCWd7d6jOyd22Dqp8965J5h8U2ao-XQ0JTpOy15C4qhQ-VrL7qD5lH9SrYMPLkHrI2wb~xPqZDWQCwPnx73Ur3~okHzUd~V21-kNsDxgzjDGagmQzDkm2xTgkiZxgfM37rVRQvLDa1TSL7yyAhBaDNwofThHe4kR0qDkLdJIy9OnqK~MRRMHl3yxOOqaMQnG-D6ldMueEKoPl6gqUtixhwDSx2u94RA__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

Once the Pixel Tracker is added to your flow you need to add the URL of the web beacon you want to call with the appropriate parameters.

Let's say you want to call **Google Analytics Tracking Pixel** and use the **LeadConduit Lead ID** as the unique identifier.

Here are the base URL and Parameters we'll use as a reference point:

**Base URL:**

[http://www.google-analytics.com/collect](http://www.google-analytics.com/collect)

**Parameters:**

- v=1
- tid=UA-XXXXXXX-YY
- cid= **LEAD-ID-GOES-HERE**
- t=event

You click on **Edit Field Mappings** button for the Pixel Tracker step, then copy + paste your URL into the URL field.

Next, add a few lines and map the Name+Value pairs as shown below:

![](https://content0.bloomfire.com/thumbnails/contents/002/452/583/original.png?f=1610138096&Expires=1748567753&Signature=gCOLR7yMsNZgbaZdtiM6G-MsQRa35El45VkSNZR85tpfRRxLhHuWJJhAq50Xpwv8cT7E1oAmFmM6WHDls1uM4UHuH8TeLe5E-apiHxrp8sDqS8qWJgf8UFUMImaFQsFrnW76xjWmCANe0Sweo8rBu7ZYF~B-0bhNkgW1sBBiLongupr18sCPDXnFbj8lKFvSOnxuQDNmt~YdtX6ZT~1rw7ytbxc9OG-CUucgdU3~sCCRb3aX-ErorVjBxRKOw5EDAgxs6Cs2T9flC2YMWbrL7C2zPJBK6DosfRHVx5qPKjy1Cr49tjgW2zy2X5TZV00A9vEPrl29C3roQ~-ndFc9qQ__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

Then click Ok and Save your flow. You're good to go!

Type something"

