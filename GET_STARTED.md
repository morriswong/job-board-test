# 🚀 Get Started with Your CMS-Powered Job Board

## Welcome!

Your Hugo job board now has **Sveltia CMS** installed! This means you can manage job postings and blog content through a beautiful web interface instead of editing markdown files.

---

## ⚡ Quick Start (Choose One Path)

### Path 1: Test Locally (5 minutes) 🏠

Perfect for trying out the CMS before deploying.

```bash
# 1. Uncomment this line in static/admin/config.yml:
#    local_backend: true

# 2. Install and start
npm install
npm run dev:cms

# 3. Open in browser
# 🌐 CMS: http://localhost:1313/admin/
# 🌐 Site: http://localhost:1313/
```

**No authentication needed locally!** Start creating job postings immediately.

---

### Path 2: Deploy to Production (15 minutes) ☁️

Full production setup with authentication.

```bash
# 1. Update static/admin/config.yml:
#    - Change repo to: your-username/job-board-test
#    - Change site_url to: https://your-site.netlify.app

# 2. Push to GitHub
git add .
git commit -m "Add Sveltia CMS"
git push origin main

# 3. Deploy to Netlify
# - Connect your GitHub repo
# - Enable Netlify Identity
# - Enable Git Gateway
# - Invite users

# 4. Access CMS
# 🌐 https://your-site.netlify.app/admin/
```

Full instructions: **[CMS_SETUP.md](CMS_SETUP.md)**

---

## 📚 Documentation Overview

### Choose Your Guide

| **If you want to...** | **Read this** | **Time** |
|------------------------|---------------|----------|
| Get running ASAP | [QUICKSTART_CMS.md](QUICKSTART_CMS.md) | 5 min |
| Full setup guide | [CMS_SETUP.md](CMS_SETUP.md) | 15 min |
| Understand the system | [CMS_ARCHITECTURE.md](CMS_ARCHITECTURE.md) | 20 min |
| See what was built | [IMPLEMENTATION_SUMMARY.md](IMPLEMENTATION_SUMMARY.md) | 10 min |

---

## 🎯 What You Can Do Now

### Create Content Visually

<table>
<tr>
<td width="50%">

**Before CMS** ❌
```markdown
+++
title = 'Software Engineer'
date = 2025-10-22T10:00:00Z
employer = 'Tech Corp'
location = 'London'
workType = 'remote'
region = 'London'
jobType = 'Full time'
salary = '£50,000'
tags = ['engineering', 'remote']
+++

## Description
...
```
Manual markdown editing

</td>
<td width="50%">

**With CMS** ✅
1. Visit `/admin/`
2. Click "New Job Posting"
3. Fill in form fields
4. Click "Publish"

User-friendly interface!

</td>
</tr>
</table>

---

## 💡 Key Features

### 📝 Visual Editor
- No markdown syntax needed
- Rich text formatting
- Live preview

### 🖼️ Media Library
- Drag & drop upload
- Image management
- Reusable assets

### 📱 Mobile Friendly
- Edit from phone/tablet
- Responsive interface
- Touch controls

### 🔄 Git-Powered
- Auto-commits changes
- Full version history
- Collaborate safely

### 🌙 Modern UI
- Dark mode support
- Clean interface
- Fast performance

---

## 🎨 Collections Available

You can manage these content types through the CMS:

### 1. **Job Postings** (`/admin/` → Job Postings)
- Create/edit job listings
- Set salary ranges
- Add language requirements
- Upload employer logos
- Tag for categorization

### 2. **Blog Posts** (`/admin/` → Blog Posts)
- Write career advice articles
- Add featured images
- Set author attribution
- Organize with tags

### 3. **Site Settings** (`/admin/` → Site Settings)
- Edit site title
- Update description
- Change tagline

---

## 🔧 Configuration Files

Key files to know about:

```
static/admin/
├── config.yml      ← CMS configuration (edit this)
└── index.html      ← CMS interface (don't edit)

content/
├── jobs/           ← Job markdown files (CMS creates these)
└── blog/           ← Blog markdown files (CMS creates these)

static/images/
└── uploads/        ← CMS-uploaded media
```

---

## ⚙️ NPM Scripts

Convenient commands added to `package.json`:

```bash
npm run dev          # Start Hugo dev server
npm run build        # Build production site
npm run cms:local    # Start CMS proxy (for local dev)
npm run dev:cms      # Start both Hugo + CMS (one command!)
npm run preview      # Preview production build
```

