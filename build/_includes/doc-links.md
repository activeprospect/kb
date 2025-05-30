# Internal Documentation Link Standards

## Jekyll Link Syntax Examples:

### **Section Index Pages:**
```markdown
[Getting Started]({{ '/UserGuide/GettingStarted/' | relative_url }})
[Foundational Building Blocks]({{ '/UserGuide/FoundationalBuildingBlocks/' | relative_url }})
[Reports & Analytics]({{ '/UserGuide/ReportsAndAnalytics/' | relative_url }})
```

### **Specific Documents:**
```markdown
[API Reference]({{ '/UserGuide/Appendices/api-reference/' | relative_url }})
[Glossary]({{ '/UserGuide/Appendices/glossary/' | relative_url }})
[Rules Engine Deep-Dive]({{ '/UserGuide/FoundationalBuildingBlocks/rules-engine-deep-dive/' | relative_url }})
```

### **Relative Links (within same section):**
```markdown
[Pre-Built Dashboards](../pre-built-dashboards/)
[Custom Reports](./custom-reports-funnels/)
```

### **Anchor Links (same page):**
```markdown
[Jump to API Overview](#api-overview)
[See Authentication](#authentication-and-security)
```

## Link Validation:
- All URLs should end with `/` for consistency
- Use `relative_url` filter for portability
- Test links work in development and production