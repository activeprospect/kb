# Build a Flow \- Buyer

Flows are the heart of LeadConduit, housing your fields, sources, and the steps used to collect, enhance, filter, and deliver your leads. Let’s look at how to build a simple flow that collects leads from a webpage and delivers them to our fake MockCRM.  
---

## Background

You are the owner of Robert’s Robots, a new manufacturer of state-of-the-art robots. In order to generate sales leads for your robots, you are going to add a simple HTML form to your website where consumers can request more information. 

**Step 1:** Create Your Flow  
Let’s start with a fresh LeadConduit flow. You will need to log into your ActiveProspect account and navigate to the [LeadConduit dashboard](https://next.leadconduit.com). Click the **Flows** menu option and then click **Create New Flow**. This will launch the Flow Editor. Your flow will be given a default name based on today's date, you should click on the text and rename it by typing “Robert’s Robots.” Make sure to click the **Save** button when you are done.

**Step 2:** Pick your fields  
LeadConduit will automatically add a selection of the most used fields: First Name, Last Name, Phone 1, Email, Address 1, Address 2, City, State, Postal Code, and TrustedForm Cert URL.

In addition to the above fields, we want to add a text field for comments. To do that, first, click the **Add/Edit** fields button. Fields that have already been added to your flow will have a green checkbox next to them and will appear at the top of the list. Fields that are in any of your flows will have a green circle. se the **Search Fields** box to search fields, and locate the **Comments** field. You can also **Scroll** down the page to find fields. Once you have located the **Comments** field, click the empty **checkbox** to the left of the field name, then click **Update Fields**. Lastly, click **Save** to save the work you have done.

**Step 3:** Setup a Source  
Sources represent uniquely identifiable entities that supply leads to your flow. These can be websites/webforms, lead vendors or even Facebook Lead Ads. Let’s add a new custom source to your flow. Click **\+ Add Source.** Click **create a new custom source**, and then select **LeadConduit Standard** integration (you can learn more about source integration options, visit our Sources page). Then click the green **Next** button. Enter **Robert’s Robots Website** as the Custom Source Name and select **Website \- Leads obtained via your website or webform** from the Select a Source Classification drop-down, then click **Finish**. Lastly, click **Save** at the upper-right of the screen.

In order to make sure that you are able to contact your client, you only want to accept leads that include an email address. Click **\+ Add** under **Acceptance Criteria** in the **Robert’s Robots Website** row:  
![][image1]  
This brings you to the rules editor. Rules are used throughout LeadConduit. Click **Add Rule**. In the field that says **Flow Field**, start typing email, and you should get a drop-down, click **Email**. Change the **is equal to** (the operator) drop down to **is not blank**. Leads that do not include an email address will now be rejected before entering your flow. Ensure that the email field is filled out is one way to validate email data, but emails should also be formatted as username@domain (such as [support@activeprospect.com](mailto:support@activeprospect.com)). Let’s include a rule to require the email be properly formatted. Click the **\+** icon to add a new row. Again, enter Email in the empty **Flow field** textbox, and change **is equal to** to **format is valid**. Click **OK**. Lastly, click **Save**.

This has set *source-specific acceptance criteria**.*** If you want your acceptance criteria to apply to all sources, click the **\+ Add** button in the **Configure Flow Settings** row.

**Step 4:** Add your Steps  
Steps are where the magic happens. Once a Source has successfully posted a lead into your flow using the fields you've selected, that lead begins it's journey through your steps. There are three types of Steps for processing a lead in LeadConduit: Enhancements, Recipients, and Filters.

For the tutorial, we will be adding a single recipient and filter. 

Start by clicking on the **Steps** tab. You should see three options, **Add Enhancement**, **Add Recipient**, and **Add Filter**. Let’s get started by clicking **Add Recipient**. The **Add a Recipient** window includes a drop-down that lets you select from other LeadConduit accounts, your existing custom recipients, or any of a number of built-in recipients, like SalesForce, Hubspot or MailChimp. You can see a complete listing on our [integrations page](https://activeprospect.com/integrations/). In this case, we are delivering to our fake MockCRM, so click **create a new custom recipient**. This will bring you to the **Select Integration** screen, you can use the **Select** dropdown to scroll through the various built-in integrations, but we want to use **Form POST**. Locate **Form POST** from the dropdown and click it. On the next screen, enter **MockCRM** as the **Recipient Name** and select **No, this recipient represents one of my own systems**. LeadConduit may also recommend an existing Recipient with similar names.

Click **Next** to be taken back to the flow editor.

**Step 5:** Configure your step  
You should now see a **MockCRM** step in your flow editor. Click **Edit Field Mappings** to be brought to the **Outbound Mapping** editor. By default, the Outbound Mapping editor will include any required fields needed to function, in this case, it includes only the URL. Normally URL and a list of fields would be provided to you by your CRM provider as part of their submission (or posting) instructions. In this case, I have generated some very simple posting instructions below.

Submission URL: [http://www.mocky.io/v2/5c1016c53100002c0924f01e](http://www.mocky.io/v2/5c1016c53100002c0924f01e)  
Fields:

| Field Name | Description |
| :---- | :---- |
| client\_id | 178 (hardcoded) |
| fname | First Name |
| lname | Last Name |
| email | Email Address |
| ph1 | Phone Number |
| address1 | Address 1 |
| address2 | Address 2 |
| city | City |
| state | State |
| zip\_code | Zip Code |
| comments | User comments |

Successful Response:  
{“status”:”accepted”,”reason”:null}

Failure Response:  
{“status”:”rejected”,”reason”:”failure reason”}

Let’s start by copying the **Submission URL** into the **flow field or raw value** textbox in the URL map row:  
![][image2]

This is the only required field for the **Form POST** recipient integration to work, however, if you submitted a lead right now, none of the data in your fields would be sent to MockCRM. Let’s fix that.

Start by clicking **\+** in the URL row. In the **flow field or raw value** enter First Name, if you’ve done it right, it should turn blue-green. Once you click in the **recipient field** textbox, you should get a drop-down, select **Form Field**. Reviewing the submission instructions above, you will see that the field name is not First Name (or properly, first\_name), but is fname. By entering fname in the textbox, you are letting LeadConduit know how to send the data to MockCRM:  
![][image3]  
Complete the mappings for all of the fields.

Lastly, you might notice that MockCRM requires a static (hardcoded) client\_id. LeadConduit allows you to hardcode values by simply typing the value (178, in this case) into the **flow field or raw value** map:  
![][image4]

Finally, you will need to indicate to LeadConduit what a **successful** outcome for MockCRM is. This is given in the submission instructions under Successful Response. This is call response parsing. If you do not setup response parsing for a recipient, LeadConduit will assume all responses are successful. 

To setup response parsing for MockCRM, click the **\+** button in the Outbound Mappings, and in the **recipient field**, locate **Outcome Search Path** in the dropdown. In the **flow field or raw value**, enter **status**. This will tell LeadConduit to look in the **status** field in the response. Click the **\+** icon again, and in the **recipient field** textbox, select **Outcome Search Term** and place **success** in the **flow field or raw value** textbox. Finally, select **Reason Path** forms the dropdown in the **recipient field**. Enter **reason** in the **flow fields or raw value** textbox.  
![][image5]  
For more detailed information why and how we selected these fields, see **Response Parsing**.

Click **OK** and then click **Save**.

**Step 5:** Configure a filter  
Filters allow you to stop the flow. Once a filter triggers, no additional steps will be completed. A comment use of filters is to reject leads after they pass the configured acceptance criteria and enter your lead flow. A flow with no filters will always respond with a success to your source.

To get started, click **Add Filter**. This will add the filter to your step. You may (optionally) provide a name/description for the filter. In this case, we would use **MockCRM failures** to quickly identify the filter when looking at the flow.

Next, using the rules editor, select **MockCRM Outcome** from the **flow fields** dropdown. This tells the filter which field to use. LeadConduit supports complex, nested rules, to find out more visit LeadConduit Rules. For our purpose, we only are worried about the MockCRM outcome. Change the operator dropdown to **is not equal to** and in the **Select Outcome** dropdown, choose **success.** This rule says that if the MockCRM Outcome is not equal to Success, the lead should fail. You can either setup a static failure reason, such as **Failed rules**, this is done in the reason textbox. You can also use the **MockCRM Reason** that was populated from MockCRM. To use that, remove **Failed rules** from the textbox and then start typing **MockCRM Reason** in the textbox, and you should get a scrollbox that pops up so you can select the **MockCRM Reason** field.

Click **Save**.

You know have a simple flow that will ensure that leads have a properly formatting email and will deliver to a MockCRM.