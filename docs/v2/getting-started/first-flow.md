---
title: Create Your First Flow
description: Build a working lead flow in 10 minutes - no experience required
tags:
  - tutorial
  - quickstart
  - hands-on
---

# Create Your First Flow

## Let's Build Something Real

In the next 10 minutes, you'll build a working flow that:
- Receives leads from a web form
- Validates the data
- Checks for duplicates
- Delivers to a webhook (simulating your CRM)

No theory, no fluff - just hands-on building. Let's go!

📍 **You are here**: About to create your first lead processing flow
⏱️ **Time needed**: 10 minutes
🎯 **You'll have**: A working flow processing real leads

## Step 1: Create Your Flow (2 minutes)

### Navigate to Flows
1. Log into your LeadConduit account
2. Click **Flows** in the main navigation
3. Click the blue **New Flow** button

### Name Your Flow
Give it a meaningful name:
- ✅ Good: "Solar Leads - California"
- ✅ Good: "Insurance - Web Form - Test"
- ❌ Avoid: "Test" or "Flow 1"

💡 **Pro tip**: Include the lead type and source in the name. You'll thank yourself later when you have 20+ flows.

### Create the Flow
1. Enter your flow name
2. Add a description (optional but recommended)
3. Click **Create Flow**

🎉 **Congrats!** You just created your first flow. You'll see an empty canvas ready for building.

## Step 2: Add Your First Source (3 minutes)

Every flow needs a source - where leads come from. Let's use the simplest option for testing.

### Add the Source
1. Click **Add Source** on the left side of your flow
2. Search for "Inbound Field"
3. Click **Inbound Field** from the results
4. Click **Add Source**

### Configure Basic Settings
1. **Name**: "Web Form Test" (or similar)
2. **Submission URL**: You'll see a unique URL like:
   ```
   https://app.leadconduit.com/v2/sources/[ID]/submit
   ```
   Copy this - you'll need it to submit test leads!

### Define Your Fields
Let's add the essential fields for a basic lead:

Click **Add Field** and create these:
1. **first_name** (Text)
2. **last_name** (Text)  
3. **email** (Email)
4. **phone** (Phone)
5. **state** (US State)

💡 **Why these types matter**: Email and Phone types automatically validate and parse the data. State type ensures valid US state codes.

### Save Your Source
Click **Save** at the bottom. Your source is ready!

## Step 3: Add Data Quality Steps (3 minutes)

Now let's ensure only quality leads flow through.

### Add Email Validation
1. From your flow canvas, click **Add Step**
2. Choose **Filter** type
3. Search for "Standard Filter"
4. Click **Add Step**

Configure the filter:
- **Name**: "Require Valid Email"
- **Rules**: 
  - Field: `email.valid`
  - Operator: `is true`
- **Outcome**: Continue if passed, skip if failed

### Add Duplicate Check
1. Click **Add Step** again
2. Choose **Filter** type
3. Search for "Suppress Duplicates"
4. Click **Add Step**

Configure duplicate checking:
- **Name**: "Block Recent Duplicates"
- **Duplicate Field**: `email`
- **Time Window**: `7 days`

💡 **What this does**: Blocks any lead with the same email submitted in the last 7 days.

## Step 4: Add Your Delivery (2 minutes)

Time to send your validated leads somewhere!

### Add a Webhook Recipient
1. Click **Add Recipient** on the right side
2. Search for "Webhook"
3. Click **Webhook (GET)**
4. Click **Add Recipient**

