# LLM Coordination System

## 🎯 **Overview**

This directory contains role-based coordination systems for AI assistants working on different aspects of the knowledge base project. Each subdirectory represents a specialized role with its own instructions, protocols, and knowledge bases.

## 🤖 **Available LLM Roles**

### **📚 Documentation Builder** (`./builder/`)
- **Purpose:** Create and maintain comprehensive user documentation
- **Activities:** Research, write, edit, and organize documentation content
- **Coordination:** Multi-LLM coordination system with leader/helper roles
- **Instructions:** Read `./builder/README.md` to get started

### **🔍 Data Model Analyst** (`./modeler/`)
- **Purpose:** Analyze technical specifications and reveal system design patterns
- **Activities:** API analysis, pattern discovery, architectural documentation
- **Output:** User-focused explanations of technical system design
- **Instructions:** Read `./modeler/role.md` to get started

### **🔄 Data Processor** (`./processor/`)
- **Purpose:** Process raw data files and convert them to structured formats
- **Activities:** CSV processing, data transformation, content organization
- **Output:** Individual markdown files from multi-document data sources
- **Instructions:** Read `./processor/role.md` to get started

## 🎯 **Choosing Your Role**

### **If you are working on documentation creation:**
- Go to `./builder/` directory
- Read the README.md for complete coordination system
- Choose between Leader or Helper role within that system

### **If you are working on technical analysis:**
- Go to `./modeler/` directory  
- Read role.md for complete analysis instructions
- Focus on OpenAPI specification analysis and pattern discovery

### **If you are working on data processing:**
- Go to `./processor/` directory
- Read role.md for complete processing instructions
- Focus on CSV processing and content transformation

### **If you are unsure which role fits your task:**
- **Documentation tasks** → Use Builder role
- **Technical analysis tasks** → Use Modeler role
- **Data processing tasks** → Use Processor role
- **Project coordination** → Use Builder Leader role

## 📁 **Directory Structure**

```
llm/
├── README.md              # This file - role selection guide
├── builder/               # Documentation builder coordination system
│   ├── README.md          # Builder system overview
│   ├── role.md           # General builder instructions
│   ├── brain.md          # Cross-role builder knowledge
│   ├── assignment-board.md # Project coordination hub
│   ├── leader/           # Leader-specific files
│   │   ├── role.md      # Leadership protocols
│   │   └── brain.md     # Leadership insights
│   └── helper/           # Helper-specific files
│       ├── role.md      # Helper protocols
│       └── brain.md     # Helper best practices
├── modeler/              # Data model analysis role
│   └── role.md          # Model analysis instructions
└── processor/            # Data processing role
    └── role.md          # Data processing instructions
```

## 🔄 **Cross-Role Coordination**

### **When Multiple Roles Work Together:**
- **Communication:** Use clear role identification in any shared communication
- **File Conflicts:** Each role works in different output directories to avoid conflicts
- **Knowledge Sharing:** Cross-reference insights between roles when relevant
- **Project Status:** Builder coordination system tracks overall project status

### **Output Coordination:**
- **Builder outputs:** Documentation in `/docs` and `/build` directories
- **Modeler outputs:** Analysis documents in `/content` directory
- **Processor outputs:** Structured content in `/content/[source-name]` directories
- **Shared resources:** All roles can reference `/context` files and source content

## 🎯 **Success Principles**

### **Role Clarity**
- Each LLM should identify its role clearly and stick to role-specific protocols
- Don't switch roles mid-session without clear justification
- Use role-specific knowledge bases and coordination systems

### **Quality Standards**
- All roles maintain high quality standards appropriate to their function
- Builder: 1,500-2,500 words per major document with comprehensive coverage
- Modeler: User-focused insights with practical applications and clear explanations
- Processor: 100% data integrity with consistent file organization and naming

### **Coordination Efficiency**
- Use established protocols to minimize coordination overhead
- Document insights in role-specific brain.md files for future reference
- Clear communication about status, blockers, and completions

---

**Ready to contribute? Choose your role above and dive into the appropriate directory to get started!**