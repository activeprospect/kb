# Volume Caps Migration Plan

## Overview
This document outlines the migration plan for creating a comprehensive volume-caps.md guide in the flow-management category. The guide will consolidate information from various Bloomfire articles related to volume caps, daily caps, and cap configuration.

## Source Content Identified

### Primary Article
1. **Volume Caps** (`/content/bloomfire/volume caps/article.md`)
   - Main comprehensive guide on volume caps
   - Last updated: May 15, 2023
   - Contains detailed definitions, behaviors, configuration instructions
   - Includes 6 screenshots showing UI elements

### Related Articles
2. **LeadConduit Day Parting** (`/content/bloomfire/leadconduit day parting/article.md`)
   - Shows how to use time-based rules with volume caps
   - Contains examples of combining volume caps with day/time restrictions
   
3. **LeadConduit Pro Tip: Optimize Sequence Order** (`/content/bloomfire/leadconduit pro tip optimize the sequence order of/article.md`)
   - Best practices for ordering volume cap rules
   - Shows optimization strategies for multiple caps

4. **Working with LeadConduit Flows** (`/content/bloomfire/working with leadconduit flows/article.md`)
   - Series overview that includes Volume Caps as part 6
   - Provides context within the flow management workflow

5. **LeadConduit Transactions** (`/content/bloomfire/leadconduit transactions/article.md`)
   - Explains how volume caps affect billing
   - Important for understanding cap behavior with transactions

6. **Acceptance Criteria** (`/content/bloomfire/acceptance criteria/article.md`)
   - Related concept that works alongside volume caps
   - Shows flow-level vs source-level configuration patterns

7. **LeadConduit Hours of Operation** (`/content/bloomfire/leadconduit hours of operation/article.md`)
   - Alternative time-based control mechanism
   - Can be used in conjunction with volume caps

8. **Ping Limits** (`/backup/whatsnew/ping limits.md`)
   - Related feature for Real-Time Bidding
   - Specific type of volume control for ping events

## Proposed Structure for volume-caps.md

```markdown
# Volume Caps

## Overview
- Definition and purpose
- Key benefits
- When to use volume caps

## Types of Volume Caps
### Flow Caps
- Definition
- Use cases
- Configuration location

### Source Caps
- Definition
- Use cases
- Configuration location

### Step Caps
- Definition
- Use cases
- Configuration location

### Ping Limits (RTB)
- Definition
- Requirements
- Configuration

## How Volume Caps Work
### Cap Counters
- How counting works
- What counts against caps
- What doesn't count

### Cap Reset Behavior
- Duration options (minute, hour, day, week, month)
- Time zone considerations
- Reset timing

### Cap Evaluation Order
- Flow caps checked first
- Source caps checked second
- Step cap behavior

## Configuration Guide
### Basic Configuration
- Step-by-step instructions
- Screenshots from Flow Editor
- Naming conventions

### Advanced Configuration
- Conditional caps (IF rules)
- Multiple caps
- Nested caps
- Combining with day parting

## Best Practices
### Rule Ordering
- Least restrictive to most restrictive
- Optimization strategies
- Examples

### Common Use Cases
- Daily lead limits
- Hourly throttling
- Source-specific limits
- Time-based restrictions
- Geographic restrictions

## Behavior and Edge Cases
### When Caps Are Reached
- Flow/Source cap behavior (lead fails)
- Step cap behavior (step skipped)
- Error messages and responses

### Counter Reset Rules
- Creating new caps
- Modifying cap quantities
- Changing cap rules
- Duration changes

### Multiple Caps Interaction
- Independent evaluation
- Incrementation logic
- Nested cap behavior

## Integration with Other Features
### Hours of Operation
- Differences and similarities
- When to use each
- Combining both features

### Day Parting
- Using submission timestamps
- Creating time-based caps
- Examples

### Real-Time Bidding
- Ping limits
- Cap behavior with RTB

## Monitoring and Reporting
### Dashboard Views
- Flow dashboard
- LeadConduit dashboard
- Nested cap display

### Cap Status
- Real-time monitoring
- Counter visibility
- Alert options

## Troubleshooting
### Common Issues
- Caps not resetting
- Unexpected counter values
- Configuration errors

### FAQ
- Transaction billing impact
- Performance considerations
- Limits and constraints
```

## Migration Tasks

1. **Content Consolidation**
   - Extract core content from primary Volume Caps article
   - Integrate related concepts from other articles
   - Add ping limits information for RTB users

2. **Image Migration**
   - Download and migrate 6 images from volume caps article
   - Ensure proper image paths in new location
   - Add captions and alt text

3. **Content Enhancement**
   - Add more detailed examples
   - Include code snippets for API responses
   - Add troubleshooting section
   - Create FAQ based on common issues

4. **Cross-referencing**
   - Link to related guides (day-parting, hours-of-operation)
   - Reference transaction billing implications
   - Connect to flow management series

5. **Metadata and Tagging**
   - Category: flow-management
   - Tags: volume-caps, caps, limits, flow-control, source-management
   - Related topics: day-parting, hours-of-operation, acceptance-criteria

## Notes

- The primary article is comprehensive but could benefit from more integration with related features
- Screenshots will need to be migrated from the original location
- Consider adding API examples for programmatic cap management
- May want to add performance best practices for high-volume flows