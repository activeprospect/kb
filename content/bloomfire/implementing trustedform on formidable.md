---
URL: https://community.activeprospect.com/posts/5191581-implementing-trustedform-on-formidable
Page Title: Implementing TrustedForm on Formidable
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-a822e3c4-e6df-4ed4-9374-f754842ca970.png
Scraped At: 2025-05-30 00:17:06.095
---

[![](https://content2.bloomfire.com/avatars/users/1966401/thumb/thumbnail.png?f=1692038964&Expires=1748567772&Signature=G1Mj~6bHOCARsT6RRDFfnPefChZPFUgRbLv5HNUOJ2gjtk5EHdiDNwd0OTc18YKvwwldTJ-GQkL~VduZj4Nm45AmtPfoX9-QEDpJjeQPKcbgtp0ERTXSqQc-NFMOfCG577xckY5McX5DngiMAA4vHnWrjFEkzG4qzobgtmzlf9Woy44jQ~1M02TCVU~ulqtDfRT4xCEiP8UfMnmUzGc72ijbNuMNUT2ebU2FtKPDkfvQpLArxDkwlpfq5nE43acFHaWul9raPsDTcYGTdEV5IMSiBsO4NK~jYmcdM2-f5msURB4bgnmM0xlItvwFaaeWSbz0KFNzz1S0Wec62lG5Mg__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/9624817-ayesha-akhtar)

[_Ayesha Akhtar_](https://community.activeprospect.com/memberships/9624817-ayesha-akhtar)

Updated March 4, 2024. Published October 16, 2023.

Details

# Implementing TrustedForm on Formidable

How to add TrustedForm to a Formidable form.

Open WordPress, and navigate to Formidable forms, and here either create a form( 'Add New' ) or open an existing form. In the example below, we're using a simple contact form.

![](https://content2.bloomfire.com/thumbnails/contents/003/928/462/original.png?f=1697487648&Expires=1748567816&Signature=ubK7oRt1NzoGVMebH8AI9WAwlMfSvyydvAL9MrBMndeVRegZ6MobhpiaG5gZkc6bb2vhDcAT-9o8MTxwNKY5Smd1kKRJF75IRf6dmH6Lt6cq-u0bIL0RLSODwbllxkthB0iARYCK8nHy3yvR6uqzjeVMpcnv62kQZ5uDYE~B0z-YH2PtgfKV-hXUntDzwVvh6jtXKmWKtbAf1JJjenSN0OSzY8DJoUGO6JpF9T73LneOjOJ224glqwwQ-60y-I6LI4Uc6g1WCogNNZDCEBBV64yrk3TpctPcyDwg0ZzvFpczC18FbQoxynGvL3owSjwiL7WChlIPODr4yhTRW3WsOg__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

Make sure you're under the 'Build' page. Now click on '</> HTML' on the left side bar.

![](https://content1.bloomfire.com/thumbnails/contents/003/928/469/original.png?f=1697488035&Expires=1748567816&Signature=lh6C4RSoqvptRilmXYZdWsXhfBfWpuFuN7B80Za1KcZD2da7HU77-0RMJMtA4H1f9jXqvJ6lYUoYdRJdFFUHOk92x3zkYOMUTzxY7YWf6sdXnDVWmRbACDX1ylBezh9K5K3TXIAQY3-7zQMwG15~5ngHUBuGXP4-AAFxdEG4528NNnkKqaN3e7qiDnRntCMOlSMxJJsmiIfPx5mJ3h~TxPAbrVOq7gtXwtRZaG6Sy4uzv-t3j2pm2d4D9POXgqMghwLa-Bl62hYLcHKUZ-LU2fAR4Hq7CuqGC0ulqJ90XPidl~z6Y1unMZh5qxPy5V9b3nHYy9~S6KqqMseSpvNG3A__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

As soon as you click, an HTML block would get added to you form, make sure it gets added just before the submit button, if not, then drag and change its position, so it's placed before the submit button.

![](https://content1.bloomfire.com/thumbnails/contents/003/928/477/original.png?f=1697488135&Expires=1748567816&Signature=QvXEQrQvldwpzfy4UUz5J5ak0TGOND8Lu09aeKM8ZFowZQ1iUxjC-npk2cYSjx8wCD5kyF-4nSlztNtf-6MZtP11fw9yXG4bHdHK9aCpkJRsViwnfLb1oqK~LiM9xq7TLlqsk4qv6WmpEnn8Yrr~UKjnQrD1NbFbvbGJATnqSnO8zas2NSL68u-ExBLWVNC6CTR0chZPoh7XxW8h0Qlnm0nQaqCmLrU1drkhIiX3E6KXq9V6DfUQ2H-oQbt3yXGhQymCV9Wr86fD0TIR-M-ZeRoBqxARbbxV~B75cKBzrCeouDZEGB~OHMF-ScphgakgNvpfY1cq7WJIaEzvJ~8vUQ__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

Now click on the 'Custom HTML' block, and a small 'Content' window will appear in the left side bar, here you copy and paste the TrustedForm script, then click on 'Update' button on the top right corner.

**To get the TrustedForm script:**

- Log into your Trusted Form ActiveProspect account, then navigate to the Certify tab.
- Here you will find the TrustedForm script under 'Javascript Snippet', copy this script.

![](https://content3.bloomfire.com/thumbnails/contents/003/928/496/original.png?f=1697488899&Expires=1748567817&Signature=B8Gq5oaT2BpnvRWPDNPOVKqQwnadASXogSwKDmMtR6S5NJuKciZXKKhG7ZoYSomNrxZ4CUrigdM255Xja2ZifTfHVlelqcv0-BNresdFXiGjqFj5nbFEM~WUH6O0OkFI9egCAfN~9VAlP7Iq3YfZ~c-By2N3fSnVJks-WsjEi9vOHkQ3nbr97EMNOccQT4dQn7PHmz1xNyOrgVrIy7V3o5hFnVl2UtgmMJkYK~oBE1CmGHc1bAhM4c9kgsl5iGHk~2w-aSEeFIVBxBiD3nrrSFLvRbwLvJesgpRvYRZRsGRfHHaUa8M9QoiMCKpjHd1KOg~ZsqSgdAcgpzlGjQy0YQ__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

That's it! Now you should be able to preview and test the form, and certificates should be created successfully. Look for the hidden field (xxTrustedFormCertUrl) in the inspect tool, which is where you'll find the certificate URL.

Type something"

