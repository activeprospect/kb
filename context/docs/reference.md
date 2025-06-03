# Reference Documentation Guidelines

This document captures the key attributes and guidelines for the LeadConduit reference documentation, particularly the `docs/v2/reference/index.md` file and its supporting documents.

## Purpose and Structure

The reference documentation serves as the authoritative technical guide for LeadConduit's core concepts. Unlike user guides or tutorials, it provides comprehensive details about how each component works, their relationships, and technical specifications.

## Key Attributes of reference/index.md

### 1. Metadata in Frontmatter
- Tags must be placed in YAML frontmatter, not in the content body

### 2. Flow-Centric Narrative
The index explains concepts through the lens of lead processing:
- Start with flows as the central concept
- Introduce other concepts as they appear in the lead journey
- Show how each concept contributes to processing leads from arrival to delivery

### 3. Lead Journey Structure
Organize content by the six stages of lead processing:
1. **Arrival** - Sources and Authentication
2. **Data Reception** - Fields, Types, Mappings
3. **Business Logic: Decisions and Control** - Acceptance Criteria, Pricing, Volume Caps, Filter Steps
4. **Processing & Enhancement** - Integrations, Rules
5. **Delivery** - Mappings, Recipients, Integrations
6. **Visibility** - Events, Reporting, Exports

Note: Lower-level concepts like Rules and Templates should be referenced but detailed in their own reference docs (e.g., reference/rules.md, reference/templates.md)

### 4. Vocabulary Guidelines

#### Entity Terminology
Per `context/vocabulary.md`, use precise terminology:
- **Sources** - Where leads come FROM (user-facing term)
- **Recipients** - Where leads go TO (user-facing term)
- **Partners** - Business relationships (especially two-way)
- **Entities** - Only mention in technical/advanced content as "the platform's identity system"

Never use:
- "Destination" (LeadsBridge terminology)
- "Client" (ambiguous)
- "Vendor" (use Source or Partner)

#### Field Names
Always use the `name` property (not the `id`) from `content/app/fields.json`:
- Use `Phone 1` not `phone_1` (name vs id)
- Use `Email` not `email` (name vs id)
- Use `Address 1` not `address_1` (name vs id)
- Always verify field references against the source JSON
- The `name` property is what users see in the UI, making documentation more user-friendly

### 5. Content Organization

The index.md was split into multiple documents for better navigation:

#### Main Index (`index.md`)
- Flow-centric overview
- Lead journey narrative
- Links to all 12 core concepts
- Conceptual architecture layers
- Links to supporting documents

#### Supporting Documents
1. **concepts-overview.md** - Detailed concept relationships and dependencies
2. **lifecycle.md** - Step-by-step lead processing lifecycle
3. **navigation.md** - Quick navigation by task, role, or technical depth

### 6. Diagram Placeholders
Include TODO comments for future diagrams:
```html
<!-- TODO: Add flow orchestration diagram here showing the complete lead journey -->
![Flow Orchestration Overview](../images/flow-orchestration-diagram.png)
```

### 7. Conceptual Layers
Organize the 12 concepts into four architectural layers:
1. **Data Foundation Layer** - Fields, Types, Templates
2. **Business Logic Layer** - Rules, Pricing, Mappings
3. **Identity & Integration Layer** - Entities, Integrations, Flows
4. **Analytics Layer** - Events, Reporting, Exports

### 8. Model Concept Tags
Use specific tags from `content/tags.md` for concept-focused content:
- `types-focused` - Content about how Types work
- `fields-focused` - Content about field definitions
- `rules-focused` - Content about rule evaluation
- `mappings-focused` - Content about mapping configuration
- etc.

## Writing Style Guidelines

### Document Structure Approach
The six-stage breakdown (Arrival → Data Reception → Business Logic → Processing & Enhancement → Delivery → Visibility) is a key organizational principle. This structure:
- Follows the actual lead processing flow
- Groups related concepts logically
- Makes complex systems understandable
- Should be used consistently across documentation

### Explain Through Lead Processing
Don't just define concepts - show how they participate in processing leads:
- "When a lead arrives..." 
- "As the lead moves through..."
- "During delivery..."

### Technical Yet Accessible
- Assume technical audience but explain clearly
- Use concrete examples
- Show relationships between concepts
- Link liberally between related concepts

### Consistent Linking
- Always link to concept pages when mentioning them
- Use markdown links: `[Flows](flows.md)`
- Link to supporting documents for additional context

## Important Instructions Summary

1. **Tags in metadata only** - Never put tags in the content body
2. **Flow comes first** - Everything flows from the flow (pun intended)
3. **Explain the journey** - Show how leads move through the system
4. **Use correct vocabulary** - Sources/Recipients for users, Entities only for technical docs
5. **Verify field names** - Always use the `name` property from fields.json, not the `id`
6. **Split large content** - Use supporting documents for better organization
7. **Reference the source** - The `content/app/` directory is the source of truth

## Document Relationships

```
reference/
├── index.md              # Main overview with lead journey narrative
├── concepts-overview.md  # Detailed concept relationships
├── lifecycle.md          # Step-by-step processing lifecycle  
├── navigation.md         # Quick navigation guide
└── [concept].md files    # Individual concept reference pages
```

Each concept page should follow the same structure:
- Definition
- Technical Details
- Configuration
- Examples
- Relationships
- Best Practices

## Future Considerations

- Add actual diagrams to replace TODO placeholders
- Consider adding code examples for technical concepts
- May need role-specific reference guides (buyer vs seller)
- Could add troubleshooting reference section

---

*This guide ensures consistency and quality in LeadConduit reference documentation. Always refer back to these guidelines when creating or updating reference content.*