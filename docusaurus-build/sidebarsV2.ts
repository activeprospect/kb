import type {SidebarsConfig} from '@docusaurus/plugin-content-docs';

// This runs in Node.js - Don't use client-side code here (browser APIs, JSX...)

/**
 * Creating a sidebar enables you to:
 - create an ordered group of docs
 - render a sidebar for each doc of that group
 - provide next/previous navigation

 The sidebars can be generated from the filesystem, or explicitly defined here.

 Create as many sidebars as you want.
 */
const sidebars: SidebarsConfig = {
  // Manual sidebar configuration with custom ordering
  tutorialSidebar: [
    {
      type: 'category',
      label: 'Introduction',
      collapsed: false,
      link: {
        type: 'doc',
        id: 'introduction/index',
      },
      items: [
        'introduction/key-concepts-overview',
        'introduction/product-overview',
        'introduction/data-model',
      ],
    },
    {
      type: 'category',
      label: 'Getting Started',
      collapsed: false,
      link: {
        type: 'doc',
        id: 'getting-started/index',
      },
      items: [
        'getting-started/first-flow',
        'getting-started/for-buyers',
        'getting-started/for-sellers',
      ],
    },
    {
      type: 'category',
      label: 'Guides',
      collapsed: false,
      link: {
        type: 'doc',
        id: 'guide/index',
      },
      items: [
        {
          type: 'category',
          label: 'Getting Started',
          collapsed: true,
          link: {
            type: 'doc',
            id: 'guide/getting-started/index',
          },
          items: [
            'guide/getting-started/what-is-leadconduit',
            'guide/getting-started/building-your-first-flow',
            'guide/getting-started/adding-sources',
            'guide/getting-started/understanding-submission',
            'guide/getting-started/testing-your-flow',
            'guide/getting-started/first-integration',
            'guide/getting-started/basic-troubleshooting',
          ],
        },
        {
          type: 'category',
          label: 'Flow Management',
          collapsed: true,
          link: {
            type: 'doc',
            id: 'guide/flow-management/index',
          },
          items: [
            'guide/flow-management/managing-flow-steps',
            'guide/flow-management/acceptance-criteria',
            'guide/flow-management/volume-caps',
            'guide/flow-management/volume-caps-advanced',
            'guide/flow-management/buyer-step-connections',
            'guide/flow-management/disabling-steps',
            'guide/flow-management/using-templates',
            'guide/flow-management/hours-of-operation',
            'guide/flow-management/day-parting-strategies',
            'guide/flow-management/configuring-delivery',
          ],
        },
        {
          type: 'category',
          label: 'Data Management',
          collapsed: true,
          link: {
            type: 'doc',
            id: 'guide/data-management/index',
          },
          items: [
            'guide/data-management/field-configuration',
            'guide/data-management/data-mapping',
            'guide/data-management/content-filtering',
            'guide/data-management/suppression-lists',
            'guide/data-management/list-management',
            'guide/data-management/duplicate-management',
            'guide/data-management/lead-feedback',
          ],
        },
        {
          type: 'category',
          label: 'Integrations',
          collapsed: true,
          link: {
            type: 'doc',
            id: 'guide/integrations/index',
          },
          items: [
            'guide/integrations/facebook-lead-ads',
            'guide/integrations/email-marketing-integrations',
            'guide/integrations/email-marketing-platforms',
            'guide/integrations/zapier-integration',
            'guide/integrations/batch-delivery-management',
            'guide/integrations/response-parsing',
            'guide/integrations/webhooks-and-apis',
          ],
        },
        {
          type: 'category',
          label: 'Analytics',
          collapsed: true,
          link: {
            type: 'doc',
            id: 'guide/analytics/index',
          },
          items: [
            'guide/analytics/understanding-events',
            'guide/analytics/custom-reports',
            'guide/analytics/leadconduit-reporting',
            'guide/analytics/monitoring-performance',
            'guide/analytics/data-exports',
            'guide/analytics/lead-feedback-system',
          ],
        },
        {
          type: 'category',
          label: 'Best Practices',
          collapsed: true,
          link: {
            type: 'doc',
            id: 'guide/best-practices/index',
          },
          items: [
            'guide/best-practices/leadconduit-pro-tips',
            'guide/best-practices/workflow-optimization',
            'guide/best-practices/flow-optimization',
          ],
        },
        {
          type: 'category',
          label: 'Compliance',
          collapsed: true,
          link: {
            type: 'doc',
            id: 'guide/compliance/index',
          },
          items: [
            'guide/compliance/implementing-trustedform',
            'guide/compliance/tcpa-compliance',
            'guide/compliance/trustedform-api-guide',
          ],
        },
        {
          type: 'category',
          label: 'Troubleshooting',
          collapsed: true,
          link: {
            type: 'doc',
            id: 'guide/troubleshooting/index',
          },
          items: [
            'guide/troubleshooting/common-issues',
            'guide/troubleshooting/lead-rejection-analysis',
          ],
        },
        {
          type: 'category',
          label: 'Advanced Topics',
          collapsed: true,
          link: {
            type: 'doc',
            id: 'guide/advanced/index',
          },
          items: [
            'guide/advanced/ping-post',
            'guide/advanced/real-time-bidding',
            'guide/advanced/multi-buyer-routing',
          ],
        },
      ],
    },
    {
      type: 'category',
      label: 'Flows',
      collapsed: true,
      link: {
        type: 'doc',
        id: 'flows/index',
      },
      items: [
        {
          type: 'category',
          label: 'Lead Submission',
          collapsed: true,
          link: {
            type: 'doc',
            id: 'flows/lead-submission/index',
          },
          items: [
            'flows/lead-submission/sources',
            'flows/lead-submission/mappings',
          ],
        },
      ],
    },
    {
      type: 'category',
      label: 'Leads & Events',
      collapsed: true,
      link: {
        type: 'doc',
        id: 'leads/index',
      },
      items: [
        {
          type: 'category',
          label: 'Events',
          collapsed: true,
          link: {
            type: 'doc',
            id: 'leads/events/index',
          },
          items: [
            'leads/events/event-patterns',
            'leads/events/system-events',
            'leads/events/filter-events',
            'leads/events/recipient-events',
            'leads/events/feedback-events',
            'leads/events/retention-archival',
          ],
        },
      ],
    },
    {
      type: 'category',
      label: 'Reference',
      collapsed: false,
      link: {
        type: 'doc',
        id: 'reference/index',
      },
      items: [
        'reference/concepts',
        {
          type: 'category',
          label: 'Flows',
          collapsed: true,
          link: {
            type: 'doc',
            id: 'reference/flows',
          },
          items: [
            'reference/flows/pre-processing',
            'reference/flows/step-processing',
            'reference/flows/business-logic',
            'reference/flows/delivery',
            'reference/flows/completion',
          ],
        },
        'reference/lifecycle',
        'reference/fields',
        'reference/entities',
        'reference/types',
        'reference/mappings',
        'reference/integrations',
        'reference/templates',
        'reference/rules',
        'reference/navigation',
      ],
    },
    {
      type: 'category',
      label: 'API',
      collapsed: true,
      link: {
        type: 'doc',
        id: 'api/index',
      },
      items: [
        // API sub-pages will be added here as they're created
      ],
    },
    {
      type: 'category',
      label: 'Tutorials',
      collapsed: true,
      link: {
        type: 'doc',
        id: 'guides/tutorials/index',
      },
      items: [
        'guides/tutorials/leadconduit-tutorial',
        'guides/tutorials/data-security-in-leadconduit',
        'guides/tutorials/feedback-instructions',
        'guides/tutorials/shared-reporting',
      ],
    },
    {
      type: 'category',
      label: 'Appendix',
      collapsed: true,
      link: {
        type: 'doc',
        id: 'appendix/index',
      },
      items: [
        'appendix/activeprospect-product-glossary',
        'appendix/leadsbridge-glossary',
        'appendix/trustedform-glossary',
        'appendix/content-taxonomy',
      ],
    },
  ],
};

export default sidebars;
