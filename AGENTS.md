# AGENTS.md

## Goal
Keep this repository easy for any coding agent to edit quickly and safely as the source for `madhavm.com`.

## Fast Start (2 minutes)
1. `npm install`
2. `npm run dev`
3. Make edits in `src/`
4. `npm run verify`
5. Commit and push to `main` (Cloudflare Pages Git integration deploys)
6. Confirm prod: `npm run check:live`

## Project Map
- `src/pages/index.astro`: landing page
- `src/pages/blog/index.astro`: blog index
- `src/pages/blog/*.md`: blog post pages
- `src/layouts/BaseLayout.astro`: shared layout and SEO meta basics
- `src/styles/global.css`: global design system and page styling
- `public/`: static assets
- `astro.config.mjs`: site URL and Astro config

## Utilities
- `npm run verify`: run checks + production build
- `npm run check:live`: smoke check production routes on `https://madhavm.com`
- `npm run new:post -- "Post Title"`: scaffold a new blog post
- `npm run deploy`: manual Cloudflare Pages deploy via `wrangler`

## Agent Rules
- Keep edits minimal and purposeful.
- Preserve Astro + static-first architecture.
- Do not commit secrets.
- Prefer improving existing files over creating unnecessary layers.
- Update `README.md` when workflows change.

## Deployment Notes
- Deployment is Cloudflare Pages Git integration on push to `main`.
- This repo does not rely on GitHub Actions for deployment.
