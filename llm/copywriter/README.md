# LLM Copywriter System

## 🎯 **Overview**

This directory contains the coordination system for AI assistants working on documentation projects. The system enables multiple LLMs to work together efficiently on large documentation projects while maintaining quality and preventing conflicts.

**Note:** This is specifically for the **copywriter** role. For other LLM roles in this project, see the parent `llm/` directory.

## 🏗️ **Copywriter Roles**

### **Lead Copywriter**
- **Responsibility:** Project coordination, assignment management, quality assurance
- **Instructions:** Read `lead/README.md` for complete leadership protocols
- **Knowledge Base:** Contribute insights to `lead/brain.md`

### **Staff Copywriter** 
- **Responsibility:** Execute assigned documentation tasks, maintain quality standards
- **Instructions:** Read `staff/README.md` for complete staff protocols  
- **Knowledge Base:** Contribute insights to `staff/brain.md`

## 📋 **Getting Started**

### **If You Are a Lead:**
1. Read `./lead/README.md` for complete leadership instructions
2. Check `assignment-board.md` for current project status
3. Review `./lead/brain.md` for accumulated leadership insights
4. Begin coordination and assignment management

### **If You Are Staff:**
1. Read `./staff/README.md` for complete staff instructions
2. Check `assignment-board.md` for your assignment
3. Review `./staff/brain.md` for staff best practices
4. Begin work on your assigned section

### **If You Are Unsure of Your Role:**
1. Read both `lead/README.md` and `staff/README.md`
2. Check `assignment-board.md` to see if you're already assigned
3. If no assignment exists, assume lead role for project coordination

## 🧠 **Knowledge Management**

### **Shared Knowledge:**
- `role.md` - General copywriter role and system overview
- `brain.md` - Cross-role insights and best practices  
- `assignment-board.md` - Real-time project coordination hub

### **Role-Specific Knowledge:**
- `lead/brain.md` - Leadership insights, coordination strategies
- `staff/brain.md` - Execution best practices, quality patterns

## 📊 **Project Coordination**

**Central Hub:** `assignment-board.md`
- Real-time project status and progress tracking
- Assignment management and communication log
- Quality standards and completion criteria

**Communication Protocol:**
- All coordination happens through the assignment board
- Leads assign work and monitor progress
- Staff execute assignments and report completion
- Knowledge gets captured in brain.md files

## 🎯 **Success Principles**

1. **Team Completion Over Individual Completion** - Stay until project is 100% finished
2. **Quality Standards** - Maintain 1,500-2,500 words per major document
3. **Clear Communication** - Use assignment board for all coordination
4. **Knowledge Capture** - Document insights in brain.md files
5. **Structured Roles** - Follow role-specific protocols consistently

## 🔄 **System Files**

```
llm/copywriter/
├── README.md              # This file - system overview
├── role.md               # General copywriter instructions
├── brain.md              # Cross-role knowledge base
├── assignment-board.md   # Project coordination hub
├── lead/
│   ├── README.md        # Leadership protocols
│   └── brain.md         # Leadership insights
└── staff/
    ├── README.md        # Staff protocols  
    └── brain.md         # Staff best practices
```

---

**Ready to build documentation? Choose your role and dive into the appropriate README.md file to get started!**