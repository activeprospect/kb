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
            'guide/getting-started/building-your-first-flow',
            'guide/getting-started/adding-sources',
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
            'guide/flow-management/acceptance-criteria',
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
            'guide/troubleshooting/lead-rejection-analysis',
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
  ],
};

export default sidebars;
