---
URL: https://community.activeprospect.com/posts/4918830
Page Title: TrustedForm Verify
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-61c12924-66cf-42c1-baf6-22b7d6d8e552.png
Scraped At: 2025-05-30 00:16:48.293
---

[![](https://content2.bloomfire.com/avatars/users/1405246/thumb/thumbnail.png?f=1620827893&Expires=1748567774&Signature=WTTOqztRC7U-S55SOSIf9P3hqE6TNryUy3kqOV4rwBHGDb0Ckl8tieyFbTt9JkDhY5eT2-0nExUlIdUHmcbo~MLaS3OfaLy640OprXvFuAj8jiiiAKvuaNvNO~5TB5YvqgdhNVMxIEoumXqj0k4QPs~MzWZsTWVsufLlvfbmqiCJodrggo81OdQLyzMKVl3rcVUyhjdXKypx89V831oePVWQhGNETN6RZ96OOquiqMR7h2lXD4s7wxNUu2TgO8TUVHu65sI0F~1cswXJqCN9PzSusja9hm7~xyvDe~RncAW3QgSB9IO809B0dAFmhhUJzh-2tQ65jH3MfYLjgzSrzA__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7846678-christopher-williams)

[_Christopher Williams_](https://community.activeprospect.com/memberships/7846678-christopher-williams)

Updated May 20, 2025. Published January 13, 2023.

Details

# TrustedForm Verify

Verify is a TrustedForm product offering that allows you to assess if a consumer gave their express written consent to be contacted when purchasing 3rd party leads. You can set rules that enable you to determine whether lead events meet the requirements set by your legal and/or compliance teams to keep your business safe and ensure the consumers you contact wanted you to reach out. By making a simple API call you will be able to verify the following:

- You have approved the consent language presented during the lead event
- The consumer specifically and explicitly consented to hear from your company
- The consent language was presented in a clear and conspicuous manner

# How It Works

Ask your lead vendors to implement [TrustedForm Certify](https://activeprospect.com/trustedform/certify) and send a TrustedForm Certificate URL along with the leads you purchase from them. Then use our [Certificate API](https://developers.activeprospect.com/docs/trustedform/api/v4.0/tag/Certificate-URL/) to make a request to verify your lead and send the results to the system you use to make purchasing decisions.The API response will inform you if the certificate meets the requirements you have set. If not, you may want to immediately reject the lead, flag it for a manual review, or use non-regulated contact methods. If your requirements are met make sure to retain the certificate so that you have proof of the consent you have verified and you can confidently purchase the lead and contact the consumer

Verify makes the following checks available to enforce the requirements you have set for your leads:

- [Approved Language Check](https://community.activeprospect.com/posts/5474009-trustedform-verify-approved-language-check)
- [Font Size Check](https://community.activeprospect.com/posts/5561944-trustedform-verify-font-size-check)
- [Contrast Ratio Check](https://community.activeprospect.com/posts/5561943-trustedform-verify-contrast-ratio-check)
- [Opt-in Type Check](https://community.activeprospect.com/posts/5619028-trustedform-verify-opt-in-type-check)
- [1:1 Consent Check](https://community.activeprospect.com/posts/5471724-trustedform-verify-1-1-consent-check)

View the [implementation guide](https://community.activeprospect.com/posts/5253900-trustedform-verify-implementation-guide) for help getting started.

# Frequently Asked Questions

1. **How do I get access to TrustedForm Verify?**

New customers should contact [sales@activeprospect.com](mailto:sales@activeprospect.com). Contracted customers must contact their account manager for purchase. Self-service customers must enable it in the [Features hub](https://account.activeprospect.com/features).

2. **Will this allow me to view and retain TrustedForm certificates?**

No, in order to view TrustedForm certificates you must use TrustedForm Retain to get view access and retain certificates in your account.

3. **How should I communicate the requirements I have set in Verify to my lead vendors?**

TrustedForm Verify can be used to enforce requirements and check them in an automated fashion. However, communication of these to your vendor must still be handled independently of TrustedForm. We recommend you document your requirements, send them to your vendors and get confirmation that they have made any necessary changes before you begin rejecting leads that fail your acceptance criteria.

4. **How do I use the API?**

Verify is available as part of the TrustedForm Certificate API once your account has been given access to it. You must have a development team that is able to build a custom solution using the [verify operation](https://developers.activeprospect.com/docs/trustedform/api/v4.0/tag/Verify/) or a lead distribution software that has integrated with TrustedForm Verify. If your current software does not support this reach out to their team to request it or consider using [ActiveProspect's LeadConduit](https://activeprospect.com/leadconduit/) which stays up to date with all of TrustedForm's newest features and product offerings.

5. **Can Verify be used with masked certificates?**

Yes. Masked certificates obscure the source from which they were generated. Verify does not inherently reveal any information directly about the source so it can be used with a masked certificate. If information about the source of a website is revealed in it's consent language then it is the publisher's responsibility to make any necessary edits to their consent language to prevent this in the future.

6. **What are the possible Verify failures?** Visit the [documentation here](https://community.activeprospect.com/posts/5415514-trustedform-possible-failure-outcomes-on-api-v4-0) to learn about the possible failure outcomes under Verify.

7. **Can I test Verify without rejecting leads?**

Yes, Verify itself doesn't cause your leads to be rejected. It returns a determination of whether or not they met specified criteria. Generally a lead distribution system such as LeadConduit will manages lead rejection. This means to test Verify without rejecting your leads you should set up a process that will make a Verify request to get the information and report on it but not act on it until you are ready.

8. **Is there a way to set up different criteria for different sources, locations or types of leads?**

TrustedForm Verify does not have this capability directly, but this possible using LeadConduit. LeadConduit gives users the flexibility to build flows with steps that only run under certain conditions. By taking advantage of this you can customize your Verify request using any of the data available with your lead.


Type something"

