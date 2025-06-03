#!/bin/bash

# Script to get your Document360 User ID using the API

echo "Document360 User ID Finder"
echo "========================="
echo ""

# Check if API key is provided
if [ -z "$1" ]; then
    echo "Usage: ./get-document360-user-id.sh <YOUR_API_KEY>"
    echo ""
    echo "Or set environment variable:"
    echo "export D360_API_KEY='your-api-key'"
    echo "./get-document360-user-id.sh"
    exit 1
fi

API_KEY="${1:-$D360_API_KEY}"

echo "Fetching user information..."
echo ""

# Get user info from Document360 API
response=$(curl -s -H "api_token: ${API_KEY}" \
    "https://api.document360.com/v1/users/me" 2>/dev/null)

# Check if request was successful
if [ $? -ne 0 ]; then
    echo "❌ Failed to connect to Document360 API"
    exit 1
fi

# Parse and display the response
echo "$response" | python3 -c "
import sys, json
try:
    data = json.load(sys.stdin)
    if 'data' in data:
        user = data['data']
        print('✅ User Information Found:')
        print(f\"   User ID: {user.get('id', 'Not found')}\")
        print(f\"   Name: {user.get('name', 'Not found')}\")
        print(f\"   Email: {user.get('email', 'Not found')}\")
        print('')
        print('Add this to your GitHub Secrets:')
        print(f\"   D360_USER_ID = {user.get('id', 'Not found')}\")
    elif 'error' in data:
        print(f\"❌ API Error: {data['error']}\")
    else:
        print('❌ Unexpected response format')
        print(json.dumps(data, indent=2))
except Exception as e:
    print(f'❌ Error parsing response: {e}')
    print('Raw response:', sys.stdin.read())
"