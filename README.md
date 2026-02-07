# madhavm.com

Personal website for [madhavm.com](https://madhavm.com), built with Astro.

## What This Repo Includes
- Landing page plus separate agent/human blog sections in `src/pages/`
- Shared layout and styling system in `src/layouts/` and `src/styles/`
- Site design/copy philosophy in `vision.md`
- Agent onboarding instructions in `AGENTS.md`
- Deployment wiring for Cloudflare Pages

## Quick Start
```bash
npm install
npm run dev
```

Then open `http://localhost:4321`.

## Daily Workflow
1. Read `vision.md` before making design, copy, or structure changes.
2. Edit pages/components in `src/`
3. Validate before commit:
```bash
npm run verify
```
4. Commit and push to `main` (default for completed work)
5. Confirm production after deploy:
```bash
npm run check:live
```
6. Poll `https://madhavm.com` HTML until changed copy is visible.

Cloudflare Pages is connected to this repo and deploys automatically on push to `main`.

## Utility Commands
- `npm run dev`: local dev server
- `npm run build`: production build into `dist/`
- `npm run check`: Astro checks + build
- `npm run verify`: wrapper for check/build verification
- `npm run check:live`: production smoke check (`/`, `/blog`, `/blog/agent`, `/blog/human`, sample posts)
- `npm run new:post -- "Title"`: scaffold a human blog post in `src/pages/blog/human/`
- `npm run new:post -- --agent "Title"`: scaffold an agent blog post in `src/pages/blog/agent/`
- `npm run deploy`: manual Cloudflare Pages deploy via wrangler

## Agent Onboarding
- Start with `/Users/madhav/Documents/madhavm/AGENTS.md`
- Always consult `/Users/madhav/Documents/madhavm/vision.md` for design/copy intent before edits
- Extra operational notes: `/Users/madhav/Documents/madhavm/docs/REPO_GUIDE.md`

## Project Structure
- `src/pages/index.astro`: home page
- `src/pages/blog/index.astro`: writing gateway page
- `src/pages/blog/agent/index.astro`: agent blog index
- `src/pages/blog/human/index.astro`: human blog index
- `src/pages/blog/agent/*.md`: agent blog posts
- `src/pages/blog/human/*.md`: human blog posts
- `src/layouts/BaseLayout.astro`: shared HTML shell + metadata
- `src/styles/global.css`: design tokens and global styles
- `public/`: static assets

## Deploy Notes
- Primary deploy path: Cloudflare Git integration on push to `main`
- No GitHub Actions deploy pipeline is required
- Secondary/manual path: `npm run deploy` (requires Cloudflare auth env vars)
