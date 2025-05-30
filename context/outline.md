# LeadConduit User Guide - First Pass Outline

This document represents an initial outline for the LeadConduit user guide, based on the current content and structure of this repository. This is a living document that will evolve as we refine and expand the documentation.

* **Introduction**
  * What Is LeadConduit?
  * Key Benefits & Use Cases
  * Core Concepts at a Glance

* **Getting Started**
  * Sign Up & Log In
  * Dashboard Overview
  * User Roles & Permissions

* **Leads & Events**
  * **Ping** (Pre-submission Bidding)
    * Acceptance Criteria (Rule-Based)
    * Pricing (Rule-Based)
    * Volume Caps (Rule-Based)
    * Ping Limits
  * **Submitting Leads**
    * Manual Entry & CSV Import
    * API Submission
    * Mapping & Normalizing Lead Data
    * Controlling Volume
  * **Qualifying Leads**
    * Using Lead Data
    * Using 3rd-Party Enhancement Data
    * Duplicate Checking
  * **Delivering Leads**
    * Manual Test Deliveries
    * API-Driven Delivery
    * Automated Retry
    * Mapping & Normalizing Lead Data
    * Generic HTTP Integrations
    * Controlling Volume
    * Schedule Batch Delivery
  * **Enhancing Leads**
    * Add-On Services
    * Integrations
    * Require a Valid TrustedForm Cert
  * **Manage & Search Leads**
  * **Events**
    * Source Events
    * Recipient Events
    * Filter Events
    * Feedback-Received Events
    * Feedback-Sent Events
    * Retry Events
  * **Firehose (Real-Time Streaming)**
    * Overview & Use Cases
    * S3 Configuration
    * Enabling on a Flow

* **Flows**
  * **Flow Fields**
    * What Lead Data Is Collected
    * Built-In vs. Custom Field Definitions
  * **Flow Sources**
    * Tracking Vendor Sources
    * Source-Level Acceptance Criteria (Rule-Based)
    * Source-Level Pricing Rules
    * Source-Level Volume Caps
  * **Flow Steps**
    * Filter Step (Stopping Lead Flow)
    * Buyer Step (Selling a Lead to a Buyer)
    * Add-On Step (Appending Data to a Lead)
    * Integration Step (Third-Party or Backend Delivery)
  * **Delivery**
    * CRM & Dialer Configuration
    * Delivery Testing & Error Handling
    * Delivery Monitoring & Metrics
  * **Feedback**
    * Conversion
    * Returns
  * **Change Management**
    * Viewing Changes
    * Rolling Back Changes

* **Foundational Building Blocks**
  * **Fields & Data Types**
    * Built-In vs. Custom Fields
    * Validation & Normalization Rules
    * Versioning & Schema Evolution
  * **Templates, Variables & Rules**
    * Variables (System & Custom)
    * Templates (Handlebars)
    * Rules Engine Deep-Dive

* **Working with Your Partners**
  * **Connecting**
    * Invitation to Connect
    * Accepting an Invitation
  * **Sellers**
    * Access to Submission Instructions
  * **Buyers**

* **Reports & Analytics**
  * Pre-Built Dashboards
  * Custom Reports & Funnels
  * Scheduling & Sharing

* **Add-On Services**
  * Overview of Add-Ons
  * SuppressionList
  * TrustedForm Decisions (Ping & Post)
  * TrustedForm Insights
  * Automated Retry, Real-Time Bidding, etc.

* **Best Practices & Troubleshooting**
  * Designing Maintainable Flows
  * Ensuring Data Quality
  * Common Errors & Resolutions
  * Support Resources

* **Appendices**
  * Glossary of Terms
  * Keyboard Shortcuts
  * Release Notes & Change History
