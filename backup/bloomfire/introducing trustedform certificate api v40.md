---
URL: https://community.activeprospect.com/posts/5066720-introducing-trustedform-certificate-api-v4-0
Page Title: Introducing TrustedForm Certificate API v4.0
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-3206fbca-becd-4d43-9224-c7d58503193f.png
Scraped At: 2025-05-30 00:16:22.617
tags:
  - trustedform
  - compliance
  - developer-focused
  - technical
  - data-management
  - analytics
  - beginner
secondary_tags:
  - conceptual
  - admin-focused
  - how-to
  - universal
  - operation
---

[![](https://content2.bloomfire.com/avatars/users/1405246/thumb/thumbnail.png?f=1620827893&Expires=1748567764&Signature=k2EnCRpiTRmRjLWA5M8R7-Q~ePGyjTegalEZr1l2l~eMY7xFC2FmIo-9OVSnDVpY--Mbi82MQMtP34UG13foga8dMzBCQXPMx9xZ6rTZuOwK4GntN5kl6ltaJW5O5hfTxErw7QwuwLQQFZMhZXzzoxPST5FL4ufGvdNExAJJnrRC0j73E2QDrOgs~ZI-UT83wHw8JAC3dI4sJywxG-Sz8cB8e1bez~Lkv58sV9LFMjjG0AEtHKl9lnpZ18yXsHxZBPQHp93RW96Xf4nR3shGoGD54gzpAp0Fi~UM5eF4kPQBsi-BnI~SwbfUI1KMOXLzmlqBFq7S~atB-d8kmcDaXQ__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7846678-christopher-williams)

[_Christopher Williams_](https://community.activeprospect.com/memberships/7846678-christopher-williams)

Updated September 5, 2024. Published May 18, 2023.

Details

# Introducing TrustedForm Certificate API v4.0

TrustedForm Certificate API v4.0 is the latest and recommended version when using the TrustedForm product offering. As part of this release we are highlighting changes below that are relevant to our community to help you understand what's new and update your integrations with our platform.

For full details please visit our [developer portal](https://developers.activeprospect.com/docs/trustedform/api/v4.0/tag/Certificate-URL/).

Are you a self-service customer? [View How to use API version 4.0](https://community.activeprospect.com/posts/5098113-trustedform-self-service-how-to-use-api-version-4-0/)

# General Announcement and Updates

New Product: TrustedForm Retain

[TrustedForm Retain](https://community.activeprospect.com/posts/4986362-trustedform-retain) is the newest product to join the TrustedForm product offering. It is a streamlined version of past products, TrustedForm Claim and TrustedForm Consent, used to store TrustedForm certificates in your account. Enjoy the latest version of our session replay technology with advanced navigation controls and more prominent placement of the most useful data to audit your certificates. This also includes several bug fixes to ensure that each certificate is the most accurate representation of the lead events captured within them and protection against incurring charges for repeated attempts to store a single certificate. If you become a managed customer and [verify ownership of your domains](https://community.activeprospect.com/posts/4649879-verify-domain-ownership) you can unlock special discounts for your first party leads.

Lead Matching

As published in the ActiveProspect blog, starting July 5th TrustedForm with enforce a [new data security enhancement which limits access to TrustedForm Certificate session replays](https://activeprospect.com/blog/trustedform-new-data-security-enhancement/) to parties who already have access to the consumer data contained within them. Due to this, the new API version requires [lead matching](https://community.activeprospect.com/posts/4766190-trustedform-lead-matching) to be performed when storing a certificate. This ensures that all parties involved in the lead generation process are better protected.

Page Scanning

The [page scan feature](https://community.activeprospect.com/posts/4078890-trustedform-page-scan) has historically be available in every API based product TrustedForm has offer. Searching for specific text can be a great way to learn more how a lead was generated and gauge its quality. As such, it is most aligned to the TrustedForm Insights product and will now exclusively be available as a part of it.

# Breaking Changes

Operations

TrustedForm Certificate API v4.0 introduces the concepts of operations. Operations are the actions that can be performed via the TrustedForm Certificate API. In order to use the API you must now include the operations you would like to run in your request. This allows you to specify exactly which operations you want to perform so that you can use them in isolation (ex. store a certificate without retrieving insights) or create whatever combination of operations you need. Most operations align with TrustedForm products so it was important for us to give you full control over when they are performed rather than bundling them together. This allows you to better manage your usage and the costs incurred.

Insights Data Points

Many customers don't yet need all of the data points available in the [TrustedForm Insights](https://community.activeprospect.com/posts/4709758-trustedform-insights) product and don't want to manage data they aren't using. In order to accommodate this we have changed the structure of requests for insights to require that you pass the specific data points you would like to be returned in the response. This ensures that you get exactly what you want and can follow [data minimization](https://www.trendmicro.com/vinfo/us/security/definition/Data-Minimization) principles.

API Schema

With TrustedForm Certificate API v4.0 comes an entirely new API schema. This mostly changes how properties are organized to make it more readable and easier to understand. In order to adopt this new schema you must create completely new parsing logic as the changes are too drastic to simply modify any former logic. Please view the new schema in the [full API documentation](https://developers.activeprospect.com/docs/trustedform/api/v4.0/overview/).

# Deprecations

Programatic Retrieval of Share URLs

The Share URL response property was deprecated in TrustedForm Certificate API v3.0, but it is important to highlight this again as v2.0 is still in use. Share URLs are special URLs that allow anyone to view a TrustedForm certificate without authenticating within the TrustedForm application. These are very convenient to use when responding to demand letters or as evidence during litigation. We found that returning these URLs in the API response was a cavalier decision due to the sensitive nature of TrustedForm certificates. Therefore we have decided to stop this and only allow Share URLs to be retrieved when viewing a TrustedForm certificate to encourage more secure practices.

The following will be sunset in the near future:

- [TrustedForm Certificate API v2.0](https://developers.activeprospect.com/docs/trustedform/api/v2.0/overview/#section/Overview)
- [TrustedForm Certificate API v3.0](https://developers.activeprospect.com/docs/trustedform/api/v3.0/overview/#section/Overview)
- TrustedForm Claim
- TrustedForm Ping API
- TrustedForm Consent

Type something"

