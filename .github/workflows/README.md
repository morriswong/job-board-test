# GitHub Actions Workflow Setup

## Cloudflare Pages Deployment

This workflow automatically deploys your Hugo site to Cloudflare Pages when you push to the `main` branch.

### Required GitHub Secrets

You need to add these secrets to your GitHub repository:

1. **CLOUDFLARE_API_TOKEN**
   - Go to Cloudflare Dashboard → My Profile → API Tokens
   - Create a new token with "Cloudflare Pages: Edit" permission
   - Copy the token and add it as a GitHub secret

2. **CLOUDFLARE_ACCOUNT_ID**
   - Go to Cloudflare Dashboard
   - Click on "Workers & Pages" in the left sidebar
   - Your Account ID is shown in the right sidebar
   - Copy it and add it as a GitHub secret

### How to Add Secrets

1. Go to your GitHub repository
2. Click **Settings** → **Secrets and variables** → **Actions**
3. Click **New repository secret**
4. Add each secret:
   - Name: `CLOUDFLARE_API_TOKEN`
   - Value: `<your-api-token>`
   - Click **Add secret**
   - Repeat for `CLOUDFLARE_ACCOUNT_ID`

### Project Name

The workflow uses `job-board` as the project name. This will create a new Cloudflare Pages project called "job-board".

To change it, edit `.github/workflows/deploy-cloudflare.yml` and update the `projectName` field.

### Manual Deployment

You can trigger a deployment manually:
1. Go to **Actions** tab in your GitHub repository
2. Click **Build and Deploy to Cloudflare Pages**
3. Click **Run workflow**
4. Select the branch and click **Run workflow**

### Custom Domain

After deployment, you can add a custom domain:
1. Go to Cloudflare Dashboard → Workers & Pages
2. Click on your `job-board` project
3. Go to **Custom domains** tab
4. Click **Set up a custom domain**
5. Follow the instructions

### Build Settings

- **Build command**: Automatically handled by GitHub Actions
- **Build output directory**: `public`
- **Root directory**: `/`

The site will be available at: `https://job-board.pages.dev`

