---
URL: https://docs.activeprospect.com/article/webhook-configuration
Page Title: Configuring Webhook Integrations for Real-Time Lead Delivery
Screenshot URL: https://docs.activeprospect.com/images/webhook-config-screenshot.png
Scraped At: 2024-01-15 10:30:00
Tags: buyer-focused, intermediate, how-to, integrations, vendor-management
Related Tags: semi-technical, universal, webhook, real-time-delivery
---
# Configuring Webhook Integrations for Real-Time Lead Delivery

This guide walks you through setting up webhook integrations in LeadConduit to deliver leads to external systems in real-time.

## Prerequisites

Before you begin, ensure you have:
- A LeadConduit account with appropriate permissions
- The webhook endpoint URL from your vendor
- Any required authentication credentials

## Step 1: Access the Integration Settings

Navigate to your flow and click on the "Add Step" button. Select "Integration" from the step types.

![Integration step selection](images/image-1.png)

## Step 2: Configure the Webhook

In the integration configuration panel:

1. Enter your webhook URL
2. Select POST as the method
3. Configure authentication if required

![Webhook configuration interface](images/image-2.png)

## Step 3: Map Your Data

Use the payload mapping interface to configure which fields to send:

![Payload mapping interface](images/image-3.png)

## Understanding the Data Flow

This diagram illustrates how data flows from LeadConduit to your webhook endpoint:

![Data flow diagram](images/image-4.png)

## Step 4: Test Your Integration

Always test your webhook before going live:

1. Click the "Send Test" button
2. Review the response
3. Verify the data was received correctly

![Test interface](images/image-5.png)

## Troubleshooting Common Issues

If you encounter errors, check the error log for details:

![Error log view](images/image-6.png)

Common issues include:
- Authentication failures (401 errors)
- Server errors (500 errors)
- Timeout issues

## Best Practices

- Always use HTTPS endpoints for security
- Implement proper error handling
- Set reasonable timeout values
- Monitor your webhook performance regularly

## Next Steps

Once your webhook is configured and tested, you can:
- Set up additional webhooks for other vendors
- Configure retry logic for failed deliveries
- Implement response parsing for advanced workflows