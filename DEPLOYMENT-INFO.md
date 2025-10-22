# Deployment Information

## 🌐 Live Site URLs

- **Production Site**: https://job-board-cu2.pages.dev
- **GitHub Repository**: https://github.com/morriswong/job-board-test

## 🚀 Quick Deploy Commands

### Deploy to Cloudflare Pages
```bash
./deploy.sh
```

Or manually:
```bash
hugo --gc --minify
wrangler pages deploy public --project-name=job-board --commit-dirty=true
```

### View Deployment List
```bash
wrangler pages deployment list --project-name=job-board
```

### Rollback to Previous Deployment
```bash
wrangler pages deployment list --project-name=job-board
# Copy the deployment ID you want to rollback to
wrangler pages deployment tail <deployment-id> --project-name=job-board
```

## 📝 Add New Jobs

### Regular Job
```bash
# Create job in dated folder
hugo new jobs/2025/10/22/position-name.md

# Edit the file, then deploy
./deploy.sh
```

### Sponsored Job (Shows on Homepage)
```bash
# Create sponsored job
hugo new jobs/sponsored/position-name.md

# Make sure to add this line to front matter:
# sponsored = true

# Deploy
./deploy.sh
```

## 🎨 Customize

### Update Colors
Edit `static/css/style.css` - look for color values:
- Blue: `#012169`
- Red: `#C8102E`
- Background: `#f6f6ef`

### Update Site Info
Edit `hugo.toml`:
- Site title
- Description
- Base URL (if using custom domain)

## 🌍 Custom Domain

### Add a Custom Domain
```bash
wrangler pages domain add job-board yourdomain.com
```

### List Domains
```bash
wrangler pages domain list --project-name=job-board
```

### Remove Domain
```bash
wrangler pages domain remove job-board yourdomain.com
```

## 📊 View Analytics

Visit Cloudflare Dashboard:
1. Go to https://dash.cloudflare.com/
2. Click **Workers & Pages**
3. Select **job-board**
4. Click **Analytics** tab

## 🔍 View Deployment Logs

```bash
# Tail production logs
wrangler pages deployment tail --project-name=job-board

# View specific deployment
wrangler pages deployment tail <deployment-id> --project-name=job-board
```

## 🔄 Git Workflow

```bash
# Make changes to content or code
hugo new jobs/sponsored/new-job.md

# Test locally
hugo server -D

# Commit changes
git add .
git commit -m "Add new job posting"
git push

# Deploy to Cloudflare
./deploy.sh
```

## 🛠️ Useful Commands

### List all projects
```bash
wrangler pages project list
```

### Get project info
```bash
wrangler pages project info job-board
```

### Delete deployment
```bash
wrangler pages deployment delete <deployment-id> --project-name=job-board
```

### Check Wrangler version
```bash
wrangler --version
```

### Update Wrangler
```bash
npm update -g wrangler
```

## 📚 Documentation Links

- **Hugo Docs**: https://gohugo.io/documentation/
- **Wrangler Docs**: https://developers.cloudflare.com/workers/wrangler/
- **Cloudflare Pages**: https://developers.cloudflare.com/pages/

## 🆘 Troubleshooting

### Build Fails
```bash
# Test build locally
hugo --gc --minify

# Check for errors in content files
hugo --gc --minify --verbose
```

### Deploy Fails
```bash
# Check authentication
wrangler whoami

# Re-login if needed
wrangler login

# Check project exists
wrangler pages project list
```

### Site Not Updating
1. Clear browser cache
2. Check deployment status
3. Wait 1-2 minutes for CDN propagation

## 📈 Project Stats

- **Technology**: Hugo 0.151.2 (Extended)
- **Deployment**: Cloudflare Pages via Wrangler CLI
- **Repository**: GitHub
- **Job Postings**: 5 regular + 2 sponsored
- **Pages Generated**: 67

---

**Last Updated**: October 22, 2025
**Deployed By**: Wrangler CLI

