---
URL: https://community.activeprospect.com/posts/5098113-trustedform-how-to-use-api-version-4-0
Page Title: TrustedForm: How to use API version 4.0
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-107f31c6-7320-4177-8f01-ea33e2313f11.png
Scraped At: 2025-05-30 00:16:15.507
tags:
  - trustedform
  - intermediate
  - developer-focused
  - technical
  - compliance
  - how-to
  - business-logic
secondary_tags:
  - buyer-focused
  - data-management
  - admin-focused
  - best-practices
  - beginner
---

[![](https://content2.bloomfire.com/avatars/users/1405246/thumb/thumbnail.png?f=1620827893&Expires=1748567764&Signature=k2EnCRpiTRmRjLWA5M8R7-Q~ePGyjTegalEZr1l2l~eMY7xFC2FmIo-9OVSnDVpY--Mbi82MQMtP34UG13foga8dMzBCQXPMx9xZ6rTZuOwK4GntN5kl6ltaJW5O5hfTxErw7QwuwLQQFZMhZXzzoxPST5FL4ufGvdNExAJJnrRC0j73E2QDrOgs~ZI-UT83wHw8JAC3dI4sJywxG-Sz8cB8e1bez~Lkv58sV9LFMjjG0AEtHKl9lnpZ18yXsHxZBPQHp93RW96Xf4nR3shGoGD54gzpAp0Fi~UM5eF4kPQBsi-BnI~SwbfUI1KMOXLzmlqBFq7S~atB-d8kmcDaXQ__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7846678-christopher-williams)

[_Christopher Williams_](https://community.activeprospect.com/memberships/7846678-christopher-williams)

Updated February 13, 2024. Published June 28, 2023.

Details

# TrustedForm: How to use API version 4.0

TrustedForm Certificate API v4.0 is the latest and recommended version when using the TrustedForm product offering. View [Introducing TrustedForm Certificate API v4.0](https://community.activeprospect.com/posts/5066720-introducing-trustedform-certificate-api-v4-0) for more details about what's new. All self-service customers using older versions must make changes to their API requests to begin using v4.0 by **January 1, 2024**.

Professional and Enterprise customers who would like to use it should contact their client success manager to gain access before making an attempt. Below are a few easy steps to help you make the necessary changes.

**1\. Add ""api-version: 4.0"" as a HTTP header to your existing request**

The [api-version header](https://developers.activeprospect.com/docs/trustedform/api/v4.0/tag/Certificate-URL/#tag/Certificate-URL/operation/runOperations!in=header&path=api-version&t=request) is how the TrustedForm Certificate API determines which version of the request/response structure to use to interpret and process your request. You will only have access to the support versions released after the version your account is configured to use. You can check this by visiting [https://app.trustedform.com/settings](https://app.trustedform.com/settings?__hstc=41051389.878e47cf92028a7aea017536738b0668.1748564168768.1748564168768.1748564168768.1&__hssc=41051389.1.1748564168768&__hsfp=3707738794).

​x

1

```
Content-Type: application/json
```

2

```
Authorization: Basic ************************************************
```

3

```
Api-Version: 4.0
```

**2\. Add the** [**retain**](https://developers.activeprospect.com/docs/trustedform/api/v4.0/tag/Retain/#tag/Retain/schema/RetainParameters) **and** [**match\_lead**](https://developers.activeprospect.com/docs/trustedform/api/v4.0/tag/Match-Lead/#tag/Match-Lead/schema/MatchLeadParameters) **objects to your request body**

One of the biggest changes in v4.0 is that you must now pass the operations you would like to execute as part of your request. This enables us to expand the operations you are able to perform and offer new products as part of the same API over time. As a self service customer you currently only have access to the Retain product. View the [retain operation section of our API documentation](https://developers.activeprospect.com/docs/trustedform/api/v4.0/tag/Retain/) for details on how to format your request. Please include both the match\_lead and retain operation in your request, as in the following example of a payload:

```
xxxxxxxxxx
```

1

10

1

```
{
```

2

```
  ""match_lead"": {
```

3

```
    ""email"": ""consumeremail@gmail.com"",
```

4

```
    ""phone"": ""3033294595""
```

5

```
  },
```

6

```
  ""retain"": {
```

7

```
    ""reference"": ""Weblead"",
```

8

```
    ""vendor"": ""Vendor Name""
```

9

```
  }
```

10

```
}
```

**3\. Make any necessary adjustments to your integration**

If you were previously ingesting any information from the response provided by the TrustedForm Certificate API please see the new Retain Response in the [retain operation section of our API documentation](https://developers.activeprospect.com/docs/trustedform/api/v4.0/tag/Retain/) and use the new path to retrieve the properties you want. We recommend using the [outcome](https://developers.activeprospect.com/docs/trustedform/api/v4.0/tag/Certificate-URL/#tag/Certificate-URL/operation/runOperations!c=200&path=outcome&t=response) property to determine your next steps. You can find our [full API documentation here](https://developers.activeprospect.com/docs/trustedform/getting-started/).

When outcome is...

**""success""** \- No action is necessary. The certificate has been retained in your account.

**""failure""** \- The certificate has been retained in your account but as failed to meet best practices. Please review the value in the ""reason"" property and manually review the certificate before contacting your lead.

**""error""** \- The certificate could not be retained. Please review the value in the ""reason"" property for an explanation, correct the problem and try again.

**That's it! Now you are using version 4.0 of the TrustedForm Certificate API.**

# Frequently Asked Questions

1. **Will versions 2.0 and 3.0 stop working?**

Yes previous versions will be sunset and no longer available after **December 31** **st, 2023 for Self-Service customers**. If you're in this group you should have received an email notification explaining this.

2. **How does this affect self-service pricing?**

Your pricing for API usage will not change until you start using version 4.0. The product offering in the v4.0 API is different, with different pricing.  Depending on your needs and usage, your costs may vary.

Customers using v2.0 will be switching from a flat fee per certificate to our tiered structure. Once your volume reaches the higher tier you'll find that your unit cost becomes lower than it currently is.

Customers using v3.0 are already being charged based on our tiered structure but will now have the opportunity to received a discounted rate for certificate generated from their [verified domains](https://community.activeprospect.com/posts/4649879-verify-domain-ownership)!

Visit [https://activeprospect.com/pricing](https://activeprospect.com/pricing/?_gl=1*1tpu3vi*_ga*MTU1NjIxNDM1NC4xNjQyNzkzOTI2*_ga_QHXBV6N7D1*MTY5MDg5OTQ5MC4yNTUuMS4xNjkwODk5NjE2LjIuMC4w) for more details.

3. **How do I access to lead event data like IP address, originating domain, lead age, etc.?**

These data points were included for self service customers using v2.0. Now they have become part of the [TrustedForm Insights](https://community.activeprospect.com/posts/4709758-trustedform-insights) product. To purchase Insights [submit your information](https://activeprospect.com/pricing/#form) to be contacted by our sales team.

4. **How do I access the page scan feature?**

Page scan has also become a part of the [TrustedForm Insights](https://community.activeprospect.com/posts/4709758-trustedform-insights) product. To purchase Insights [submit your information](https://activeprospect.com/pricing/#form) to be contacted by our sales team.

5. **If I switch API versions mid-month how does that affect my self service pricing tier?**

When you switch API versions you will be using a new product, so your pricing tier will be reset. To avoid missing out on any lower pricing that you have qualified for we recommend switching your api-version at the beginning of the month.

6. **Does it require a different javascript snippet to record?**

No. The Certificate API does is not related to this.


Version 2.0/3.0 Example Node.js Request

```
xxxxxxxxxx
```

1

25

1

```
import fetch from 'node-fetch';
```

2

```
​
```

3

```
async function run() {
```

4

```
  const certificateURL = 'YOUR_CERTIFICATE_URL';
```

5

```
  const resp = await fetch(certificateURL,
```

6

```
    {
```

7

```
      method: 'POST',
```

8

```
      headers: {
```

9

```
        'Content-type': 'application/json',
```

10

```
        Authorization: 'Basic ' + Buffer.from('APIKEY:<YOUR_API_KEY>').toString('base64')
```

11

```
      },
```

12

```
      body: JSON.stringify({
```

13

```
        email_1: 'user@example.com',
```

14

```
        phone_1: '512-555-1234',
```

15

```
        reference: '1128238382829',
```

16

```
        vendor: 'Acme Co.'
```

17

```
      })
```

18

```
    }
```

19

```
  );
```

20

```
​
```

21

```
  const data = await resp.json();
```

22

```
  console.log(data);
```

23

```
}
```

24

```
​
```

25

```
run();
```

Version 4.0 Example Node.js Request

```
xxxxxxxxxx
```

1

30

1

```
import fetch from 'node-fetch';
```

2

```
​
```

3

```
async function run() {
```

4

```
  const certificateURL = 'YOUR_CERTIFICATE_URL';
```

5

```
  const resp = await fetch(certificateURL,
```

6

```
    {
```

7

```
      method: 'POST',
```

8

```
      headers: {
```

9

```
        'Content-Type': 'application/json',
```

10

```
        'Api-Version': '4.0',
```

11

```
        Authorization: 'Basic ' + Buffer.from('<username>:<password>').toString('base64')
```

12

```
      },
```

13

```
      body: JSON.stringify({
```

14

```
        match_lead: {
```

15

```
          email: 'user@example.com',
```

16

```
          phone: '512-555-1234'
```

17

```
        },
```

18

```
        retain: {
```

19

```
          reference: '1128238382829',
```

20

```
          vendor: 'Acme Co.'
```

21

```
        }
```

22

```
      })
```

23

```
    }
```

24

```
  );
```

25

```
​
```

26

```
  const data = await resp.json();
```

27

```
  console.log(data);
```

28

```
}
```

29

```
​
```

30

```
run();
```

Type something"

