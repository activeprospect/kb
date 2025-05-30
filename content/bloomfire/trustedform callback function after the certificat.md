---
URL: https://community.activeprospect.com/posts/4076703-callback-function-after-the-certificate-is-inserted-into-your-form
Page Title: TrustedForm Callback Function After the Certificate Is Inserted Into Your Form
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-eadbc6b8-7a23-4166-889a-973d35779c6b.png
Scraped At: 2025-05-30 00:16:29.507
---

[![](https://content2.bloomfire.com/avatars/users/1405246/thumb/thumbnail.png?f=1620827893&Expires=1748567764&Signature=k2EnCRpiTRmRjLWA5M8R7-Q~ePGyjTegalEZr1l2l~eMY7xFC2FmIo-9OVSnDVpY--Mbi82MQMtP34UG13foga8dMzBCQXPMx9xZ6rTZuOwK4GntN5kl6ltaJW5O5hfTxErw7QwuwLQQFZMhZXzzoxPST5FL4ufGvdNExAJJnrRC0j73E2QDrOgs~ZI-UT83wHw8JAC3dI4sJywxG-Sz8cB8e1bez~Lkv58sV9LFMjjG0AEtHKl9lnpZ18yXsHxZBPQHp93RW96Xf4nR3shGoGD54gzpAp0Fi~UM5eF4kPQBsi-BnI~SwbfUI1KMOXLzmlqBFq7S~atB-d8kmcDaXQ__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7846678-christopher-williams)

[_Christopher Williams_](https://community.activeprospect.com/memberships/7846678-christopher-williams)

Updated March 25, 2024. Published November 9, 2020.

Details

# TrustedForm Callback Function After the Certificate Is Inserted Into Your Form

Publishers may find it useful to have a callback fire after the TrustedForm script has inserted the Certificate URL into the form. The TrustedForm script supports this option by calling the global function named `trustedFormCertIdCallback` with a single argument, the TrustedForm Certificate ID. The `trustedFormCertUrlCallback` is also available if you want the full Certificate URL rather than just the ID.

In order to implement this callback, you must define the function `trustedFormCallback` before loading the TrustedForm script.

For example, this script will pop up two alert boxes with the ID and URL of the TrustedForm Certificate.

`    // the callback
    <script type=""text/javascript"">
      function trustedFormCertIdCallback(certificateId) {
        alert(""Certificate ID: "" + certificateId);
      }
      function trustedFormCertUrlCallback(certificateUrl) {
        alert(""Certificate URL: "" + certificateUrl);
      }
    </script>
    // the TrustedForm script wrapped in a function
    <script type=""text/javascript"">
    (function() {
    /*Place the core TrustedForm Script here`

`    Obtain the core script by clicking ` [`TrustedForm Web Script`](https://sso.activeprospect.com/trustedform/script) ` at https://activeprospect.com`

`    */`

`    })();
    </script>`

Please note, these callbacks are only fired _once_, regardless of how many forms the TrustedForm script inserts the Certificate URL into.

Each callback is strictly optional and can safely be ignored. If the callback functions are not defined, then the callback function is ignored by the TrustedForm script.

Type something"

