---
URL: https://community.activeprospect.com/posts/4126647-using-gravity-forms-in-wordpress-to-submit-to-leadconduit
Page Title: Using Gravity Forms in WordPress to Submit to LeadConduit
Screenshot URL: https://service.firecrawl.dev/storage/v1/object/public/media/screenshot-322da732-4f44-4957-93fb-19ea559ec1d8.png
Scraped At: 2025-05-30 00:16:11.044
---

[![](https://content1.bloomfire.com/avatars/users/1317000/thumb/thumbnail.png?f=1617311121&Expires=1748567752&Signature=X9fj59kSmWD-4zTnYmepc5gKRqn2PVncexDVa9LApbv-iop7C63UHcLx-fmxxAoLfRrlGiNk-rg7X~UUep8r-a8vX6Tk1P1Bra5LYbgpGLC9HWJBpqE5XIPK4BasUHX4ECchDubxZawERW9evx5dHSjZn1wkV9E9~XY8T4kDPRHDwRQn~DCD7Juh~~yOnadsDl-CUOcQZiZBOlTYMLytIDjBPLpNmADr0avpxQbIwEmHzOpMn~QvpKFhZkCn29EcInQ9YaKnmkoXBT-FopoN74PSKZuhnhN8-uhwLbtvlUlJv~uQYG8ise8NP2nQS~BfpVJiWF1xeERmGTQWG1GzSg__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7557680-scott-mckee)

[_Scott McKee_](https://community.activeprospect.com/memberships/7557680-scott-mckee)

Updated November 13, 2023. Published January 11, 2021.

Details

# Using Gravity Forms in WordPress to Submit to LeadConduit

Learn how to send leads to LeadConduit from Gravity Forms on your Wordpress site.

### 1\. Install Gravity Forms on WordPress and create your form

After obtaining your Gravity Form license, install Gravity Forms on WordPress by following the [instructions](https://docs.gravityforms.com/getting-started/#installing-gravity-forms) on their website.

Create a form by first clicking on ""Forms"" on the left pane of your WordPress Dashboard's Home page and then click **Add New**.

![](https://content1.bloomfire.com/thumbnails/contents/002/456/827/original.png?f=1610396851&Expires=1748567764&Signature=UKhiHP6sd~TkiWCX6vkH61Dk23SZS~c-OHsAh8WI-DQ5QzPyEyn~IYXfRr6D24iL29udHARbIks2PDwooU8IWH~FFCKoXkDtw-HBOh9C5tp6thdlT6i283S~B27XjE0lU5XPLW9HEfYgtO~DXU5YERwh-f1Xeg7phtETFSz6aB2vdUP8dy57dIbV0F5ARif3vVkUaWt6lvG9cn6EjPcmJYKqFV00MXYU09khps2JzHm6fcVRE3H7zQwfq9UqLpXPFtIOO5fLUOVPWj1QA6GAW7cj-U3R6VNXCdo4idwHQCk5ptWTZ8pmqO1VossIi1TEje0BsCUA4X3q9gyFPttDBQ__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

### 2\. Configure Gravity Forms to send leads to LeadConduit

To send lead data into LeadConduit, you will need to use the “Forms” plugin. _This step will only set LeadConduit as the location to send data; we will map the actual data being sent in the next step._

To install Forms, mouse over the **Plugins** button on the left pane of your WordPress site and select **Add New**. Type in “forms 3rd Party” and you will find the “Forms: 3rd-Party Integration” in the list. Install and activate the plugin.

![](https://content3.bloomfire.com/thumbnails/contents/002/456/838/original.png?f=1610397030&Expires=1748567764&Signature=VxuySremGy6Ecf7ziIUQ0uHgbF-nonFde8t5rADhXe0vYYmX4ya9XTiabk2fO7q94ARF3ZE-zqPRzcYvbhDrfir7NWl9G7wrpHh1xuycpXiC7zFGWoOn1vqCBEn1Z6uPlB2VPf6VYk47pOW6543ApsKXlPiqb4oYogqE8-ldq2kD5fMeAgaAIumhqhyXNswWy4rC90ZFYiHLXJf7WaMex5SHluIEpswG1NSlQ3~hk5O2InuSNSBJFf45KSYXxQxnPHfGmMZDnBdMXwbvHx0ZVulecPAwOjgDmhw5eJabRXmoHzgreFMHvuGcsSOcmTyR3oPJzUnwyaywYxKWI1lkkw__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

**3\. Set the location to which the Forms integration will send lead data.**

Mouse over **Forms** and click on **3rdparty Services** in the expanded menu. In the **3rd-Party Service: Forms Test** section, find the Submission URL box. This is where you will enter your LeadConduit posting URL, found in your [Submission Docs](https://community.activeprospect.com/posts/4109880-finding-and-using-submission-docs).

![](https://content0.bloomfire.com/thumbnails/contents/002/456/844/original.png?f=1610397242&Expires=1748567764&Signature=LjXzlwfoOL0p28tn8t-1tD8FAFdY7cxuJAiAzatPTmi1djB75FmNwv6xN3zuMpTXKWIuJdfEugqZoFDBkEyeInAKBZ5vhKpNMfK9A7yS0ZYaHHFsQbALxL~DYlGp8SnZmrU~SNZmKqe-h98TGc3gyjtnYS6BjCgaZ-BvcAo5uoKwlcFwUBa6RsTQxaixIzLK6a2WM5CowK5R2PJwlHyvV74PL~GIGmlOkA8PsjiYkZAfQuq28l~ersj4LRp~LDxNJldW8JBlz-pijJDA8WGgHGlzpATucZvQGlhmArhJPVnPoK2lvL7BV9RG~Rg4ZBUOb1fnaHKYZrNrot-4rtmFyw__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

**4\. Map your Gravity Form fields to LeadConduit fields**

Gravity Forms now knows _where_ to send the lead data, but the form fields must still must be properly mapped, so you will need to map the Gravity Form fields to send data to LeadConduit fields.

Scroll down and find the **Mapping** subsection. Here you will map the form’s fields (the Form Submission Field) to LeadConduit flow field labels (3rd-Party Field). The LeadConduit flow field labels can be found in your [Submission Docs](https://community.activeprospect.com/posts/4109880-finding-and-using-submission-docs).

![](https://content3.bloomfire.com/thumbnails/contents/002/456/858/original.png?f=1610397344&Expires=1748567764&Signature=Z8hFUbzipklXHJCMH54FbS8kgefJZunUf7CjcYB7htUb-fb~39JquYtaAqi7MTgEmVQwC6vwD-neajcUGk6edwraFb-PAwx6fDoutwlY~PeVFpchnl35rjvnoUOEQFrhdSq6ynItPHxTRfmfiN6uNNevLty5rghgBdZgx~DMQxbeWAs7~7OgUdt7Hq78MmZQAKmx4AwcMNlQztAx-FhGo2ZmwqzaZcU9Cyw~wWw5epkTN4g3eMIC27ET91dvCeUaq4X1zhZi1oF8SRYWxHbf6W5uRf2IIIrC48hXArWkbA9VlaZwkcy9J4oOGLuCAxdOGqQzgB7-mNuzgVpgqEyWmQ__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)

Keep in mind that the third-party plug-in is only capable of sending data if the form element’s [input name](https://www.w3schools.com/tags/att_input_name.asp) has a single “\_” prefix. For example, where \`input\_18\` would be acceptable, \`input\_18.1\` would not be. For this reason, we suggest the use of form element types like “Single Line Entry” and “Radio Button,” as their input names follow the acceptable syntax.

**Your Gravity Form is now ready to send lead data to LeadConduit.** If you’d like to configure more than one form for lead submission to LeadConduit, click the “Add Another Service” button at the bottom of the mapping menu and repeat this process.

Type something"

