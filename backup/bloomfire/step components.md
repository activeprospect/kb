---
URL: https://community.activeprospect.com/posts/4123734-step-components
Page Title: Step Components
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-00373f33-8a54-4955-a82f-7787b09d829c.png
Scraped At: 2025-05-30 00:15:58.631
tags:
  - seller-focused
  - intermediate
  - flows
  - business-logic
  - data-management
  - how-to
  - conceptual
secondary_tags:
  - operation
  - semi-technical
  - developer-focused
  - beginner
  - troubleshooting
---

[![](https://content1.bloomfire.com/avatars/users/1317000/thumb/thumbnail.png?f=1617311121&Expires=1748567752&Signature=X9fj59kSmWD-4zTnYmepc5gKRqn2PVncexDVa9LApbv-iop7C63UHcLx-fmxxAoLfRrlGiNk-rg7X~UUep8r-a8vX6Tk1P1Bra5LYbgpGLC9HWJBpqE5XIPK4BasUHX4ECchDubxZawERW9evx5dHSjZn1wkV9E9~XY8T4kDPRHDwRQn~DCD7Juh~~yOnadsDl-CUOcQZiZBOlTYMLytIDjBPLpNmADr0avpxQbIwEmHzOpMn~QvpKFhZkCn29EcInQ9YaKnmkoXBT-FopoN74PSKZuhnhN8-uhwLbtvlUlJv~uQYG8ise8NP2nQS~BfpVJiWF1xeERmGTQWG1GzSg__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7557680-scott-mckee)

[_Scott McKee_](https://community.activeprospect.com/memberships/7557680-scott-mckee)

Updated January 7, 2021. Published January 7, 2021.

Details

# Step Components

Steps have a variety of options, depending on what kind of step they are.

# Rules

Only Filters can have rules. Rules define the requirements wherein you want to stop a lead from processing further. This can be as basic as ""Stop when the previous step failed"".

In this example, the filter will stop the lead flow if the outcome of the My Personal CRM step is anything other than Success (Errors, Failures, and Skips will all stop the flow).

![](https://content3.bloomfire.com/thumbnails/contents/002/449/190/original.png?f=1610032850&Expires=1748567752&Signature=MZ4CGJOMiMClKzeKjD0mTRDUoUgRmjA~Cou3G7boH6LeuWc4WAZXapsIUYxOtmeyCTn0duOkgrGLN1YTyzrL57Qlvgz6fFlq2B-LieBpA4Bd~Y15444ig6RyLYLkiWdV0mDdfHilzTFWaVysBVbkBhwcJp6YIFr2hNgplVJUGjrKrc91xaFL4YMpPioIWiZCW4Zk1TQ3OlhcobnOdODtHcOV9vjpw~q4ijfb6bOB6W9W68MxVFAS~EmJKM9dA4dSIyAO4EMuyPJTpO4QgeQH~iFl5YhWu5OsZHHBPuBHREff9FoYSC3OP-uJJXmeEJtL-7Qs4TGYyGFQo4QSvaqqcA__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

# Feedback

Only steps with an option to deliver data to a destination can have Feedback. Read more about this in our post on Feedback.

# Step Criteria

Similar to Acceptance Criteria, Step Criteria define the conditions when a step should execute.

![](https://content2.bloomfire.com/thumbnails/contents/002/449/191/original.png?f=1610032873&Expires=1748567752&Signature=E7WqOsexZsHDPp1HxWszaxpF5uhMxSzw~R~zqTwk6zhZF5EVzLN1gax6TEhaS6y2kel0bXQUWFquRBbilENJWyNIjvTaAO6fqFw3lfIt5kwLqxXJ2ZuODXnsD1T56GkK3XmJRFhddBi9KMyhOAELgoTqd9GGDQiPQPC20bdMo2qczngytpDPcbYrEiIZgjpsgLZFmb8T9Jahrc6WJvZ7qtdaT-q3~ZIOFIWegaIRpragwJGqDvm-XRLm-WMwUEr3Pd7-OPsgJnvVwaYQNuCEzUfpkCkFT7I7-dzfSFgOLshSFx81S3yFXPVviLFhbZ6rV1hQBkcci3uJ~SZu1vhAJg__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

# Field Mappings

Some steps require configuration (e.g. a Posting URL, an API key) , some steps just you need to connect the field names between LeadConduit and the service you are delivering to, and some steps require no field mappings at all. Whatever the case, LeadConduit will warn you if you need additional configuration.

![](https://content3.bloomfire.com/thumbnails/contents/002/449/199/original.png?f=1610033037&Expires=1748567752&Signature=tCU7X5IQfaHUEa-FD~uSa5UfQ3j4t8-xINnQT6ivNnw1wNQZ7C~Jcnt7S06ul4fqEb3eDZgeoUvZBoWV9pSYC1riDoFP765XMNXfuLtq14ZmUF2mphMYnScFDoRyh9C~muJolRIaJ1jaqEbvnVLpuqPn6tj3SEemIrN~gKx9SinTQKHrL1sXUxC5pnGbrA1J~3dTXvU6IE2QJzM-rImdxeQwbbIQExlinClJBhUWRVJ4Y05GfmfrJtYdaNoan2Yh-IUTxQSHOwdQRhMpc3e1RmbDAb6HLooacWos9etC~vPG-tJ7UnTRDIIkSar6eZzUnPCx2oBSLM0K~i4bDE9C5A__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

**Warning:** When you get a warning, open the step to see more about what's missing.

![](https://content3.bloomfire.com/thumbnails/contents/002/449/200/original.png?f=1610033055&Expires=1748567752&Signature=W9-4yWBsTkwql-prWLwqsISlfy7FVht3P4tyH0-lOG6Hm9QNrX7Qe35J84UeFinUWDjDKjvrBU1V~RaznUqEzvdtYB8JiRQYJWKwxZnoTy0kq~4YxPKyXyfgphhixYC7yPRDETXrCf84Vxi1q9Bid1-GuYqbvYn4f3P5Y9uTzU~bMAp0bGwEp5baBB1EU64NEbB2Bh1DbGsM1ZLFRtxwpHM2GMYAdsIeM81aYoJGuI2FyXhaQa1YHEGMsCSGMyhkvvFsY4zjABRG05rYyspUM6B20Dxs0RTTSN~mzFTWLVOYrv3lpeS26BaIKfuHrocVX4klK5ITZFu-LTva0bXo1A__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

# Notes

If a step has complicated configurations, you can make a note to help remember what or why you did what you did. Read more about this in our post on Step Notes.

# Disable a Step

You may want to disable a step instead of deleting it. Read more about this in our post on Disabling a Step.

Type something"

