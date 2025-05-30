---
layout: default
title: LeadConduit User Guide
description: Comprehensive documentation for the LeadConduit lead management platform
---

<div class="hero-section">
    <div class="hero-content">
        <img src="{{ '/images/activeprospect_logo.png' | relative_url }}" alt="ActiveProspect" class="hero-logo">
        <h1 class="hero-title">LeadConduit User Guide</h1>
        <p class="hero-description">
            Comprehensive documentation for mastering LeadConduit's powerful lead management and routing platform. 
            From basic setup to advanced integrations, everything you need to optimize your lead operations.
        </p>
        <div class="hero-actions">
            <a href="{{ '/UserGuide/GettingStarted/' | relative_url }}" class="btn btn-primary">Get Started</a>
            <a href="{{ '/UserGuide/Appendices/api-reference/' | relative_url }}" class="btn btn-secondary">API Reference</a>
        </div>
    </div>
</div>

<div class="features-grid">
    <div class="feature-card">
        <div class="feature-icon">🚀</div>
        <h3>Quick Start</h3>
        <p>Get up and running with LeadConduit in minutes. Step-by-step guides for account setup and your first flow.</p>
        <a href="{{ '/UserGuide/GettingStarted/' | relative_url }}" class="feature-link">Start Here →</a>
    </div>
    
    <div class="feature-card">
        <div class="feature-icon">🏗️</div>
        <h3>Build Foundations</h3>
        <p>Master the core concepts: rules, templates, variables, and validation systems that power LeadConduit.</p>
        <a href="{{ '/UserGuide/FoundationalBuildingBlocks/' | relative_url }}" class="feature-link">Learn More →</a>
    </div>
    
    <div class="feature-card">
        <div class="feature-icon">📊</div>
        <h3>Manage Leads</h3>
        <p>Complete guide to lead submission, processing, enhancement, routing, and real-time streaming.</p>
        <a href="{{ '/UserGuide/LeadsAndEvents/' | relative_url }}" class="feature-link">Explore →</a>
    </div>
    
    <div class="feature-card">
        <div class="feature-icon">🔄</div>
        <h3>Design Flows</h3>
        <p>Create sophisticated workflows with sources, steps, delivery, and feedback management.</p>
        <a href="{{ '/UserGuide/Flows/' | relative_url }}" class="feature-link">Build Flows →</a>
    </div>
    
    <div class="feature-card">
        <div class="feature-icon">📈</div>
        <h3>Analytics & Reports</h3>
        <p>Comprehensive reporting, custom dashboards, and analytics to optimize your lead operations.</p>
        <a href="{{ '/UserGuide/ReportsAndAnalytics/' | relative_url }}" class="feature-link">View Reports →</a>
    </div>
    
    <div class="feature-card">
        <div class="feature-icon">⚡</div>
        <h3>Add-On Services</h3>
        <p>Enhance your workflows with SuppressionList, TrustedForm, and other premium services.</p>
        <a href="{{ '/UserGuide/AddOnServices/' | relative_url }}" class="feature-link">Add Services →</a>
    </div>
</div>

<div class="quick-access">
    <h2>Quick Access</h2>
    <div class="quick-links-grid">
        <div class="quick-link-card">
            <i class="fas fa-book"></i>
            <h4>Glossary</h4>
            <p>Complete terminology reference</p>
            <a href="{{ '/UserGuide/Appendices/glossary/' | relative_url }}">Browse Terms</a>
        </div>
        
        <div class="quick-link-card">
            <i class="fas fa-code"></i>
            <h4>API Reference</h4>
            <p>REST API documentation</p>
            <a href="{{ '/UserGuide/Appendices/api-reference/' | relative_url }}">View API Docs</a>
        </div>
        
        <div class="quick-link-card">
            <i class="fas fa-tools"></i>
            <h4>Troubleshooting</h4>
            <p>Quick fixes and solutions</p>
            <a href="{{ '/UserGuide/Appendices/troubleshooting-quick-reference/' | relative_url }}">Get Help</a>
        </div>
        
        <div class="quick-link-card">
            <i class="fas fa-handshake"></i>
            <h4>Partners</h4>
            <p>Multi-party workflows</p>
            <a href="{{ '/UserGuide/WorkingWithPartners/' | relative_url }}">Partner Setup</a>
        </div>
    </div>
