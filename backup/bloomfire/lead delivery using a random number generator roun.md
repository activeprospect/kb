---
URL: https://community.activeprospect.com/posts/4063600-lead-delivery-using-a-random-number-generator-round-robin
Page Title: Lead Delivery using a Random Number Generator (Round Robin)
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-554805ed-726a-4be4-af71-0eeddebfd85c.png
Scraped At: 2025-05-30 00:15:59.132
tags:
  - seller-focused
  - intermediate
  - flows
  - universal
  - operation
  - non-technical
secondary_tags:
  - business-logic
  - leadconduit
  - beginner
  - intermediate
  - how-to
---

[![](https://content2.bloomfire.com/avatars/users/1316948/thumb/thumbnail.png?f=1606147181&Expires=1748567752&Signature=PxYYkph4QSnYszReL38LPd679Jq8Ty5tH7QdOK6mc5A1OnxTDwYOgy~MImHpTkNN9MTR0pqxL5U5dfzwPsFKMMfKsmOkEZN4CIb1QxjTTGTcE-BvzZqcAbtMC5FDRk9LKgWiXXtoqgVq5tIPseDmlz3YqCMcOs1anTjSsxlQX1PPii8EpF-oUwzJQUJhmcFJ8s~tv3Z3J6u2y~yZTw0uGQU8IUuNhqxaqn7k4PuCSk84lfxFrOAzFvQxn0bcMGJIWu06KQMG~ap7zMSB7Tue21kxoxHnYFv~g3VnZVyOcUwKZzON~f86o4y2V8DoSUaP-cIzZqG7HZ7Ahv-AZyr9Eg__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7557576-caitie-clarke)

[_Caitie Clarke_](https://community.activeprospect.com/memberships/7557576-caitie-clarke)

Updated November 3, 2020. Published November 3, 2020.

Details

# Lead Delivery using a Random Number Generator (Round Robin)

# Use Case

You want to bucket leads into two or more groups and deliver them according to various endpoints depending on what bucket the lead ends up in. This is a common workaround in LeadConduit for Round Robin and A/B split testing scenarios.

# Solution

LeadConduit appends a randomly generated number between 1 and 100 to every lead. This random number can be used for a variety of use cases, including this one.

Here you can make use of the Random Number to set **Step Criteria** on your various delivery steps to bucket the leads based on ranges of the randomly generated number.

![](https://content0.bloomfire.com/thumbnails/contents/002/305/466/original.png?f=1604429846&Expires=1748567752&Signature=dhcBpPjeVCPP3qXB255JRIAiKWsskR~r6dDGNgEobYs~ATGPVRInNVn4kNPddTuzEyWEooyjXYWaoV3lm7hReAgZiVTrie19yH8B9tKHOEz9I3u0emNaWPCtnJMiTaohisPnuZksfUHdpkqWoh14aPFmgn6SMNF9VUno0-KTf1GWpuKQXo9zA6jpSOMWJXDiSg-OnMs~hvxSWR3MdYKsTkppX3uCzW6oXF3nqZFTdPYiSYniY1GGpTmwkvsgdNtULQjXmDh7Qh8ba7~o8RMSAkKfOnanyK15aMSfxK2xNKybwaBllZ4pftBRZCe98H9JVVRyOOwPbP0JMa4nFqNIKg__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

For example, for a 50/50 split, you could set the Step Criteria of the two deliveries as Less Than or Equal To 50 and Greater than 50.

![](https://content1.bloomfire.com/thumbnails/contents/002/305/468/original.png?f=1604429875&Expires=1748567752&Signature=BF36mptU4DiYu7AFdaIcn6VCfZgd6Y9jHvTm5u~ShUPhUolGJ6c04BGKQMhMpWq7hgrM8pvyKPV3ptpXMKRX-QYfpcu-CWIzodMd2OpY8VnVzU6sv3rXxg9GCGG~fbtuCf2oYIdV3Hml~8wGUK2CnDhvV-v96yH8DmwKPY1ZcSro9yOjJ1mU4X9-d2FuFRNKLx1y2U6jQMSIlT9xMGgHENyAeYwZ03ixLHNe1bxbVwCELSqCbXvXEHF6KKBlSALVvXxfAIKnhAF9qgqGHtjt9dW8cje-xDWMZ6TV~0D4ncfN8MwtUSjOEz7aMt6K9OFNYVwDxWjpTkiwRr9vjXH6Dw__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

**NOTE:** This approach isn't a strict 50/50 binary split, as it is possible for any number of leads to be delivered to the first delivery endpoint in succession before a delivery to the second endpoint. However, you'll find over a given timeframe with enough lead volume, deliveries will even out very close to a 50/50 split, and for many clients, this is sufficient for their needs.

Type something"

