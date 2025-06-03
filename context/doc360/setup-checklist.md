# Document360 Setup Checklist

Follow this checklist to set up Document360 deployment for your documentation site.

## Prerequisites

- [ ] Document360 account with API access enabled
- [ ] GitHub repository with Actions enabled
- [ ] Node.js 18+ for local testing

## Document360 Configuration

### 1. Get API Credentials

- [ ] Log in to Document360
- [ ] Navigate to **Settings** → **API Tokens**
- [ ] Create new API token with these permissions:
  - Read/Write Articles
  - Read/Write Categories
  - Read Project Information
- [ ] Save the API key securely

### 2. Get Project Information

- [ ] In Document360, go to **Settings** → **Project**
- [ ] Note your **Project ID**
- [ ] If using versioning, note your **Version ID**
- [ ] Find your **User ID** in your profile settings

## GitHub Repository Setup

### 3. Add GitHub Secrets

Add these secrets to your repository (Settings → Secrets → Actions):

- [ ] `D360_API_KEY` - Your Document360 API key
- [ ] `D360_PROJECT_ID` - Your project ID
- [ ] `D360_VERSION_ID` - Your version ID (if applicable)
- [ ] `D360_USER_ID` - Your user ID

### 4. Add Workflow Files

- [ ] Copy `.github/workflows/deploy-document360.yml` to your repository
- [ ] Copy `scripts/deploy-markdown-to-document360.js` to your repository
- [ ] Copy `scripts/package.json` to your repository

### 5. Configure Deployment

Edit the workflow file if needed:

- [ ] Update `DOCS_PATH` if your docs are in a different location
- [ ] Adjust branch triggers if not using `main`
- [ ] Configure path filters for specific directories

## Testing

### 6. Local Testing

```bash
# Install dependencies
cd scripts
npm install

# Test with environment variables
export D360_API_KEY="your-api-key"
export D360_PROJECT_ID="your-project-id"
export DOCS_PATH="../docs/v2"
export DEPLOY_MODE="incremental"

# Run deployment
npm run deploy
```

### 7. GitHub Actions Testing

- [ ] Make a small change to a markdown file in `docs/v2`
- [ ] Commit and push to trigger the workflow
- [ ] Check Actions tab for workflow status
- [ ] Verify content appears in Document360

## Content Preparation

### 8. Markdown Compatibility

Ensure your markdown files are compatible:

- [ ] Use standard markdown syntax
- [ ] Add frontmatter for metadata (optional):
  ```yaml
  ---
  title: "Page Title"
  description: "Page description"
  tags: "tag1, tag2"
  slug: "custom-url-slug"
  draft: false
  ---
  ```

### 9. Folder Structure

Document360 will create categories based on your folder structure:

```
docs/v2/
├── getting-started/
│   ├── installation.md    → Category: Getting Started
│   └── configuration.md
├── guides/
│   ├── basic/
│   │   └── intro.md      → Category: Guides > Basic
│   └── advanced/
│       └── api.md        → Category: Guides > Advanced
└── reference/
    └── api.md            → Category: Reference
```

## Monitoring

### 10. Set Up Monitoring

- [ ] Enable GitHub Actions notifications
- [ ] Check Document360 activity logs
- [ ] Set up error alerts (optional)

## Troubleshooting

### Common Issues

1. **Authentication Failed**
   - Verify API key is correct
   - Check API token permissions

2. **Category Creation Failed**
   - Ensure you have category management permissions
   - Check category name doesn't contain special characters

3. **Rate Limit Errors**
   - The script includes delays between batches
   - Reduce batch size if needed

4. **Content Not Appearing**
   - Check article status (published vs draft)
   - Verify project/version IDs are correct

### Debug Mode

Enable verbose logging by adding to the workflow:

```yaml
env:
  DEBUG: true
```

## Next Steps

- [ ] Test incremental deployments
- [ ] Set up staging environment (optional)
- [ ] Configure custom domain in Document360
- [ ] Set up redirects from old documentation
- [ ] Train team on new workflow

## Support Resources

- [Document360 API Documentation](https://apidocs.document360.com/)
- [Document360 Support](https://document360.com/support/)
- [GitHub Actions Documentation](https://docs.github.com/actions)