# Building Your First Flow

Ready to process your first lead? In the next 10 minutes, you'll build a working flow that receives leads, validates them, and delivers them to a destination. Let's dive in!

## 📍 You Are Here

You're about to create your first flow - the intelligent pipeline that processes leads from arrival to delivery. Think of it as setting up an automated quality control department that works 24/7.

## 🎯 What You'll Build

By the end of this guide, you'll have:
- A working flow that can receive leads
- Basic validation to ensure data quality  
- A destination configured for lead delivery
- Your first successfully processed lead!

## 📋 Prerequisites (2 minutes of prep)

Before we start, you'll need:
- Access to your account (you're probably already logged in)
- A destination in mind (your CRM, email, or even just a webhook for testing)
- 10 minutes of uninterrupted time

## 🚀 Step 1: Create Your Flow

Let's create your flow:

1. **Navigate to Flows**
   - From the main navigation, click **Flows**
   - You'll see the flows list (might be empty if you're brand new)

2. **Create a New Flow**
   - Click the **Create Flow** button (usually a blue button in the top right)
   - Give your flow a meaningful name like "My First Lead Flow" or "Insurance Leads - California"
   
   💡 **Pro tip**: Use descriptive names. "Test Flow 1" becomes confusing when you have "Test Flow 47"

3. **Save Your Flow**
   - Click **Create** or **Save**
   - Congratulations! You now have a flow. It doesn't do anything yet, but we'll fix that.

## 🔌 Step 2: Add a Source (Where Leads Come From)

Your flow needs at least one source - the entry point for leads:

1. **Open Your Flow**
   - Click on your flow name to enter edit mode
   - Look for the **Sources** tab

2. **Add Your First Source** 
   - Click **Add Source**
   - For your first flow, choose **Default Source** (it's the simplest)
   - Name it something clear like "Web Form" or "API Endpoint"

3. **Configure the Source**
   - Note the submission URL - this is where leads will be sent
   - Copy this URL, you'll need it for testing
   - Leave other settings as default for now

💡 **What just happened?** You created an endpoint that can receive lead data. It's like setting up a mailbox for your leads.

## ✅ Step 3: Set Up Basic Validation

Let's add some acceptance criteria to ensure you only process quality leads:

1. **Find Acceptance Criteria**
   - In your flow, look for **Acceptance Criteria** or **Pre-Processing**
   - Click **Add Rule** or **Configure**

2. **Add Your First Rule**
   - Let's start simple: require an email address
   - Create a rule: `email is not blank`
   - Add a clear rejection reason: "Email address is required"

3. **Add Another Rule**
   - Require a phone number: `phone is not blank`  
   - Rejection reason: "Phone number is required"

💡 **Why this matters**: These rules protect you from processing incomplete leads. If someone submits without an email or phone, they'll get a clear message about what's missing.

## 📤 Step 4: Add a Destination (Where Leads Go)

Now let's configure where your validated leads should go:

1. **Navigate to Flow Steps**
   - Find the **Steps** or **Flow Steps** section
   - Click **Add Step**

2. **Choose Step Type**
   - Select **Destination** (or **Recipient** for internal notifications)
   - For testing, **Webhook** is perfect - it just sends data to a URL

3. **Configure Your Destination**
   - For webhook: Use a service like webhook.site for testing
   - Name it clearly: "Test Webhook" or "My CRM"
   - Map the fields you want to send

💡 **Quick Test Option**: Use webhook.site to create a free test endpoint. You'll see exactly what data is being sent.

## 🧪 Step 5: Test Your Flow

Time to see your flow in action:

1. **Prepare Test Data**
   ```json
   {
     "email": "test@example.com",
     "phone": "555-123-4567",
     "first_name": "Test",
     "last_name": "Lead"
   }
   ```

2. **Submit a Test Lead**
   - Use a tool like Postman or curl
   - Send a POST request to your source URL
   - Include your test data as JSON

   Example using curl:
   ```bash
   curl -X POST https://app.leadconduit.com/flows/YOUR_FLOW_ID/sources/YOUR_SOURCE.json \
     -H "Content-Type: application/json" \
     -d '{"email":"test@example.com","phone":"555-123-4567","first_name":"Test","last_name":"Lead"}'
   ```

3. **Check the Results**
   - Go to your flow's **Events** tab
   - You should see your test lead!
   - Check if it was accepted and delivered

## 🎉 Success! What Just Happened?

If your test worked, here's what your flow just did in milliseconds:

1. **Received** the lead at your source endpoint
2. **Validated** the data (parsed the email and phone)
3. **Checked** your acceptance criteria (email and phone present)
4. **Delivered** the lead to your destination
5. **Recorded** every step in the event log

You just built a working lead processing pipeline!

## 🚫 Troubleshooting Common Issues

**"My lead was rejected"**
- Check the Events tab for the specific rejection reason
- Verify your test data includes all required fields
- Make sure the data format matches (e.g., valid email format)

**"I don't see my lead"**
- Confirm you sent to the correct URL
- Check if you included Content-Type: application/json
- Look for authentication errors in your HTTP response

**"Delivery failed"**
- Verify your destination configuration
- Check if the destination URL is accessible
- Review the error message in the Events tab

## 🎯 Next Steps

Your basic flow is working! Here's how to level up:

### Add More Sophistication
- [Add more sources](./adding-sources.md) for different vendors
- [Configure field mapping](../data-management/field-configuration.md) for complex data
- [Set up filters](../flow-management/working-with-filters.md) for routing

### Enhance Your Validation  
- [Implement TrustedForm](../compliance/trustedform-basics.md) for consent verification
- [Add suppression lists](../data-management/suppression-lists.md) to prevent duplicates
- [Configure volume caps](../flow-management/volume-caps.md) to control flow

### Connect Real Systems
- [Integrate your CRM](../integrations/crm-integration-guide.md)
- [Set up email notifications](../integrations/email-notifications.md)
- [Connect to dialers](../integrations/dialer-setup.md)

## 💡 Pro Tips

**Start Simple**: Get a basic flow working before adding complexity. You can always add more steps and rules later.

**Use Clear Names**: "California Solar Leads" is better than "Flow 1". You'll thank yourself later.

**Test Often**: Send test leads whenever you make changes. It's easier to spot issues early.

**Check Events**: The Events tab is your best friend for understanding what happened to each lead.

## 📚 Related Documentation

- [Flow Concepts](../../reference/flows.md) - Deep dive into how flows work
- [Source Configuration](../../reference/entities.md) - Advanced source options
- [Event Reference](../../reference/lifecycle.md) - Understanding the event system

---

🎉 **Congratulations!** You've built your first flow and processed your first lead. You're officially on your way to mastering lead management. Keep experimenting, and don't hesitate to reach out to support@activeprospect.com if you need help!