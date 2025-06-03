---
URL: https://community.activeprospect.com/posts/4383260-implementing-trustedform-on-wordpress-with-gravityforms
Page Title: Implementing TrustedForm on WordPress with Gravity Forms
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-1fcbffd3-abf0-47ec-aed4-b1e6d42ba087.png
Scraped At: 2025-05-30 00:17:11.910
tags:
  - trustedform
  - intermediate
  - compliance
  - developer-focused
  - technical
  - data-management
  - how-to
secondary_tags:
  - admin-focused
  - universal
  - operation
  - seller-focused
  - troubleshooting
---

[![](https://content2.bloomfire.com/avatars/users/1405246/thumb/thumbnail.png?f=1620827893&Expires=1748567764&Signature=k2EnCRpiTRmRjLWA5M8R7-Q~ePGyjTegalEZr1l2l~eMY7xFC2FmIo-9OVSnDVpY--Mbi82MQMtP34UG13foga8dMzBCQXPMx9xZ6rTZuOwK4GntN5kl6ltaJW5O5hfTxErw7QwuwLQQFZMhZXzzoxPST5FL4ufGvdNExAJJnrRC0j73E2QDrOgs~ZI-UT83wHw8JAC3dI4sJywxG-Sz8cB8e1bez~Lkv58sV9LFMjjG0AEtHKl9lnpZ18yXsHxZBPQHp93RW96Xf4nR3shGoGD54gzpAp0Fi~UM5eF4kPQBsi-BnI~SwbfUI1KMOXLzmlqBFq7S~atB-d8kmcDaXQ__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7846678-christopher-williams)

[_Christopher Williams_](https://community.activeprospect.com/memberships/7846678-christopher-williams)

Updated August 23, 2024. Published July 14, 2021.

Details

# Implementing TrustedForm on WordPress with Gravity Forms

How to add TrustedForm to a WordPress site using a single-page GravityForms form.

To implement the TrustedForm script and begin submitting TrustedForm Certificate URLs with GravityForms leads, follow the steps below.

Open WordPress, and navigate to GravityForms, and here either create a form( 'Add New' ) or open an existing form. In the example below, we're using a contact form.

![](https://content3.bloomfire.com/thumbnails/contents/004/211/234/original.png?f=1709596693&Expires=1748567804&Signature=tstht7feL~JPTQpahMQDZf4TrCbCQvmFgPYTh2aIbr55IJ8yMrriSfzr9IrqOrzksYE69pwrb8fjFeGtlI8b~HrXuy74xn77kCzT4mNsKgpdGBS3Y1ETUXuwBZP3Lk2iXJfzebM9wq4T8sHLNPHOaqIsN42WJ66fmeJYxkqNTUlT0u~btVnn8TuTW~21jiWz0vpj~RZjLHWHcPC~xukEBWNM63~k7qW3wy2uE7gyRcpIhCZl6dDsb9D6ECg8AXS~nNrduNnzLiezxI0LItgIJbv5ATRvqiYoAa43YNzUqWFzxyvvlwl5yz3i1pxKBstaAqTUm3NHn-QdpvGZpLHMRw__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

**Adding the TrustedForm Script to your GravityForms Page**

Now in the GravityForms editor, let’s add The TrustedForm script to our form page.

From the right side bar, under 'Add Fields' > 'Standard fields' look for an '<> HTML' field.

Now click and drag an “HTML” block onto the page and make sure to add it just before the submit button. Click on the HTML Content block, then on the right side bar expand the “General”  section so you can see the “Content” block.

![](https://content3.bloomfire.com/thumbnails/contents/004/211/245/original.png?f=1709598018&Expires=1748567804&Signature=ZmytSCkHHY8bx7wo8MdZkc67lKmecOrqkSLTslN6i5F0jh1Gd2JI2ZWy0Ym7CN~S9w4mC9FrmoxkWDfIyMQ3mou3L8qz4Qaw~rh2OxF5pDEF3Sst98wL4tmmwAWoVXHUDv7RTMS~P3Ukej0mvxJhjrf7qD-xGcKBex8dcfEWzeiYf8HyDp1lgO7qqJgkcS9P9H6rsn9y2YQGF95-JPh4IO1~50ZGnO4c9fRK9lZW3r6aB~5O6kNNPWVnjvHHlGaB~HKWookEMO9iftifxEG7sIlNsA1ZcHzE4EJB5wi8b9RNZ3AQkawPEHR2LA4pgW9eRRbyId2H1JwWNJ-KHlWDYw__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

You’re now going to paste the TrustedForm script into the Content block and update the form to save your changes.

**To get the TrustedForm script:**

- Log into your Trusted Form ActiveProspect account, then navigate to the Certify tab.
- Here you will find the TrustedForm script under 'Javascript Snippet (Web SDK)', copy this script.

![](https://content1.bloomfire.com/thumbnails/contents/004/211/247/original.png?f=1709598130&Expires=1748567804&Signature=GnKTQJzyHKGVvQOPHhrpz1vnG6aFDZxGcf0F4YnEgKr8014xBALxRCGMBW33XMp4P07NpY4-ML6cUdOubUVh58aipRjWURX~NsRA9xSFwMQquy3335d1wbomDOwguy9sDys44fSPyuRj-rXfBxmrPkvUiuIlAGK0koRNNyfX~Tat6SkHtzo4~STNhuR9MyZobu0x3Dqe5ODtWHkCRueJhTP-M7IPWGD~xG9AoJKh9pgR-Fj1o4a8VH7r11O895kZVr70fSwEnuu136lvTNSJRI95LzUE~G0CGZi4ifmJ5uLbcWD5f-xp4l33~kbf3ehhtFfi8Y9kd5HdemOWrwGkjA__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

# That's it! Now you should be able to preview and test the form, and certificates should be created successfully.

# Checking Whether the Script Is Working

You can check a loaded form page for the presence of a populated hidden field named ""xxTrustedFormCertUrl\_0"" in the browser's page DOM by using the browser's ""inspect"" feature. Look for the hidden field (xxTrustedFormCertUrl) in the inspect tool, which is where you'll find the certificate URL.

If you’ve done everything right, you’ll see an “https:// cert.trustedform.com…” url as the hidden field’s value.

**How to adjust the SDK to insert the Certificate URL into your Gravity Forms hidden field**

**Step 1:**Insert a hidden field into your form within GravityForms.

![](https://content2.bloomfire.com/thumbnails/contents/004/454/348/original.png?f=1724438084&Expires=1748567804&Signature=EdR75pH38q6Ggag5BwhT-z~~X5XEE2Omblct0yazq3yWVtqcmSJq4iGwaoq5EPzcjly5sifR5krTI1CPR9SVl4MzViOBUEy~tsDeiWj71G-95cwXesd4QD13eb43I5nklPP0E9UO0wNp3e0WTxKoI5Hxz~DxPSPcNBnKBOgclm5MWANrO~Nz5QohZJyVFmWblwXMe3CmJUXR4HeG~KRwqVSYCD2XizxqA2jU53H0KVHlSn-aVIsdKf9JpKMz5rqe9OvCc7j8qEiEdqiCvZxbgJz7AGW9QSxL~ufP8EsRkex1tyWn0~ivNeNVY5DXHXcEtJ-3YpV-PxAqBMQrCod-CQ__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

**Step 2:** Save the form, and then note the ID assigned to your hidden field by checking the hidden field settings in the top-right corner. In our example, the ID is 6. This ID is used to name the hidden field, and it will typically be formatted as **input\_ID**, so in this case, it will be **input\_6**.

![](https://content0.bloomfire.com/thumbnails/contents/004/454/355/original.png?f=1724438220&Expires=1748567804&Signature=cr-OQesSLlKaluagmt2thW-mFzYUb7K9cyOlV4PUnZiSinZzPidKKLC7lj8a8KzwcPQsstcoUhXkGnuz8aXjTVeOxfIts-Y65tfsAn5c5tdrv4CG9g9UjN~nUkYdI16wgMMFeaiLfi04xKf92XEFIX8oH391mBVFMoGdlfHniD0010CruJcb9m3Rkx55-MHKZtly95146H6E3sFWHssRY7q1AzelmoKR00FgsUemrwFqhLpYkuS99-Q8HxhHef3G8tE3CLW7vqmmMj-FVSQ6U7E4Z7eVJySMAwDz~vdpw~5Z6ZZgk02uHUt08pMuVcxghyxf4tSVgt~6RkzpCLhP~Q__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

You can also obtain this information by following these steps:

- Visit your website and open the page you want to inspect using your browser's developer tools.
- Locate the hidden field in your form, which should have a class of ""gform\_hidden"".
- Take note of the input name assigned by Gravity Forms (e.g., **input\_6**)

![](https://content3.bloomfire.com/thumbnails/contents/004/454/411/original.png?f=1724439260&Expires=1748567804&Signature=GHVpXYtmCrBHRZqgFQg~~Uk5j9Nvbkc6Ut2l~9LMad-tgUxVkc23jRn4HBTxlLqtB1Vya5TI2TIDqWISeR0UiY-rloT-1sugVGEBFW5ktrbFSCBjha~KyXkC8pUIeKRTab5a0DyA6rDepjCadgsM-DG299WM55wY6VxfqYzwlBsGhXUFIcqvkiKaA3TPFcAvaWbpC1we13nWkQMRwcBXA4IB-bS5Fx6HaT8wlwktBoMy0Iao4ecsTiN9KRD~yndm5GxAiBa4V~ZI7SjoPWEyU42Eo1htwZopHvNxfnDb~IGkGzL9a9-x108zD1gQnF2hnad5rjWdAZCWn64RYrccEg__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

**Step 3:** Go to the [certify tab](https://app.trustedform.com/certificates/issue?__hstc=41051389.b94d25e7fa675c1dd50cabd5b15b9252.1748564224459.1748564224459.1748564224459.1&__hssc=41051389.1.1748564224459&__hsfp=3707738794) of your TrustedForm account to edit the field names used in the Javascript Snippet (SDK). Navigate to the Script Configurations section, then update the ""Field"" blank to match the input name assigned to your hidden field by Gravity Forms. As you update the 'Field', the Javascript Snippet below gets updated too.

![](https://content1.bloomfire.com/thumbnails/contents/004/454/419/original.png?f=1724439525&Expires=1748567804&Signature=bbFeX7CfGa1zd~mF4rkrun2xef8A1nEq8Z0TMbTXr8bVUWfIBRLdfKiF7zmVYtTySDNrtzIdhddq~0XN46sPmxpLOkkwKPXhag8MXcvILOdkOBVbrqBctKf37qdfiHFCnDXeX7fxjp6lU6GWbgHfBP06SsyPs2uJqDtkjWrZTagtdrAM7GOjD6Rn7HtmF6kmChpvQbu9YWupq53JJlHHe4u-MHcYqGZ6-4P57yhwsgUvCNa3BBNC1X5BXzUc63yBYkZQRiEYJzzCgcrOiuOEUeocHAYe-aMYy9MwTnNtSn7nhi0REQdbWvI-AIzx3T2eYTdJpwHxSZE8tkhQ4Fr9vg__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

**Step 4:** Now copy the modified Javascript Snippet (SDK) and insert it into your Gravity Forms, in the same place you added the SDK previously.

After this, the TrustedForm Certificate should be inserted into the hidden field you created.

Type something"

