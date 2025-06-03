# Document360 Deployment Guide

This guide explains how to set up automated deployment of your documentation to Document360 alongside your existing GitHub Pages deployment.

## Overview

Document360 provides several methods for automating documentation deployment:
- **d360 CLI**: Command-line tool for syncing API documentation
- **REST API**: Direct API access for creating and updating content
- **GitHub App**: One-way sync from GitHub to Document360

## Prerequisites

1. Document360 account with API access
2. Node.js installed (for d360 CLI)
3. API key from Document360
4. Project/Version IDs from your Document360 project

## Method 1: Using d360 CLI for API Documentation

### Installation

```bash
npm install -g d360
```

### Basic Usage

```bash
d360 apidocs --apiKey=<your-api-key> \
             --userId=<your-user-id> \
             --versionId=<your-version-id> \
             --path=./docs/v2/openapi.yaml \
             --publish
```

### GitHub Actions Workflow

Create `.github/workflows/document360-deploy.yml`:

```yaml
name: Deploy to Document360

on:
  push:
    branches: [main]
    paths:
      - 'docs/v2/**'
  workflow_dispatch:

jobs:
  deploy:
    runs-on: ubuntu-latest
    
    steps:
    - uses: actions/checkout@v3
    
    - name: Setup Node.js
      uses: actions/setup-node@v3
      with:
        node-version: '18'
    
    - name: Install d360 CLI
      run: npm install -g d360
    
    - name: Sync API Documentation
      env:
        D360_API_KEY: ${{ secrets.D360_API_KEY }}
        D360_USER_ID: ${{ secrets.D360_USER_ID }}
        D360_VERSION_ID: ${{ secrets.D360_VERSION_ID }}
      run: |
        d360 apidocs --apiKey=$D360_API_KEY \
                     --userId=$D360_USER_ID \
                     --versionId=$D360_VERSION_ID \
                     --path=./docs/v2/openapi.yaml \
                     --publish
```

## Method 2: Using Document360 REST API

For more granular control over content publishing, use the REST API directly.

### GitHub Actions Workflow with REST API

Create `.github/workflows/document360-api-deploy.yml`:

```yaml
name: Deploy Markdown to Document360

on:
  push:
    branches: [main]
    paths:
      - 'docs/v2/**'

jobs:
  deploy:
    runs-on: ubuntu-latest
    
    steps:
    - uses: actions/checkout@v3
    
    - name: Setup Python
      uses: actions/setup-python@v4
      with:
        python-version: '3.x'
    
    - name: Install dependencies
      run: |
        pip install requests pyyaml
    
    - name: Deploy to Document360
      env:
        D360_API_KEY: ${{ secrets.D360_API_KEY }}
        D360_PROJECT_ID: ${{ secrets.D360_PROJECT_ID }}
      run: |
        python scripts/deploy-to-document360.py
```

### Python Deployment Script

Create `scripts/deploy-to-document360.py`:

```python
import os
import requests
import yaml
from pathlib import Path

API_KEY = os.environ['D360_API_KEY']
PROJECT_ID = os.environ['D360_PROJECT_ID']
BASE_URL = 'https://api.document360.com/v1'

headers = {
    'api_token': API_KEY,
    'Content-Type': 'application/json'
}

def create_or_update_article(title, content, category_id=None):
    # Check if article exists
    search_url = f"{BASE_URL}/Articles"
    params = {'title': title}
    response = requests.get(search_url, headers=headers, params=params)
    
    if response.status_code == 200 and response.json()['data']:
        # Update existing article
        article_id = response.json()['data'][0]['id']
        update_url = f"{BASE_URL}/Articles/{article_id}"
        data = {
            'title': title,
            'content': content,
            'status': 1  # Published
        }
        response = requests.put(update_url, headers=headers, json=data)
    else:
        # Create new article
        create_url = f"{BASE_URL}/Articles"
        data = {
            'title': title,
            'content': content,
            'category_id': category_id,
            'project_version_id': PROJECT_ID,
            'status': 1  # Published
        }
        response = requests.post(create_url, headers=headers, json=data)
    
    return response

def process_markdown_files():
    docs_path = Path('docs/v2')
    for md_file in docs_path.rglob('*.md'):
        with open(md_file, 'r', encoding='utf-8') as f:
            content = f.read()
            
        # Extract title from first H1 or filename
        title = md_file.stem.replace('-', ' ').title()
        if content.startswith('# '):
            title = content.split('\n')[0].replace('# ', '')
        
        print(f"Processing: {title}")
        response = create_or_update_article(title, content)
        
        if response.status_code in [200, 201]:
            print(f"✓ Successfully deployed: {title}")
        else:
            print(f"✗ Failed to deploy: {title}")
            print(f"  Error: {response.text}")

if __name__ == '__main__':
    process_markdown_files()
```

## Method 3: Using Document360 GitHub App

1. Install the Document360 GitHub App from GitHub Marketplace
2. Configure repository access
3. Set up sync rules in Document360 dashboard
4. The app will automatically sync when you push to the configured branches

## Configuration Steps

### 1. Get API Credentials

1. Log in to Document360
2. Navigate to Settings → API Tokens
3. Create a new API token with appropriate permissions
4. Note your Project ID and Version ID

### 2. Set GitHub Secrets

Add these secrets to your GitHub repository:
- `D360_API_KEY`: Your Document360 API key
- `D360_PROJECT_ID`: Your project ID
- `D360_VERSION_ID`: Your version ID (if using d360 CLI)
- `D360_USER_ID`: Your user ID (if using d360 CLI)

### 3. Configure Deployment Triggers

Modify the workflow triggers based on your needs:
- Deploy on push to main branch
- Deploy only when docs/v2 directory changes
- Manual deployment with workflow_dispatch

## Best Practices

1. **Version Control**: Keep your Document360 version in sync with your Git tags
2. **Error Handling**: Add retry logic for API calls
3. **Logging**: Use GitHub Actions logging to track deployment status
4. **Testing**: Test deployments in a staging environment first
5. **Content Validation**: Validate markdown content before deployment

## Limitations and Considerations

- **Rate Limits**: Document360 API has rate limits (check their documentation)
- **Content Format**: Ensure markdown is compatible with Document360's parser
- **Media Files**: Handle images and other assets separately
- **Permissions**: API token needs appropriate permissions for creating/updating content

## Troubleshooting

### Common Issues

1. **Authentication Errors**: Verify API key and permissions
2. **Content Not Updating**: Check if article IDs are correct
3. **Markdown Rendering**: Test markdown compatibility
4. **API Rate Limits**: Implement exponential backoff

### Debug Mode

Add verbose logging to workflows:
```yaml
- name: Deploy with Debug
  run: |
    export DEBUG=true
    python scripts/deploy-to-document360.py
```

## Next Steps

1. Choose your deployment method based on content type
2. Set up GitHub secrets
3. Create and test the workflow
4. Monitor initial deployments
5. Iterate based on your specific needs