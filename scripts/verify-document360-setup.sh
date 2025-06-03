#!/bin/bash

echo "Document360 API Key Verification"
echo "================================"
echo ""

# Check if API key is provided
if [ -z "$1" ] && [ -z "$D360_API_KEY" ]; then
    echo "Usage: ./verify-document360-setup.sh <YOUR_API_KEY>"
    echo ""
    echo "Or set environment variable:"
    echo "export D360_API_KEY='your-api-key'"
    exit 1
fi

API_KEY="${1:-$D360_API_KEY}"

echo "API Key Details:"
echo "- Length: ${#API_KEY} characters"
echo "- First 10 chars: ${API_KEY:0:10}..."
echo "- Last 10 chars: ...${API_KEY: -10}"
echo "- Contains special chars: $(echo "$API_KEY" | grep -q '[+/=]' && echo "Yes" || echo "No")"
echo ""

echo "Testing API endpoints:"
echo "====================="

# Test lowercase endpoints (correct for v2)
echo -e "\n1. Testing /v2/teams (lowercase):"
response=$(curl -s -w "\nSTATUS:%{http_code}" -H "api_token: $API_KEY" "https://apihub.document360.io/v2/teams")
status=$(echo "$response" | grep "STATUS:" | cut -d: -f2)
body=$(echo "$response" | grep -v "STATUS:")

echo "   Status: $status"
echo "   Response: $body"

echo -e "\n2. Testing /v2/projectversions (lowercase):"
response=$(curl -s -w "\nSTATUS:%{http_code}" -H "api_token: $API_KEY" "https://apihub.document360.io/v2/projectversions")
status=$(echo "$response" | grep "STATUS:" | cut -d: -f2)
body=$(echo "$response" | grep -v "STATUS:")

echo "   Status: $status"
echo "   Response: $body"

echo -e "\n3. Testing US datacenter:"
response=$(curl -s -w "\nSTATUS:%{http_code}" -H "api_token: $API_KEY" "https://apihub.us.document360.io/v2/teams")
status=$(echo "$response" | grep "STATUS:" | cut -d: -f2)
body=$(echo "$response" | grep -v "STATUS:")

echo "   Status: $status"
echo "   Response: $body"

echo ""
echo "Troubleshooting:"
echo "==============="
echo ""
echo "If you're getting 'Invalid API token':"
echo ""
echo "1. Check in Document360 → Settings → API Tokens:"
echo "   - Is the token Active?"
echo "   - Does it have the right permissions?"
echo "   - Copy the token again (click the copy button)"
echo ""
echo "2. Make sure you copied the ENTIRE token"
echo "   - Tokens are usually 100+ characters long"
echo "   - Don't miss characters at the beginning or end"
echo ""
echo "3. Check your Document360 region:"
echo "   - US customers: use apihub.us.document360.io"
echo "   - Others: use apihub.document360.io"
echo ""
echo "4. Token format:"
echo "   - Should be a long base64-like string"
echo "   - May contain letters, numbers, +, /, ="
echo ""
echo "5. Wait a minute after creating"
echo "   - New tokens might take a moment to activate"