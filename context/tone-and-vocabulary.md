# LeadConduit Documentation Tone and Vocabulary Guide

## Official Vocabulary and Terminology

This guide ensures consistency in how we write about LeadConduit and ActiveProspect products. Always use these official terms as defined below.

## Core LeadConduit Terms

### The Fundamentals

**Lead (data)** - Information provided by a Lead (person). Never use "contact," "record," or "submission" when referring to lead data.

**Flow** - A stored collection of discrete steps executed in a predefined, linear sequence. Never use "workflow," "pipeline," or "process" as substitutes.

**Event** - The state of a lead at a particular step in a flow. Not "transaction" or "occurrence."

**Step** - A discrete operation in a flow. Steps can be:
- **Filter Step** - Uses rules to block certain leads
- **Delivery/Recipient Step** - Sends lead data to a recipient

### Entities and Partners

**Entity** - A company or system that you exchange leads with in LeadConduit. An Entity represents the actual business partner - for example, "Acme Insurance Company" is a single Entity, even if you both buy leads from them and sell leads to them.

**Source** - The role an Entity plays when sending leads TO you. When Acme Insurance sends you leads, they're acting as a Source.

**Recipient** - The role an Entity plays when receiving leads FROM you. When you send leads to Acme Insurance, they're acting as a Recipient.

**Important:** The same Entity can be both a Source and a Recipient. This reflects real business relationships where you might buy certain types of leads from a partner while selling them other types. Think of Source and Recipient as "hats" an Entity wears, not as separate companies.

**Partner** - Another company (Entity) with whom you conduct business within LeadConduit. Always represented by an Entity.

#### Types of Sources

**Default Source** - Automatically added to every flow and named after your account. This is your starting point.

**Account Source** - A globally accessible source representing another LeadConduit account holder. Used when LeadConduit users send leads to each other.

**Custom Source** - A source you create that's only accessible within your account. Used for unique submission formats or private partners.

**Standard Source** - Pre-built source integrations for common platforms (Facebook Lead Ads, web forms, etc.).

**My Sources** - Your personalized list including sources you've added to flows, custom sources you've created, and partners you've connected with.

#### Types of Recipients

**Custom Recipients** - Recipients you create that are only accessible within your account. Used for unique delivery formats or private partners.

**My Recipients** - Your personalized list including recipients you've added to flows, custom recipients you've created, and partners you've connected with.

#### Important Terminology Notes

**Destination vs. Recipient** - In LeadConduit, always use "Recipient." The term "Destination" is specific to LeadsBridge (a separate integration product) and should not be used in LeadConduit documentation.

**Direction Matters** - Always be clear about lead flow direction:
- Sources send leads TO LeadConduit
- Recipients receive leads FROM LeadConduit
- An Entity becomes a Source or Recipient based on this direction

### Data and Processing

**Field** - Data points that comprise a lead, structured as label-value pairs. Use "field" not "attribute" or "property."

**Mapping** - The assignment of values to flow fields or step parameters. Not "transformation" or "translation."

**Enhancement** - An integration that validates or appends data to leads. Not "enrichment" or "augmentation."

**Appended data** - Data added to the lead package during processing. Not "enriched data."

### Technical Components

**Integration** - Software that connects LeadConduit to other systems. Types include:
- **Add-On** - Purchasable integrations billed to the ActiveProspect account
- **Custom Integration** - User-configurable delivery step integration
- **Standard Integration** - Pre-built integrations

**Rule** - Logical tests that evaluate lead data. Never "condition" or "criteria" when referring to the logic itself.

**Rule Set** - A collection of rules with an operator ("any" or "all").

## TrustedForm Vocabulary

**TrustedForm Certificate** - A collection of information documenting a user's experience on a web form. Always use the full term on first reference.

**Claim/Retain** - The action required to save a TrustedForm Certificate. These terms are interchangeable but be consistent within a document.

**TrustedForm Certify Web SDK** - The JavaScript snippet embedded on websites. Always use this exact term, not "script" or "code."

**Session Replay** - Visual reconstruction of consumer interaction. Not "playback" or "recording."

**Fingerprints** - Hashed email and phone numbers for verification. Always explain this is encryption on first use.

