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
├── llm/                        # AI coordination system
│   ├── README.md               # LLM role selection guide
│   ├── builder/                # Documentation builder coordination
│   │   ├── README.md           # Builder system overview
│   │   ├── role.md             # General builder instructions
│   │   ├── brain.md            # Cross-role knowledge base
│   │   ├── assignment-board.md # Project coordination hub
│   │   ├── leader/             # Leader-specific files
│   │   │   ├── role.md         # Leadership protocols
│   │   │   └── brain.md        # Leadership insights
│   │   └── helper/             # Helper-specific files
│   │       ├── role.md         # Helper protocols
│   │       └── brain.md        # Helper best practices
│   ├── modeler/                # Data model analysis role
│   │   └── role.md             # Model analysis instructions
│   └── processor/              # Data processing role
│       └── role.md             # Data processing instructions
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
- **📝 CRITICAL: Follow `context/vibes.md`** for tone, style, and user experience approach
- **📝 CRITICAL: Follow `context/tone-and-vocabulary.md`** for official terminology and voice
- **Use existing content** from the `content/` directory as source material
- **Identify gaps** where new content needs to be created
- **Maintain consistency** with existing documentation patterns and terminology

## Key Files to Reference

Before working on documentation generation, always review:

1. **`context/outline.md`** - Defines the complete structure and topics that must be covered
2. **`context/build.md`** - Specifies how the final documentation should be structured for import
3. **🎯 `context/vibes.md`** - **ESSENTIAL**: Documentation philosophy, user experience approach, and writing style
4. **🎯 `context/tone-and-vocabulary.md`** - **ESSENTIAL**: Official terminology, voice guidelines, and vocabulary standards
5. **Content in `content/` directories** - Source material for remixing and reference

**⚠️ IMPORTANT:** The tone and vibes files are not optional - they define the voice, personality, and user experience approach that makes LeadConduit documentation delightful and effective. All content must follow these guidelines.

## Usage Instructions

### Initial Setup
1. Ensure CSV data files are present in the `data/` directory
2. Run `./bin/generate_content.sh` to generate markdown content from CSV data
3. Review the generated files in `content/bloomfire/` and `content/whatsnew/`

### Documentation Generation
1. **Study the outline** in `context/outline.md` to understand required coverage
2. **📝 Read `context/vibes.md`** to understand the documentation philosophy and user experience approach
3. **📝 Read `context/tone-and-vocabulary.md`** to learn official terminology and voice guidelines
4. **Review existing content** in the `content/` directory for relevant material
5. **Follow build specifications** in `context/build.md` for output structure
6. **Generate documentation** that combines existing content with new material as needed
7. **Place final artifacts** in the `build/` directory using the Document360 structure

**🎯 Content Quality Standards:**
- **Voice**: Follow the helpful colleague tone from `vibes.md` (professional but human)
- **Terminology**: Use exact terms from `tone-and-vocabulary.md` (e.g., "flow" not "workflow")
- **User Experience**: Apply the "documentation as hospitality" philosophy
- **Structure**: Use progressive disclosure and celebrate small wins

### Content Organization
- **Source content**: Raw materials in `content/` (do not edit these directly)
- **Context files**: Guidelines and structure in `context/` (reference only)
- **Build output**: Final documentation in `build/` (generated artifacts)
- **Scripts**: Automation tools in `bin/`

## 🚀 **AI Coordination System**

This project includes a sophisticated coordination system that enables multiple AI assistants to work together on different aspects of the knowledge base project. The system provides structured roles, quality standards, and coordination protocols for efficient collaborative work.

### **📋 For AI Assistants**

**Important:** If you are an AI assistant working on this project, please refer to:

🎯 **`./llm/`** - Complete coordination system with role-based instructions

**Quick Start:**
1. **Read** `./llm/README.md` for role selection guide
2. **Choose your role** based on your task:
   - **Documentation work** → `./llm/builder/` (Leader or Helper)
   - **Technical analysis** → `./llm/modeler/`
   - **Data processing** → `./llm/processor/`
3. **Follow role-specific instructions** in the appropriate subdirectory
4. **Use coordination systems** provided for each role

### **🎯 Available Roles**

**Documentation Roles:**
- **Documentation Leader:** Manages assignments, ensures quality, coordinates multiple helpers
- **Documentation Helper:** Execute assigned documentation tasks, maintain quality standards

**Analysis Roles:**
- **Data Model Analyst:** Analyze technical specifications and reveal system design patterns

**Processing Roles:**
- **Data Processor:** Process raw data files and convert them to structured formats

**Coordination Features:**
- **Assignment Board:** Real-time project tracking and coordination (for builders)
- **Communication Protocols:** Structured progress reporting and team coordination
- **Quality Standards:** Role-specific quality standards and best practices
- **Knowledge Capture:** Accumulated insights in role-specific brain.md files

### **📊 Current Project Status**

**Project Completion:** 100% complete - all 10 major sections finished with 34+ comprehensive documents ready for publication.

The coordination system proved highly effective, enabling parallel work across multiple contributors while maintaining consistent quality standards throughout the project.

## Important Notes

- **Always consult ALL context files** before generating documentation:
  - `outline.md` and `build.md` for structure and format
  - **`vibes.md` for tone and user experience approach** 
  - **`tone-and-vocabulary.md` for official terminology and voice**
- **Use existing content** as the foundation and add new knowledge only where needed
- **Follow the Document360 structure** specified in `build.md` for all output
- **Maintain traceability** between source content and generated documentation
- The `content/` directory is regenerated from CSV data - do not edit files there directly
- **Use the coordination system** for all multi-helper work to ensure project success

**🚨 CRITICAL REMINDER:** The tone and vocabulary guidelines are not suggestions - they are requirements that ensure consistent, delightful user experiences across all LeadConduit documentation.

This approach ensures that every documentation generation effort is comprehensive, structured, and ready for publication while making maximum use of existing knowledge assets and enabling efficient parallel development.