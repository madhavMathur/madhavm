# madhavm.com

Personal website for [madhavm.com](https://madhavm.com), built with Astro.

## What This Repo Includes
- Landing page and blog pages in `src/pages/`
- Shared layout and styling system in `src/layouts/` and `src/styles/`
- Agent onboarding instructions in `AGENTS.md`
- Deployment wiring for Cloudflare Pages

## Quick Start
```bash
npm install
npm run dev
```

Then open `http://localhost:4321`.

## Daily Workflow
1. Edit pages/components in `src/`
2. Validate before commit:
```bash
npm run verify
```
3. Commit and push to `main`
4. Confirm production after deploy:
```bash
npm run check:live
```

Cloudflare Pages is connected to this repo and deploys automatically on push to `main`.

## Utility Commands
- `npm run dev`: local dev server
- `npm run build`: production build into `dist/`
- `npm run check`: Astro checks + build
- `npm run verify`: wrapper for check/build verification
- `npm run check:live`: production smoke check (`/`, `/blog`, sample post)
- `npm run new:post -- "Title"`: scaffold blog post markdown file
- `npm run deploy`: manual Cloudflare Pages deploy via wrangler

## Agent Onboarding
- Start with `/Users/madhav/Documents/madhavm/AGENTS.md`
- Extra operational notes: `/Users/madhav/Documents/madhavm/docs/REPO_GUIDE.md`

## Project Structure
- `src/pages/index.astro`: home page
- `src/pages/blog/index.astro`: blog index
- `src/pages/blog/*.md`: blog posts
- `src/layouts/BaseLayout.astro`: shared HTML shell + metadata
- `src/styles/global.css`: design tokens and global styles
- `public/`: static assets

## Deploy Notes
- Primary deploy path: Cloudflare Git integration on push to `main`
- No GitHub Actions deploy pipeline is required
- Secondary/manual path: `npm run deploy` (requires Cloudflare auth env vars)
