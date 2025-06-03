import {themes as prismThemes} from 'prism-react-renderer';
import type {Config} from '@docusaurus/types';
import type * as Preset from '@docusaurus/preset-classic';

const config: Config = {
  title: 'LeadConduit Documentation',
  tagline: 'Comprehensive documentation for LeadConduit lead management platform',
  favicon: 'img/favicon.ico',

  url: 'https://activeprospect.github.io',
  baseUrl: '/kb/',

  organizationName: 'activeprospect',
  projectName: 'kb',

  onBrokenLinks: 'warn',
  onBrokenMarkdownLinks: 'warn',

  i18n: {
    defaultLocale: 'en',
    locales: ['en'],
  },

  markdown: {
    format: 'md',
    mermaid: false,
    mdx1Compat: {
      comments: false,
      admonitions: false,
      headingIds: false,
    },
  },

  presets: [
    [
      'classic',
      {
        docs: false, // Disable default docs plugin
        blog: false,
        theme: {
          customCss: './src/css/custom.css',
        },
      } satisfies Preset.Options,
    ],
  ],

  plugins: [
    // Version 2 (current)
    [
      '@docusaurus/plugin-content-docs',
      {
        id: 'v2',
        path: '../docs/v2',
        routeBasePath: 'v2',
        sidebarPath: './sidebarsV2.ts',
        editUrl: 'https://github.com/activeprospect/kb/tree/main/',
        showLastUpdateTime: true,
      },
    ],
    // Version 1
    [
      '@docusaurus/plugin-content-docs',
      {
        id: 'v1',
        path: '../docs/v1',
        routeBasePath: 'v1',
        sidebarPath: './sidebarsV1.ts',
        editUrl: 'https://github.com/activeprospect/kb/tree/main/',
      },
    ],
    // Redirect root to v2
    [
      '@docusaurus/plugin-client-redirects',
      {
        redirects: [
          {
            to: '/v2/',
            from: '/',
          },
        ],
      },
    ],
    // Custom plugin to fix category navigation
    './src/plugins/category-nav-fix.js',
  ],

  themeConfig: {
    docs: {
      sidebar: {
        autoCollapseCategories: true,
      },
    },
    navbar: {
      title: 'LeadConduit',
      logo: {
        alt: 'ActiveProspect Logo',
        src: 'img/activeprospect_logo.png',
      },
      items: [
        {
          type: 'dropdown',
          label: 'Version',
          position: 'right',
          items: [
            {
              label: 'v2 (Latest)',
              to: '/v2/',
            },
            {
              label: 'v1',
              to: '/v1/',
            },
          ],
        },
        {
          to: '/v2/',
          label: 'Documentation',
          position: 'left',
        },
        {
          href: 'https://github.com/activeprospect',
          label: 'GitHub',
          position: 'right',
        },
      ],
    },
    footer: {
      style: 'dark',
      links: [
        {
          title: 'Documentation',
          items: [
            {
              label: 'Version 2',
              to: '/v2/',
            },
            {
              label: 'Version 1',
              to: '/v1/',
            },
          ],
        },
        {
          title: 'More',
          items: [
            {
              label: 'GitHub',
              href: 'https://github.com/activeprospect',
            },
            {
              label: 'ActiveProspect',
              href: 'https://activeprospect.com',
            },
          ],
        },
      ],
      copyright: `Copyright © ${new Date().getFullYear()} ActiveProspect, Inc.`,
    },
    prism: {
      theme: prismThemes.github,
      darkTheme: prismThemes.dracula,
    },
  } satisfies Preset.ThemeConfig,
};

export default config;