</div>

<style>
/* Hero Section */
.hero-section {
    text-align: center;
    padding: 4rem 2rem;
    background: linear-gradient(135deg, #f8fafc 0%, #e2e8f0 100%);
    border-radius: 1rem;
    margin-bottom: 3rem;
}

.hero-logo {
    height: 60px;
    margin-bottom: 1.5rem;
}

.hero-title {
    font-size: 3rem;
    font-weight: 700;
    color: var(--text-primary);
    margin-bottom: 1rem;
}

.hero-description {
    font-size: 1.25rem;
    color: var(--text-secondary);
    max-width: 600px;
    margin: 0 auto 2rem auto;
    line-height: 1.6;
}

.hero-actions {
    display: flex;
    gap: 1rem;
    justify-content: center;
    flex-wrap: wrap;
}

.btn {
    display: inline-block;
    padding: 0.75rem 1.5rem;
    border-radius: 0.5rem;
    text-decoration: none;
    font-weight: 600;
    transition: all 0.2s;
}

.btn-primary {
    background: var(--primary-color);
    color: white;
}

.btn-primary:hover {
    background: #1d4ed8;
    text-decoration: none;
}

.btn-secondary {
    background: white;
    color: var(--primary-color);
    border: 2px solid var(--primary-color);
}

.btn-secondary:hover {
    background: var(--primary-color);
    color: white;
    text-decoration: none;
}

/* Features Grid */
.features-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: 2rem;
    margin-bottom: 4rem;
}

.feature-card {
    background: white;
    border: 1px solid var(--border-color);
    border-radius: 0.75rem;
    padding: 2rem;
    text-align: center;
    transition: all 0.2s;
}

.feature-card:hover {
    border-color: var(--primary-color);
    box-shadow: var(--shadow-lg);
    transform: translateY(-2px);
}

.feature-icon {
    font-size: 3rem;
    margin-bottom: 1rem;
    display: block;
}

.feature-card h3 {
    color: var(--text-primary);
    margin-bottom: 1rem;
}

.feature-card p {
    color: var(--text-secondary);
    margin-bottom: 1.5rem;
}

.feature-link {
    color: var(--primary-color);
    font-weight: 600;
    text-decoration: none;
}

.feature-link:hover {
    text-decoration: underline;
}

/* Quick Access */
.quick-access {
    background: var(--sidebar-bg);
    border-radius: 0.75rem;
    padding: 2rem;
}

.quick-access h2 {
    text-align: center;
    margin-bottom: 2rem;
    color: var(--text-primary);
}

.quick-links-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    gap: 1.5rem;
}

.quick-link-card {
    background: white;
    border: 1px solid var(--border-color);
    border-radius: 0.5rem;
    padding: 1.5rem;
    text-align: center;
    transition: all 0.2s;
}

.quick-link-card:hover {
    border-color: var(--primary-color);
    box-shadow: var(--shadow);
}

.quick-link-card i {
    font-size: 2rem;
    color: var(--primary-color);
    margin-bottom: 1rem;
}

.quick-link-card h4 {
    margin-bottom: 0.5rem;
    color: var(--text-primary);
}

.quick-link-card p {
    font-size: 0.875rem;
    color: var(--text-secondary);
    margin-bottom: 1rem;
}

.quick-link-card a {
    color: var(--primary-color);
    font-weight: 600;
    text-decoration: none;
    font-size: 0.875rem;
}

.quick-link-card a:hover {
    text-decoration: underline;
}

/* Responsive */
@media (max-width: 768px) {
    .hero-title {
        font-size: 2rem;
    }
    
    .hero-description {
        font-size: 1rem;
    }
    
    .hero-actions {
        flex-direction: column;
        align-items: center;
    }
    
    .btn {
        width: 200px;
    }
}
</style>