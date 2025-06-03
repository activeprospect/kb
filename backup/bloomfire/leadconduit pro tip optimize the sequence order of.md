---
URL: https://community.activeprospect.com/series/4583478/posts/4583626-leadconduit-pro-tip-optimize-the-sequence-order-of-alternative-prices-volume-ca
Page Title: LeadConduit Pro Tip: Optimize the Sequence Order of Alternative Prices, Volume Caps, and Mappings
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-395d7191-88ef-4037-9f77-df956dd74938.png
Scraped At: 2025-05-30 00:16:23.283
tags:
  - seller-focused
  - best-practices
  - advanced
  - leadconduit
  - data-management
  - business-logic
  - optimization
secondary_tags:
  - universal
  - seller-focused
  - buyer-focused
  - intermediate
  - reference
---

[previous page](https://community.activeprospect.com/series/4583478/posts/4583514-leadconduit-pro-tip-an-easier-way-to-work-with-lists-of-values-in-rules) 3 of 4 [next page](https://community.activeprospect.com/series/4583478/posts/5034662-step-by-step-add-a-new-vendor-or-lead-source-to-your-flow)

In Series: [LeadConduit Pro Tips](https://community.activeprospect.com/series/4583478-leadconduit-pro-tips)

[![](https://content1.bloomfire.com/avatars/users/1317000/thumb/thumbnail.png?f=1617311121&Expires=1748567752&Signature=X9fj59kSmWD-4zTnYmepc5gKRqn2PVncexDVa9LApbv-iop7C63UHcLx-fmxxAoLfRrlGiNk-rg7X~UUep8r-a8vX6Tk1P1Bra5LYbgpGLC9HWJBpqE5XIPK4BasUHX4ECchDubxZawERW9evx5dHSjZn1wkV9E9~XY8T4kDPRHDwRQn~DCD7Juh~~yOnadsDl-CUOcQZiZBOlTYMLytIDjBPLpNmADr0avpxQbIwEmHzOpMn~QvpKFhZkCn29EcInQ9YaKnmkoXBT-FopoN74PSKZuhnhN8-uhwLbtvlUlJv~uQYG8ise8NP2nQS~BfpVJiWF1xeERmGTQWG1GzSg__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7557680-scott-mckee)

[_Scott McKee_](https://community.activeprospect.com/memberships/7557680-scott-mckee)

Updated January 19, 2022. Published January 19, 2022.

Details

# LeadConduit Pro Tip: Optimize the Sequence Order of Alternative Prices, Volume Caps, and Mappings

Sequence order matters when you're creating rules that choose between between multiple prices, volume caps, or mappings. You'll save setup time and your flow will be easier to understand if you put the options with the least-restrictive rules at the top and work down to those with the most restrictive rules at the bottom.

Here’s an example using Source price. We put the default price, with no rules, at the top. Next is a price rule that applies to leads from certain states, and below that is the price for leads received over the weekend.

![](https://content2.bloomfire.com/thumbnails/contents/003/050/679/original.png?f=1642617235&Expires=1748567774&Signature=WR-qTnd93-JuaCCKy-~AxsJ9QHliNrExw~7~g5vAW0HJNZ26-9gM12inWUcrsMynJ4XxIGhIYW6wIltELZdMTw8~GuDFsA1ZEW6wsO4omnVfGDFoDEZHhgC5j-tiFJTW3cxicmGasv2bd-w2H0548mc2xD8Smjxw03hiWI6iC2-RZHfbaPn2aKjhb-ZuxQSZL6pFchBctjXpwfUjRYkTxIq7Qpd3XdmB1Hi1Igqti39dRZHF~obl9TViMQ1aJEY4Vz4QXhzQAh1HAhx7zZZ6LRXZ-Ukx80N0RvPgHbgFJ34mRjFAIl-R3B1Q3YIgyFZdwZXX2YRzFPM66es~EJieMQ__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

Here’s how it might look if we hadn’t paid attention to the sequence. Note that this requires more rules, which wastes time and is confusing to read.

![](https://content3.bloomfire.com/thumbnails/contents/003/050/682/original.png?f=1642617587&Expires=1748567774&Signature=ijvlJFw7iIF3mzCzekqiStN3JSDcExI4ATDU77HyLjILL3Oki97UlnK7Jt4TQoGQOHqqKsSGUzTV9HboHf2yY9aFYzyLjpTnbuBRIYY7HwLwKqUNiecvmWVxnUMAmgHJBgZ6lnjKidFlfvFrIpDK9EVqnSfhyRRA-nFZ2uEVsPwOTrNslYFmpMiXvX1dEEE~LwAbhNlHcn3FY4JgC7u1vTBSz-wWZglf-0WfEW1lmaz1VwPHulvRW6k0MvrsIg4n7rV2D0OkwEdNSnnoGOHaMHboVkOi74IywhhMH9w1T~XRp5rW4HadoUFYDf1vBW2ga7qiRwP5AtTaV-1XMTZKSg__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

Type something"

