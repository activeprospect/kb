---
URL: https://community.activeprospect.com/series/4720459/posts/4383260-implementing-trustedform-on-wordpress-with-gravity-forms
Page Title: Implementing TrustedForm on WordPress with Gravity Forms
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-dbf004a3-b4e0-43c2-b02e-40cea680bddf.png
Scraped At: 2025-05-30 00:17:13.510
tags:
  - trustedform
  - intermediate
  - compliance
  - developer-focused
  - how-to
  - technical
  - data-management
secondary_tags:
  - admin-focused
  - universal
  - operation
  - seller-focused
  - troubleshooting
---

[previous page](https://community.activeprospect.com/series/4720459/posts/4067743-activeprospect-compatible-landing-pages-form-builders-and-chat-platforms) 6 of 8 [next page](https://community.activeprospect.com/series/4720459/posts/4290731-troubleshooting-a-trustedform-certify-web-sdk-deployment)

In Series: [Implementing TrustedForm Certify on third party form builders](https://community.activeprospect.com/series/4720459-implementing-trustedform-certify-on-third-party-form-builders)

[![](https://content2.bloomfire.com/avatars/users/1405246/thumb/thumbnail.png?f=1620827893&Expires=1748567792&Signature=pAhB7qIdcbVx5QwKTBYZYOnQu3BBEdnF~eXNAn5ONmzRwkphGhldfGwOpW~IxRc4v1TZz3dtjUyOr1eVBc7CwNnwUI-0CriXuFoAXmkv5AfJZTN-s7GKe6Q0EQ8o6QlWe9ajHQIIQOKeZyusaTBtqeFcgFIawLjhdXATUfmRR3gdZhzSmuIG7PuMhvBM5CgTs2sZnLkRcsAD6pTdZq~Xl7YN-oyfujb5BIOCVsm6kGnB0d-3qfcfWrNDb0O-aY~rarQJ79s2WIybJ4uYiBwgv0TnkpBGMJ~eJ6ojM47G-4~kj2Snvdxx6t7GSplcMRvlp1i6u62IWpd~6bx6x01JbQ__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7846678-christopher-williams)

[_Christopher Williams_](https://community.activeprospect.com/memberships/7846678-christopher-williams)

Updated August 23, 2024. Published July 14, 2021.

Details

# Implementing TrustedForm on WordPress with Gravity Forms

How to add TrustedForm to a WordPress site using a single-page GravityForms form.

To implement the TrustedForm script and begin submitting TrustedForm Certificate URLs with GravityForms leads, follow the steps below.

Open WordPress, and navigate to GravityForms, and here either create a form( 'Add New' ) or open an existing form. In the example below, we're using a contact form.

![](https://content3.bloomfire.com/thumbnails/contents/004/211/234/original.png?f=1709596693&Expires=1748567823&Signature=qng6690nPR5bVTodR~-DyumARlyV7OXlDAtdZR5PB-DY0sD62j01xympbkJBzocyMUUlhZp7MluCLcVOUtCnHuEQF8ZmN6vHty-IUueqHQoP12c7K-RFgQUzElAULgxv-miUwHkeowD0GuNqH7R5rDxNs1VBBaxz-u3W6atVk~3ou3-mueP2mYuzp6Q45tQeMyhuV0ai5MLgNtFjKzTlV3RWu1y0ZEMxiUIbFaozD2pL6of3p4zgOGa3-RUEWVbW70tuml6dWxmHw8qGqzHbfF~xTRzEiExaDXHdSB5jiqMEnduho0wvBK2Xouy-95EAyeFC-kwxn5pYTpQDRz8vhQ__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

**Adding the TrustedForm Script to your GravityForms Page**

Now in the GravityForms editor, let’s add The TrustedForm script to our form page.

From the right side bar, under 'Add Fields' > 'Standard fields' look for an '<> HTML' field.

Now click and drag an “HTML” block onto the page and make sure to add it just before the submit button. Click on the HTML Content block, then on the right side bar expand the “General”  section so you can see the “Content” block.

![](https://content3.bloomfire.com/thumbnails/contents/004/211/245/original.png?f=1709598018&Expires=1748567823&Signature=hdyDACqC4W~LdCPWU6crIe8Fozpx8sJkgPcFt4C1E9lJkzeRlfF8N4Yxygfw09qvLiDQB8GMJD80H65sBbn61TH~u8XJBFFWvyLjxKqtbfK21QcLhdgyqDqvoRG2K6BE7X2371J7JV3wEWKTKyMTBkxvA03yuoasfpwkO~6WPxAmqlcVRflEn9RuUWAapCL6LkNHUhOJkUDfKm5sW37guoqf7QRlmC1CFrSOH8Dtp~0poSzailEc7DYq-Toyx7I~V9Qd2iM-TyXoG5gAlshcJsxRRZ4WUJiFfE67vDM--lH-rIfbcNhy0gHOh~K92rVAkWc0yITCiwWtsqtfj9S87Q__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

You’re now going to paste the TrustedForm script into the Content block and update the form to save your changes.

**To get the TrustedForm script:**

- Log into your Trusted Form ActiveProspect account, then navigate to the Certify tab.
- Here you will find the TrustedForm script under 'Javascript Snippet (Web SDK)', copy this script.

![](https://content1.bloomfire.com/thumbnails/contents/004/211/247/original.png?f=1709598130&Expires=1748567823&Signature=CTYGFG0xfsTWGv2~SIETsehbOXcTVLUdinlnhLOZCsB2AK1A3eF6YGE30FUtmUAdHX~3XqFU~hQnrvgw4aTOsYyeflokHRX3w5JmIMw-j8X9Kc7oyMkl7UB-w0DwBB2Kez581Mxy4Y9~wZY3BeYhFn8OX7osMKPzwSeZpizUQlqffgV7xSkb9TpvQcaeNSMuH5-J0xvj68ipfvyEbczVmhFn~X~KJc02d9GpxnT3guo2bBu5QB0neQO6v4xFAjVP~jEipz1pe~~kZu7h62Klo5udqbdcni9EgAlEMDZ9UUcw9jXjYYk95rlRtvtwrWL82Dt8MJj0dnrbMWfsUnlIUw__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

# That's it! Now you should be able to preview and test the form, and certificates should be created successfully.

# Checking Whether the Script Is Working

You can check a loaded form page for the presence of a populated hidden field named ""xxTrustedFormCertUrl\_0"" in the browser's page DOM by using the browser's ""inspect"" feature. Look for the hidden field (xxTrustedFormCertUrl) in the inspect tool, which is where you'll find the certificate URL.

If you’ve done everything right, you’ll see an “https:// cert.trustedform.com…” url as the hidden field’s value.

**How to adjust the SDK to insert the Certificate URL into your Gravity Forms hidden field**

**Step 1:**Insert a hidden field into your form within GravityForms.

![](https://content2.bloomfire.com/thumbnails/contents/004/454/348/original.png?f=1724438084&Expires=1748567823&Signature=RJG5PrLtt~3piBDOeTQ7XmrI9eAQBdI9bJ7-HklC~6TttEUJxLwI154t61l5bJzp8d9matQAlMnv0uzUoNPSFwfu3cFVbA8Tk0BGi9SAYDYhsqiAPK50YiS2gS02xkheM0ocdlM-dWuyJC6gAFCagHODCkRaif7Q8m7NGweDurLiCUvhvLYnNfiuJ8rzOtqFc9SqjFknSE3wKElkfs6ZGzKEkt7xn6g0S0gBvi7tTUHV5Qyhbb8DP727w6s8kETsi96JeZsTau0wQxMad6cOsV5ThzeMt4ZnEY~5Duc6JlzEB5LWbDa1eOL0lMFnnv~7lCxQAUE9rd598N7GPtsAYQ__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

**Step 2:** Save the form, and then note the ID assigned to your hidden field by checking the hidden field settings in the top-right corner. In our example, the ID is 6. This ID is used to name the hidden field, and it will typically be formatted as **input\_ID**, so in this case, it will be **input\_6**.

![](https://content0.bloomfire.com/thumbnails/contents/004/454/355/original.png?f=1724438220&Expires=1748567823&Signature=VvKJiMDsr9e~6cez6scJF9GWSUCsFfsJIhgFtE6TZWRzkdtSjTra-RHrjbTQ8RiC1r~hW9wdfZn4OldGHlbKI1nIAbHnTamrdBhPuh2tmVEp11ntHp9xMvCLdU-C6~O8Clad~hSdd3Eha3byqI5kxC-HM0ivjSuXBMvhFl7rdx7QvbKB0hCV6XiF7v0DEo9fNY5L9tk9E06QAKHy~xz24B~kKY6IDhNqp42EgdNN8UNLSbNf9bbwBn-FYEFWXFB~ZL-6jcJnFocNRu50SEpwUClnl8sPqOUPT-MnMrQSxZInpFwfHowAefM9nc7EZa6mRIvfe1AnTXAnNTQns-glWw__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

You can also obtain this information by following these steps:

- Visit your website and open the page you want to inspect using your browser's developer tools.
- Locate the hidden field in your form, which should have a class of ""gform\_hidden"".
- Take note of the input name assigned by Gravity Forms (e.g., **input\_6**)

![](https://content3.bloomfire.com/thumbnails/contents/004/454/411/original.png?f=1724439260&Expires=1748567823&Signature=t2rHfzCNV9ynhmpjoohyeADf7lO6fZJ0U8LrcW4ZZ6zR9NdEncjLZYaXrrSW7txjjoiwbZ9m5buGeg4nmG~b74ZFMv21xGbjrU4YDmVewWU4yKoZ4d3HbDUF~HFYyo32BMTczRR4F9weTsNNZJI~~fzQ~kzAF28SfSIOwkfPAXSJ4VE2CRD2RtJjgD5E2oWCWpZJQlDY3DKScivPB0~HxJw4wPznzMV2EwSlgzEvJsUUKw3OFk603nov35178crkDr5Lz9aLpI4OYQ5f8HTr-ot~qH6prCxjEMb~LCOwM4dAIpWCCW~iqi~KCnRuuK9hlmgKGCEmXcDLCsA6pCjKiA__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

**Step 3:** Go to the [certify tab](https://app.trustedform.com/certificates/issue?__hstc=41051389.43606a6e2ff3de6aa4ef188da8da6084.1748564228037.1748564228037.1748564228037.1&__hssc=41051389.1.1748564228037&__hsfp=3707738794) of your TrustedForm account to edit the field names used in the Javascript Snippet (SDK). Navigate to the Script Configurations section, then update the ""Field"" blank to match the input name assigned to your hidden field by Gravity Forms. As you update the 'Field', the Javascript Snippet below gets updated too.

![](https://content1.bloomfire.com/thumbnails/contents/004/454/419/original.png?f=1724439525&Expires=1748567823&Signature=KLWzCrng2vYFQDEJDsa0WG7bn114RKsZhOXvJTTmanC~wTVtjdk-Tfs6rFwhjS61JE7wJO69ZQ02QoTHMxQp4QPdvW6FJqlgcw8~FsEpZcYYfYcWkR5SDtf9R0CyLzDe29A5IHikLVD~A2lnrBXy~LpqzMOFC36vZDw8aFscfzk0Uxc6YlBXG-yWWXm2lNWulcXuvZ9r1kBN3~HlH8Wt2ozOdlR8GnDlCpAIggdajNuSWGQNJK4bAKQEpSKVXNV9bLygVztV~zIJ2qy83N-JPejI~zShi93me22v6ob8xrku9Ei~F5tcRZoyD6obztQB0bF-jqyrZYrHm7O-QEjFEw__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

**Step 4:** Now copy the modified Javascript Snippet (SDK) and insert it into your Gravity Forms, in the same place you added the SDK previously.

After this, the TrustedForm Certificate should be inserted into the hidden field you created.

Type something"

