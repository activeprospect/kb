import type {ReactNode} from 'react';
import clsx from 'clsx';
import Link from '@docusaurus/Link';
import useDocusaurusContext from '@docusaurus/useDocusaurusContext';
import Layout from '@theme/Layout';
import Heading from '@theme/Heading';

import styles from './index.module.css';

function HomepageHeader() {
  const {siteConfig} = useDocusaurusContext();
  return (
    <header className={clsx('hero', styles.heroBanner)}>
      <div className="container">
        <Heading as="h1" className={styles.heroTitle}>
          {siteConfig.title}
        </Heading>
        <p className={styles.heroSubtitle}>{siteConfig.tagline}</p>
        <div className={styles.buttons}>
          <Link
            className={clsx('button button--primary button--lg', styles.getStarted)}
            to="/v2/">
            Get Started →
          </Link>
          <Link
            className={clsx('button button--outline button--secondary button--lg', styles.learnMore)}
            to="/v2/">
            View Documentation
          </Link>
        </div>
      </div>
    </header>
  );
}

type FeatureItem = {
  title: string;
  description: string;
  link: string;
  linkText: string;
};

const FeatureList: FeatureItem[] = [
  {
    title: 'Latest Documentation (v2)',
    description: 'Access the most current documentation with comprehensive guides, API references, and best practices for LeadConduit.',
    link: '/v2/',
    linkText: 'Browse v2 Docs',
  },
  {
    title: 'Legacy Documentation (v1)',
    description: 'Reference materials for existing v1 implementations, migration guides, and historical documentation.',
    link: '/v1/',
    linkText: 'Browse v1 Docs',
  },
];

function Feature({title, description, link, linkText}: FeatureItem) {
  return (
    <div className={clsx('col col--6')}>
      <div className={styles.featureCard}>
        <div className="text--center">
          <Heading as="h3" className={styles.featureTitle}>{title}</Heading>
          <p className={styles.featureDescription}>{description}</p>
          <Link className={styles.featureLink} to={link}>
            {linkText} →
          </Link>
        </div>
      </div>
    </div>
  );
}

export default function Home(): ReactNode {
  const {siteConfig} = useDocusaurusContext();
  return (
    <Layout
      title={`Welcome to ${siteConfig.title}`}
      description="LeadConduit documentation and guides">
      <HomepageHeader />
      <main>
        <section className={styles.features}>
          <div className="container">
            <div className="row">
              {FeatureList.map((props, idx) => (
                <Feature key={idx} {...props} />
              ))}
            </div>
          </div>
        </section>
      </main>
    </Layout>
  );
}
