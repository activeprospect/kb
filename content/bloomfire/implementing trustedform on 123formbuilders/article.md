---
URL: https://community.activeprospect.com/posts/5189112-implementing-trustedform-on-123formbuilders?_gl=1*yvtfuy*_ga*NjUzMTIyNjYwLjE2ODk3ODYwNTc.*_ga_QHXBV6N7D1*MTY5NzEzNDE2My45LjEuMTY5NzEzNjMxNS41MS4wLjA.
Page Title: Implementing TrustedForm on 123FormBuilders
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-db0db375-1d9c-47bb-90d7-53ac44c537f7.png
Scraped At: 2025-06-02 22:30:49.902
---


[_Ayesha Akhtar_](https://community.activeprospect.com/memberships/9624817-ayesha-akhtar)

Updated February 21, 2024. Published October 12, 2023.

Details

# Implementing TrustedForm on 123FormBuilders

How to add TrustedForm to a 123FormBuilders form.

Begin by logging into your FormBuilders account.

Select the form you want to use with TrustedForm by clicking edit or create a new form:

![](images/image-1.png)

Click on the 'Set up' tab:

![](images/image-2.png)

Then click on 'Advanced' on the left side bar:

![](images/image-3.png)

Then click on the 'Form' tab. Then select 'Add a JS script to your form'.

Here we will be entering the URL of a .js file which holds the TrustedForm script.

To do that, first create a JS file that holds our TrustedForm script, then upload the JS file on a trusted web server or your own and use the URL where the file is located (e.g. https://mydomain.com/my-javascript.js). There are web services that host JavaScript files for you, but they represent certain risks, such as data corruption or service retirement. That’s the reason why it is best to host them on a web service where you have administrative access.

Once you have entered the URL of the JS file, click on 'Save', as follows:

![](images/image-4.png)

That's it! Now you should be able to publish and test the form, and the certificates should be created successfully.

Type something
