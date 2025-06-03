# Using Templates for Efficient Flow Creation

Accelerate flow development with templates. Learn to create, manage, and leverage templates for consistent, error-free flow configurations.

## 📍 You Are Here

You're building multiple similar flows or want to standardize configurations across your organization. Templates provide the foundation for rapid, consistent flow development.

## 🎯 What You'll Learn

- Template fundamentals
- Creating custom templates
- Template inheritance
- Variable substitution
- Library management
- Best practices

## 🏗️ Template Basics

### What Are Templates?

Templates are pre-configured flow patterns:
- **Standard configurations** ready to customize
- **Best practices** built-in
- **Consistent structure** across flows
- **Time-saving** blueprints

### Template Components

```yaml
Template Structure:
  ├── Metadata
  │   ├── Name
  │   ├── Description
  │   └── Category
  ├── Steps
  │   ├── Sources
  │   ├── Enhancements
  │   ├── Filters
  │   └── Recipients
  ├── Field Mappings
  └── Variables
```

## 📦 Using Built-in Templates

### Available Templates

Common starting points:

**Lead Distribution**:
```yaml
Name: Standard Lead Buyer
Description: Basic lead distribution to single buyer
Includes:
  - TrustedForm verification
  - Duplicate checking
  - Standard validations
  - JSON delivery
```

**Multi-Buyer Ping Post**:
```yaml
Name: Ping Post Auction
Description: Two-step bidding system
Includes:
  - Ping configuration
  - Bid collection
  - Winner selection
  - Post delivery
```

**Email Marketing**:
```yaml
Name: Email Platform Integration
Description: Add leads to email platforms
Includes:
  - Email validation
  - Consent checking
  - Platform delivery
  - Suppression handling
```

### Creating from Template

1. **Select Template**:
   - Navigate to Flows
   - Click "Create Flow"
   - Choose "From Template"
   - Select template

2. **Customize Variables**:
   ```javascript
   Template Variables:
     buyer_name: "Acme Corp"
     api_endpoint: "https://api.acme.com/leads"
     api_key: "your-api-key"
     price_accepted: 25.00
     price_rejected: 0.00
   ```

3. **Review and Adjust**:
   - Check all steps
   - Verify mappings
   - Update criteria
   - Test thoroughly

## 🎨 Creating Custom Templates

### Template Design

Build reusable patterns:

```javascript
// Template definition
const customTemplate = {
  metadata: {
    name: "Insurance Lead Router",
    description: "Route insurance leads by type and state",
    category: "Industry Specific",
    tags: ["insurance", "routing", "multi-buyer"],
    version: "2.0"
  },
  
  variables: [
    {
      name: "buyer_endpoint",
      type: "url",
      required: true,
      description: "Buyer's API endpoint"
    },
    {
      name: "timeout_seconds",
      type: "number",
      default: 30,
      description: "API timeout"
    },
    {
      name: "retry_count",
      type: "number",
      default: 3,
      description: "Number of retries"
    }
  ],
  
  steps: [
    // Step configurations
  ]
};
```

### Step Configuration

Define template steps:

```yaml
steps:
  - name: "Insurance Type Router"
    type: "acceptance_criteria"
    config:
      rules:
        - field: "insurance_type"
          operator: "is equal to"
          value: "{{insurance_type}}"
        - field: "state"
          operator: "is in list"
          value: "{{allowed_states}}"

  - name: "Calculate Premium"
    type: "custom_js"
    config:
      script: |
        const baseRate = {{base_rate}};
        const ageMultiplier = lead.age < 25 ? 1.5 : 1.0;
        const stateMultiplier = {{state_multipliers}}[lead.state] || 1.0;
        return baseRate * ageMultiplier * stateMultiplier;
```

### Variable Substitution

Dynamic template values:

```javascript
// Define variables
const variables = {
  // Simple substitution
  api_key: "{{API_KEY}}",
  
  // Lists
  allowed_states: "{{STATES|split:','}}",
  
  // Conditionals
  use_enhancement: "{{ENHANCE|default:true}}",
  
  // Computed
  timeout_ms: "{{TIMEOUT_SECONDS|multiply:1000}}"
};

// Usage in template
delivery_config: {
  url: "{{buyer_endpoint}}",
  headers: {
    "Authorization": "Bearer {{api_key}}",
    "X-Timeout": "{{timeout_ms}}"
  },
  retry: "{{retry_count}}"
}
```

## 🔗 Template Inheritance

### Base Templates

Create hierarchical templates:

```javascript
// Base template
const baseLeadTemplate = {
  name: "Base Lead Flow",
  steps: [
    { name: "Parse", type: "field_parse" },
    { name: "Validate", type: "validation" },
    { name: "Normalize", type: "normalization" }
  ]
};

// Extended template
const enhancedLeadTemplate = {
  extends: "Base Lead Flow",
  steps: [
    ...baseLeadTemplate.steps,
    { name: "Enhance", type: "data_append" },
    { name: "Score", type: "lead_scoring" }
  ]
};

// Specialized template
const autoLeadTemplate = {
  extends: "Enhanced Lead Flow",
  steps: [
    ...enhancedLeadTemplate.steps,
    { name: "Auto Data", type: "vehicle_append" },
    { name: "Insurance Check", type: "insurance_verify" }
  ]
};
```

### Override Patterns

Customize inherited steps:

```javascript
// Override specific step
const customTemplate = {
  extends: "Standard Lead Buyer",
  overrides: {
    "Delivery": {
      timeout: 60000,  // Increase timeout
      headers: {
        "X-Custom-Header": "value"
      }
    },
    "Validation": {
      rules: [
        ...inheritedRules,
        { field: "custom_field", required: true }
      ]
    }
  }
};
```

