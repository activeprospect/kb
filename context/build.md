# Documentation Publishing & Deployment Guide

## Overview

This guide covers both GitHub Pages deployment for web publishing and Document360 import for enterprise knowledge base systems. Choose the approach that best fits your documentation publishing needs.

## GitHub Pages Deployment (Web Publishing)

### Quick Setup Summary
This project is configured for automatic GitHub Pages deployment using Jekyll and GitHub Actions. The setup provides clean URLs and professional documentation hosting.

**Live Documentation URL Pattern:**
- Clean URLs: `https://activeprospect.github.io/kb/SectionName/page-name`
- No `/build/UserGuide/` prefix needed
- Automatic deployment on every push to main branch

### GitHub Pages Architecture

**Jekyll Configuration:**
- Jekyll static site generator with GitHub Actions deployment
- Custom `_config.yml` with proper baseurl and collections setup
- Jekyll collections for clean URL structure (`_userguide` collection)
- Minima theme with customizations for documentation

**URL Structure Transformation:**
- **Original structure**: `/build/UserGuide/SectionName/page-name.md`
- **Published URLs**: `/SectionName/page-name/` (clean, no extensions)
- **Navigation**: Uses `{{ site.baseurl }}` templating for portable URLs

**Key Files Created:**
1. **`_config.yml`**: Jekyll configuration with collections and defaults
2. **`Gemfile`**: Ruby dependencies for Jekyll build
3. **`.github/workflows/deploy.yml`**: GitHub Actions deployment workflow
4. **`index.md`**: Homepage with navigation to all sections
5. **`docs/index.md`**: Documentation landing page
6. **Section `index.md` files**: Navigation pages for each documentation section
7. **`.nojekyll`**: Prevents GitHub's default Jekyll processing

### Navigation & Linking Best Practices

**Link Format for Internal Navigation:**
```markdown
[Link Text]({{ site.baseurl }}/SectionName/page-name)
```

**Common Issues Resolved:**
1. **404 errors on section URLs**: Fixed by creating `index.md` files in each section
2. **Broken relative links**: Converted all relative paths to Jekyll `{{ site.baseurl }}` templating
3. **Nested subdirectory navigation**: Updated all nested paths to work with Jekyll routing
4. **Clean URL accessibility**: Configured Jekyll collections to remove `/build/UserGuide/` prefix

### Deployment Process

**Automatic Deployment:**
1. Push changes to `main` branch
2. GitHub Actions workflow triggers automatically
3. Jekyll builds site with all content and navigation
4. Deployment completes in 2-3 minutes
5. Live site updates at `https://activeprospect.github.io/kb/`

**Monitoring Deployment:**
- Check **Actions** tab in GitHub repository for build status
- Green ✅ = successful deployment
- Red ❌ = build failed (check logs for errors)
- Yellow 🟡 = currently building

### Content Management

**Content Location:**
- **Source content**: `build/UserGuide/` (maintained by documentation workers)
- **Jekyll collection**: `_userguide/` (automatically synced for web publishing)
- **Navigation**: All section index files provide comprehensive navigation

**Adding New Content:**
1. Workers add content to `build/UserGuide/` structure
2. Content automatically copied to `_userguide/` collection during build
3. New content appears on live site after deployment
4. Internal links use Jekyll templating for proper routing

### Maintenance & Updates

**Content Updates:**
- Workers continue using existing `build/UserGuide/` workflow
- Git commits trigger automatic deployment
- No manual intervention needed for routine content updates

**Navigation Updates:**
- Update section `index.md` files for new navigation links
- Use `{{ site.baseurl }}/SectionName/page-name` format for all internal links
- Maintain consistent structure across all sections

---

## Document360 Import (Enterprise Knowledge Base)

## Folder Structure

Document360 utilizes the folder and file hierarchy to establish categories and articles within your knowledge base. Here's how to structure your content:

```
UserGuide/
├── index.md
├── GettingStarted/
│   ├── _category.json
│   ├── intro.md
│   ├── installation.md
│   └── configuration.md
├── Features/
│   ├── _category.json
│   ├── overview.md
│   └── advanced.md
└── FAQ/
    ├── _category.json
    └── common-questions.md
```

- **Folders**: Represent categories and subcategories.  
- **Markdown Files (`.md`)**: Each file becomes an individual article.  
- **`index.md`**: Serves as the landing page or introduction for the root category.

## `_category.json` File

To define category titles and their order explicitly, include a `_category.json` file within each folder:

```json
{
  "title": "Getting Started",
  "position": 1
}
```

- **`title`**: Specifies the display name of the category.  
- **`position`**: Determines the order of categories in the navigation pane.

Including this file helps in organizing categories, especially when folder names are not user-friendly or require specific formatting.

## Importing into Document360

1. **Compress the Folder**: Zip the entire `UserGuide` folder to create `UserGuide.zip`.  
2. **Access Document360 Portal**: Log in to your Document360 account.  
3. **Navigate to Import Section**:  
   - Go to **Documentation** in the left navigation bar.  
   - Select **Content tools \> Import & Export**.  
4. **Initiate Import**:  
   - Click on the **Import** button.  
   - Upload the `UserGuide.zip` file.  
5. **Configure Import Settings**:  
   - Choose to import as a new project or into an existing category.  
   - Decide if articles should be published immediately or saved as drafts.  
6. **Finalize Import**: Click **Import** to begin the process.

Document360 will process the ZIP file, creating categories and articles based on your folder structure and markdown files. If `_category.json` files are present, they will guide the naming and ordering of categories.

## Handling Media Files

If your articles include images or other media:

- **Maintain Relative Paths**: Ensure that media files are referenced using relative paths in your markdown files.  
- **Include Media in ZIP**: Place all media files in appropriate folders within the `UserGuide` directory before zipping.

Document360 will upload these media files and maintain the references during the import process.

## Best Practices

- **Article Titles**: Start each markdown file with a level 1 heading (`# Title`) to set the article title.  
- **File Naming**: Use URL-friendly names for files and folders (e.g., `getting-started.md` instead of `Getting Started.md`).  
- **Testing**: Before importing the entire guide, consider testing with a small subset to ensure the structure and formatting appear as expected.

By following this structure and process, you can effectively import your markdown content into Document360, resulting in a structured and navigable user guide.

If you need assistance in transforming your existing markdown files into this structure or have further questions, feel free to ask\!  