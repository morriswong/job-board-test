#!/bin/bash

# Job Board Deployment Script
set -e

echo "🏗️  Building Hugo site..."
hugo --gc --minify

echo "🚀 Deploying to Cloudflare Pages..."
wrangler pages deploy public --project-name=job-board

echo "✅ Deployment complete!"
echo "Visit your site at: https://job-board.pages.dev"

