# LLM Documentation Builder System

## 🎯 **Overview**

This directory contains the coordination system for AI assistants working on documentation projects. The system enables multiple LLMs to work together efficiently on large documentation projects while maintaining quality and preventing conflicts.

**Note:** This is specifically for the **documentation builder** role. For other LLM roles in this project, see the parent `llm/` directory.

## 🏗️ **Builder Roles**

### **Documentation Leader**
- **Responsibility:** Project coordination, assignment management, quality assurance
- **Instructions:** Read `leader/role.md` for complete leadership protocols
- **Knowledge Base:** Contribute insights to `leader/brain.md`

### **Documentation Helper** 
- **Responsibility:** Execute assigned documentation tasks, maintain quality standards
- **Instructions:** Read `helper/role.md` for complete helper protocols  
- **Knowledge Base:** Contribute insights to `helper/brain.md`

## 📋 **Getting Started**

### **If You Are a Leader:**
1. Read `./leader/role.md` for complete leadership instructions
2. Check `assignment-board.md` for current project status
3. Review `./leader/brain.md` for accumulated leadership insights
4. Begin coordination and assignment management

### **If You Are a Helper:**
1. Read `./helper/role.md` for complete helper instructions
2. Check `assignment-board.md` for your assignment
3. Review `./helper/brain.md` for helper best practices
4. Begin work on your assigned section

### **If You Are Unsure of Your Role:**
1. Read both `leader/role.md` and `helper/role.md`
2. Check `assignment-board.md` to see if you're already assigned
3. If no assignment exists, assume leader role for project coordination

## 🧠 **Knowledge Management**

### **Shared Knowledge:**
- `role.md` - General builder role and system overview
- `brain.md` - Cross-role insights and best practices  
- `assignment-board.md` - Real-time project coordination hub

### **Role-Specific Knowledge:**
- `leader/brain.md` - Leadership insights, coordination strategies
- `helper/brain.md` - Execution best practices, quality patterns

## 📊 **Project Coordination**

**Central Hub:** `assignment-board.md`
- Real-time project status and progress tracking
- Assignment management and communication log
- Quality standards and completion criteria

**Communication Protocol:**
- All coordination happens through the assignment board
- Leaders assign work and monitor progress
- Helpers execute assignments and report completion
- Knowledge gets captured in brain.md files

## 🎯 **Success Principles**

1. **Team Completion Over Individual Completion** - Stay until project is 100% finished
2. **Quality Standards** - Maintain 1,500-2,500 words per major document
3. **Clear Communication** - Use assignment board for all coordination
4. **Knowledge Capture** - Document insights in brain.md files
5. **Structured Roles** - Follow role-specific protocols consistently

## 🔄 **System Files**

```
llm/builder/
├── README.md              # This file - system overview
├── role.md               # General builder instructions
├── brain.md              # Cross-role knowledge base
├── assignment-board.md   # Project coordination hub
├── leader/
│   ├── role.md          # Leadership protocols
│   └── brain.md         # Leadership insights
└── helper/
    ├── role.md          # Helper protocols  
    └── brain.md         # Helper best practices
```

---

**Ready to build documentation? Choose your role and dive into the appropriate role.md file to get started!**