#!/bin/bash

# Extract actual glossary files from source data

GLOSSARY_DIR="/Users/alex/Dev/kb/content/glossary"
CSV_FILE="/Users/alex/Dev/kb/data/bloomfire.csv"

# Ensure glossary directory exists
mkdir -p "$GLOSSARY_DIR"

echo "Extracting actual glossary files from source data..."

# Extract ActiveProspect Product Glossary
echo "Extracting ActiveProspect Product Glossary..."
awk '
BEGIN { in_doc = 0; found = 0 }
/^DOCUMENT$/ { in_doc = 1; doc_content = ""; next }
/^"---$/ && in_doc { 
    doc_content = doc_content $0 "\n"
    next 
}
in_doc && /^---$/ {
    doc_content = doc_content $0 "\n"
    if (index(doc_content, "activeprospect-product-glossary") > 0) {
        print doc_content
        exit
    }
    in_doc = 0
    doc_content = ""
    next
}
in_doc { doc_content = doc_content $0 "\n" }
' "$CSV_FILE" | sed 's/^"//; s/"$//' > "$GLOSSARY_DIR/activeprospect-product-glossary.md"

# Extract TrustedForm Glossary
echo "Extracting TrustedForm Glossary..."
awk '
BEGIN { in_doc = 0; found = 0 }
/^DOCUMENT$/ { in_doc = 1; doc_content = ""; next }
/^"---$/ && in_doc { 
    doc_content = doc_content $0 "\n"
    next 
}
in_doc && /^---$/ {
    doc_content = doc_content $0 "\n"
    if (index(doc_content, "trustedform-glossary") > 0 && index(doc_content, "4883927") > 0) {
        print doc_content
        exit
    }
    in_doc = 0
    doc_content = ""
    next
}
in_doc { doc_content = doc_content $0 "\n" }
' "$CSV_FILE" | sed 's/^"//; s/"$//' > "$GLOSSARY_DIR/trustedform-glossary.md"

# Extract LeadsBridge Glossary
echo "Extracting LeadsBridge Glossary..."
awk '
BEGIN { in_doc = 0; found = 0 }
/^DOCUMENT$/ { in_doc = 1; doc_content = ""; next }
/^"---$/ && in_doc { 
    doc_content = doc_content $0 "\n"
    next 
}
in_doc && /^---$/ {
    doc_content = doc_content $0 "\n"
    if (index(doc_content, "leadsbridge-glossary") > 0) {
        print doc_content
        exit
    }
    in_doc = 0
    doc_content = ""
    next
}
in_doc { doc_content = doc_content $0 "\n" }
' "$CSV_FILE" | sed 's/^"//; s/"$//' > "$GLOSSARY_DIR/leadsbridge-glossary.md"

echo ""
echo "Extracted glossary files:"
ls -la "$GLOSSARY_DIR"/*.md

echo ""
echo "File sizes:"
wc -l "$GLOSSARY_DIR"/*.md