# Job Board

A Hugo-based job board inspired by [Code4Lib Jobs](https://jobs.code4lib.org/), designed for posting and browsing job opportunities in the tech and cultural heritage sectors.

## Features

- **Job Listings**: Browse recent job postings with detailed information
- **Tagging System**: Filter jobs by technology, skills, and categories
- **Employer Directory**: View all employers and their job postings
- **Content Management**: Built-in CMS powered by [Sveltia CMS](https://github.com/sveltia/sveltia-cms)
- **Clean Design**: Simple, accessible interface inspired by Code4Lib
- **Static Site**: Fast, secure, and easy to deploy
- **Git-Based**: All content stored in version control

## Getting Started

### Prerequisites

- [Hugo](https://gohugo.io/installation/) (Extended version recommended)
- Git

### Installation

1. Clone this repository:
   ```bash
   git clone <your-repo-url>
   cd job-board-test
   ```

2. Start the development server:
   ```bash
   hugo server -D
   ```

3. Open your browser to [http://localhost:1313](http://localhost:1313)

## Content Management System

This job board includes **Sveltia CMS**, a modern, user-friendly content management system. You can manage job postings through a web interface instead of editing markdown files directly.

### Quick CMS Setup

1. **For local development:**
   - Uncomment `local_backend: true` in `static/admin/config.yml`
   - Run: `npx @sveltia/cms-proxy-server`
   - Access the CMS at: `http://localhost:1313/admin/`

2. **For production (Netlify):**
   - See the complete setup guide: **[CMS_SETUP.md](CMS_SETUP.md)**

### CMS Features

- 📝 Visual editor for creating and editing job postings
- 🖼️ Media library for managing employer logos
- 👀 Live preview of job listings
- 📱 Mobile-friendly interface
- 🌙 Dark mode support
- 🔄 Git-based workflow (all changes committed to repository)

## Usage

### Creating a New Job Posting

**Option 1: Using the CMS (Recommended)**
1. Navigate to `/admin/` on your site
2. Click "Job Postings" → "New Job Posting"
3. Fill in the form fields
4. Click "Save" or "Publish"

**Option 2: Using Hugo CLI**

```bash
hugo new jobs/job-title.md
```

This creates a new job posting with the template structure. Edit the front matter:

```toml
+++
title = 'Job Title'
date = 2025-10-22T10:00:00-00:00
draft = false
employer = 'Company Name'
location = 'City, State/Country'
jobType = 'Full time'
tags = ['tag1', 'tag2', 'tag3']
+++

Job description goes here...
```

### Front Matter Fields

- `title`: Job title
- `date`: Publication date (used for sorting)
- `draft`: Set to `false` to publish
- `employer`: Company or organization name
- `location`: Job location
- `jobType`: Employment type (Full time, Part time, Contract, etc.)
- `tags`: Array of relevant skills, technologies, or categories

### Building for Production

```bash
hugo
```

The built site will be in the `public/` directory, ready to deploy to any static hosting service.

## Project Structure

```
job-board-test/
├── archetypes/          # Content templates
│   └── jobs.md         # Job posting template
├── content/            # Site content
│   └── jobs/          # Job postings
├── layouts/           # HTML templates
│   ├── _default/     # Base templates
│   ├── jobs/         # Job-specific templates
│   └── taxonomy/     # Tag and employer pages
├── static/           # Static assets
│   ├── admin/       # CMS interface
│   │   ├── config.yml  # CMS configuration
│   │   └── index.html  # CMS admin page
│   ├── css/         # Stylesheets
│   └── images/      # Media files
├── hugo.toml        # Site configuration
├── netlify.toml     # Netlify deployment config
├── CMS_SETUP.md     # Complete CMS setup guide
└── README.md        # This file
```

## Customization

### Styling

Edit `static/css/style.css` to customize the appearance.

### Site Configuration

Modify `hugo.toml` to change:
- Site title and description
- Base URL
- Other site-wide settings

### Templates

Templates are in the `layouts/` directory:
- `layouts/index.html` - Homepage
- `layouts/jobs/list.html` - All jobs page
- `layouts/jobs/single.html` - Individual job page
- `layouts/_default/baseof.html` - Base template

## Deployment

This is a static Hugo site that can be deployed to any static hosting service:

- [Netlify](https://www.netlify.com/)
- [Vercel](https://vercel.com/)
- [GitHub Pages](https://pages.github.com/)
- [Cloudflare Pages](https://pages.cloudflare.com/)
- Any static hosting service

Simply run `hugo` to build the site, and deploy the `public/` directory.

## License

This project is open source and available under the [MIT License](LICENSE).

## Acknowledgments

Design inspired by [Code4Lib Jobs](https://jobs.code4lib.org/).

