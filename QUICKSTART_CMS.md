# Quick Start: Sveltia CMS

Get your job board CMS up and running in 5 minutes!

## 🚀 Local Development (Fastest Way to Start)

### Step 1: Enable Local Backend

Edit `static/admin/config.yml` and uncomment this line:

```yaml
local_backend: true
```

### Step 2: Install Dependencies (Optional but Recommended)

```bash
npm install
```

### Step 3: Start Both Servers

**Option A: Using npm scripts (recommended if you installed dependencies)**

```bash
npm run dev:cms
```

This starts both the Hugo server and CMS proxy server simultaneously.

**Option B: Manual (two terminal windows)**

Terminal 1:
```bash
hugo server -D
```

Terminal 2:
```bash
npx @sveltia/cms-proxy-server
```

### Step 4: Access the CMS

Open your browser to:
- **CMS Admin**: http://localhost:1313/admin/
- **Site**: http://localhost:1313/

You can now create and edit job postings locally without any authentication! 🎉

---

## 🌐 Production Deployment (Netlify)

### Step 1: Push to GitHub

```bash
git add .
git commit -m "Add Sveltia CMS"
git push origin main
```

### Step 2: Deploy on Netlify

1. Go to https://app.netlify.com/
2. Click "Add new site" → "Import an existing project"
3. Select your GitHub repository
4. Build settings:
   - **Build command**: `hugo`
   - **Publish directory**: `public`
5. Click "Deploy site"

### Step 3: Enable Identity & Git Gateway

1. In Netlify dashboard → "Identity" → "Enable Identity"
2. Under "Registration preferences" → Select "Invite only"
3. Under "Services" → "Enable Git Gateway"

### Step 4: Update Configuration

Edit `static/admin/config.yml`:

```yaml
backend:
  repo: YOUR-GITHUB-USERNAME/YOUR-REPO-NAME
site_url: https://your-site.netlify.app
```

Commit and push:
```bash
git add static/admin/config.yml
git commit -m "Update CMS config"
git push
```

### Step 5: Invite Users

1. In Netlify "Identity" tab
2. Click "Invite users"
3. Enter email addresses

### Step 6: Access CMS

Visit `https://your-site.netlify.app/admin/` and log in!

---

## 📝 Creating Your First Job Posting

### Via CMS (Recommended)

1. Navigate to `/admin/`
2. Click "Job Postings" in the sidebar
3. Click "New Job Posting"
4. Fill in the form:

   **Required Fields:**
   - Job Title: "Senior Software Engineer"
   - Employer: "Tech Company Ltd"
   - Location: "London" or "Remote"
   - Work Type: Office/Remote/Hybrid
   - Region: Select from dropdown
   - Job Type: Full time/Part time/etc.

   **Optional but Recommended:**
   - Salary: "£50,000 - £60,000"
   - Minimum Salary: 50000
   - Maximum Salary: 60000
   - Language Requirements: Mandarin, Cantonese, etc.
   - Tags: sales, remote, B2B, etc.

5. Write the job description in markdown
6. Click **"Save"** (draft) or **"Publish"** (live)

### Via Command Line (Alternative)

```bash
hugo new jobs/senior-software-engineer.md
```

Then edit the created file in `content/jobs/`.

---

## 🎨 CMS Features

### Visual Editor
- Rich text editing with markdown support
- Live preview of job postings
- Drag & drop image uploads

### Media Library
- Upload employer logos
- Organize images
- Reuse across multiple job postings

### Workflow
- Draft → Publish workflow
- All changes committed to Git
- Full version history

### Mobile Support
- Works on tablets and phones
- Responsive interface
- Touch-friendly controls

---

## ❓ Common Issues

### "Cannot load configuration"

**Problem**: CMS shows error when loading

**Solution**: 
- Check that `static/admin/config.yml` exists
- Verify YAML syntax (indentation matters!)
- Ensure `backend.repo` matches your repository

### Changes not appearing on site

**Problem**: Published a job but it's not showing

**Solution**:
- Check that `draft: false` (not draft)
- Verify Hugo is rebuilding (Netlify: check deploy status)
- Clear browser cache

### Authentication not working (Production)

**Problem**: Can't log into CMS on deployed site

**Solution**:
- Ensure Netlify Identity is enabled
- Verify Git Gateway is active
- Check that you've been invited as a user
- Make sure config.yml has correct `base_url` and `auth_endpoint`

### Local CMS shows "Failed to load entries"

**Problem**: CMS proxy server not connecting

**Solution**:
- Ensure proxy server is running (`npx @sveltia/cms-proxy-server`)
- Check that `local_backend: true` is uncommented
- Restart both servers

---

## 📚 Next Steps

### Customize Your CMS

Edit `static/admin/config.yml` to:
- Add more field types
- Create custom collections
- Adjust field validation
- Add editorial workflow

### Learn More

- 📖 [Full CMS Setup Guide](CMS_SETUP.md)
- 🔗 [Sveltia CMS Documentation](https://github.com/sveltia/sveltia-cms)
- 🏗️ [Hugo Documentation](https://gohugo.io/documentation/)

---

## 🎯 Quick Reference

### NPM Scripts

```bash
npm run dev          # Start Hugo development server
npm run build        # Build production site
npm run cms:local    # Start CMS proxy server only
npm run dev:cms      # Start Hugo + CMS proxy (both)
npm run preview      # Preview production build
```

### Hugo Commands

```bash
hugo server -D       # Development server (includes drafts)
hugo server          # Production-like preview
hugo new jobs/[name].md  # Create new job posting
hugo                 # Build site
```

### File Locations

```
static/admin/
├── config.yml      # CMS configuration
└── index.html      # CMS interface loader

content/jobs/       # Job markdown files
static/images/
├── logos/          # Employer logos
└── uploads/        # CMS uploaded media
```

---

## 💡 Tips

1. **Use the CMS preview** - See how jobs will look before publishing
2. **Add meaningful tags** - Helps users filter and find jobs
3. **Include salary ranges** - Increases application rates
4. **Use descriptive titles** - Better for SEO and user experience
5. **Test locally first** - Use local backend before deploying
6. **Commit regularly** - CMS commits changes automatically, but manual edits should be committed

---

## 🆘 Need Help?

- Check [CMS_SETUP.md](CMS_SETUP.md) for detailed documentation
- Visit [Sveltia CMS Issues](https://github.com/sveltia/sveltia-cms/issues)
- Review [Hugo Forums](https://discourse.gohugo.io/)

---

**Happy posting! 🎉**

