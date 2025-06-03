# Quick Manual Setup for Document360

Since the API authentication is having issues, let's get your IDs manually from the Document360 dashboard.

## Step 1: Find Your Project ID

1. **Log in to Document360**
2. Look for one of these locations:

### Option A: URL Method
- When you're in your documentation, check the browser URL
- Look for patterns like:
  - `https://[YOUR-WORKSPACE].document360.io/docs`
  - `https://app.document360.io/[PROJECT-ID]/...`
  - The PROJECT-ID is often a UUID or alphanumeric string

### Option B: Settings Method
1. Click **Settings** (gear icon)
2. Look for sections named:
   - "Project Settings"
   - "API Configuration"
   - "General"
   - "Project Info"

### Option C: API Keys Page
1. Go to **Settings** → **API Keys**
2. When you view or create an API key, the page might show:
   - Project ID
   - Workspace ID
   - Example API calls with your IDs

## Step 2: Find Your User ID

1. Click your **profile picture** (top right)
2. Go to **Profile** or **My Account**
3. Look for:
   - User ID
   - Member ID
   - Profile ID

## Step 3: Find Version ID (if needed)

1. Go to **Settings** → **Versions**
2. If you see versions listed, note the ID of your main version
3. If no versions are shown, you might not need this

## Step 4: Test Your Setup Manually

Once you have the IDs, test with a simple curl command:

```bash
# Replace with your actual values
PROJECT_ID="your-project-id-here"
API_KEY="4zQb4CANpr262emWjhsn5rXblFOKA0aJ8KVPjtJCHx6/RPEHAlD883r3M2PZgekITER8wvlutJPuOlJVbTJehek2AoXYQTYHvNjIouoxv8u4kYOjxf9LdSMH6/lYpPeceOISMtT2USCy0zs9DgB4jg=="

# Try this format (common for Document360)
curl -H "Api-Token: $API_KEY" \
     "https://api.document360.io/v1/projects/$PROJECT_ID/categories"
```

## Step 5: Common ID Formats

Your IDs will likely look like one of these:

**Project ID:**
- UUID: `550e8400-e29b-41d4-a716-446655440000`
- Short code: `proj_ABC123`
- Numeric: `12345`

**User ID:**
- UUID: `123e4567-e89b-12d3-a456-426614174000`
- Email-based: `user@example.com`
- Numeric: `67890`

## If You Can't Find Them

Use Document360's chat support (usually bottom right corner) and ask:
"I need my Project ID and User ID for API integration. Can you help me find these?"

They typically respond within minutes during business hours.