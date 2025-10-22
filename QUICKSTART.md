# Quick Start Guide - Deploy to Cloudflare Pages

## ⚡ Fastest Method (5 minutes)

### Step 1: Push to GitHub

```bash
cd /Users/morwon/Documents/job-board-test

# Initialize git (if not done)
git init
git add .
git commit -m "Initial commit: Job Board site"

# Create repo on GitHub, then:
git remote add origin https://github.com/YOUR-USERNAME/job-board-test.git
git push -u origin main
```

### Step 2: Deploy to Cloudflare Pages

1. **Go to Cloudflare**
   - Visit https://dash.cloudflare.com/
   - Sign up/login (free plan works!)

2. **Connect Your Repo**
   - Click **Workers & Pages** in the left sidebar
   - Click **Create application**
   - Click **Pages** → **Connect to Git**
   - Click **Connect GitHub**
   - Select your `job-board-test` repository
   - Click **Begin setup**

3. **Configure Build**
   - **Project name**: `job-board` (or your choice)
   - **Production branch**: `main`
   - **Framework preset**: Select **Hugo**
   - **Build command**: `hugo --gc --minify`
   - **Build output directory**: `public`
   - Click **Save and Deploy**

4. **Wait for Build** (usually 1-2 minutes)
   - Watch the build logs
   - When complete, you'll see "Success!"

5. **Your Site is Live! 🎉**
   - URL: `https://job-board.pages.dev`
   - Click **Continue to project** to see your dashboard

### Step 3: Add More Jobs

```bash
# Create a new sponsored job
hugo new jobs/sponsored/senior-developer.md

# Edit the file, then deploy
git add .
git commit -m "Add senior developer position"
git push

# Cloudflare automatically rebuilds and deploys!
```

## 📋 What You Get

- ✅ Free hosting and SSL certificate
- ✅ Global CDN (super fast worldwide)
- ✅ Automatic deployments on every push
- ✅ Unlimited bandwidth
- ✅ Deploy previews for branches
- ✅ Built-in analytics

## 🎨 Custom Domain (Optional)

If you have a domain (e.g., `jobs.yourdomain.com`):

1. In Cloudflare Pages dashboard, click your project
2. Go to **Custom domains** tab
3. Click **Set up a custom domain**
4. Enter your domain: `jobs.yourdomain.com`
5. Add the CNAME record shown to your DNS
6. Wait 5 minutes - done!

## 🔧 Making Changes

```bash
# Edit any file locally
nano content/jobs/sponsored/your-job.md

# Test locally
hugo server -D

# Deploy
git add .
git commit -m "Update job listing"
git push

# Cloudflare auto-deploys in 1-2 minutes
```

## 📊 View Analytics

1. Go to your Cloudflare Pages project
2. Click **Analytics** tab
3. See visitors, bandwidth, and performance

## 🆘 Need Help?

- Check `DEPLOYMENT.md` for detailed instructions
- Cloudflare Docs: https://developers.cloudflare.com/pages/
- Hugo Docs: https://gohugo.io/

## 🚀 Next Steps

1. **Add more sponsored jobs** in `content/jobs/sponsored/`
2. **Customize colors** in `static/css/style.css`
3. **Update site info** in `hugo.toml`
4. **Set up custom domain** (optional)
5. **Share your job board!** 🎉

