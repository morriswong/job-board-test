# Job Board

A Hugo-based job board inspired by [Code4Lib Jobs](https://jobs.code4lib.org/), designed for posting and browsing job opportunities in the tech and cultural heritage sectors.

## Features

- **Job Listings**: Browse recent job postings with detailed information
- **Tagging System**: Filter jobs by technology, skills, and categories
- **Employer Directory**: View all employers and their job postings
- **Clean Design**: Simple, accessible interface inspired by Code4Lib
- **Static Site**: Fast, secure, and easy to deploy

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

## Usage

### Creating a New Job Posting

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
│   └── css/         # Stylesheets
├── hugo.toml        # Site configuration
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

This site is configured for Cloudflare Pages deployment. See [DEPLOYMENT.md](DEPLOYMENT.md) for detailed instructions.

### Quick Deploy Options:

1. **Cloudflare Pages (Recommended)**
   - Connect your GitHub repo directly in Cloudflare Dashboard
   - Or use GitHub Actions workflow (see `.github/workflows/`)
   - Automatic deployments on every push

2. **Other Options**
   - [Netlify](https://www.netlify.com/)
   - [Vercel](https://vercel.com/)
   - [GitHub Pages](https://pages.github.com/)
   - Any static hosting service

## License

This project is open source and available under the [MIT License](LICENSE).

## Acknowledgments

Design inspired by [Code4Lib Jobs](https://jobs.code4lib.org/).

