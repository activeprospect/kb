# Deployment Documentation

## Overview

This repository uses GitHub Actions to automatically build and deploy a Jekyll documentation site to GitHub Pages.

## How It Works

1. **Trigger**: Push to `main` branch or manual workflow dispatch
2. **Build**: GitHub Actions builds the Jekyll site from `/docs` directory
3. **Deploy**: Static site is deployed to GitHub Pages
4. **Access**: Site is available at https://activeprospect.github.io/kb/docs/

## Deployment Process

### Automatic Deployment

```bash
git add .
git commit -m "Update documentation"
git push origin main
```

GitHub Actions automatically handles the rest.

### Manual Deployment

1. Go to Actions tab in GitHub
2. Select "Deploy Jekyll site to Pages" workflow
3. Click "Run workflow" → Select main branch → Run

## Configuration Files

### `.github/workflows/deploy.yml`
- Defines the build and deployment pipeline
- Uses Ruby 3.1 and Jekyll
- Builds from `/docs` directory
- Uploads to GitHub Pages

### `docs/_config.yml`
- Jekyll configuration
- Base URL: `/kb`
- Theme: Jekyll Theme Cayman

## URLs

- **Production**: https://activeprospect.github.io/kb/docs/
- **Local Development**: http://localhost:4000/kb/

## Local Testing

```bash
cd docs
bundle install
bundle exec jekyll serve --livereload
```

## Troubleshooting

- **Build failures**: Check GitHub Actions logs
- **Site not updating**: Clear browser cache, wait 5-10 minutes
- **404 errors**: Verify file exists and baseurl is correct