# Document360 API v2 Setup Summary

## Key Changes for API v2

1. **Base URL**: `https://apihub.document360.io/v2` (not `api.document360.com`)
2. **Authentication**: Header `api_token: YOUR_API_KEY`
3. **Project ID**: In v2, you need the **Project Version ID**, not just Project ID

## Required GitHub Secrets

You need to add these secrets to your GitHub repository:

1. **`D360_API_KEY`** (Required)
   - Get from: Document360 → Settings → API Tokens
   - Ensure it has permissions for:
     - Projects (Read)
     - Articles (Read/Write)
     - Categories (Read/Write)

2. **`D360_PROJECT_ID`** (Required)
   - This is actually your **Project Version ID** in API v2
   - Get it by running: `./scripts/get-document360-info-v2.sh`
   - Or find in Document360 → Settings → Versions

3. **`D360_VERSION_ID`** (Optional)
   - Only needed if using d360 CLI for OpenAPI docs

4. **`D360_USER_ID`** (Optional)
   - Only needed if using d360 CLI for OpenAPI docs

## Testing Your Setup

1. **Verify API Key**:
   ```bash
   export D360_API_KEY="your-api-key"
   ./scripts/get-document360-info-v2.sh
   ```

2. **Test Deployment (Dry Run)**:
   ```bash
   export D360_API_KEY="your-api-key"
   export D360_PROJECT_ID="your-project-version-id"
   export DOCS_PATH="./context/doc360/test-content"
   export DRY_RUN="true"
   node scripts/deploy-markdown-to-document360-v2.js
   ```

3. **Test with Real Deployment**:
   ```bash
   # Remove DRY_RUN to actually deploy
   export DRY_RUN="false"
   node scripts/deploy-markdown-to-document360-v2.js
   ```

## API v2 Endpoints Used

- `/v2/Teams` - Verify authentication
- `/v2/ProjectVersions` - Get project versions
- `/v2/ProjectVersions/{id}/categories` - List categories
- `/v2/ProjectVersions/{id}/articles` - List articles
- `/v2/Categories` - Create categories
- `/v2/Articles` - Create/update articles

## Common Issues

1. **401 Unauthorized**
   - Check API key is correct
   - Verify permissions in Document360
   - Ensure API key is Active

2. **Empty Response**
   - Usually means authentication failed
   - Double-check the API key format

3. **Project Version ID**
   - In v2, you need the Version ID, not just Project ID
   - Each project can have multiple versions
   - Use the default version if you're not using versioning

## Next Steps

1. Generate a new API key in Document360 with proper permissions
2. Run `./scripts/get-document360-info-v2.sh` to find your Project Version ID
3. Add the secrets to GitHub
4. Test with dry run first
5. Deploy your documentation