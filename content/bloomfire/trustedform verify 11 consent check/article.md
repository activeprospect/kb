---
URL: https://community.activeprospect.com/posts/5471724-trustedform-verify-1-1-consent-check
Page Title: TrustedForm Verify 1:1 Consent Check
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-db2d9b62-aef2-435c-a791-80c02bcdf400.png
Scraped At: 2025-06-02 22:30:02.635
---


[_Christopher Williams_](https://community.activeprospect.com/memberships/7846678-christopher-williams)

Updated May 20, 2025. Published September 10, 2024.

Details

# TrustedForm Verify 1:1 Consent Check

The FCC has implemented a [new rule requiring consumers to give explicit consent to be contacted by each advertiser individually](https://activeprospect.com/blog/fcc-one-to-one-consent?_gl=1*pv3zqv*_gcl_au*MzUyMDY1NzE1LjE3MjI4Nzc1NjY.*_ga*OTA3MjA4OTIuMTY5OTQxNDgwMg..*_ga_QHXBV6N7D1*MTcyNjE5NDA5Ny4xMjUxLjAuMTcyNjE5NDA5Ny42MC4wLjA.) when using regulated technology commonly referred to as the one-to-one consent requirement. This presents a challenge because it is difficult to tell if your purchased leads satisfy this requirement without a lot of manual review. TrustedForm Verify's 1:1 Consent Check is a new feature that enables you to programmatically verify that each lead has given one-to-one consent to be contacted by your company and does the hard work for you. Integrate this with your automated lead processes to stop noncompliant leads from making it into your funnel with as little manual work as possible. This will help stay compliant if you use it to check each lead and do one or more of the following:

- Check for one-to-one consent before purchasing a lead and avoid the ones that don't have it
- Flag the leads you purchase that haven't given your company one-to-one consent and avoid using regulated technology to contact them
- Maximize your risk mitigation by only contacting leads that pass this check and have given you one-to-one consent

# Quick Start Guide For Advertisers

1. Request that your vendors enable this feature by following [TrustedForm's Consent Tagging instructions](https://developers.activeprospect.com/docs/trustedform/consent-tagging).
2. Determine what should happen when a lead has not given consent in a one-to-one manner.
3. Relay this to your developer and ask them to use the ""one\_to\_one"" property shown in the [API documentation](https://developers.activeprospect.com/docs/trustedform/api/v4.0/tag/Verify) **OR** ask your lead distribution software provider how you can use this feature.

# How It Works

Ask your lead vendors to use [TrustedForm Certify](https://activeprospect.com/trustedform/certify/), then [add our new consent tags](https://developers.activeprospect.com/docs/trustedform/consent-tagging) (not compatible with sources such as Meta Leads Ads, mobile applications and certain form builders) to their forms and send a TrustedForm Certificate URL along with the lead. You should provide them with the exact text you would like them to use when requesting consent for your company (i.e. your company's legal name). Next enable the 1:1 Consent Verification Check on your [verification criteria page](https://app.trustedform.com/verification_criteria?__hstc=41051389.2db3d0c5887daf7e87f4ef700ffafc17.1746726612251.1747793254981.1747799482041.36&__hssc=41051389.6.1747799482041&__hsfp=4052119064) , enter your Company's legal name then click Save.

![](images/image-1.png)

Next use the [Certificate API](https://developers.activeprospect.com/docs/trustedform/api/v4.0/tag/Certificate-URL/) and make a [Verify request](https://developers.activeprospect.com/docs/trustedform/api/v4.0/tag/Verify/) which will run all of the checks you have enabled **on the verification criteria page (note you can also modify your requirements per query**[using query parameters](https://developers.activeprospect.com/docs/trustedform/api/v4.0/tag/Verify/)). Send the results to the system you use to make purchasing decisions or your CRM depending on where you want to use this data. If you don't have a system that is able to integrate with this feature, consider purchasing [LeadConduit](https://activeprospect.com/leadconduit).

The results include a ""one\_to\_one"" property which will be one of the following values:

- **true** \- you have been given one-to-one consent
- **false** \- you were not given one-to-one consent
- **null** \- your vendor has not [added the required consent tags](https://developers.activeprospect.com/docs/trustedform/consent-tagging) or you didn't include your company's name in the request. It also applies to certificates from Meta Lead Ads or native mobile apps, where this check can't be performed.

If you only want to check for one-to-one consent, use the value of the ""one\_to\_one"" property to determine how you would like process the lead. If you would also like to use the [approved language check](https://community.activeprospect.com/posts/5474009-trustedform-verify-approved-language-check) then use the ""success"" property which combines both.

![A consumer fills out a form and selects your company from a list of advertisers OR your company is the only company named in the consent language.](https://content0.bloomfire.com/thumbnails/contents/004/483/403/original.png?f=1726191905&Expires=1748906996&Signature=IBtewUO~q12xNuM6B9wIPBpqkUD-BG-3QeeE9bngJYGYirZKvFL3XE1ZxZbHpPDQSkpYyLNjEfF0YQzoNinhQ7cyoNICJSRU1pGEgO52JJKgXcpVUznxU2scAP7MTHQGvyZCr7SNfxUIR8Aayvn7nVsC64JQn5ByxRbxTZt1rZhqGIyU-ldlim5tj4wDGM5~neT3zho-xE7WuuPskmg4CSaAGFIIB8Kp6Z2DK80LUWcha5sjoCShl-mBHgtZdpsQc07OOFiHgH2-kHtiLNuWx2No~Q1m5DMr4aQHrCPrUlSdw0ZE5Z9gOsCWzNLvISrUxqRURc1CWA2c~dR6pQXAYw__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)A consumer fills out a form and selects your company from a list of advertisers OR your company is the only company named in the consent language.![You receive a TrustedForm certificate URL with your lead and use it to make an API request to verify your company was given one-to-one consent.](https://content3.bloomfire.com/thumbnails/contents/004/483/405/original.png?f=1726193436&Expires=1748906996&Signature=JK~65eCS~6iZnLDVWwIEk5s9~qiXFd9gGcppCxZuR8tdBUyvSQ6AmYn76E2w7-O3YnBjB1-XRUMdeHQjhcy3xe9V~mAL3mFVerBN20X2yW5OFYm00PuQIoOiJOicCcqKctsdzmNaMVjwvZ4bTxXQsvnt~XQLOHIHZTac8XdBecZ5CwzR2hj9gjT3tEzEwS~290uLXeY1cJMlh~t1TRpG~wfWssKR9KEWmnJ315vzJyiwcY5TywTQMBm-sWCv71Ple6erS6t8ya8MXT9p8CHVJVbpRn~LzZ5M0Czu4OXtx0bkY7eIpg4B7wdEXOG6SvYnZ8tS5arCYF4gQR4jA5zYeA__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)You receive a TrustedForm certificate URL with your lead and use it to make an API request to verify your company was given one-to-one consent.

# Collapse                                                                                00:00                                                00:28                                                                                                                Demo: Using the 1:1 Consent Check with Postman    ![](images/image-3.png)    \#\#\#\# Demo: Using the 1:1 Consent Check with Postman

# Frequently Asked Questions

01. **Does the 1:1 Consent Check allow select-all buttons and preselected checkboxes?**

    Yes, legal experts have found these practices to be acceptable as long as it is reasonably clear that the consumer has the ability to make individual selections
02. **Does using the 1:1 Consent Check satisfy all of the FCC’s  consent requirements?**

    No, complying with all of the requirements requires a broad strategy that should be discussed with your compliance/legal teams. However, using the 1:1 Consent Check is essential to comply with the most noteworthy of the changes made.
03. **Can the 1:1 Consent Check be used on all my leads?**

    This depends on whether or not your lead generators have made the necessary changes to enable this feature. If not, reach out to your vendors to request the changes be made. ActiveProspect’s team is dedicated to helping them update their processes accordingly.
04. **Can the 1:1 Consent Check tell if checkboxes used to select advertisers were pre-selected for the consumer on the form?**

    No, the FCC has not provided clarity on whether or not the pre-selection of checkboxes affects giving consent in a one to one manner. Therefore this feature doesn’t use that data when making a determination. As the FCC and relevant case law provide more clarification this will be updated if needed.
05. **Can the 1:1 Consent Check work if logos/images are used instead to allow the consumer to select which advertisers they would like to hear from?**

    Yes. If logos are used in place of text, the publisher must create their form in [such a way that selecting a logo also selects a checkbox and text based name of the advertiser behind the scenes](https://community.activeprospect.com/posts/5474057-how-do-i-add-trustedform-consent-tags-when-using-logos-images-instead-of-text-t) as specified in the consent tagging instructions.
06. **Can the 1:1 Consent Check work if tiles are used instead to allow the consumer to select which advertisers they would like to hear from?**

    Yes. If tiles are used in place of checkboxes, the publisher must create their form in [such a way that selecting a tile also selects a checkbox and text based name of the advertiser behind the scenes](https://community.activeprospect.com/posts/5474059-how-do-i-add-trustedform-consent-tags-when-using-tiles-instead-of-checkboxes-to) as specified in the consent tagging instructions.
07. **Does the 1:1 Consent Check include font size and contrast detection?**

    No, the 1:1 Consent Check is focused on making sure that consent was given in a one to one manner. The Verify product will add more checks focused on other compliance needs such as ensuring consent language is clear and conspicuous.
08. **Does it work on the ping or post?**

    It works as long as the consumer giving their consent has been recorded. However, most vendors will ping before this happens meaning we expect this to be use primarily on the post.
09. **How does it / can it respond to the results?  Alert? Message? Etc?**

    Using the certificate API you could set up alerts, messages or anything your technical team is able to provide.
10. **Do you plan to support other lead routing systems?**

    We’re in the process of requesting this of popular systems but it depends on whether or not the decide to support it. We’re happy to work with any system to advise them on how to make this feature available in their platform. Reach out to your providers and make a feature request.
11. **How many tags are required?**

    At least 4, but this varies based on how your form is structured. For more information, please refer to [TrustedForm's Consent Tagging instructions](https://developers.activeprospect.com/docs/trustedform/consent-tagging).
12. **Any comment about ease to implement?  How long does it take to set up?**

    Setup is very simple for both the publisher and buyer setup. Average setup time is 1-2 hours.
13. **What about some publisher pages who lack knowledge for coding tagging?  (Some out the box drag drop no customization site creation services)?  What level of technical knowledge is needed to implement on webpage?**

    Adding consent tags requires a very basic understanding of HTML. However, even someone with no technical knowledge could look at the examples, copy and paste using our example as a guide. If you have any trouble our support team is ready to help and as we collect more feedback we’ll create custom guides for using specific form builder / landing page providers.
14. **Is there case sensitivity in fields like advertiser name?**

    When checking for the appropriate advertiser name we do some common sense normalization including ignore case and redundant whitespaces.
15. **Do I need a new contract for this service?**

    Our Verify product offering is available to self service accounts. So you can start using it without a contract.
16. **Do I need an account?**

    Yes, an account is required to use any TrustedForm product offering or feature.
17. **What are the possible reasons for 1:1 Consent Check failure?**

      For information on the possible reasons for one-to-one consent failure, please refer to [Verify Product Errors](https://community.activeprospect.com/posts/5549054-verify-product-errors-on-api-v4-0).

Type something