**Page Scan** - Feature to verify text presence/absence in consumer sessions.

## Product Names (Always Capitalize)

- LeadConduit (never "Lead Conduit" or "LC")
- TrustedForm (never "Trusted Form" or "TF")
- SuppressionList (one word)
- ActiveProspect (never "Active Prospect")
- LeadsBridge (when referring to the integration)

## Industry Terms

**TCPA** - Telephone Consumer Protection Act. Define on first use in any document.

**Lead Generation** - The process of attracting and converting prospects. Not "lead gen" in formal documentation.

**Consent** - Permission given by a consumer. Be specific: "TCPA consent," "marketing consent," etc.

## Tone Guidelines

### Be Professional Yet Accessible

**DO:** "LeadConduit processes your leads through a series of steps to ensure quality and compliance."

**DON'T:** "LeadConduit runs your leads through our awesome pipeline to make sure they're legit."

### Be Precise with Technical Terms

**DO:** "The flow uses acceptance criteria to validate leads before processing."

**DON'T:** "The workflow checks if leads are good before moving forward."

### Be Clear About Actions and Outcomes

**DO:** "When a lead fails validation, the source receives a failure response with a specific reason."

**DON'T:** "Bad leads get rejected and we tell you why."

### Be Consistent with Status Terms

Always use these exact status terms:
- **Success** - The step completed successfully
- **Failure** - The step did not complete due to validation
- **Error** - The step encountered a technical problem
- **Skip** - The step was bypassed due to criteria

### Address the User Appropriately

- Use "you" for direct instructions
- Use "the user" or "users" when describing general behavior
- Use "account holders" for customers
- Never use "clients" or "customers" when referring to LeadConduit users

## Common Replacements

| Instead of... | Use... |
|--------------|--------|
| workflow | flow |
| pipeline | flow |
| contact/record | lead |
| enrichment | enhancement |
| vendor | source or partner |
| client | recipient or partner |
| destination | recipient (in LeadConduit context) |
| transform | map |
| criteria (as logic) | rules |
| script | TrustedForm Certify Web SDK |
| recording | Session Replay |

## Writing Style

1. **Active Voice**: "LeadConduit validates the lead" not "The lead is validated by LeadConduit"

2. **Present Tense**: "The flow processes leads" not "The flow will process leads"

3. **Specific Numbers**: "Processes leads in 300ms" not "Processes leads quickly"

4. **Define Acronyms**: Always define on first use, even common ones

5. **Explain Impact**: Don't just describe features, explain why they matter to the user's business

## Examples of Proper Usage

**Describing a Flow:**
"A flow processes leads through a series of steps. First, it validates the lead data against your acceptance criteria. Then, it enhances the lead with additional data from integrated services. Finally, it delivers the qualified lead to your chosen recipients."

**Explaining an Integration:**
"The TrustedForm Add-On integration verifies that proper consent was obtained. It checks the TrustedForm Certificate against the lead data and retains the certificate for compliance documentation."

**Discussing Partners:**
"When you connect with partners in LeadConduit, you're creating an Entity that represents your business relationship. The same partner (Entity) can act as both a Source (when they send you leads) and a Recipient (when you send them leads). For example, 'Solar Solutions Inc.' might send you California solar leads (acting as a Source) while receiving your Florida solar leads (acting as a Recipient) - but it's still one Entity representing one business relationship."

**Explaining Entity Relationships:**
"Think of it this way:
- ENTITY: 'ABC Marketing Company' (the actual business)
  - As SOURCE: When ABC sends you leads → [ABC] → [Your LeadConduit] 
  - As RECIPIENT: When you send ABC leads → [Your LeadConduit] → [ABC]
- It's one Entity, two possible roles, based on lead flow direction."

**Clarifying Source/Recipient Types:**
"Your account has access to different types of sources and recipients:
- Default Source: Automatically created for testing (named after your account)
- My Sources: All sources available to you (custom ones you built + partners you've connected)
- My Recipients: All recipients available to you (custom ones you built + partners you've connected)
- Custom Source/Recipient: Private to your account for unique integrations"

---

Remember: Consistency builds trust. When users see the same terms used the same way throughout the documentation, they learn faster and feel more confident using the platform.