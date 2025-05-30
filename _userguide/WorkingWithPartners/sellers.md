# Managing Sellers and Submission Access

## Overview

Seller management in LeadConduit centers on providing partners with the information and access they need to successfully submit leads to your flows. The submission instructions system serves as the primary interface between your lead acceptance requirements and your sellers' technical implementation, creating a standardized approach to lead delivery that ensures quality and consistency.

Effective seller management involves more than just providing technical documentation. It encompasses partner onboarding, ongoing communication, testing protocols, and performance monitoring. The submission instructions ecosystem in LeadConduit provides the foundation for these activities, offering both automated documentation generation and flexible sharing mechanisms that accommodate diverse partner technical capabilities.

## Understanding Submission Instructions

### What Are Submission Instructions?

Submission instructions are automatically generated, comprehensive technical documents that provide sellers with everything they need to submit leads to a specific flow and source combination. These documents are unique to each source within each flow, ensuring that partners receive precisely the information needed for their specific integration.

**Dynamic Generation**: LeadConduit automatically creates submission instructions based on your flow configuration, including acceptance criteria, field mappings, required fields, and validation rules. This ensures that documentation remains current as your flow evolves.

**Comprehensive Coverage**: Submission instructions include multiple technical formats (JSON, XML, form-encoded), example requests and responses, field descriptions, and acceptance criteria explanations. This comprehensive approach accommodates different technical implementation preferences.

**Security Integration**: Each submission instruction document includes unique URLs and authentication mechanisms that provide secure access while maintaining the flexibility that partners need for integration.

### Key Components of Submission Instructions

**Submission URL**: The specific endpoint where leads should be posted for your flow and source combination. This URL includes embedded authentication and routing information that ensures leads reach the correct destination.

**Field Specifications**: Detailed information about available fields, including required fields, optional fields, data types, validation rules, and example values. This specification enables partners to understand exactly what data is expected and how it should be formatted.

**Acceptance Criteria**: A comprehensive explanation of the logic that determines whether submitted leads are accepted or rejected. This includes field validation rules, business logic criteria, and any custom acceptance requirements you've configured.

**Format Examples**: Interactive examples showing how to submit leads using different technical approaches (POST requests, GET requests, JSON payloads, XML formats). Partners can select their preferred format and see corresponding examples.

**Response Specifications**: Detailed documentation of the responses partners can expect from LeadConduit, including success confirmations, rejection explanations, and error messages. This information enables partners to build robust error handling and retry logic.

## Accessing and Sharing Submission Instructions

### Finding Submission Instructions for Your Sources

LeadConduit provides multiple pathways for accessing submission instructions, accommodating different workflow preferences and organizational structures:

**Flow-Based Access**: Navigate to your flow, then use the "Submission Docs" dropdown in the top-right corner to select source-specific documentation. This approach is ideal when working within the context of a specific flow configuration.

**Sources Tab Method**: Within your flow's Sources tab, locate the documentation icon next to each source name. Clicking this icon opens the submission instructions for that specific source, providing quick access during flow configuration activities.

**Direct URL Access**: Each submission instruction document has a unique, shareable URL that can be bookmarked or distributed directly to partners. These URLs provide access to the documentation without requiring partners to navigate through your LeadConduit interface.

### Sharing Submission Instructions with Partners

**URL Distribution**: Copy the submission instruction URL from your browser's address bar and share it directly with partners. These URLs are designed to be shared and don't require LeadConduit account credentials for access.

**Partner Account Requirements**: External partners accessing submission instructions for the first time will be prompted to create a free LeadConduit account or log in with existing credentials. This lightweight authentication ensures access tracking while maintaining ease of use.

**Documentation Currency**: Shared submission instruction URLs automatically reflect the current configuration of your flow. Partners accessing these URLs will always see up-to-date information, eliminating the need to redistribute documentation after configuration changes.

### Managing Partner Access

**Access Tracking**: Monitor which partners are accessing submission instructions and how frequently they're reviewing the documentation. This information helps identify partners who may need additional support or guidance.

**Version Control**: As your flows evolve, submission instructions automatically update to reflect changes. Communicate significant changes to partners and provide transition timelines when necessary.

**Support Integration**: Use submission instruction access patterns to proactively identify partners who may be experiencing integration difficulties or who may benefit from additional technical support.

## Partner Onboarding and Setup

### Systematic Partner Onboarding

Effective seller onboarding creates the foundation for successful, long-term partnerships. The submission instructions system provides the technical foundation, but comprehensive onboarding encompasses broader relationship and operational elements.

**Information Gathering**: Before providing submission instructions, collect essential partner information including business details, technical capabilities, expected lead volumes, and integration timelines. This information guides the onboarding process and helps set appropriate expectations.

**Flow Configuration**: Configure your flow's acceptance criteria, field mappings, and routing logic before sharing submission instructions with partners. This ensures that documentation reflects your actual requirements rather than placeholder configurations.

**Initial Documentation Delivery**: Provide partners with submission instruction URLs along with contextual information about your business requirements, volume expectations, quality standards, and communication protocols.

### Technical Integration Support

**Format Selection Guidance**: Help partners choose appropriate submission formats based on their technical capabilities. While LeadConduit supports multiple formats, some partners may benefit from guidance in selecting the most suitable approach for their systems.

**Testing Protocols**: Establish clear testing procedures that allow partners to validate their integration before beginning production lead submission. This includes providing test scenarios, expected outcomes, and validation criteria.

