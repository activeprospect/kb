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
    <header className={clsx('hero hero--primary', styles.heroBanner)}>
      <div className="container">
        <Heading as="h1" className="hero__title">
          {siteConfig.title}
        </Heading>
        <p className="hero__subtitle">{siteConfig.tagline}</p>
        <div className={styles.buttons}>
          <Link
            className="button button--secondary button--lg"
            to="/v2/">
            Get Started with Documentation
          </Link>
        </div>
      </div>
    </header>
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
              <div className={clsx('col col--6')}>
                <div className="text--center padding-horiz--md">
                  <Heading as="h3">Latest Version (v2)</Heading>
                  <p>Access the most up-to-date documentation with new features and improvements.</p>
                  <Link to="/v2/">Browse v2 Documentation →</Link>
                </div>
              </div>
              <div className={clsx('col col--6')}>
                <div className="text--center padding-horiz--md">
                  <Heading as="h3">Previous Version (v1)</Heading>
                  <p>Legacy documentation for existing implementations and reference.</p>
                  <Link to="/v1/">Browse v1 Documentation →</Link>
                </div>
              </div>
            </div>
          </div>
        </section>
      </main>
    </Layout>
  );
}
