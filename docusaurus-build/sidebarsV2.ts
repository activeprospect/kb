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
      items: [
        'introduction/index',
        'introduction/key-concepts-overview',
      ],
    },
    // Guides section will be added when guide content is created
    {
      type: 'category',
      label: 'Reference',
      collapsed: false,
      items: [
        'reference/index',
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
      items: [
        'api/index',
      ],
    },
  ],
};

export default sidebars;
