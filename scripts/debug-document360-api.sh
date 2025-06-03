#!/bin/bash

# Debug script for Document360 API connection

echo "Document360 API Debug Script"
echo "============================"
echo ""

# Check if API key is provided
if [ -z "$1" ] && [ -z "$D360_API_KEY" ]; then
    echo "Usage: ./debug-document360-api.sh <YOUR_API_KEY>"
    echo ""
    echo "Or set environment variable:"
    echo "export D360_API_KEY='your-api-key'"
    echo "./debug-document360-api.sh"
    exit 1
fi

API_KEY="${1:-$D360_API_KEY}"

echo "Testing API connection..."
echo ""

# Test 1: Basic connection test
echo "Test 1: Basic API connection"
echo "----------------------------"
echo "Command: curl -v -H \"api_token: ${API_KEY:0:10}...\" https://api.document360.com/v1/projects"
echo ""

response=$(curl -s -w "\nHTTP_CODE:%{http_code}" -H "api_token: ${API_KEY}" \
    "https://api.document360.com/v1/projects" 2>&1)

http_code=$(echo "$response" | grep "HTTP_CODE:" | cut -d: -f2)
body=$(echo "$response" | sed '/HTTP_CODE:/d')

echo "HTTP Status Code: $http_code"
echo ""

if [ "$http_code" = "200" ]; then
    echo "✅ Connection successful!"
    echo "Response preview:"
    echo "$body" | head -n 5
elif [ "$http_code" = "401" ]; then
    echo "❌ Authentication failed - API key may be invalid"
elif [ "$http_code" = "403" ]; then
    echo "❌ Forbidden - API key may lack required permissions"
elif [ "$http_code" = "404" ]; then
    echo "❌ Not found - API endpoint may have changed"
else
    echo "❌ Connection failed with status: $http_code"
    echo "Response:"
    echo "$body"
fi

echo ""
echo "Test 2: Try alternative authentication header"
echo "--------------------------------------------"

# Some APIs use different header names
alt_response=$(curl -s -w "\nHTTP_CODE:%{http_code}" -H "Authorization: Bearer ${API_KEY}" \
    "https://api.document360.com/v1/projects" 2>&1)

alt_http_code=$(echo "$alt_response" | grep "HTTP_CODE:" | cut -d: -f2)
echo "HTTP Status Code with Bearer token: $alt_http_code"

echo ""
echo "Test 3: Check SSL and connectivity"
echo "---------------------------------"

# Test basic connectivity
ping_test=$(ping -c 1 api.document360.com 2>&1)
if [ $? -eq 0 ]; then
    echo "✅ Can reach api.document360.com"
else
    echo "❌ Cannot reach api.document360.com"
fi

# Test SSL
ssl_test=$(curl -s -I https://api.document360.com 2>&1)
if [ $? -eq 0 ]; then
    echo "✅ SSL connection works"
else
    echo "❌ SSL connection failed"
fi

echo ""
echo "Test 4: Try with different endpoints"
echo "-----------------------------------"

endpoints=(
    "https://api.document360.com/v1/users/me"
    "https://api.document360.com/v1/categories"
    "https://api.document360.com/v1/articles"
    "https://api.document360.io/v1/projects"
    "https://api-v2.document360.com/v1/projects"
)

for endpoint in "${endpoints[@]}"; do
    echo -n "Testing $endpoint ... "
    status=$(curl -s -o /dev/null -w "%{http_code}" -H "api_token: ${API_KEY}" "$endpoint")
    echo "Status: $status"
done

echo ""
echo "Debugging Information:"
echo "--------------------"
echo "- Make sure your API key is correct and active"
echo "- Check if your Document360 account is active"
echo "- Verify API access is enabled for your account"
echo "- The API key should be from Settings → API Tokens"
echo ""
echo "If all tests fail, try:"
echo "1. Regenerate your API key in Document360"
echo "2. Check with Document360 support for API status"
echo "3. Verify your account has API access enabled"