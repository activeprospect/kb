# Document360 Markdown Import Guide

## Overview

This guide provides a structured approach to importing a Markdown-based user guide into Document360. By organizing your content appropriately, you can ensure that Document360 accurately interprets your documentation, creating a coherent and navigable knowledge base.

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