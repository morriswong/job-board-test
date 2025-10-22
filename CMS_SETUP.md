# Sveltia CMS Setup Guide

This job board now uses [Sveltia CMS](https://github.com/sveltia/sveltia-cms) as its content management system. Sveltia CMS is a modern, fast, and lightweight Git-based headless CMS.

## Features

✅ **User-Friendly Interface** - Intuitive admin panel for managing job postings  
✅ **Git-Based** - All changes are committed directly to your repository  
✅ **No Database Required** - Content stored as markdown files  
✅ **Live Preview** - See how jobs will look before publishing  
✅ **Media Management** - Upload and manage employer logos  
✅ **Mobile Friendly** - Manage content from any device  
✅ **Dark Mode** - Modern UI with dark mode support  

## Setup Instructions

### Option 1: GitHub + Netlify (Recommended)

This is the easiest setup option and provides authentication out of the box.

1. **Push your repository to GitHub**
   ```bash
   git add .
   git commit -m "Add Sveltia CMS"
   git push origin main
   ```

2. **Deploy to Netlify**
   - Go to [Netlify](https://app.netlify.com/)
   - Click "Add new site" → "Import an existing project"
   - Connect your GitHub repository
   - Configure build settings:
     - Build command: `hugo`
     - Publish directory: `public`
   - Click "Deploy site"

3. **Enable Netlify Identity**
   - In your Netlify site dashboard, go to "Identity"
   - Click "Enable Identity"
   - Under "Registration preferences", select "Invite only"
   - Under "External providers", enable any OAuth providers you want (GitHub recommended)

4. **Enable Git Gateway**
   - In Netlify Identity settings, scroll to "Services"
   - Click "Enable Git Gateway"

5. **Update CMS Configuration**
   - Open `static/admin/config.yml`
   - Update these values:
     ```yaml
     backend:
       repo: your-github-username/your-repo-name
     site_url: https://your-site.netlify.app
     ```

6. **Invite Users**
   - In Netlify Identity, click "Invite users"
   - Enter email addresses for people who should have CMS access

7. **Access the CMS**
   - Visit `https://your-site.netlify.app/admin/`
   - Log in with your invited email
   - Start creating job postings!

### Option 2: GitHub OAuth App (Self-Hosted)

If you're not using Netlify, you can set up GitHub OAuth authentication:

1. **Create a GitHub OAuth App**
   - Go to GitHub Settings → Developer settings → OAuth Apps
   - Click "New OAuth App"
   - Fill in:
     - Application name: "Job Board CMS"
     - Homepage URL: Your site URL
     - Authorization callback URL: `https://your-site.com/admin/`
   - Note the Client ID and Client Secret

2. **Set up an OAuth authentication server**
   - Use [netlify-cms-github-oauth-provider](https://github.com/vencax/netlify-cms-github-oauth-provider)
   - Or use [Netlify's auth provider](https://github.com/netlify/git-gateway)

3. **Update config.yml**
   ```yaml
   backend:
     name: github
     repo: your-username/your-repo
     branch: main
     base_url: https://your-auth-server.com
   ```

### Option 3: Local Development

For testing and development, you can run Sveltia CMS locally:

1. **Enable local backend in config.yml**
   - Uncomment the `local_backend: true` line in `static/admin/config.yml`

2. **Install and run the local proxy server**
   ```bash
   npx @sveltia/cms-proxy-server
   ```

3. **Run Hugo development server**
   ```bash
   hugo server -D
   ```

4. **Access the CMS**
   - Visit `http://localhost:1313/admin/`
   - You can now manage content locally without authentication

## Using the CMS

### Creating a New Job Posting

1. Navigate to `/admin/` on your site
2. Click "Job Postings" in the sidebar
3. Click "New Job Posting"
4. Fill in the required fields:
   - **Job Title**: Position name
   - **Employer**: Company name
   - **Location**: City or "Remote"
   - **Salary**: Display format (e.g., "£30,000 - £40,000")
   - **Job Description**: Full markdown description
5. Add optional fields as needed:
   - Employer logo
   - Language requirements
   - Tags for categorization
6. Click "Save" (draft) or "Publish"

### Editing an Existing Job

1. Navigate to "Job Postings"
2. Click on the job you want to edit
3. Make your changes
4. Click "Save" or "Publish"

### Managing Media

- Click "Media" in the sidebar to view all uploaded images
- Drag and drop files to upload
- Uploaded files go to `static/images/uploads/`

### Publishing vs. Drafts

- **Draft**: Set `draft: true` - job won't appear on the public site
- **Published**: Set `draft: false` - job will be visible immediately

## Content Structure

Job postings are stored as markdown files in `content/jobs/` with TOML frontmatter:

```toml
+++
title = 'Sales Manager'
date = 2025-10-22T10:00:00Z
draft = false
employer = 'Company Name'
location = 'London'
workType = 'office'
region = 'London'
jobType = 'Full time'
salary = '£35,000'
salaryMin = 35000
salaryMax = 35000
jobCategory = 'white-collar'
industry = 'Tech'
languageRequirements = ['Mandarin']
tags = ['sales', 'B2B']
+++

## Position Overview
...
```

## Troubleshooting

### "Cannot load configuration"
- Check that `static/admin/config.yml` exists and is valid YAML
- Verify your `backend.repo` setting matches your GitHub repository

### Authentication Issues
- Ensure Netlify Identity is enabled and Git Gateway is active
- Check that you've been invited as a user
- Clear browser cache and try again

### Changes Not Appearing
- Hugo regenerates the site on each deployment
- Check that your build command includes `hugo` (not `hugo -D` in production)
- Verify the publish directory is set to `public`

## Advanced Configuration

### Custom Workflow
You can add editorial workflow for content approval:

```yaml
publish_mode: editorial_workflow
```

This adds a "Draft → In Review → Ready" workflow.

### Additional Collections
To manage other content types, add collections to `config.yml`:

```yaml
collections:
  - name: "pages"
    label: "Pages"
    folder: "content/pages"
    # ... field configuration
```

## Resources

- [Sveltia CMS Documentation](https://github.com/sveltia/sveltia-cms/blob/main/README.md)
- [Hugo Documentation](https://gohugo.io/documentation/)
- [Netlify CMS Configuration Reference](https://decapcms.org/docs/configuration-options/)
- [Markdown Guide](https://www.markdownguide.org/)

## Support

- For Sveltia CMS issues: https://github.com/sveltia/sveltia-cms/issues
- For Hugo issues: https://discourse.gohugo.io/

