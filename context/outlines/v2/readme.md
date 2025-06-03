The documentation should be built in docs/v2.

let's follow this outline. when in doubt, feel free to add a sub-section.

consult content/app as your source of truth. all other docs under content are historical supporting docs. 

make sure to use context/vibes.md, context/tone.md, and context.vocabulary.md. 

```
introduction
getting-started
flows
  lead submission
    sources
    flow/source hierarchy
    mappings
    acceptance criteria
    volume caps
    pricing
    submission response
  flow steps
    overview of types
    filter steps
    recipient steps
      delivery
      enhancement with add-ons or integrations
      custom calls to third party APIs (custom aka generic integrations)
leads
  lead events 
    source
    recipient
    filter
    feedback-sent
    feedback-received
    etc.
  <more concepts that detail events> 
  lead data & field types
  firehose
reporting
exports
reference
  flows.md
  fields.md
  etc...
guides
  all bloomfire articles for how-to guides go here, organized by category. make sure the adjust terminology according to context/vocabulary.
```

Each section must be written to a directory. The directory must contain an index.md file that serves as the content that summarizes the section.

