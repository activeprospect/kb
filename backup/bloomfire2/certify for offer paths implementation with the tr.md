---
URL: https://community.activeprospect.com/posts/5291010-certify-for-offer-paths-implementation-with-trustedform-next
Page Title: Certify for Offer Paths Implementation with the trustedFormNext function
Screenshot URL: images/screenshots/screenshot.png
Scraped At: 2025-06-02 19:43:35.119
---
XOwqSDsscrXwXaeX7GVul~40gPmnsFLrhUh6GAx8ecwkkukdNoqZ1VHhg7tBC5KQ-I99fn2UDAYALMjSI6VmawfHnToAFyPZvu5XF7T8YLX4suJxaJCfPzqObQV8k5bWzscFmWSF6-DfyGtWxgg__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/8215141-ricky-mcmurtrey)

[_Ricky McMurtrey_](https://community.activeprospect.com/memberships/8215141-ricky-mcmurtrey)

Updated March 7, 2025. Published January 17, 2024.

Details

# Certify for Offer Paths Implementation with the trustedFormNext function

Sometimes referred to as ""coregistration"" or ""coreg"", Certify for Offer Paths allows site owners to break offers into individual certificates.

For more context, check out the community post [TrustedForm Certify for Offer Paths Overview](https://community.activeprospect.com/posts/5570619-trustedform-certify-for-offer-paths-overview).

To facilitate coregistration, we have added a global trustedFormNext function to TrustedForm Certify SDK. trustedFormNext creates a new TrustedForm certificate without the need to unload and reload the TrustedForm Certify SDK.

Example

The initial call:

**NOTE: The code below is not a replacement for your implementation of the TrustedForm Certify SDK, it is only an example.**

​x

13

1

```
<!-- TrustedForm -->
```

2

```
<script type=""text/javascript"">
```

3

```
(function() {
```

4

```
  var tf = document.createElement('script');
```

5

```
  tf.type = 'text/javascript'; tf.async = true;
```

6

```
  tf.src = (""https:"" == document.location.protocol ? 'https' : 'http') + ""://api.trustedform.com/trustedform.js?field=offer1_cert_url&ping_field=offer1_ping_url&identifier=coreg_beta_test&l="" + new Date().getTime() + Math.random();
```

7

```
  var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(tf, s);
```

8

```
})();
```

9

```
</script>
```

10

```
<noscript>
```

11

```
<img src=""https://api.trustedform.com/ns.gif"" />
```

12

```
</noscript>
```

13

```
<!-- End TrustedForm -->
```

Then when you move to the next offer (assuming showLoading() and hideLoading() provide an overlay):

**NOTE: This step is not optional. Any DOM mutations or other activity that happens between the call to trustedFormNext and the callback or promise being called or resolved has the potential to cause errors in the recording of the current and/or ""next"" certificate.**

```
xxxxxxxxxx
```

1

10

1

```
showLoading();
```

2

```
​
```

3

```
​
```

4

```
var options = { field: 'offer2_cert_url' };
```

5

```
function tfCallback(data) {
```

6

```
  console.log(data);
```

7

```
  hideLoading();
```

8

```
}
```

9

```
​
```

10

```
trustedFormNext(options, tfCallback);
```

Or with a promise:

```
xxxxxxxxxx
```

1

1

```
showLoading();
```

2

```
​
```

3

```
const options = { field: 'offer2_cert_url' };
```

4

```
trustedFormNext(options).then((data) => {
```

5

```
  console.log(data);
```

6

```
  hideLoading();
```

7

```
});
```

## Parameters

|     |     |     |
| --- | --- | --- |
| Name | Type | Description |
| options | object | An optional object with properties to be used for the new certificate. See options below. |
| cbReady | function | A callback that is called when the next certificate is ready. This can be used instead of (or in addition to) the promise returned by the call to trustedFormNext. No activity changes to the page or user interactions should occur between the call to trustedFormNext and the calling of cbReady or the resolution of the promise. |

### Options

|     |     |     |
| --- | --- | --- |
| Name | Type | Description |
| field | string | The name of the hidden field injected into the form. The value will be the certificate URL. |
| ping\_field | string | The name of the hidden field injected into the form. The value will be the ping URL. |
| token | string | The name of the hidden field injected into the form. The value will be the certificate URL. Note: This is effectively an alias for ""field"" above, that is not often used. |
| identifier | string | Change the identifier associated with the next certificate. This is not often used as the identifier is normally used to group certificates together. |

## Notes

- trustedFormNext is a global function added to window when the TrustedForm Certify SDK is loaded. Depending on your framework and/or toolchain, you may need to take extra steps to access the global window object.

- The parameters (field, ping\_field, token\_field) passed when the script is called will be used for the first certificate. When options are passed to trustedFormNext, they will be used for the subsequent certificate. If a given option is not passed, the initial value from the parameters (or defaults, if the parameter was not passed) will be used. This would also mean that the hidden fields injected by TrustedForm will have the values overwritten with those from the subsequent certificate.


## Response

The response object is passed to both the promise resolution and the callback.

|     |     |     |
| --- | --- | --- |
| Name | Type | Description |
| cert\_id | string | The certificate id. |
| external\_id | string | The ""identifier"" field, passed in as a parameter. |
| id | string | The certificate id. |
| ping\_url | string | The ping URL. |
| token | string | The full certificate URL. |

Type something"
