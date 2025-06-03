---
URL: https://community.activeprospect.com/posts/5191581-implementing-trustedform-on-formidable
Page Title: Implementing TrustedForm on Formidable
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-2c1cad03-1a75-4dae-9890-08cc85d39d14.png
Scraped At: 2025-06-02 22:30:49.874
---


[_Ayesha Akhtar_](https://community.activeprospect.com/memberships/9624817-ayesha-akhtar)

Updated March 4, 2024. Published October 16, 2023.

Details

# Implementing TrustedForm on Formidable

How to add TrustedForm to a Formidable form.

Open WordPress, and navigate to Formidable forms, and here either create a form( 'Add New' ) or open an existing form. In the example below, we're using a simple contact form.

![](images/image-1.png)

Make sure you're under the 'Build' page. Now click on '</> HTML' on the left side bar.

![](images/image-2.png)

As soon as you click, an HTML block would get added to you form, make sure it gets added just before the submit button, if not, then drag and change its position, so it's placed before the submit button.

![](images/image-3.png)

Now click on the 'Custom HTML' block, and a small 'Content' window will appear in the left side bar, here you copy and paste the TrustedForm script, then click on 'Update' button on the top right corner.

**To get the TrustedForm script:**

- Log into your Trusted Form ActiveProspect account, then navigate to the Certify tab.
- Here you will find the TrustedForm script under 'Javascript Snippet', copy this script.

![](images/image-4.png)

That's it! Now you should be able to preview and test the form, and certificates should be created successfully. Look for the hidden field (xxTrustedFormCertUrl) in the inspect tool, which is where you'll find the certificate URL.

Type something
