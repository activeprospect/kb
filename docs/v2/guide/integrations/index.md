# Integrations Guide

Connect your flows with external systems and services. From CRM platforms to marketing automation, learn how to set up reliable integrations that keep your lead data flowing smoothly.

## 🔌 Popular Integrations

### [Facebook Lead Ads Setup](./facebook-lead-ads.md)
Connect Facebook's native lead forms to your flows.
- **Time**: 30 minutes
- **Level**: Intermediate
- **Tags**: `intermediate`, `how-to`, `integrations`, `facebook`

### [Salesforce Integration](./salesforce-integration.md)
Send leads directly to Salesforce CRM.
- **Time**: 25 minutes
- **Level**: Intermediate
- **Tags**: `intermediate`, `how-to`, `integrations`, `crm`

### [Email Platform Connections](./email-platforms.md)
Connect Mailchimp, Constant Contact, and ActiveCampaign.
- **Time**: 20 minutes per platform
- **Level**: Beginner
- **Tags**: `beginner`, `how-to`, `integrations`, `email`

### [Webhook Configuration](./webhook-setup.md)
Set up custom webhooks for any system.
- **Time**: 15 minutes
- **Level**: Intermediate
- **Tags**: `intermediate`, `how-to`, `integrations`, `api-related`

## 🎯 Integration Patterns

### [Real-Time Delivery](./real-time-delivery.md)
Configure instant lead delivery to destinations.
- **Time**: 20 minutes
- **Level**: Intermediate
- **Tags**: `intermediate`, `how-to`, `integrations`, `performance-optimization`

### [Batch Delivery Setup](./batch-delivery.md)
Configure scheduled batch deliveries.
- **Time**: 25 minutes
- **Level**: Advanced
- **Tags**: `advanced`, `how-to`, `integrations`, `performance-optimization`

### [Multi-System Distribution](./multi-system-distribution.md)
Send leads to multiple systems simultaneously.
- **Time**: 30 minutes
- **Level**: Advanced
- **Tags**: `advanced`, `how-to`, `integrations`, `distribution`

## 🛠️ Platform-Specific Guides

### [HubSpot Connection](./hubspot-setup.md)
Complete HubSpot CRM integration.
- **Time**: 20 minutes
- **Level**: Intermediate
- **Tags**: `intermediate`, `how-to`, `integrations`, `crm`

### [Five9 Dialer Integration](./five9-integration.md)
Connect to Five9 call center platform.
- **Time**: 25 minutes
- **Level**: Intermediate
- **Tags**: `intermediate`, `how-to`, `integrations`, `phone`

### [Google Sheets Integration](./google-sheets.md)
Send leads to Google Sheets for reporting.
- **Time**: 15 minutes
- **Level**: Beginner
- **Tags**: `beginner`, `how-to`, `integrations`, `analytics`

### [Custom API Integration](./custom-api.md)
Build integrations with any API.
- **Time**: 45 minutes
- **Level**: Advanced
- **Tags**: `advanced`, `how-to`, `integrations`, `developer-focused`

## 📋 By Integration Type

### For CRM Systems
1. Choose your platform: [Salesforce](./salesforce-integration.md) or [HubSpot](./hubspot-setup.md)
2. Configure [Field Mappings](../data-management/field-mapping.md)
3. Set up [Error Handling](../troubleshooting/integration-errors.md)

### For Marketing Platforms
1. Start with [Email Platforms](./email-platforms.md)
2. Configure [Facebook Lead Ads](./facebook-lead-ads.md)
3. Implement [Multi-System Distribution](./multi-system-distribution.md)

### For Custom Systems
1. Begin with [Webhook Configuration](./webhook-setup.md)
2. Advanced users: [Custom API Integration](./custom-api.md)
3. Consider [Batch Delivery](./batch-delivery.md) for volume

## 💡 Integration Best Practices

**Test First**: Always test with a single lead before opening the floodgates.

**Map Carefully**: Ensure field mappings match destination requirements exactly.

**Handle Errors**: Configure retry logic and failure notifications.

**Monitor Performance**: Check delivery success rates daily.

**Document Everything**: Keep credentials and configuration notes secure but accessible.

## 🔧 Common Integration Patterns

### The Basic CRM Pattern
```
1. Source receives lead
2. Acceptance criteria validate
3. Enhancement adds data
4. CRM integration delivers
5. Response logged in events
```

### The Multi-Touch Pattern
```
1. Lead accepted
2. → CRM (create contact)
3. → Email platform (add to list)
4. → Dialer (create call task)
5. → Analytics (track source)
```

### The Failover Pattern
```
1. Primary CRM delivery
2. If failed → Secondary webhook
3. If failed → Email notification
4. If failed → Manual queue
```

## 🚨 Integration Checklist

Before going live:
- [ ] Credentials configured and tested
- [ ] Field mappings verified
- [ ] Required fields identified
- [ ] Error handling configured
- [ ] Test lead processed successfully
- [ ] Monitoring alerts set up
- [ ] Documentation completed

## 📚 Related Documentation

- [Integration Reference](../../reference/integrations.md) - Technical specifications
- [Field Mappings](../data-management/field-mapping.md) - Data transformation
- [Integration Errors](../troubleshooting/integration-errors.md) - Troubleshooting

---

🔌 **Connected**: Great integrations make your lead flow invisible - data appears exactly where it's needed, when it's needed. These guides help you build reliable connections that just work!