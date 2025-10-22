# Deployment Guide

## Cloudflare Pages Deployment Options

### Option 1: Direct Git Integration (Recommended for Beginners)

This is the easiest method - no GitHub Actions needed!

1. **Push your code to GitHub**
   ```bash
   git add .
   git commit -m "Initial commit"
   git push origin main
   ```

2. **Connect to Cloudflare Pages**
   - Go to [Cloudflare Dashboard](https://dash.cloudflare.com/)
   - Click **Workers & Pages** in the left sidebar
   - Click **Create application** → **Pages** → **Connect to Git**
   - Select your GitHub repository
   - Configure build settings:
     - **Production branch**: `main`
     - **Build command**: `hugo --gc --minify`
     - **Build output directory**: `public`
     - **Environment variables**: None needed
   - Click **Save and Deploy**

3. **Your site will be live!**
   - URL: `https://your-project.pages.dev`
   - Every push to `main` automatically deploys

### Option 2: GitHub Actions (More Control)

Use this if you want more control over the build process.

#### Setup Steps:

1. **Get Cloudflare Credentials**
   
   a. **API Token**:
   - Go to [Cloudflare Dashboard](https://dash.cloudflare.com/)
   - Click your profile icon → **My Profile** → **API Tokens**
   - Click **Create Token**
   - Use "Cloudflare Pages: Edit" template
   - Copy the token (save it securely!)
   
   b. **Account ID**:
   - Go to Cloudflare Dashboard
   - Click **Workers & Pages**
   - Your Account ID is in the right sidebar

2. **Add Secrets to GitHub**
   - Go to your GitHub repository
   - **Settings** → **Secrets and variables** → **Actions**
   - Click **New repository secret**
   - Add:
     - `CLOUDFLARE_API_TOKEN`: your API token
     - `CLOUDFLARE_ACCOUNT_ID`: your account ID

3. **Push and Deploy**
   ```bash
   git add .
   git commit -m "Add deployment workflow"
   git push origin main
   ```

4. **Check Deployment**
   - Go to **Actions** tab in GitHub
   - Watch the deployment progress
   - Once complete, visit your Cloudflare Pages project

## Local Testing Before Deploy

Always test locally first:

```bash
# Build for production
hugo --gc --minify

# Test the built site
cd public
python3 -m http.server 8000
# Visit http://localhost:8000
```

## Build Configuration

### Hugo Version
- Current: `0.151.2 extended`
- Specified in: `.github/workflows/deploy-cloudflare.yml`
- Update if needed

### Build Commands
- **Development**: `hugo server -D`
- **Production**: `hugo --gc --minify`

### Output Directory
- All builds output to `public/`
- This directory is in `.gitignore` (don't commit it)

## Custom Domain Setup

After deployment:

1. Go to Cloudflare Dashboard → **Workers & Pages**
2. Select your project
3. Go to **Custom domains** tab
4. Click **Set up a custom domain**
5. Enter your domain (e.g., `jobs.yourdomain.com`)
6. Add the CNAME record to your DNS:
   - Type: `CNAME`
   - Name: `jobs` (or `@` for root domain)
   - Target: `your-project.pages.dev`
7. Wait for DNS propagation (usually < 5 minutes)

## Environment Variables

You can add environment variables in Cloudflare:

1. Go to your Pages project
2. Click **Settings** → **Environment variables**
3. Add variables (e.g., for API keys, analytics)

## Deployment URL Patterns

- **Production**: `https://job-board.pages.dev`
- **Preview (per branch)**: `https://[branch].job-board.pages.dev`
- **Preview (per PR)**: `https://[pr-number].job-board.pages.dev`

## Rollback

To rollback to a previous deployment:

1. Go to Cloudflare Dashboard → **Workers & Pages**
2. Select your project
3. Click **Deployments** tab
4. Find the deployment you want
5. Click **⋯** → **Rollback to this deployment**

## Troubleshooting

### Build Fails

Check these:
- Hugo version matches (0.151.2)
- All content files have valid front matter
- No broken links in templates
- Check build logs in GitHub Actions or Cloudflare

### Site Not Updating

- Check that you pushed to the correct branch
- Verify the build completed successfully
- Clear your browser cache
- Check Cloudflare Pages deployment status

### 404 Errors

- Verify `baseURL` in `hugo.toml` is correct
- Check that all internal links are relative
- Ensure all content files are not in draft mode

## Performance Tips

1. **Enable Cloudflare CDN features**:
   - Auto minify (HTML, CSS, JS)
   - Brotli compression
   - Image optimization

2. **Use Hugo's built-in optimization**:
   - `hugo --gc --minify` already enabled
   - Images should be optimized before upload

3. **Monitor with Cloudflare Analytics**:
   - Available in your Pages project dashboard
   - Shows traffic, performance, and errors

## Support

- Hugo Docs: https://gohugo.io/documentation/
- Cloudflare Pages Docs: https://developers.cloudflare.com/pages/
- GitHub Actions Docs: https://docs.github.com/actions

