# Sveltia CMS Architecture

This document explains how Sveltia CMS integrates with your Hugo job board.

## System Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                     YOUR JOB BOARD                          │
│                                                             │
│  ┌──────────────┐           ┌──────────────┐              │
│  │   Frontend   │           │     CMS      │              │
│  │  (Hugo Site) │           │   (Admin)    │              │
│  │              │           │              │              │
│  │  - Job List  │           │  - Editor    │              │
│  │  - Job Page  │           │  - Media Lib │              │
│  │  - Tags      │           │  - Preview   │              │
│  │  - Employers │           │              │              │
│  └──────────────┘           └──────────────┘              │
│         │                          │                        │
│         └──────────┬───────────────┘                        │
│                    │                                        │
│                    ▼                                        │
│         ┌────────────────────┐                             │
│         │   Content Files    │                             │
│         │  (Markdown + TOML) │                             │
│         │                    │                             │
│         │  content/jobs/*.md │                             │
│         └────────────────────┘                             │
│                    │                                        │
└────────────────────┼────────────────────────────────────────┘
                     │
                     ▼
            ┌────────────────┐
            │  Git Repository │
            │   (GitHub)      │
            │                 │
            │  - Version Ctrl │
            │  - Backup       │
            │  - Collaboration│
            └────────────────┘
```

## Data Flow

### Creating a Job Posting (CMS)

```
User fills form → CMS validates → Creates .md file → Commits to Git
   in /admin/                                              ↓
                                                    Triggers build
                                                           ↓
                                                    Hugo generates
                                                    static HTML
                                                           ↓
                                                    Site updates
                                                    (on deployment)
```

### Viewing a Job (Frontend)

```
User visits site → Hugo serves → Static HTML → Browser renders
       ↓              static      with job
    /jobs/           files         data
```

## Components

### 1. Hugo (Static Site Generator)

**Location**: Entire project  
**Purpose**: Transforms markdown files into HTML pages

**Key Files**:
- `hugo.toml` - Site configuration
- `layouts/` - HTML templates
- `content/jobs/` - Job postings (markdown)
- `static/` - Static assets (CSS, images)

**Process**:
```
content/jobs/*.md → Hugo → public/*.html
```

### 2. Sveltia CMS (Content Management)

**Location**: `/admin/` route  
**Purpose**: Web interface for editing content

**Key Files**:
- `static/admin/index.html` - CMS loader
- `static/admin/config.yml` - CMS configuration

**Features**:
- Visual editor
- Form validation
- Media upload
- Live preview
- Git integration

### 3. Content Files (Data Layer)

**Location**: `content/jobs/`  
**Format**: Markdown with TOML frontmatter

**Structure**:
```markdown
+++
title = 'Job Title'
date = 2025-10-22T10:00:00Z
employer = 'Company Name'
tags = ['tag1', 'tag2']
+++

## Job Description
Content here...
```

### 4. Git (Version Control)

**Provider**: GitHub (configurable)  
**Purpose**: 
- Store all content
- Version history
- Collaboration
- Trigger deployments

## Authentication Flow

### Local Development

```
User → http://localhost:1313/admin/
         ↓
    CMS Proxy Server (local)
         ↓
    Direct file access
    (no auth needed)
```

### Production (Netlify)

```
User → https://site.com/admin/
         ↓
    Netlify Identity
         ↓
    OAuth (GitHub/etc)
         ↓
    Authenticated session
         ↓
    Git Gateway
         ↓
    GitHub API (commits)
```

## Deployment Pipeline

### Netlify (Recommended)

```
┌─────────────┐
│   GitHub    │
│  Repository │
└──────┬──────┘
       │ (push/merge)
       ▼
┌─────────────┐
│   Netlify   │
│  Build Bot  │
│             │
│ 1. Clone    │
│ 2. Run Hugo │
│ 3. Deploy   │
└──────┬──────┘
       │
       ▼
┌─────────────┐
│   Netlify   │
│     CDN     │
│             │
│ Serves HTML │
└─────────────┘
```

**Build Command**: `hugo --gc --minify`  
**Publish Directory**: `public/`  
**Build Time**: ~10-30 seconds

### Alternative Hosts

- **Vercel**: Similar workflow
- **Cloudflare Pages**: Similar workflow
- **GitHub Pages**: Requires Actions workflow
- **Self-hosted**: Manual Hugo build + server

## File Organization

```
job-board-test/
│
├── content/                  # Content layer
│   └── jobs/                # Job postings
│       └── *.md            # Individual job files
│
├── layouts/                 # Presentation layer
│   ├── index.html          # Homepage template
│   ├── jobs/               # Job templates
│   │   ├── list.html       # Jobs list page
│   │   └── single.html     # Individual job page
│   └── _default/           # Default templates
│
├── static/                  # Static assets
│   ├── admin/              # CMS (not processed by Hugo)
│   │   ├── index.html      # CMS interface
│   │   └── config.yml      # CMS config
│   ├── css/                # Stylesheets
│   └── images/             # Images & uploads
│
├── public/                  # Build output (generated)
│   └── [Hugo generates this]
│
└── hugo.toml               # Site configuration
```

## Configuration Files

### `hugo.toml`
Hugo site configuration:
- Base URL
- Site title
- Taxonomies (tags, employers)
- Build settings

### `static/admin/config.yml`
CMS configuration:
- Git backend settings
- Content collections
- Field definitions
- Validation rules
- Media settings

### `netlify.toml`
Deployment configuration:
- Build commands
- Environment variables
- Redirects
- Headers

### `package.json`
Development scripts:
- Hugo server
- CMS proxy
- Build commands

## Content Model

### Job Posting Schema

```yaml
Collection: jobs
Format: Markdown with TOML frontmatter
File Location: content/jobs/{slug}.md

Fields:
├── title (string, required)
├── date (datetime, required)
├── draft (boolean)
├── employer (string, required)
├── employerLogo (image)
├── employerDescription (text)
├── location (string, required)
├── workType (select: office/remote/hybrid)
├── region (select: UK regions)
├── jobType (select: full/part/contract/etc)
├── salary (string)
├── salaryMin (number)
├── salaryMax (number)
├── jobCategory (select)
├── industry (string)
├── department (string)
├── languageRequirements (list)
├── tags (list)
├── applyUrl (string)
└── body (markdown, required)
```

## Security Considerations

### Production
✅ Authentication required (Netlify Identity)  
✅ HTTPS enforced  
✅ OAuth with GitHub  
✅ Git-based permissions  
✅ Audit trail (Git history)

### Local Development
⚠️ No authentication (local only)  
⚠️ Direct file access  
✅ No database exposure risk  
✅ Changes tracked in Git

## Performance

### Build Performance
- **Cold build**: ~10-30 seconds
- **Incremental**: ~5-10 seconds
- **Job postings**: Scales to thousands

### Runtime Performance
- **Page load**: < 1 second (static HTML)
- **Time to Interactive**: < 2 seconds
- **CMS load**: ~2-3 seconds (first load)

### Optimization
- Hugo minifies HTML/CSS/JS
- CDN caching (Netlify/Cloudflare)
- No server-side processing
- No database queries

## Scalability

### Content Scale
- ✅ Hundreds of jobs: Excellent
- ✅ Thousands of jobs: Good
- ⚠️ Tens of thousands: Consider pagination

### User Scale
- ✅ Readers: Unlimited (static files)
- ✅ CMS users: 5-50 recommended
- ⚠️ Concurrent edits: Git merge conflicts possible

## Comparison with Alternatives

### vs. WordPress
| Feature | Sveltia CMS + Hugo | WordPress |
|---------|-------------------|-----------|
| Speed | ⚡⚡⚡⚡⚡ | ⚡⚡ |
| Security | ⚡⚡⚡⚡⚡ | ⚡⚡⚡ |
| Maintenance | ⚡⚡⚡⚡⚡ | ⚡⚡ |
| Hosting Cost | ⚡⚡⚡⚡⚡ (Free) | ⚡⚡⚡ |
| Plugin Ecosystem | ⚡⚡ | ⚡⚡⚡⚡⚡ |

### vs. Traditional CMS (Drupal, Joomla)
| Feature | Sveltia CMS + Hugo | Traditional CMS |
|---------|-------------------|----------------|
| Speed | ⚡⚡⚡⚡⚡ | ⚡⚡ |
| Simplicity | ⚡⚡⚡⚡ | ⚡⚡ |
| Version Control | ⚡⚡⚡⚡⚡ | ⚡⚡ |
| Complexity | ⚡⚡⚡⚡⚡ (Simple) | ⚡⚡ |

### vs. Headless CMS (Contentful, Strapi)
| Feature | Sveltia CMS + Hugo | Headless CMS |
|---------|-------------------|--------------|
| Cost | ⚡⚡⚡⚡⚡ (Free) | ⚡⚡ |
| Git Integration | ⚡⚡⚡⚡⚡ | ⚡⚡⚡ |
| API Flexibility | ⚡⚡ | ⚡⚡⚡⚡⚡ |
| Setup Time | ⚡⚡⚡⚡ | ⚡⚡⚡ |

## Benefits of This Architecture

### For Content Editors
✅ User-friendly interface  
✅ No technical knowledge required  
✅ Live preview before publishing  
✅ Work from any device  
✅ No "save" anxiety (Git backup)

### For Developers
✅ Full control over frontend  
✅ Version control for content  
✅ No database to maintain  
✅ Easy to extend (Hugo templates)  
✅ Modern development workflow

### For Operations
✅ Free hosting (Netlify/Cloudflare)  
✅ Automatic SSL certificates  
✅ Built-in CDN  
✅ No server maintenance  
✅ Scales automatically

### For Security
✅ No server-side code execution  
✅ No SQL injection risk  
✅ No plugin vulnerabilities  
✅ Git-based audit trail  
✅ OAuth authentication

## Limitations

### Current Limitations
- ⚠️ No real-time collaboration (Git merge conflicts)
- ⚠️ Requires Git knowledge for troubleshooting
- ⚠️ Limited dynamic functionality (forms need external service)
- ⚠️ Build time increases with content size

### Not Suitable For
- ❌ Real-time applications
- ❌ User-generated content (comments, reviews)
- ❌ Complex user authentication (job seekers)
- ❌ E-commerce transactions
- ❌ Applications requiring database queries

### Solutions
For features beyond static content:
- Use external services (forms: Formspree, comments: Disqus)
- Add client-side JavaScript for interactivity
- Integrate with APIs for dynamic data

## Future Enhancements

### Potential Additions
1. **Application Form Integration**
   - Use Formspree or Netlify Forms
   - Send applications to employers via email

2. **Search Functionality**
   - Client-side search (Fuse.js)
   - External search (Algolia)

3. **Job Expiration**
   - Automated draft status after X days
   - Archive old postings

4. **Email Notifications**
   - New job alerts
   - Application confirmations
   - RSS feed for subscribers

5. **Analytics**
   - Google Analytics
   - Plausible (privacy-focused)
   - Track job views and applications

## Resources

- [Hugo Documentation](https://gohugo.io/documentation/)
- [Sveltia CMS GitHub](https://github.com/sveltia/sveltia-cms)
- [Netlify Docs](https://docs.netlify.com/)
- [JAMstack Architecture](https://jamstack.org/)
- [Static Site Generators](https://www.staticgen.com/)

---

**Questions?** See [CMS_SETUP.md](CMS_SETUP.md) or [QUICKSTART_CMS.md](QUICKSTART_CMS.md)