---

## 🎓 Tutorial: Create Your First Job

### Using the CMS

1. **Access the CMS**
   - Local: http://localhost:1313/admin/
   - Production: https://your-site.netlify.app/admin/

2. **Click "Job Postings"** in the left sidebar

3. **Click "New Job Posting"**

4. **Fill in the form**:
   - **Job Title**: "Senior Frontend Developer"
   - **Employer**: "Tech Innovations Ltd"
   - **Location**: "London"
   - **Work Type**: "Hybrid"
   - **Region**: "London"
   - **Job Type**: "Full time"
   - **Salary**: "£60,000 - £80,000"
   - **Min Salary**: 60000
   - **Max Salary**: 80000
   - **Tags**: engineering, frontend, react, london

5. **Write the description** in markdown:
   ```markdown
   ## About the Role
   We're looking for an experienced frontend developer...

   ## Requirements
   - 5+ years experience
   - React expertise
   - TypeScript proficiency
   ```

6. **Preview** (click the eye icon)

7. **Publish** (click Publish button)

**Done!** Your job is now live on the site. 🎉

---

## ❓ Common Questions

### "Do I need to know Git?"
Not for daily use! The CMS handles Git automatically. Only needed for initial setup.

### "Can multiple people edit?"
Yes! Invite team members through Netlify Identity (production) or share local dev setup.

### "What if I make a mistake?"
All changes are in Git, so you can revert to any previous version.

### "Can I still edit markdown directly?"
Absolutely! You can use both the CMS and direct file editing.

### "Is it free?"
Yes! Hugo, Sveltia CMS, GitHub, and Netlify (free tier) are all free.

---

## 🐛 Troubleshooting

### CMS won't load
- ✅ Check that `static/admin/config.yml` exists
- ✅ Check browser console for errors
- ✅ Verify Hugo server is running

### Can't authenticate (production)
- ✅ Enable Netlify Identity
- ✅ Enable Git Gateway
- ✅ Check you're invited as a user
- ✅ Clear browser cache

### Changes not appearing
- ✅ Check `draft: false` (not draft)
- ✅ Wait for Netlify build to complete
- ✅ Clear browser cache
- ✅ Check Hugo server restarted (local)

---

## 📞 Get Help

### Documentation
- [Sveltia CMS](https://github.com/sveltia/sveltia-cms)
- [Hugo Docs](https://gohugo.io/documentation/)
- [Netlify Docs](https://docs.netlify.com/)

### Community
- [Sveltia Issues](https://github.com/sveltia/sveltia-cms/issues)
- [Hugo Forum](https://discourse.gohugo.io/)

---

## 🎉 Success Checklist

Track your progress:

- [ ] Choose local or production path
- [ ] Update `config.yml` with your repo details
- [ ] Start the CMS (local or production)
- [ ] Access `/admin/` successfully
- [ ] Create your first job posting
- [ ] Preview the job on your site
- [ ] Publish and verify it's live
- [ ] Invite team members (production)
- [ ] Read the full documentation
- [ ] Customize fields as needed

---

## 🚀 Next Steps

Once you're comfortable with the basics:

1. **Customize the CMS**
   - Add custom fields to `config.yml`
   - Adjust validation rules
   - Create new collections

2. **Enhance Your Site**
   - Customize Hugo templates
   - Adjust styling in `static/css/style.css`
   - Add new features

3. **Optimize Workflow**
   - Set up editorial workflow
   - Configure automatic deployments
   - Add GitHub Actions

---

## 🎊 You're Ready!

Everything is set up and ready to go. Pick a path above and start creating content!

**Questions?** Check the detailed guides:
- 🚀 [QUICKSTART_CMS.md](QUICKSTART_CMS.md) - Fastest way to get running
- 📖 [CMS_SETUP.md](CMS_SETUP.md) - Complete setup guide
- 🏗️ [CMS_ARCHITECTURE.md](CMS_ARCHITECTURE.md) - How it all works
- 📊 [IMPLEMENTATION_SUMMARY.md](IMPLEMENTATION_SUMMARY.md) - What was built

---

**Happy job posting! 🎉**

*Built with [Sveltia CMS](https://github.com/sveltia/sveltia-cms) + [Hugo](https://gohugo.io/)*

