---
tags:
  - admin-focused
  - advanced
  - reference
  - migration
  - technical
  - operation
---

# Image Migration Guide

This guide tracks image migrations from bloomfire content to the new guide structure.

## Migration Strategy

1. **Directory Structure**:
   ```
   /docs/v2/guide/[category]/images/
   ```

2. **Naming Convention**:
   - Keep original names when clear (e.g., `flow-dashboard.png`)
   - Rename generic names (e.g., `image-1.png` → `volume-cap-config.png`)

3. **Image References**:
   - Use relative paths: `./images/filename.png`
   - Add alt text: `![Description](./images/filename.png)`

## Completed Migrations

### Flow Management
- **Volume Caps** (flow-management/images/)
  - image-1.png - Flow/Source caps configuration
  - image-2.png - Volume caps configuration options
  - image-3.png - Multiple and conditional caps
  - image-4.png - Nested caps example
  - image-5.png - Flow dashboard with caps
  - image-6.png - LeadConduit dashboard with nested caps
  - ✅ All images copied and referenced in guide

### Integrations
- **Facebook Lead Ads** (integrations/images/)
  - image-1.png - Custom field mapping configuration
  - ✅ Images copied and referenced in guide

## Pending Migrations

### Getting Started
- None identified yet

### Data Management
- Suppression list configurations

### Integrations
- Facebook Lead Ads setup screenshots
- CRM integration examples

### Compliance
- TrustedForm certificate examples
- Consent verification screenshots

### Troubleshooting
- Event view examples
- Error message screenshots

### Analytics
- Report builder interface
- Dashboard examples

### Best Practices
- Workflow optimization examples

## Migration Process

1. **Identify Images**:
   ```bash
   ls /Users/alex/Dev/kb/content/bloomfire/[article]/images/
   ```

2. **Create Target Directory**:
   ```bash
   mkdir -p /Users/alex/Dev/kb/docs/v2/guide/[category]/images
   ```

3. **Copy Images**:
   ```bash
   cp "/Users/alex/Dev/kb/content/bloomfire/[article]/images/"*.png \
      /Users/alex/Dev/kb/docs/v2/guide/[category]/images/
   ```

4. **Update References**:
   - Change from: `![](images/image-1.png)`
   - Change to: `![Description](./images/meaningful-name.png)`

5. **Verify Display**:
   - Check that images load correctly
   - Ensure alt text is descriptive