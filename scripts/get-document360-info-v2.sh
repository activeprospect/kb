#!/bin/bash

# Script to get Document360 project information using API v2

echo "Document360 API v2 - Project Information"
echo "======================================="
echo ""

# Check if API key is provided
if [ -z "$1" ] && [ -z "$D360_API_KEY" ]; then
    echo "Usage: ./get-document360-info-v2.sh <YOUR_API_KEY>"
    echo ""
    echo "Or set environment variable:"
    echo "export D360_API_KEY='your-api-key'"
    echo "./get-document360-info-v2.sh"
    exit 1
fi

API_KEY="${1:-$D360_API_KEY}"
BASE_URL="https://apihub.document360.io/v2"

echo "Using API endpoint: $BASE_URL"
echo ""

# Function to pretty print JSON
print_json() {
    python3 -c "
import sys, json
try:
    data = json.load(sys.stdin)
    if data.get('success', False):
        print('✅ Success!')
        if 'data' in data:
            print(json.dumps(data['data'], indent=2))
    else:
        print('❌ Request failed')
        if 'errors' in data and data['errors']:
            for error in data['errors']:
                print(f\"Error: {error.get('description', 'Unknown error')}\")
        else:
            print(json.dumps(data, indent=2))
except Exception as e:
    content = sys.stdin.read()
    if not content:
        print('❌ Empty response - likely authentication failure')
        print('Please check:')
        print('1. Your API key is correct')
        print('2. API key has proper permissions')
        print('3. Your Document360 account is active')
    else:
        print(f'Raw response: {content}')
"
}

# Test 1: Get Teams
echo "1. Testing Teams endpoint..."
echo "----------------------------"
curl -s -H "api_token: $API_KEY" "$BASE_URL/Teams" | print_json

echo ""
echo "2. Testing Project Versions endpoint..."
echo "--------------------------------------"
curl -s -H "api_token: $API_KEY" "$BASE_URL/ProjectVersions" | print_json

echo ""
echo "3. Testing with explicit headers..."
echo "----------------------------------"
curl -s \
  -H "api_token: $API_KEY" \
  -H "Content-Type: application/json" \
  -H "Accept: application/json" \
  "$BASE_URL/Teams" | print_json

echo ""
echo "======================================="
echo "Troubleshooting:"
echo ""
echo "If you're getting authentication errors:"
echo "1. Go to Document360 → Settings → API Tokens"
echo "2. Create a new API token with these permissions:"
echo "   - Read access to Projects"
echo "   - Read/Write access to Articles"
echo "   - Read/Write access to Categories"
echo "3. Make sure the token is Active"
echo ""
echo "The Project Version ID you need will be in the response"
echo "from the ProjectVersions endpoint once authentication works."