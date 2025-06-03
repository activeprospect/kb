# Document360 Deployment Setup

This directory contains all configuration and documentation for deploying content from `docs/v2` to Document360.

## Overview

We have two parallel deployment paths:
1. **GitHub Pages** - Your existing deployment (already configured)
2. **Document360** - New deployment path for professional documentation hosting

## Quick Start

1. Follow the [setup-checklist.md](./setup-checklist.md) to configure Document360
2. Review the [deployment-guide.md](./deployment-guide.md) for detailed implementation options
3. Use the GitHub Actions workflow in `.github/workflows/deploy-document360.yml`

## Deployment Methods

### Automatic Deployment
- Triggered on push to `main` branch when files in `docs/v2` change
- Can be manually triggered via GitHub Actions UI

### Manual Deployment
```bash
cd scripts
npm install
npm run deploy
```

## File Structure

```
context/doc360/
├── README.md                    # This file
├── setup-checklist.md          # Step-by-step setup guide
├── deployment-guide.md         # Detailed deployment documentation
├── api-mapping.json           # Mapping configuration (if needed)
└── test-content/              # Test markdown files
```

## Key Features

- **Incremental Updates**: Only deploys changed files
- **Full Sync**: Option to sync all documentation
- **Category Management**: Automatically creates categories from folder structure
- **Metadata Support**: Frontmatter support for article properties
- **Draft Support**: Can deploy as draft or published

## Environment Variables

Required for deployment:
- `D360_API_KEY` - Document360 API key
- `D360_PROJECT_ID` - Project identifier
- `D360_VERSION_ID` - Version identifier (for versioned docs)
- `D360_USER_ID` - User identifier