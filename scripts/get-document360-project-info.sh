#!/bin/bash

# Script to get your Document360 Project ID and other info using the API

echo "Document360 Project Info Finder"
echo "==============================="
echo ""

# Check if API key is provided
if [ -z "$1" ] && [ -z "$D360_API_KEY" ]; then
    echo "Usage: ./get-document360-project-info.sh <YOUR_API_KEY>"
    echo ""
    echo "Or set environment variable:"
    echo "export D360_API_KEY='your-api-key'"
    echo "./get-document360-project-info.sh"
    exit 1
fi

API_KEY="${1:-$D360_API_KEY}"

echo "Fetching project information..."
echo ""

# Get projects from Document360 API
echo "1. Checking Projects endpoint..."
projects_response=$(curl -s -H "api_token: ${API_KEY}" \
    "https://api.document360.com/v1/projects" 2>/dev/null)

if [ $? -eq 0 ] && [ -n "$projects_response" ]; then
    echo "$projects_response" | python3 -c "
import sys, json
try:
    data = json.load(sys.stdin)
    if 'data' in data and isinstance(data['data'], list):
        print('✅ Projects Found:')
        for project in data['data']:
            print(f\"   Project Name: {project.get('name', 'Unknown')}\")
            print(f\"   Project ID: {project.get('id', 'Not found')}\")
            print(f\"   Project Key: {project.get('key', 'Not found')}\")
            print('-' * 40)
    elif 'data' in data:
        project = data['data']
        print('✅ Project Information:')
        print(f\"   Project ID: {project.get('id', 'Not found')}\")
        print(f\"   Project Name: {project.get('name', 'Unknown')}\")
        print('-' * 40)
except:
    pass
"
fi

# Try project versions endpoint
echo ""
echo "2. Checking Project Versions endpoint..."
versions_response=$(curl -s -H "api_token: ${API_KEY}" \
    "https://api.document360.com/v1/projectversions" 2>/dev/null)

if [ $? -eq 0 ] && [ -n "$versions_response" ]; then
    echo "$versions_response" | python3 -c "
import sys, json
try:
    data = json.load(sys.stdin)
    if 'data' in data:
        print('✅ Project Versions Found:')
        versions = data['data'] if isinstance(data['data'], list) else [data['data']]
        for version in versions:
            print(f\"   Version Name: {version.get('name', 'Unknown')}\")
            print(f\"   Version ID: {version.get('id', 'Not found')}\")
            print(f\"   Project ID: {version.get('project_id', 'Not found')}\")
            print(f\"   Is Default: {version.get('is_default', False)}\")
            print('-' * 40)
except:
    pass
"
fi

# Try categories endpoint (which includes project info)
echo ""
echo "3. Checking Categories endpoint..."
categories_response=$(curl -s -H "api_token: ${API_KEY}" \
    "https://api.document360.com/v1/categories" 2>/dev/null)

if [ $? -eq 0 ] && [ -n "$categories_response" ]; then
    echo "$categories_response" | python3 -c "
import sys, json
try:
    data = json.load(sys.stdin)
    if 'data' in data and isinstance(data['data'], list) and len(data['data']) > 0:
        # Extract project info from first category
        first_cat = data['data'][0]
        if 'project_version_id' in first_cat:
            print('✅ Project info from categories:')
            print(f\"   Project Version ID: {first_cat.get('project_version_id', 'Not found')}\")
            print('   (This might be what you need for D360_PROJECT_ID)')
except:
    pass
"
fi

echo ""
echo "==============================="
echo "Summary:"
echo ""
echo "Add these to your GitHub Secrets based on what was found above:"
echo "- D360_PROJECT_ID = [The Project ID or Project Version ID]"
echo "- D360_VERSION_ID = [The Version ID if using versioned docs]"
echo ""
echo "Note: Sometimes 'Project Version ID' is what you need for D360_PROJECT_ID"