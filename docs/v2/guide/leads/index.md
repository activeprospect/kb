---
title: Working with Leads
description: Everything you need to know about lead data, events, and real-time streaming
tags:
  - buyer-focused
  - intermediate
  - conceptual
  - data-management
  - analytics
  - leads
  - events-focused
---

# Working with Leads

## Your Data Command Center

Leads are the lifeblood of your business, and understanding how they flow through LeadConduit gives you the power to optimize every aspect of your operation. This guide covers everything from basic lead data concepts to advanced event tracking and real-time streaming.

📍 **You are here**: Learning to master lead data and analytics
🎯 **What you'll achieve**: Complete visibility into your lead operations
🚀 **The outcome**: Data-driven decisions that boost ROI

## What You'll Learn

### [Understanding Lead Data](/guide/leads/understanding-lead-data)
*10 minutes · Beginner*

Before diving into the technical stuff, let's build a solid foundation. You'll discover:
- How LeadConduit structures lead data
- The magic of automatic field parsing
- Why data types matter (and save you headaches)
- Real examples from your industry

**Perfect if:** You're new to LeadConduit or want to understand the data model better.

### [Tracking Lead Events](/guide/leads/tracking-lead-events)
*15 minutes · Intermediate*

Every lead tells a story through events. Learn to read that story:
- What events reveal about lead quality
- How to spot problems before they cost money
- Using events for debugging and optimization
- Building event-based alerts

**Perfect if:** You want deeper insights into what's happening with your leads.

### [Event Analysis Deep Dive](/guide/leads/event-analysis)
*20 minutes · Advanced*

Turn raw events into actionable intelligence:
- Analyzing acceptance patterns
- Tracking delivery success rates
- Understanding rejection reasons
- Optimizing based on event data

**Perfect if:** You're ready to use events for serious optimization.

### [Real-Time Streaming with Firehose](/guide/leads/firehose-setup)
*25 minutes · Advanced*

Connect LeadConduit to your data ecosystem:
- Setting up real-time event streaming
- Feeding data warehouses and BI tools
- Building live dashboards
- Handling massive scale

**Perfect if:** You need leads and events in external systems instantly.

## Quick Wins

### See Your Lead Data Right Now
1. Go to **Leads** in the navigation
2. Click any recent lead
3. Look at the **Data** tab
4. Notice how phone numbers are automatically parsed into components? That's the type system at work!

### Check Recent Events
1. From any lead, click the **Events** tab
2. See the complete journey from submission to delivery
3. Each event shows exactly what happened and when
4. Red events? That's where to focus your attention

### Export Your First Dataset
1. Go to **Exports** → **Create Export**
2. Select "Last 24 hours" and "All fields"
3. Download as CSV
4. Open in Excel to see your structured lead data

## Common Questions

### "What's the difference between a lead and an event?"
**Lead**: The actual data (name, email, phone, etc.)
**Events**: The story of what happened to that lead (received, validated, delivered, etc.)

Think of it like a package delivery - the lead is the package, events are the tracking updates.

### "How long does LeadConduit keep my data?"
- **Leads**: 30 days by default (customizable)
- **Events**: 30 days by default (customizable)
- **Exports**: Create permanent archives anytime
- **Firehose**: Stream to your systems for permanent storage

### "Can I add custom fields?"
Absolutely! LeadConduit adapts to your business:
- Add any custom field through flow configuration
- Choose from various types (text, number, date, etc.)
- Custom fields work just like standard ones
- They're included in events and exports

### "What happens to invalid data?"
LeadConduit is forgiving but informative:
- Invalid data is marked but not rejected by default
- You see what's invalid and why
- You decide whether to accept it
- Events track validation results

## Pro Tips

💡 **Event Patterns Tell Stories**
Look for patterns in your events:
- Rejections spiking at certain hours? Check your acceptance criteria
- Delivery failures to one buyer? Check their endpoint
- Slow processing times? Look for enhancement bottlenecks

📊 **Use Events for Debugging**
When a lead doesn't behave as expected:
1. Find the lead
2. Check its events
3. Look for red (failure) events
4. The event details show exactly what went wrong

🚀 **Firehose Changes Everything**
Once you set up Firehose:
- Build real-time dashboards in Tableau/PowerBI
- Set up alerts in your monitoring system
- Feed machine learning models
- Never miss an insight

## Success Path

### Week 1: Master the Basics
- ✓ Understand lead data structure
- ✓ Navigate the Leads interface
- ✓ Read event timelines
- ✓ Create your first export

### Week 2: Dive Deeper
- ✓ Analyze acceptance patterns
- ✓ Track source quality via events
- ✓ Set up event-based alerts
- ✓ Export data for analysis

### Week 3: Advanced Analytics
- ✓ Configure Firehose
- ✓ Build external dashboards
- ✓ Create automated reports
- ✓ Optimize based on insights

## Need Help?

### 🎓 Keep Learning
- [Types Reference](/reference/types) - Deep dive into data parsing
- [Events Reference](/reference/events) - Complete event documentation
- [API Guide](/api/events) - Programmatic access to events

### 🤝 Get Support
- **Quick question?** Check our [Event FAQ](/guide/leads/event-faq)
- **Stuck?** Email support@activeprospect.com
- **Complex setup?** Ask about our onboarding services

---

🎯 **Remember**: Your leads are more than just data - they're the story of your business. Events tell you that story, exports let you analyze it, and Firehose lets you act on it in real-time. Master these tools, and you master your lead operation.

*Ready to start? Jump to [Understanding Lead Data](/guide/leads/understanding-lead-data) →*