**Implementation Validation**: Review initial submissions from new partners to ensure proper implementation of field mappings, data formatting, and error handling. Early validation prevents problems from persisting into production operations.

### Ongoing Partner Communication

**Change Notifications**: Implement processes for notifying partners of changes to flow configurations that affect submission requirements. This includes acceptance criteria updates, field changes, and validation rule modifications.

**Performance Feedback**: Provide regular feedback to partners about their submission quality, acceptance rates, and any patterns that suggest optimization opportunities.

**Support Escalation**: Establish clear channels for partners to request technical support, report issues, or seek clarification about submission requirements.

## Advanced Submission Instruction Features

### Interactive Examples and Testing

The submission instructions interface includes sophisticated tools that enable partners to understand and test integration requirements:

**Format Selector**: Partners can choose from different submission formats (JSON, XML, form-encoded) and see corresponding examples tailored to their selected approach. This customization reduces integration complexity and improves implementation accuracy.

**Interactive Testing**: The submission instructions interface allows partners to modify example data and submit test requests directly from the documentation. This capability enables real-time validation of integration approaches without requiring separate development environments.

**Response Simulation**: Partners can see examples of different response scenarios, including successful submissions, various rejection reasons, and error conditions. This comprehensive view enables robust error handling implementation.

### Batch Import Capabilities

**CSV Import Interface**: Submission instructions include direct access to batch lead import functionality, allowing partners to submit large volumes of leads through CSV file uploads. This capability is valuable for partners with batch processing workflows or historical data migration needs.

**Processing Transparency**: The batch import process provides real-time feedback about processing progress, acceptance rates, and any individual lead rejections. This transparency enables partners to identify and correct data quality issues efficiently.

**Volume Considerations**: Batch import processing operates within browser constraints, typically processing approximately 6 leads concurrently. Partners should consider these limitations when planning large import operations.

## Quality Assurance and Validation

### Submission Quality Monitoring

**Acceptance Rate Tracking**: Monitor partner submission acceptance rates to identify quality issues, configuration problems, or training needs. Consistent patterns of rejections often indicate specific areas where partners need additional guidance.

**Field Validation Analysis**: Review field-level validation failures to understand common data quality issues. This analysis can inform both partner training and flow configuration optimization.

**Volume Pattern Monitoring**: Track submission volume patterns to identify unusual activity that might indicate technical problems, business changes, or potential fraud concerns.

### Partner Performance Management

**Quality Metrics**: Establish clear quality metrics for partner submissions, including acceptance rates, data completeness, and compliance with business rules. Communicate these metrics to partners and provide regular performance reports.

**Improvement Support**: When partners experience quality issues, provide specific guidance about root causes and improvement strategies. This might include additional training, configuration adjustments, or implementation reviews.

**Recognition Programs**: Acknowledge partners who consistently deliver high-quality submissions. Recognition can include performance feedback, preferential treatment for new opportunities, or other incentives that encourage continued excellence.

## Troubleshooting Common Issues

### Access and Authentication Problems

**Login Difficulties**: Partners experiencing access problems may need assistance with account creation or password recovery. Provide clear guidance about the authentication requirements and support resources.

**URL Issues**: Submission instruction URLs occasionally become inaccessible due to configuration changes or system updates. Maintain current URL lists and be prepared to provide updated links when necessary.

**Permission Problems**: Partners may encounter access restrictions if their accounts lack appropriate permissions. Verify that partner accounts have the necessary access levels for submission instruction viewing.

### Technical Integration Issues

**Field Mapping Errors**: Common integration problems include incorrect field names, inappropriate data formatting, or missing required fields. Provide specific examples and validation tools to help partners identify and correct these issues.

**Format Compatibility**: Partners may encounter difficulties with specific submission formats. Be prepared to provide alternative format suggestions or additional technical guidance for complex integration scenarios.

**Response Handling**: Integration problems often stem from inadequate response handling. Help partners understand different response scenarios and implement appropriate error handling and retry logic.

### Documentation and Communication Issues

**Requirement Clarity**: Partners may request clarification about acceptance criteria, field requirements, or business rules. Maintain comprehensive documentation and be responsive to clarification requests.

**Change Management**: When flow configurations change, partners may need transition support to update their integrations. Provide clear change notifications and implementation timelines.

**Support Channel Management**: Ensure that partners know how to request support and that support requests are handled promptly and effectively.

## Best Practices for Seller Management

### Strategic Partner Relationship Management

**Segmented Approach**: Different partners have different capabilities, volumes, and requirements. Develop segmented approaches to seller management that accommodate these differences while maintaining consistent quality standards.

**Long-term Partnership Focus**: View seller relationships as long-term partnerships rather than transactional arrangements. Invest in partner success through training, support, and ongoing communication.

**Performance-Based Management**: Use submission quality and volume data to inform partner relationship decisions, including priority levels, support allocation, and business development opportunities.

### Operational Excellence

**Documentation Maintenance**: Regularly review and update submission instructions to ensure accuracy and completeness. Consider partner feedback when improving documentation clarity and usefulness.

**Process Standardization**: Develop standardized processes for partner onboarding, support, and performance management. Consistent processes improve efficiency and ensure that all partners receive appropriate attention.

**Continuous Improvement**: Use partner feedback, performance data, and industry best practices to continuously improve seller management processes and submission instruction quality.

The submission instructions system in LeadConduit provides a robust foundation for seller management, but success depends on thoughtful implementation of broader partnership processes. By combining technical excellence with strategic relationship management, organizations can build seller networks that consistently deliver high-quality leads while maintaining operational efficiency and scalability.