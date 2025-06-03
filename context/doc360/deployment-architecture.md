# Document360 Deployment Architecture

## Overview

This document describes the architecture for deploying documentation from this repository to Document360.

## Architecture Diagram

```
┌─────────────────────┐
│   GitHub Repo       │
│   docs/v2/*.md      │
└──────────┬──────────┘
           │
           │ Push to main
           ▼
┌─────────────────────┐
│  GitHub Actions     │
│  Workflow           │
└──────────┬──────────┘
           │
    ┌──────┴──────┐
    │             │
    ▼             ▼
┌─────────┐  ┌─────────┐
│ GitHub  │  │Document │
│ Pages   │  │  360    │
└─────────┘  └─────────┘
```

## Components

### 1. Source Content
- Location: `docs/v2/`
- Format: Markdown with optional frontmatter
- Structure: Nested folders become categories

### 2. GitHub Actions Workflow
- File: `.github/workflows/deploy-document360.yml`
- Triggers:
  - Push to main branch (when docs/v2 changes)
  - Manual workflow dispatch
- Modes:
  - Incremental: Only changed files
  - Full: All documentation files

### 3. Deployment Script
- File: `scripts/deploy-markdown-to-document360-enhanced.js`
- Features:
  - Checksum-based change detection
  - Batch processing with rate limiting
  - Category auto-creation
  - Metadata processing
  - Content transformation

### 4. Configuration
- File: `context/doc360/api-mapping.json`
- Controls:
  - Category name mapping
  - Metadata defaults
  - Content transformations
  - Exclude patterns

## Data Flow

1. **Content Creation/Update**
   - Developer updates markdown files in `docs/v2/`
   - Commits and pushes to GitHub

2. **Trigger Detection**
   - GitHub Actions detects changes in `docs/v2/`
   - Workflow starts automatically

3. **Content Processing**
   - Script reads markdown files
   - Extracts frontmatter metadata
   - Transforms content (links, images)
   - Calculates checksums

4. **API Communication**
   - Authenticates with Document360 API
   - Creates/updates categories as needed
   - Creates/updates articles
   - Handles rate limiting

5. **Verification**
   - Logs deployment status
   - Creates GitHub Actions summary
   - Saves checksums for next run

## Security

### API Key Management
- Stored as GitHub Secret: `D360_API_KEY`
- Never logged or exposed
- Scoped permissions in Document360

### Access Control
- GitHub Actions requires repository write access
- Document360 API requires project-specific permissions
- Deployment limited to configured branches

## Performance Optimization

### Incremental Updates
- Checksum comparison prevents unnecessary updates
- Only changed files are processed
- Reduces API calls and processing time

### Batch Processing
- Articles processed in batches of 5
- 1-second delay between batches
- Prevents rate limit issues

### Caching
- Category IDs cached during deployment
- Checksums cached between deployments
- Reduces redundant API calls

## Error Handling

### Retry Logic
- Network errors trigger automatic retry
- Rate limit errors include backoff
- Failed articles logged for manual review

### Validation
- Markdown syntax validation
- Frontmatter schema validation
- API response validation

### Rollback
- No automatic rollback (Document360 has version history)
- Failed deployments don't affect successful articles
- Manual intervention for critical failures

## Monitoring

### Deployment Logs
- GitHub Actions logs all operations
- Success/failure summary in job summary
- Detailed error messages for debugging

### Document360 Activity
- API activity visible in Document360 dashboard
- Article history tracks all changes
- Category changes logged

## Maintenance

### Regular Tasks
1. Review deployment logs weekly
2. Update API mapping for new categories
3. Monitor API usage and limits
4. Clean up test content

### Troubleshooting Guide
1. Check GitHub Actions logs first
2. Verify API credentials are valid
3. Test with dry run mode
4. Use test content for debugging

## Future Enhancements

1. **Bi-directional Sync**
   - Pull changes from Document360
   - Conflict resolution

2. **Advanced Features**
   - Custom article templates
   - Automated screenshots
   - Version branching

3. **Integration Expansion**
   - Slack notifications
   - JIRA linking
   - Analytics integration