### Configure the Webhook
For testing, we'll use a service that shows us what was sent:
1. **Name**: "Test CRM Webhook"
2. **URL**: `https://webhook.site/[unique-id]`
   
   (Visit [webhook.site](https://webhook.site) to get your unique URL)

3. **Method**: GET (simpler for testing)

### Map Your Fields
The webhook will automatically include all lead fields. For a real integration, you'd map specific fields here.

### Save Your Recipient
Click **Save**. Your flow is complete!

## Step 5: Test Your Flow! (2 minutes)

This is the exciting part - let's see it work!

### Submit a Test Lead

#### Option 1: Use the Test Panel
1. In your flow, click the source step
2. Click **Test** in the sidebar
3. Fill in the test form:
   ```
   First Name: John
   Last Name: Doe
   Email: john@example.com
   Phone: 555-123-4567
   State: CA
   ```
4. Click **Submit**

#### Option 2: Use the Submission URL
Send a POST request to your source URL with JSON:
```json
{
  "first_name": "Jane",
  "last_name": "Smith",
  "email": "jane@example.com",
  "phone": "555-987-6543",
  "state": "TX"
}
```

### Watch the Magic Happen

1. Go back to your flow
2. Click the **Leads** tab
3. You'll see your test lead appear!
4. Click the lead ID to see details

### What You'll See

✅ **Source Step**: Lead received and parsed
✅ **Email Filter**: Passed (valid email)
✅ **Duplicate Check**: Passed (first time seen)
✅ **Webhook Delivery**: Sent successfully

Visit your webhook.site URL to see the delivered data!

## Understanding Your Success

### What Just Happened?

In 10 minutes, you built a production-ready flow that:

1. **Received** a lead via API
2. **Validated** the email address
3. **Checked** for duplicates
4. **Delivered** clean data to a webhook

### The Power You Now Have

- **Instant Integration**: Any system can now send you leads
- **Automatic Validation**: Bad emails never reach your CRM
- **Duplicate Protection**: Stop paying for the same lead twice
- **Flexible Delivery**: Send leads anywhere via webhook

### Your Flow Metrics

Check the flow's **Stats** tab to see:
- Total leads received
- Acceptance rate
- Filter performance
- Delivery success rate

## Level Up Your Flow

Ready to enhance your flow? Try these upgrades:

### Add Phone Validation
1. Add another filter step
2. Rule: `phone.valid is true`
3. Now only valid phones pass through

### Add State Filtering
1. Add a filter for specific states
2. Rule: `state is included in list "CA,TX,NY,FL"`
3. Only accept leads from profitable states

### Add Data Enhancement
1. Add an enhancement step
2. Try "Phone Intelligence" to append carrier data
3. Use appended data in routing decisions

### Add Business Hours
1. Add a filter for time-based routing
2. Rule: `timestamp.hour is between 9 and 17`
3. Only accept leads during business hours

## Common Questions

### "My lead was rejected - why?"
Click the lead ID and check the **Events** tab. You'll see exactly which step failed and why.

### "Can I edit my flow while it's running?"
Yes! LeadConduit allows live editing. Changes take effect immediately for new leads.

### "How do I connect real sources?"
Check out **[Connecting Sources](/flows/lead-submission/sources)** for guides on Facebook, Google, and custom integrations.

### "What about pricing and caps?"
See **[Source Configuration](/flows/lead-submission)** to add cost tracking and volume limits.

## Your Next Steps

Congratulations! You've built your first flow. Here's what to explore next:

### 📚 Deepen Your Knowledge
- **[Understanding Events](/leads/lead-events)** - See the complete audit trail
- **[Working with Fields](/leads/lead-data-field-types)** - Master data handling
- **[Advanced Filters](/flows/flow-steps/filter-steps)** - Complex routing logic

### 🔧 Build Production Flows  
- **[Connect Real Sources](/flows/lead-submission/sources)** - Facebook, Google, APIs
- **[CRM Delivery](/flows/flow-steps/recipient-steps)** - Salesforce, HubSpot, etc.
- **[Add Enhancements](/flows/flow-steps/enhancement)** - TrustedForm, data append

### 🚀 Optimize Operations
- **[Volume Caps](/flows/lead-submission/volume-caps)** - Control lead flow
- **[Pricing Rules](/flows/lead-submission/pricing)** - Track ROI automatically
- **[Reporting](/reporting)** - Measure everything

---

🎉 **You did it!** You're no longer a LeadConduit beginner. You've built a real flow that processes real leads. Everything else builds on what you just learned.

*Stuck? Excited? Questions? We love hearing from new users: support@activeprospect.com*