## 📚 Template Library

### Organizing Templates

Structure for reuse:

```
Template Library/
├── Base Templates/
│   ├── Standard Flow
│   ├── Ping Post Base
│   └── Multi Buyer Base
├── Industry Specific/
│   ├── Insurance/
│   ├── Solar/
│   ├── Education/
│   └── Finance/
├── Integration Templates/
│   ├── CRM Systems/
│   ├── Email Platforms/
│   └── Custom APIs/
└── Advanced Patterns/
    ├── Machine Learning/
    ├── A/B Testing/
    └── Complex Routing/
```

### Version Control

Manage template evolution:

```javascript
const templateVersion = {
  version: "2.1.0",
  changelog: [
    {
      version: "2.1.0",
      date: "2024-01-15",
      changes: [
        "Added consent verification step",
        "Updated field mappings for new API",
        "Improved error handling"
      ]
    },
    {
      version: "2.0.0",
      date: "2023-12-01",
      changes: [
        "Major refactor for performance",
        "Added parallel processing"
      ]
    }
  ],
  compatibility: {
    min_version: "2.0.0",
    breaking_changes: ["API endpoint format"]
  }
};
```

## 🔄 Template Patterns

### Dynamic Step Inclusion

Conditional steps:

```javascript
// Template with conditional steps
const flexibleTemplate = {
  steps: [
    {
      name: "Basic Validation",
      type: "validation",
      always: true
    },
    {
      name: "Phone Enhancement",
      type: "phone_append",
      condition: "{{enhance_phone}}",
      skipIfFalse: true
    },
    {
      name: "Credit Check",
      type: "credit_append",
      condition: "{{buyer_requires_credit}}",
      skipIfFalse: true
    }
  ]
};
```

### Multi-Environment Templates

Environment-aware configs:

```javascript
const environmentTemplate = {
  environments: {
    development: {
      api_endpoint: "https://sandbox-api.example.com",
      debug: true,
      volume_cap: 100
    },
    staging: {
      api_endpoint: "https://staging-api.example.com",
      debug: false,
      volume_cap: 1000
    },
    production: {
      api_endpoint: "https://api.example.com",
      debug: false,
      volume_cap: null
    }
  },
  
  getCurrentConfig: function() {
    const env = process.env.ENVIRONMENT || 'development';
    return this.environments[env];
  }
};
```

### Composite Templates

Combine multiple patterns:

```javascript
// Modular template composition
const compositeFlow = {
  name: "Complete Lead System",
  modules: [
    {
      template: "Lead Ingestion Module",
      config: { source_type: "web_form" }
    },
    {
      template: "Enhancement Module",
      config: { 
        enhancements: ["phone", "email", "property"]
      }
    },
    {
      template: "Distribution Module",
      config: {
        distribution_type: "weighted",
        buyers: ["buyer1", "buyer2", "buyer3"]
      }
    }
  ]
};
```

## 🎯 Best Practices

### Template Design Principles

1. **Single Responsibility**:
   ```javascript
   // Good: Focused template
   const emailValidationTemplate = {
     name: "Email Validation",
     purpose: "Validate and verify email addresses",
     steps: [/* email-specific steps */]
   };
   ```

2. **Sensible Defaults**:
   ```javascript
   variables: [
     {
       name: "timeout",
       default: 30000,  // Reasonable default
       description: "API timeout in ms"
     }
   ]
   ```

3. **Clear Documentation**:
   ```javascript
   metadata: {
     description: "Routes leads to insurance buyers by type",
     prerequisites: [
       "Insurance type field must be present",
       "State must be valid US state"
     ],
     outputs: [
       "Routed to appropriate buyer",
       "Price set based on buyer agreement"
     ]
   }
   ```

### Testing Templates

Validate before sharing:

```javascript
const templateTest = {
  testCases: [
    {
      name: "Valid insurance lead",
      input: {
        insurance_type: "auto",
        state: "CA",
        age: 35
      },
      expected: {
        routed_to: "auto_buyer_ca",
        price_range: [20, 50]
      }
    },
    {
      name: "Invalid state",
      input: {
        insurance_type: "auto",
        state: "XX"
      },
      expected: {
        outcome: "rejected",
        reason: "Invalid state"
      }
    }
  ]
};
```

### Template Maintenance

Keep templates current:

1. **Regular Reviews**: Quarterly template audits
2. **Usage Tracking**: Monitor which templates are used
3. **Feedback Loop**: Collect user improvements
4. **Deprecation**: Clear sunset process

## 📈 Advanced Template Usage

### Template Analytics

Track template effectiveness:

```javascript
const templateMetrics = {
  usage_count: 156,
  avg_customization_time: "12 minutes",
  success_rate: 0.94,
  common_modifications: [
    "API endpoint (89%)",
    "Field mappings (67%)",
    "Timeout values (45%)"
  ],
  user_satisfaction: 4.7
};
```

### Template Marketplace

Share within organization:

```javascript
const marketplaceEntry = {
  template: "Advanced Solar Lead Router",
  author: "Operations Team",
  rating: 4.8,
  downloads: 234,
  tags: ["solar", "residential", "multi-state"],
  pricing_model: "free",
  support_level: "community"
};
```

## 📚 Related Documentation

- [Flow Creation Guide](./creating-flows.md) - Basic flow setup
- [Best Practices](../best-practices/) - Design patterns
- [Import/Export](./import-export.md) - Sharing templates

---

🏗️ **Template Excellence**: Well-designed templates accelerate development and ensure consistency. Invest time in creating good templates—they pay dividends in efficiency and quality!