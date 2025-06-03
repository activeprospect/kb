---
URL: https://community.activeprospect.com/series/4539489/posts/4098942-filters-overview
Page Title: Filters Overview
Screenshot URL: images/screenshots/screenshot.png
Scraped At: 2025-06-02 19:41:51.247
---
6NfAYpt~hcTJBagMa1WhGSI9w7ZKTskaAhx1avRNz~stjWw7w0lYzpIukGinSsbjz4ECx-eq77AgI26YRv34OG8EnzQHPCXa1LdxTdSqr8yp9UeKsQPHMBUG40m9YGXWcJyzJdmjKh-4LtxXvaQ__&Key-Pair-Id=APKAIDFCFZ2UHE5LPIUA)](https://community.activeprospect.com/memberships/7557680-scott-mckee)

[_Scott McKee_](https://community.activeprospect.com/memberships/7557680-scott-mckee)

Updated June 15, 2023. Published December 1, 2020.

Details

# Filters Overview

LeadConduit filters are powerful, flexible, and critical to getting the most value out of the platform. To successfully configure a filter, keep a few simple principles in mind.

**Filters have only one function**: They decide whether to let the lead proceed on to the next step in the flow, or stop the lead at that point and issue a response, ""failure"" by default, back to the Source.

Filters are composed of one or more rules. If the rules' conditions are met, the filter stops the lead, sets the status of the lead and returns an outcome response back to the source, closing the Source's connection to LeadConduit for that submission.

**Filters are case-insensitive**: To a filter, ""TEST"" == ""test"" == ""Test"".

**There's more than one way to skin a cat**. You can filter out **red** leads by setting a filter to look for **is red**, or you can accomplish the same thing by setting the filter to look for **is not green, blue, white or black**. The shortest is often, but not always, the most efficient, so think flexibly.

**Layers and rule sets are your friend**. LeadConduit filters allow you to create one layer of **child** sub-rules that also must evaluate as true for the **parent** rule to evaluate as true. You also can create **rule sets** composed of multiple **parent**-level or **child**-level rules. Initiate a rule set by clicking a rule's **Convert this rule into a rule set** button, then adding additional rules to the set. Each rule set is evaluated separately as a group, and the outcome of the set is treated as if it were the outcome of a single rule.

These options create a lot of flexibility. Let's look at an example. Say you want to accept leads only from females aged 40 to 65. That means that, from the filter's point of view, you want to reject leads from all males, and reject leads from females who are not between 40 and 65. You could set up one filter to reject leads from males, a second filter to reject females over 65, and a third filter to reject females under 40, like so:

![](images/image-1.png)

Effective, but very clunky. Using a second-level rule set we can do the entire gender/age evaluation in a single filter. Note the use of **any** and **all** in the configuration:

![](images/image-2.png)

Note that the top level rules evaluate only gender (one rule for male and one for female) and reject the lead if either the lead is of either gender, but the female rule contains a second-level rule set that tests age, so the female gender rule is only true if the age is less than 40 or greater than 65.

Finally, let's allow for the possibility of a DOB date that's in the future, and the possibility that the gender is submitted as **other** (both are legitimate options for those fields in LeadConduit). In the process we can refactor the entire filter configuration for maximum efficiency using a top-level rule set for the age component:

![](images/image-3.png)

**Customizing the filter's response to the Source.**

**Customizing the Status**

If a filter's conditions are met, the lead's overall status and the response returned to the source can be either ""success"", ""failure"", ""error"", or it can match the status of any previous enhancement or delivery step in the flow.  You can choose which status to use from the menu in the filter's ""and respond to the source with..."" text.

![](images/image-4.png)

**Customizing the reason**

You can customize the reason returned in a filter's failure responses by typing your message into the box following the ""and the following reason"" text. You can insert any flow data values in your message by using the text box's ""Add field"" button.

Use caution when including fields if you're tracking rejection reason. Best practice is to use only fields that would have a limited number of possible values. You should avoid putting any PII or other lead-unique fields in the rejection reason.

![](images/image-5.png)

Type something"
