# Key Concepts Overview

Before you build your first flow, let's get familiar with the key concepts that make LeadConduit tick. Think of this as learning the vocabulary of lead distribution - once you understand these building blocks, everything else clicks into place.

## The Big Picture: How LeadConduit Thinks About Leads

At its core, LeadConduit is built around a simple but powerful idea: leads flow through a series of steps, and each step can validate, transform, or route the lead based on your business rules. Let's break down the key concepts you'll work with every day.

## 🌊 Flows: Your Lead Processing Pipelines

A **flow** is the heart of LeadConduit - it's a visual pipeline showing exactly how your leads move through your system.

### What Makes a Flow?
Think of a flow like an assembly line in a factory:
- Leads enter from the left (sources)
- Move through various stations (steps)
- Exit on the right (delivery)

Here's a simple flow in action:
```
Facebook Leads → Validate Phone → Check Duplicates → Enhance Data → Deliver to CRM
```

### Key Facts About Flows:
- **Linear execution**: Steps happen in order, left to right
- **Real-time processing**: Most flows complete in under a second
- **Visual feedback**: See exactly where leads succeed or fail
- **Unlimited flows**: Create as many as your business needs

**💡 Pro tip**: Start with one simple flow and expand. You don't need to build the perfect system on day one!

## 🏢 Entities: Your Business Relationships

An **Entity** in LeadConduit represents a company or system you work with. Here's the key insight: the same company can play different roles.

### Understanding Entity Roles

Think of it like a person who's both a customer and a supplier to your business:

**Entity**: "Solar Solutions Inc"
- **As a Source**: When they send you California leads
- **As a Recipient**: When you send them Texas leads

This reflects real business relationships where you might buy certain leads from a partner while selling them others.

### Types of Connections:
- **Standard Integrations**: Pre-built connections (Facebook, Google, major CRMs)
- **Custom Integrations**: Your unique partners and systems
- **Account Connections**: Other LeadConduit users (instant compatibility!)

**🔑 Key Point**: One Entity, multiple roles. This keeps your partner management clean and reflects how business actually works.

## 📥 Sources: Where Leads Enter

A **Source** is any Entity sending leads INTO your LeadConduit account. Sources are the starting points of your flows.

### Types of Sources:

**Default Source**
- Automatically created with your account
- Perfect for testing and manual lead entry
- Named after your account for easy identification

**Standard Sources**
- Pre-built integrations (Facebook Lead Ads, Google Ads, etc.)
- Connect in minutes with guided setup
- Automatic field mapping included

**Custom Sources**
- Built for your unique needs
- Complete control over field definitions
- Private to your account

**Account Sources**
- Connect with other LeadConduit users
- Instant compatibility
- Real-time delivery between accounts

### Source Configuration Includes:
- **Field mappings**: How incoming data maps to your fields
- **Acceptance criteria**: Which leads to accept
- **Volume caps**: Daily/monthly limits
- **Pricing**: What you pay per lead

## 📤 Recipients: Where Leads Go

A **Recipient** is any Entity receiving leads FROM your LeadConduit account. These are your delivery destinations.

### Recipient Capabilities:
- **Multiple formats**: JSON, XML, form post, or custom
- **Retry logic**: Automatic retries for failed deliveries
- **Response parsing**: Capture and act on recipient responses
- **Conditional delivery**: Send only leads that match criteria

**Remember**: The same Entity can be both a Source (sending you leads) and a Recipient (receiving leads from you).

## 📊 Fields: Your Data Model

**Fields** are the individual pieces of information that make up a lead. Think of them as the columns in a spreadsheet.

### Field Structure:
Every field has:
- **Name**: The identifier (like `first_name`)
- **Type**: What kind of data it holds
- **Value**: The actual data

### Field Types Include:
- **Text**: Names, addresses, comments
- **Number**: Age, income, loan amount
- **Phone**: Automatically formatted and validated
- **Email**: Built-in validation
- **Date/Time**: Properly parsed timestamps
- **Boolean**: Yes/no, true/false values

### Standard vs Custom Fields:
- **Standard Fields**: Common fields LeadConduit provides (first name, email, phone)
- **Custom Fields**: Fields you create for your specific needs

**💡 Smart Move**: LeadConduit's typed fields do heavy lifting for you - phone numbers are automatically formatted, emails validated, and dates parsed correctly.

