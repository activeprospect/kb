# Document360 Deployment Setup

This repository is configured for dual deployment:
1. **GitHub Pages** (existing) - Public documentation site
2. **Document360** (new) - Professional documentation platform

## Quick Start

1. **Set GitHub Secrets** (required):
   - `D360_API_KEY` - Your Document360 API key
   - `D360_PROJECT_ID` - Your project ID
   - `D360_VERSION_ID` - Version ID (if using versions)
   - `D360_USER_ID` - User ID (for d360 CLI)

2. **Test Locally**:
   ```bash
   export D360_API_KEY="your-api-key"
   export D360_PROJECT_ID="your-project-id"
   ./scripts/test-document360-deployment.sh
   ```

3. **Deploy**:
   - Automatic: Push changes to `docs/v2/` on main branch
   - Manual: Go to Actions → Deploy to Document360 → Run workflow

## Project Structure

```
├── .github/workflows/
│   └── deploy-document360.yml      # GitHub Actions workflow
├── context/doc360/                 # Document360 configuration
│   ├── README.md                   # Overview and quick start
│   ├── setup-checklist.md          # Step-by-step setup guide
│   ├── deployment-guide.md         # Detailed deployment docs
│   ├── deployment-architecture.md  # Technical architecture
│   ├── api-mapping.json           # Configuration file
│   └── test-content/              # Test markdown files
├── scripts/
│   ├── deploy-markdown-to-document360-enhanced.js  # Main deployment script
│   ├── test-document360-deployment.sh             # Test script
│   └── package.json                               # Node dependencies
└── docs/v2/                        # Your documentation source
```

## Features

- **Incremental Deployment**: Only deploys changed files using checksums
- **Full Sync**: Option to sync entire documentation
- **Auto Categories**: Creates categories from folder structure
- **Metadata Support**: Frontmatter for article properties
- **Rate Limiting**: Batch processing with delays
- **Dry Run Mode**: Test without making changes

## Configuration

Edit `context/doc360/api-mapping.json` to customize:
- Category name mappings
- Default metadata
- Content transformations
- Exclude patterns

## Documentation

- Setup Guide: `context/doc360/setup-checklist.md`
- Deployment Guide: `context/doc360/deployment-guide.md`
- Architecture: `context/doc360/deployment-architecture.md`

## Support

For issues with:
- **GitHub Actions**: Check workflow logs in Actions tab
- **Document360 API**: Verify credentials and permissions
- **Content**: Test with dry run mode first

## Next Steps

1. Complete setup checklist
2. Run local tests
3. Deploy test content
4. Configure production deployment
5. Set up monitoring