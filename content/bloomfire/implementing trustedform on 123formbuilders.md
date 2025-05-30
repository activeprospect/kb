---
URL: https://community.activeprospect.com/series/4720459/posts/5189112-implementing-trustedform-on-123formbuilders
Page Title: Implementing TrustedForm on 123FormBuilders
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-501ab3eb-354f-4415-840d-1c0f20aa55e7.png
Scraped At: 2025-05-30 00:16:52.700
---

[previous page](https://community.activeprospect.com/series/4720459/posts/4388124-trustedform-certify-and-multi-step-forms) 3 of 8 [next page](https://community.activeprospect.com/series/4720459/posts/4062119-wordpress-form-generators-and-trustedform)

In Series: [Implementing TrustedForm Certify on third party form builders](https://community.activeprospect.com/series/4720459-implementing-trustedform-certify-on-third-party-form-builders)

[![](https://content2.bloomfire.com/avatars/users/1966401/thumb/thumbnail.png?f=1692038964&Expires=1748567804&Signature=cIaqzD1aCEnFNedh3WRtWp-cGUPhNBlskGS368~XD-9QNa~T9gzOooBeuqNV2SrsLwX6cADxy7nSEBoIsifwFYtzP8hn~5ImbVsIq7RJEOfy6QLZWG3FTVZk70vVR1I3Q5aOTN7ncLwdjIxObIIeIpvsQO230FZXNowFFcEjCD~Cmy2PVptuFlHrYhFOESC0gw3s2GfwdaFYgeEK7hnHqXyOaf5v4nY9z2w~64TqBARra6XihO0JeTZ1~LEeUf67mXE89i65N5~Jgi0u520ubruxBf7K9jVeTFHCeKQ2dv4n9PEyLstMMOA9hSeWRA2fFzMfFGxd1KZ0hssLyzYWXw__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/9624817-ayesha-akhtar)

[_Ayesha Akhtar_](https://community.activeprospect.com/memberships/9624817-ayesha-akhtar)

Updated February 21, 2024. Published October 12, 2023.

Details

# Implementing TrustedForm on 123FormBuilders

How to add TrustedForm to a 123FormBuilders form.

Begin by logging into your FormBuilders account.

Select the form you want to use with TrustedForm by clicking edit or create a new form:

![](https://content2.bloomfire.com/thumbnails/contents/003/923/768/original.png?f=1697076499&Expires=1748567804&Signature=b68QIExp3wagKVOjkrYAyni2CBDbYzpJFKi8CUuP6XJh4bwwiVOWE30AGkszjt~wRtMyNYkti9X02cZ4D4cVzq3jL5kinDeAdTVUnre~bvBMHyZRAHrh~KENsyb08mkcMnLtr8wU67NjQ0GiKqteluOM2rAFagPBwbkNVh4Op8vSVh~g3tDhZTMMOhcj~f-aMgrDKgDllxetGpXbrJARXW6L~AtlcaQHxZFLFYALH015xwHqQTdG0ioZWIRo-D8TA2iAjcYN~b4DOZBTk03ltrxhlPiDudQCAIS06adxxgiiZxbGu~aB91S0~Ce2haTZBYv~xvIMtZIAQa37TNLqrQ__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

Click on the 'Set up' tab:

![](https://content2.bloomfire.com/thumbnails/contents/003/923/769/original.png?f=1697076862&Expires=1748567804&Signature=QdTyn13KdpEwdwmM3Vv-TtN6AVKz~oHQHX3oyvmH6a4UObgwFvxZPpUgkOWsmCepy1pGJUBQj27S-44tTCwiBYFPqBej5IjGlf580InMJNhyAOJw7cP6B1qXicGT7Sl0cNGQmZoKSAxO~pVj6-M9DPT5gpkmNJw3~C2K6VFzcOv6i032iG4bFfqLTaBNxhqntQACdWzIw8q3YYSxSnRxjjzG55Sfn4di-7urb~3SL4T66r6K3V6exwvJHGAm2aF-78GomUAhSwuUACZSn2uOo1Hd3dwP7XH2YQ1CRnxYktiG~MmgKo80evVdUZ-PJm80eol1xID9cPZsOrPFrP1-8w__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

Then click on 'Advanced' on the left side bar:

![](https://content3.bloomfire.com/thumbnails/contents/003/923/778/original.png?f=1697077120&Expires=1748567804&Signature=uE80c5ybEmm0qh36pm8VJDZD4vI43EucIjlR0QP9BzhfkfpLWPU-DTIIzVDZnG8IV7ejtm8qJnFiqUhHjOsH-A1efzv3beXXNWEE58ORgMF1dL9rlO4rvDZnu03yqV6XPHS7m8H~i7JCyMH~s0QbcRLHGNOrq6d~BblodTZMBOESxxdik4zCPxxCRQIyuGlzkQnlBozGe8-oSaSIFyPLzxEraaOV4SlpozIFj0ndUBfepBgQM~5AsL3raMFkrzFhmql6jX1pdFS0hVJc0wAOWZROB95Egiwj40RKH6dEK~cK2MkFxY5oHJPJ0p~Wyln0Kng3D9BfM2-m2V4yDa5gsA__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

Then click on the 'Form' tab. Then select 'Add a JS script to your form'.

Here we will be entering the URL of a .js file which holds the TrustedForm script.

To do that, first create a JS file that holds our TrustedForm script, then upload the JS file on a trusted web server or your own and use the URL where the file is located (e.g. https://mydomain.com/my-javascript.js). There are web services that host JavaScript files for you, but they represent certain risks, such as data corruption or service retirement. That’s the reason why it is best to host them on a web service where you have administrative access.

Once you have entered the URL of the JS file, click on 'Save', as follows:

![](https://content3.bloomfire.com/thumbnails/contents/003/923/784/original.png?f=1697077679&Expires=1748567804&Signature=QSTTXm7sbVsr3tRBdiRGRk0j424Ckzx03EdzT8HNZudmjF7u9a7fW54zRupB2iXQVD~8JoU8UusmC1a3aHqaUCFbRaydXhZWYT8~XyxLtEsWqfrq5EpnwaI5YyzJucPUpGdiRRj9sD-Z77AR-p8ieFrvQnJb4UlCLCQF-dvHp6t2AW8Aii8BqVOCvoXrVL3QUv2gA2zYzshg0Hzfl6ioWXlhxF6xIran0H61sYy8tpjIQ6iUvKNm9feotfzdlSvAo8uUq9KSmqkw94YnV018GWm9xK7~RTsd~nafZvDTC6CPT97B7z~9yFqMDixyP3fX-a-su1-OQh5pioc~tvAO4w__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

That's it! Now you should be able to publish and test the form, and the certificates should be created successfully.

Type something"

