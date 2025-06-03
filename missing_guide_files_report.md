# Missing Guide Files Report

This report lists all the guide files that are referenced in index.md files but don't exist in the docs/v2/guide directory structure.

## Summary

Total missing files: **57 unique files** (some are referenced multiple times across different index files)

## Missing Files by Section

### Analytics Section (9 files)
- `analytics/cohort-analysis.md` - Cohort Analysis
- `analytics/conversion-tracking.md` - Conversion Tracking
- `analytics/data-exports.md` - Data Exports
- `analytics/event-mining.md` - Event Mining Techniques
- `analytics/predictive-analytics.md` - Predictive Analytics
- `analytics/real-time-monitoring.md` - Real-Time Monitoring
- `analytics/roi-analysis.md` - ROI Analysis
- `analytics/understanding-events.md` - Understanding Events
- `analytics/vendor-performance.md` - Vendor Performance Tracking

### Best Practices Section (9 files)
- `best-practices/cost-optimization.md` - Cost Optimization
- `best-practices/disaster-recovery.md` - Disaster Recovery Planning
- `best-practices/education-leads.md` - Education Lead Optimization
- `best-practices/financial-services.md` - Financial Services Compliance
- `best-practices/high-volume-processing.md` - High-Volume Processing
- `best-practices/insurance-leads.md` - Insurance Lead Best Practices
- `best-practices/multi-flow-architecture.md` - Multi-Flow Architecture
- `best-practices/quality-control.md` - Quality Control Strategies
- `best-practices/vendor-management.md` - Vendor Management Excellence

### Compliance Section (7 files)
- `compliance/advanced-suppression.md` - Advanced Suppression Strategies
- `compliance/advanced-trustedform.md` - Advanced TrustedForm Configuration
- `compliance/consent-language.md` - Consent Language Management
- `compliance/multi-state-compliance.md` - Multi-State Compliance
- `compliance/suppression-basics.md` - Suppression List Fundamentals
- `compliance/trustedform-basics.md` - TrustedForm Basics
- `compliance/trustedform-decisions-vs-insights.md` - TrustedForm Decisions vs Insights

### Data Management Section (8 files)
- `data-management/advanced-mappings.md` - Advanced Mapping Techniques
- `data-management/custom-fields.md` - Custom Field Strategies
- `data-management/data-retention.md` - Extended Data Retention
- `data-management/data-validation.md` - Data Validation Best Practices
- `data-management/field-mapping.md` - Field Mapping Strategies
- `data-management/understanding-types.md` - Understanding Data Types
- `data-management/working-with-lists.md` - Working with Lists
- `data-management/working-with-templates.md` - Working with Templates

### Flow Management Section (7 files)
- `flow-management/filter-routing.md` - Filter Steps and Routing
- `flow-management/hours-of-operation.md` - Hours of Operation
- `flow-management/multi-buyer-distribution.md` - Multi-Buyer Distribution
- `flow-management/performance-optimization.md` - Flow Performance Optimization
- `flow-management/pricing-strategies.md` - Pricing Strategies
- `flow-management/service-area-routing.md` - Service Area Routing
- `flow-management/working-with-steps.md` - Working with Flow Steps

### Integrations Section (10 files)
- `integrations/batch-delivery.md` - Batch Delivery Setup
- `integrations/custom-api.md` - Custom API Integration
- `integrations/email-platforms.md` - Email Platform Connections
- `integrations/five9-integration.md` - Five9 Dialer Integration
- `integrations/google-sheets.md` - Google Sheets Integration
- `integrations/hubspot-setup.md` - HubSpot Connection
- `integrations/multi-system-distribution.md` - Multi-System Distribution
- `integrations/real-time-delivery.md` - Real-Time Delivery
- `integrations/salesforce-integration.md` - Salesforce Integration
- `integrations/webhook-setup.md` - Webhook Configuration

### Troubleshooting Section (9 files)
- `troubleshooting/duplicate-issues.md` - Duplicate Lead Problems
- `troubleshooting/facebook-lead-ads-issues.md` - Facebook Lead Ads Issues
- `troubleshooting/field-mapping-issues.md` - Field Mapping Issues
- `troubleshooting/integration-errors.md` - Integration Connection Errors
- `troubleshooting/performance-issues.md` - Performance Optimization
- `troubleshooting/testing-strategies.md` - Testing Strategies
- `troubleshooting/trustedform-errors.md` - TrustedForm Certificate Errors
- `troubleshooting/using-events.md` - Using Events for Debugging
- `troubleshooting/volume-cap-issues.md` - Volume Cap Troubleshooting

## Existing Files in Guide Sections

For reference, here are the files that DO exist:

### Analytics
- `analytics/custom-reports.md`

### Best Practices
- `best-practices/flow-optimization.md`
- `best-practices/workflow-optimization.md`

### Compliance
- `compliance/implementing-trustedform.md`
- `compliance/tcpa-compliance.md`

### Data Management
- `data-management/content-filtering.md`
- `data-management/data-mapping.md`
- `data-management/field-configuration.md`
- `data-management/suppression-lists.md`

### Flow Management
- `flow-management/acceptance-criteria.md`
- `flow-management/configuring-delivery.md`
- `flow-management/disabling-steps.md`
- `flow-management/managing-flow-steps.md`
- `flow-management/volume-caps.md`

### Getting Started
- `getting-started/adding-sources.md`
- `getting-started/basic-troubleshooting.md`
- `getting-started/building-your-first-flow.md`
- `getting-started/first-integration.md`
- `getting-started/testing-your-flow.md`
- `getting-started/understanding-submission.md`
- `getting-started/what-is-leadconduit.md`

### Integrations
- `integrations/email-marketing-platforms.md`
- `integrations/facebook-lead-ads.md`
- `integrations/webhooks-and-apis.md`

### Troubleshooting
- `troubleshooting/common-issues.md`
- `troubleshooting/lead-rejection-analysis.md`

## Actions Needed

1. **Create Missing Files**: All 57 missing files need to be created with appropriate content
2. **Update Index Files**: Some index.md files may need to be updated to remove references to files that won't be created
3. **Verify Links**: After creating files, verify all internal links work correctly

## Notes

- Some files are referenced multiple times in the same index file (e.g., in different sections like "By Use Case")
- The Getting Started section has NO missing files - it's complete
- The Analytics section has the highest percentage of missing files (9 out of 10 referenced files don't exist)