# Admin Directory

This directory contains the Sveltia CMS configuration files.

## Files

### `index.html`
The admin interface loader. Access the CMS by navigating to `/admin/` on your site.

### `config.yml`
CMS configuration file that defines:
- Backend (Git provider)
- Collections (content types)
- Fields (form inputs)
- Media settings
- Workflow options

## Accessing the CMS

### Local Development
Visit: http://localhost:1313/admin/

Make sure you have:
1. Enabled `local_backend: true` in `config.yml`
2. Started the proxy server: `npx @sveltia/cms-proxy-server`
3. Started Hugo: `hugo server -D`

### Production
Visit: https://your-site.netlify.app/admin/

Requires:
1. Netlify Identity enabled
2. Git Gateway activated
3. User invitation accepted

## Customizing

Edit `config.yml` to:
- Add new collections
- Modify field types
- Change validation rules
- Enable editorial workflow
- Configure media library

See [CMS_SETUP.md](../../CMS_SETUP.md) for detailed configuration options.

## Security

⚠️ **Important**: Never commit sensitive credentials to this directory. Use environment variables or Netlify's secure configuration for any secrets.

The `/admin/` route is protected by authentication in production (via Netlify Identity or your chosen auth provider).

## Documentation

- [Sveltia CMS](https://github.com/sveltia/sveltia-cms)
- [Configuration Reference](https://decapcms.org/docs/configuration-options/)
- [Widget Reference](https://decapcms.org/docs/widgets/)

