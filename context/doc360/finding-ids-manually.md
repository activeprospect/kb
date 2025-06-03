# Finding Document360 IDs Manually

If the API scripts aren't working, here's how to find your IDs manually:

## Method 1: Browser Developer Tools

1. **Open Document360** in your browser
2. **Open Developer Tools** (F12 or right-click → Inspect)
3. Go to the **Network** tab
4. **Refresh the page**
5. Look for API calls (filter by XHR or Fetch)
6. Click on any API request and check:
   - Request Headers for user info
   - Response body for project/user IDs

## Method 2: Document360 Dashboard

### For Project ID:
1. Log in to Document360
2. Look at the browser URL when viewing your documentation
   - Often contains project identifier
   - Format: `app.document360.com/[PROJECT_ID]/...`
3. Go to **Settings** → Look for:
   - Project Settings
   - General Settings
   - API Configuration
   - About/Info section

### For User ID:
1. Click your **profile picture/avatar** (top right)
2. Go to **Profile** or **Account Settings**
3. Look for:
   - User ID
   - Member ID
   - Account ID

## Method 3: Document360 API Documentation

1. If you can access your Document360 dashboard
2. Look for **API Documentation** or **Developer Docs**
3. There might be examples showing your actual IDs

## Method 4: Check Welcome Emails

When you signed up for Document360, they may have sent:
- Account setup emails with IDs
- API access confirmation with examples
- Welcome documentation with your specific values

## Method 5: Quick Manual Test

Try this manual curl command with your API key:

```bash
# Replace YOUR_API_KEY with your actual key
curl -H "api_token: YOUR_API_KEY" https://api.document360.com/v1/projects

# If that doesn't work, try:
curl -H "Api-Token: YOUR_API_KEY" https://api.document360.com/v1/projects

# Or with different auth:
curl -H "Authorization: YOUR_API_KEY" https://api.document360.com/v1/projects

# Or check if it's api.document360.io instead:
curl -H "api_token: YOUR_API_KEY" https://api.document360.io/v1/projects
```

## Common Issues

1. **Wrong API endpoint**: Sometimes it's `.io` instead of `.com`
2. **API key permissions**: Ensure your key has read permissions
3. **Account type**: Some features require specific plan levels
4. **Region-specific endpoints**: EU vs US endpoints might differ

## If Nothing Works

Contact Document360 support directly:
- Use the chat widget in your dashboard
- Email: support@document360.com
- Ask specifically for:
  - Your Project ID (or Project Version ID)
  - Your User ID
  - Correct API endpoint for your account
  - Example API call for your account

They usually respond quickly and can provide exact values.