---
URL: https://community.activeprospect.com/posts/4106032-filtering-for-profanity-using-suppressionlist
Page Title: Filtering for Profanity Using SuppressionList
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-0700bd92-10a8-4f85-8d91-ee9f86fb00ae.png
Scraped At: 2025-05-30 00:16:01.655
tags:
  - seller-focused
  - reference
  - flows
  - compliance
  - leadconduit
  - how-to
  - beginner
secondary_tags:
  - operation
  - admin-focused
  - intermediate
  - data-management
  - semi-technical
---

[![](https://content1.bloomfire.com/avatars/users/1317000/thumb/thumbnail.png?f=1617311121&Expires=1748567752&Signature=X9fj59kSmWD-4zTnYmepc5gKRqn2PVncexDVa9LApbv-iop7C63UHcLx-fmxxAoLfRrlGiNk-rg7X~UUep8r-a8vX6Tk1P1Bra5LYbgpGLC9HWJBpqE5XIPK4BasUHX4ECchDubxZawERW9evx5dHSjZn1wkV9E9~XY8T4kDPRHDwRQn~DCD7Juh~~yOnadsDl-CUOcQZiZBOlTYMLytIDjBPLpNmADr0avpxQbIwEmHzOpMn~QvpKFhZkCn29EcInQ9YaKnmkoXBT-FopoN74PSKZuhnhN8-uhwLbtvlUlJv~uQYG8ise8NP2nQS~BfpVJiWF1xeERmGTQWG1GzSg__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7557680-scott-mckee)

[_Scott McKee_](https://community.activeprospect.com/memberships/7557680-scott-mckee)

Updated December 9, 2020. Published December 9, 2020.

Details

# Filtering for Profanity Using SuppressionList

Some users want to reject leads that contain profanity words because they consider those leads to be unreliable. Configuring your LeadConduit flow to reject leads with profanity words only takes a few steps.

**Step 1.** Formulate a list of words you would like to include on your profanity list. Store those words in a .csv file.

**Step 2.** Create a new list in your SuppressionList account, and upload your profanity words file to it. See our knowledge base for ""Creating a New List Using the UI"" and ""Bulk Adding or Replacing List Entries With the UI and Deleting a List"".

**Step 3.** Include a SuppressionList query step in your LeadConduit flow to check if the field contains a word on your profanity list. Include a filter after this step to stop the flow if you find a profanity word.

Here are two examples of step configurations that **WILL** work:

_Example 1._

![](https://content3.bloomfire.com/thumbnails/contents/002/401/882/original.png?f=1607551417&Expires=1748567753&Signature=MGblARbF39L~IyKeuybMsxtD5QOUbwkcolKFS~l35uTZcvfcqv1ce0VXxxbDGxNP1s2cF32HVrr9EAxqg1n2vinh3lpIbm-4HWV-UfS29Pw~JuMBqzSbTdzXV1iFcrPt2eyVEtIfLZw-KS65B1KG-y2HSpfjsialyFutNVlxdLNgObeb-mvrqQMZzf6et6n1-6wAQimlpdXUM-AFg9Q8ommU3nKKc6LEb9BZqbP0fIGFd7PF~sfuFSjd5BRbC6fxva0eK-7NM~RPSlI4JxSVPQRxx12Q1AaRPu~-L6GbX8QJ-DNvpSq7l1bosDSWCVgPARlhcxGj17nE5I4suxIRdA__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

_Example 2._

![](https://content2.bloomfire.com/thumbnails/contents/002/401/886/original.png?f=1607551441&Expires=1748567753&Signature=IfCeRFrP9UE6fIO2ftLbgedviNwufqBcf7iXv8PAIuqqUDp8PjJkXwC62Q6YzVpjEYbcdxq~AGvO8~Zhcc9bIKUNuYvVqTwDERVxY3CGYwVm3H0C-kl8qBvIxQUaNveG~P9R-e6DdKlFRhqdETIbecGYmr5PTPLzJv8RadT0Da0w5XC5NsDLxQWUXm2s6E6~MfFk-22yQZ6ZxgEU-RlOuua4mNscQTNTR3CBl0DUVd9M1aWcTZSUmL1B7Swl6Psz4Va8oU-rm4XbL0MTi8Lhg7XAXKdefaYYvQKToGKuN7d~3Mu3Lad0xKK1f-SbL6hf-xWUVQPANelN5~DV4lSE0Q__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

If you want to check both first name and last name, you'll need to set up two separate steps for each SuppressionList query, along with filters that will stop the flow if the query item is found.

**Important Note:** Most users are interested in checking to see if the lead's first or last name contains a profanity word. The temptation is to configure your SuppressionList step to check against both first and last name in one step. This won't work.

Here are two examples of step configurations that will **NOT** work:

_Example 1._

![](https://content2.bloomfire.com/thumbnails/contents/002/401/887/original.png?f=1607551462&Expires=1748567753&Signature=pYGZFN5sYiJVlWqSuXEMEujic7fV5Lo91eTpzWfiLFr2FYJik7sREVvZHDICjVBGkzg9s7vDeh9HiGieKw9azlbG1tibhUhtZvkCNiCqJONJKVxrsZbQQmFpDRGHD9ppsJ-2juyhmL5UtnuxY538mVVKeUOPfAVXxFOHhhGECYDOGAGsGp5YZrgyEIBj7fTxNmMx1rA-oM5tFd7iZUrZGUKVMaZTTD-UGgNUZ9KhKvB585cPQmQPqPk~UFksw-7WwnMz1IrPjQ2i4s19BPTm2eHilkvJ4b8ine25zXi8uaJMzu4rGzGRk6jJ3u46HYD6KbB1UXiHn9PhCD9OLADByQ__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

_Example 2._

![](https://content0.bloomfire.com/thumbnails/contents/002/401/889/original.png?f=1607551480&Expires=1748567753&Signature=tDsRxUnsEati1OsMoqtm6b7PHKrqG7HGMdS8cEfrYiNE5eXAwq1xTTKIq50g9TlbZX6HHxgvv2Gxyck~HhsDohizXtQDqFRXDduvH~Co0py0JKYM4h7-YUjd-D1YM0koHjEqpsd8PkUA14MWKxzARughajypDfM~jfPA-bEzJyrU8dP664LACKwAvkVbxtjFmDm9WN5R59B~uT~H06wseORYAEoCqXXM2S9AcBSd5~9UTA831IxWLWhjts92JXb3FPJSuLLAcLP7304jNsMRZTwPm164fRAGMW1JvueSS4wvNn8YaFiwk40xzKjxr0xsai6oGpvwEkKs~3lsR2fdhQ__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

Type something"

