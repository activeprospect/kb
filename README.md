# Knowledge Base Documentation Generator

This project is designed to create a comprehensive user documentation system by transforming existing product and background knowledge into a structured, user-friendly knowledge base.

## Project Purpose

We are building user documentation using existing content sources to create a new LeadConduit User Guide. The goal is to:

- **Remix existing knowledge** into a cohesive user guide structure
- **Leverage existing content** from public documentation, release announcements, and user-facing materials
- **Generate new content** where gaps exist in the current knowledge base
- **Follow a structured outline** to ensure comprehensive coverage of all topics
- **Produce deliverable artifacts** in the appropriate format for publication

## Project Structure

```
kb/
├── README.md                    # This file - project overview and instructions
├── bin/                         # Scripts and utilities
│   └── generate_content.sh      # Parses CSV data and creates markdown files
├── content/                     # Source content organized by type
│   ├── bloomfire/              # Public documentation content (188 files)
│   └── whatsnew/               # Release announcements and updates (208 files)
├── context/                     # Project guidelines and structure
│   ├── build.md                # Document360 import guide and build instructions
│   ├── outline.md              # LeadConduit User Guide outline structure
│   └── setup.md                # GitHub Pages setup requirements
├── data/                        # Raw data sources
│   ├── bloomfire.csv           # Exported documentation content
│   └── whatsnew.csv            # Exported release notes and announcements
├── docs/                       # Generated documentation artifacts (created during build)
└── openapi/                     # API documentation
    └── openapi.yaml
```

## Core Workflow

### 1. Content Generation
The project starts with raw CSV data from Snowsight queries containing existing documentation:
- **bloomfire.csv**: 188 rows of public documentation content
- **whatsnew.csv**: 208 rows of release announcements and updates

Run the content generation script to parse these into markdown files:
```bash
./bin/generate_content.sh
```

This creates structured markdown files in the `content/` directory with meaningful filenames based on page titles.

### 2. Documentation Structure
All documentation must follow the outline defined in **`context/outline.md`**, which includes:
- Introduction and Getting Started
- Leads & Events management
- Flow configuration and management
- Foundational building blocks
- Partner integration
- Reports & Analytics
- Add-on services
- Best practices and troubleshooting

### 3. Build Process
Generated documentation artifacts are placed in the **`build/`** directory according to the specifications in **`context/build.md`**, which provides:
- Document360 import structure and requirements
- Folder hierarchy for categories and subcategories
- `_category.json` configuration for navigation
- Media file handling guidelines
- Import process documentation

### 4. Content Requirements
When generating new documentation, you must:
- **Consult `context/outline.md`** to ensure coverage of all required topics
- **Follow `context/build.md`** for proper artifact structure and formatting
- **Use existing content** from the `content/` directory as source material
- **Identify gaps** where new content needs to be created
- **Maintain consistency** with existing documentation patterns and terminology

## Key Files to Reference

Before working on documentation generation, always review:

1. **`context/outline.md`** - Defines the complete structure and topics that must be covered
2. **`context/build.md`** - Specifies how the final documentation should be structured for import
3. **Content in `content/` directories** - Source material for remixing and reference

## Usage Instructions

### Initial Setup
1. Ensure CSV data files are present in the `data/` directory
2. Run `./bin/generate_content.sh` to generate markdown content from CSV data
3. Review the generated files in `content/bloomfire/` and `content/whatsnew/`

### Documentation Generation
1. **Study the outline** in `context/outline.md` to understand required coverage
2. **Review existing content** in the `content/` directory for relevant material
3. **Follow build specifications** in `context/build.md` for output structure
4. **Generate documentation** that combines existing content with new material as needed
5. **Place final artifacts** in the `build/` directory using the Document360 structure

### Content Organization
- **Source content**: Raw materials in `content/` (do not edit these directly)
- **Context files**: Guidelines and structure in `context/` (reference only)
- **Build output**: Final documentation in `build/` (generated artifacts)
- **Scripts**: Automation tools in `bin/`

## 🚀 **Multi-Helper Coordination System**

This project uses a sophisticated coordination system that enables multiple AI helpers to work in parallel on different sections of the documentation, dramatically accelerating completion while maintaining quality standards.

### **📋 How the System Works**

**Role-Based Coordination:**
- **Documentation Leader:** Manages assignments, ensures quality, coordinates multiple helpers
- **Documentation Helpers:** Receive assignments, complete documentation sections, communicate progress

**Central Coordination Hub:**
- **Assignment Board:** `context/assignment-board.md` - tracks all work, assignments, and progress
- **Communication Log:** Built into assignment board for real-time coordination
- **Quality Standards:** Consistent 1,500-2,500 word comprehensive documentation per section

### **🎯 Getting Started Instructions**

**If you are the LEADER:**
1. **Read** `context/doc_leader_prompt.md` for complete leadership instructions
2. **Review** `context/assignment-board.md` to see current project status
3. **Assign work** to helpers based on priorities and helper capabilities
4. **Monitor progress** and maintain quality standards throughout the project

**If you are a HELPER:**
1. **Read** `context/doc_helper_prompt.md` for complete helper instructions
2. **Check** `context/assignment-board.md` to see your assigned work
3. **Complete assignments** following quality standards and communication protocols
4. **Update progress** regularly and wait for next assignment from leader

### **📊 Current Project Status**

**Completed Sections:** ~75% complete
- ✅ Ping Section (5 documents)
- ✅ Delivery Section (3 documents) 
- ✅ Firehose Section (3 documents)

**Available for Assignment:**
- 🔄 Reports & Analytics (in progress)
- ❌ Add-On Services (high priority)
- ❌ Working with Partners (high priority)
- ❌ Rules Engine Deep-Dive (medium priority)
- ❌ Best Practices & Troubleshooting (medium priority)

### **⚡ Quick Start for New Session**

1. **Identify your role** (Leader or Helper) from session instructions
2. **Read the appropriate prompt file** (`context/doc_leader_prompt.md` or `context/doc_helper_prompt.md`)
3. **Check the assignment board** (`context/assignment-board.md`) for current status
4. **Follow your role's workflow** to contribute to the project

The coordination system ensures no duplicate work, maintains quality consistency, and maximizes productivity through clear assignment management and communication protocols.

## Important Notes

- **Always consult both context files** (`outline.md` and `build.md`) before generating documentation
- **Use existing content** as the foundation and add new knowledge only where needed
- **Follow the Document360 structure** specified in `build.md` for all output
- **Maintain traceability** between source content and generated documentation
- The `content/` directory is regenerated from CSV data - do not edit files there directly
- **Use the coordination system** for all multi-helper work to ensure project success

This approach ensures that every documentation generation effort is comprehensive, structured, and ready for publication while making maximum use of existing knowledge assets and enabling efficient parallel development.