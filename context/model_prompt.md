# LeadConduit Data Model Analysis Prompt

## Objective
You are tasked with analyzing LeadConduit's OpenAPI specification (`openapi/openapi.yaml`) to create a comprehensive user-focused document that reveals how the platform's core concepts are systematically designed and interconnected. Your goal is to help users understand the elegant reuse of fundamental building blocks throughout the system.

## Your Mission
Discover and document the underlying patterns that make LeadConduit work. The platform is built on a foundation of reusable components that appear in many different contexts - your job is to uncover these patterns and explain them in a way that helps users understand both the "what" and the "why" of how LeadConduit operates.

## Analytical Approach

### 1. Archaeological Discovery
Explore the OpenAPI specification like an archaeologist uncovering hidden structures:

- **Pattern Recognition**: Look for schema components that appear multiple times across different endpoints and features
- **Structural Analysis**: Identify how complex features are built from simpler, reusable components  
- **Relationship Mapping**: Trace how components reference each other and create hierarchical relationships
- **Behavioral Understanding**: Understand how the same component behaves differently in different contexts

### 2. Conceptual Architecture
Build a mental model of how LeadConduit is architecturally designed:

- **Core Primitives**: What are the fundamental building blocks that everything else is built upon?
- **Composition Patterns**: How do these primitives combine to create complex functionality?
- **Hierarchy and Inheritance**: Where do you see layered configuration (flow-level → source-level → step-level)?
- **Cross-Cutting Concerns**: What concepts (like templating, rules, mappings) appear everywhere?

### 3. User Impact Analysis
Think about what these patterns mean for users:

- **Configuration Efficiency**: How does understanding reuse help users configure things once and leverage everywhere?
- **Mental Model Building**: What conceptual framework will help users predict how features work?
- **Troubleshooting Power**: How does understanding the underlying model help users debug issues?
- **Best Practices**: What patterns suggest optimal ways to structure configurations?

## Cross-Reference with Reality
Use the existing content in `content/bloomfire/` and `content/whatsnew/` to:

- **Validate discoveries**: Does what you find in the API match how features are described in user documentation?
- **Find real examples**: Look for user-facing documentation that demonstrates the patterns you discover
- **Bridge the gap**: Identify where API concepts need better user-facing explanation
- **Check terminology**: Ensure consistency between technical and user-facing language

## Deliverable Requirements

Create a user-focused document titled **"Understanding LeadConduit's Data Model: How Everything Connects"** that reveals the systematic beauty of how LeadConduit is designed.

### Your Document Should:

**Tell the Story** of LeadConduit's design philosophy:
- Start with the big picture - why is the system designed this way?
- Reveal the core building blocks through discovery, not prescription
- Show how these blocks combine to create powerful functionality
- Explain why this matters for users (not just how it works)

**Use Discovery-Based Structure**:
- Let your analysis drive the organization, don't force a predetermined structure
- Group concepts by how they naturally relate to each other
- Present insights in the order that builds understanding most effectively

**Write for Understanding**:
- Use business language, not API jargon
- Provide concrete examples that users will recognize
- Help users build mental models they can apply
- Focus on "aha moments" that change how users think about the platform

**Make it Actionable**:
- Show users how to leverage these patterns in their own configurations
- Provide troubleshooting insights based on understanding the model
- Suggest best practices that emerge from the design patterns

## Success Criteria

Your document succeeds if a user reading it says:
- "Now I understand why LeadConduit works this way!"
- "This helps me think about how to structure my flows differently"
- "I can see patterns I never noticed before"
- "This will help me troubleshoot issues more effectively"

## Output Location
Place the completed document at: `content/understanding-leadconduit-data-model.md`

Let your curiosity drive the analysis. Discover the patterns, then teach them.