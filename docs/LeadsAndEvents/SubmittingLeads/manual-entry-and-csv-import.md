---
layout: page
title: Manual Entry & CSV Import
permalink: /LeadsAndEvents/SubmittingLeads/manual-entry-and-csv-import
---

# Manual Entry & CSV Import

LeadConduit provides flexible options for submitting lead data, from individual manual entries to bulk CSV imports. Understanding these submission methods ensures you can efficiently get lead data into your flows regardless of your data source or technical requirements.

## Manual Lead Entry

### When to Use Manual Entry

**Single Lead Submission:**
- Testing flow configurations
- Entering high-value leads individually
- One-off lead submissions from phone calls
- Troubleshooting specific lead issues

**Training and Learning:**
- Understanding field requirements
- Testing acceptance criteria
- Learning submission processes
- Validating flow configurations

### Manual Entry Process

**Accessing Manual Entry:**
1. Navigate to your specific flow
2. Click on "Submission Docs" dropdown
3. Select the source for manual entry
4. Use the interactive example section

**Entry Steps:**
1. **Select HTTP Method** - Choose your preferred submission format
2. **Fill Test Data** - Enter lead information in the left panel
3. **Submit Lead** - Click "Continue" to process the lead
4. **Review Response** - Check the response for success/failure details

**Interactive Features:**
- Real-time field validation
- Format examples for each field type
- Immediate response feedback
- Multiple submission method options

### Field Requirements

**Required vs Optional Fields:**
- **Required fields** must be populated for successful submission
- **Optional fields** enhance lead quality but aren't mandatory
- **Custom fields** may have specific validation rules
- **Field types** determine acceptable data formats

**Common Required Fields:**
- Contact information (name, email, phone)
- Geographic data (state, zip code)
- Lead source identification
- Timestamp information

**Data Quality Tips:**
- Use proper field formatting (phone: 555-123-4567)
- Ensure email addresses are valid
- Provide complete geographic information
- Include all available demographic data

## CSV Import Process

### Bulk Import Overview

**When to Use CSV Import:**
- Large volumes of leads to process
- Regular batch processing workflows
- Data migration from other systems
- Historical lead data upload

**Benefits of CSV Import:**
- Process multiple leads simultaneously
- Maintain data consistency across batches
- Efficient handling of large datasets
- Browser-based processing (no server upload required)

### CSV File Preparation

**File Format Requirements:**
- Standard CSV format with comma separators
- First row should contain field headers
- One lead per row
- UTF-8 encoding for special characters

**Field Mapping:**
- Use LeadConduit field names as headers
- Map source data to appropriate field types
- Include required fields for all leads
- Ensure consistent data formatting

**Example CSV Structure:**
```csv
first_name,last_name,email,phone,state,zip
John,Smith,john@email.com,555-123-4567,CA,90210
Jane,Doe,jane@email.com,555-987-6543,TX,77001
```

### Import Execution

**Browser-Based Processing:**
- Upload occurs directly in your browser
- No server-side file storage required
- Real-time processing feedback
- Concurrent lead processing (up to 6 simultaneous)

**Processing Mechanics:**
1. **File Upload** - Select and upload your CSV file
2. **Field Mapping** - Verify field alignment with LeadConduit
3. **Validation** - Check for formatting and required field issues
4. **Processing** - Each row processed as individual lead submission
5. **Results** - Review success/failure status for each lead

**Performance Considerations:**
- Browser limits: 6 concurrent HTTP requests maximum
- Processing speed varies based on flow complexity
- Large files may take significant time to complete
- Monitor browser for completion status

### Import Results and Troubleshooting

**Success Indicators:**
- Accepted leads receive success status
- Proper field mapping and validation
- Compliance with acceptance criteria
- Successful delivery to recipients

**Common Failure Reasons:**
- Missing required fields
- Invalid data formats (email, phone)
- Acceptance criteria not met
- Duplicate lead detection
- Geographic restrictions

**Error Resolution:**
- Review specific error messages for each failed lead
- Correct data formatting issues
- Adjust acceptance criteria if needed
- Re-submit corrected data

## Data Mapping and Validation

### Field Type Understanding

**Standard Field Types:**
- **Text**: Names, addresses, comments
- **Email**: Validated email format required
- **Phone**: Various formats accepted, normalized automatically
- **Number**: Numeric values with validation
- **Date**: Multiple date formats supported
- **Boolean**: True/false or yes/no values

**Custom Field Types:**
- Account-specific field definitions
- Custom validation rules
- Specialized data formats
- Business-specific requirements

### Data Normalization

**Automatic Processing:**
- Phone number formatting standardization
- Email address validation and cleanup
- Geographic data standardization
- Text trimming and case adjustment

**Quality Enhancement:**
- Duplicate detection and prevention
- Data completeness scoring
- Format validation before processing
- Error reporting for invalid data

### Validation Rules

**Pre-Processing Validation:**
- Required field completeness
- Data type conformance
- Format validation (email, phone)
- Range checking for numeric fields

**Business Rule Validation:**
- Acceptance criteria evaluation
- Geographic restrictions
- Lead quality scoring
- Source-specific requirements

## Volume Control for Submissions

### Managing Submission Volume

**Rate Limiting:**
- Browser concurrent request limits
- Server-side processing capacity
- Flow-specific volume caps
- Source-level restrictions

**Batch Processing Strategy:**
- Break large files into smaller batches
- Monitor processing progress
- Schedule imports during low-traffic periods
- Plan for retry processing if needed

### Monitoring and Tracking

**Import Progress:**
- Real-time processing status
- Success/failure counts
- Error message tracking
- Completion time estimates

**Post-Import Analysis:**
- Success rate calculation
- Error pattern identification
- Quality score assessment
- Follow-up action planning

## Best Practices for Manual and CSV Submission

### Data Preparation

**Quality Control:**
- Validate data before submission
- Remove duplicate entries
- Standardize formatting
- Complete required information

**Testing Strategy:**
- Test with small batches first
- Validate acceptance criteria
- Check field mapping accuracy
- Monitor processing performance

### Submission Workflow

**Process Documentation:**
- Document field mapping requirements
- Create submission checklists
- Establish error handling procedures
- Maintain quality standards

**Regular Monitoring:**
- Track submission success rates
- Monitor processing times
- Review error patterns
- Optimize data quality

### Integration Planning

**Scaling Considerations:**
- Plan for API integration as volume grows
- Consider automated submission tools
- Implement real-time submission monitoring
- Develop error handling automation

**Quality Maintenance:**
- Regular data validation reviews
- Acceptance criteria optimization
- Field mapping updates
- Processing workflow improvements

## Advanced Submission Techniques

### Template Usage

**Dynamic Field Population:**
- Use templates for calculated fields
- Conditional data population
- Cross-field validation
- Automated data enhancement

### Integration Preparation

**API Transition Planning:**
- Document manual processes for automation
- Identify repetitive submission patterns
- Plan for real-time integration
- Prepare for scale requirements

### Quality Optimization

**Continuous Improvement:**
- Analyze submission success patterns
- Optimize field mapping strategies
- Refine acceptance criteria
- Enhance data collection processes

Manual entry and CSV import provide essential flexibility for lead submission while maintaining data quality and processing efficiency. These methods serve as both standalone solutions and stepping stones toward more advanced API-based integrations.