## 🎯 Steps: Actions in Your Flow

Steps are the individual operations that process your leads. Each step does one specific job.

### Types of Steps:

**Filter Steps** 🚦
- Use rules to stop certain leads
- No external calls = lightning fast
- Common uses: duplicate checking, geographic filtering, business hours

**Enhancement Steps** 🔍
- Call external services to append data
- Add demographics, scores, or verification
- Examples: TrustedForm, phone validation, lead scoring

**Delivery Steps** 📬
- Send leads to recipients
- Multiple formats supported
- Includes retry logic and response handling

**Integration Steps** 🔌
- Connect to third-party services
- Both inbound and outbound
- Handle complex business logic

### Step Execution:
- Steps run in sequence (left to right)
- Each step can succeed, fail, or error
- Use outcomes to control flow behavior
- Skip steps conditionally with rules

## 🧮 Rules: Your Business Logic

**Rules** are logical tests that evaluate lead data. They're the "if-then" logic of LeadConduit.

### Rule Components:
1. **Field to test**: What data to look at
2. **Operator**: How to compare (equals, contains, greater than)
3. **Value**: What to compare against

### Example Rules:
- `state equals "CA"` - Lead is from California
- `age is greater than 25` - Lead is over 25
- `phone is valid` - Phone number is properly formatted
- `email contains "@gmail.com"` - Gmail address

### Rule Sets:
Combine multiple rules with operators:
- **ALL**: Every rule must be true
- **ANY**: At least one rule must be true

Example: Accept leads where `(state = "CA" OR state = "TX") AND age > 21`

## 🔄 Events: Your Audit Trail

**Events** record everything that happens to a lead. Think of them as a detailed diary of each lead's journey.

### What Events Capture:
- Every step outcome (success/failure)
- All data at each point
- Timing information
- Response data from integrations
- Who did what and when

### Why Events Matter:
- **Troubleshooting**: See exactly why a lead failed
- **Compliance**: Prove consent and data handling
- **Analytics**: Build reports on any metric
- **Billing**: Reconcile with partners

**🔍 Power User Tip**: Events are your best friend for debugging. When something goes wrong, events show you exactly what happened.

## 🗺️ Mappings: Data Transformation

**Mappings** reshape data between systems. They're how you handle different field names and formats between partners.

### Mapping Use Cases:
- Rename fields: `fname` → `first_name`
- Combine fields: `first_name + " " + last_name` → `full_name`
- Transform data: `phone` → remove special characters
- Add static values: Always set `lead_type = "solar"`

### Mapping Power:
Use templates in mappings for complex transformations:
```
{{lead.first_name}} {{lead.last_name|uppercase}}
```

## 💰 Pricing: Revenue and Cost Tracking

LeadConduit tracks the economics of every lead automatically.

### Pricing Layers (in precedence order):
1. **Entity + Type**: Most specific pricing
2. **Entity**: Pricing for all leads from a source
3. **Type**: Pricing for a lead type across sources
4. **Source**: Base pricing for the source

### Pricing Supports:
- Fixed prices per lead
- Percentage of revenue
- Conditional pricing with rules
- Multi-currency support

## 🎚️ Volume Caps: Inventory Control

Control lead flow with sophisticated capping:

### Cap Types:
- **Daily caps**: Reset each night
- **Monthly caps**: Reset on the 1st
- **Total caps**: Lifetime limits
- **Rolling caps**: Based on time windows

### Advanced Capping:
- Nested caps (state within source)
- Rule-based caps (different limits by quality)
- Cap groups (shared limits across sources)

## Putting It All Together

Now you understand the vocabulary of LeadConduit! Here's how these concepts work together:

1. **Entities** represent your business partners
2. **Sources** (Entities sending leads) connect to your **Flows**
3. **Fields** define the data structure of your leads
4. **Steps** process leads using **Rules** and **Mappings**
5. **Recipients** (Entities receiving leads) get delivered leads
6. **Events** record everything for analysis
7. **Pricing** and **Volume Caps** control the business side

## Your Learning Path

Ready to put this knowledge into practice? Here's your next step:

**→ [Your First Flow](./your-first-flow.md)**: Let's build something real! We'll create a working flow that receives, validates, and delivers leads.

---

*Remember: You don't need to master every concept before starting. LeadConduit is designed to be intuitive - you'll learn by doing. Let's build that first flow!*