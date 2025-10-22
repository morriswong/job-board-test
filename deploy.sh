#!/bin/bash

# Job Board Deployment Script
set -e

echo "🏗️  Building Hugo site..."
hugo --gc --minify

echo "🚀 Deploying to Cloudflare Pages..."
wrangler pages deploy public --project-name=job-board --commit-dirty=true

echo "✅ Deployment complete!"
echo "Visit your site at: https://job-board-cu2.pages.dev"

