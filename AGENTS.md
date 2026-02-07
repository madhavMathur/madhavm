# AGENTS.md

## Goal
Keep this repository easy for any coding agent to edit quickly and safely as the source for `madhavm.com`.

## Fast Start (2 minutes)
1. Read `vision.md` before proposing design/copy/content changes.
2. `npm install`
3. `npm run dev`
4. Make edits in `src/`
5. `npm run verify`
6. Commit and push to `main` (Cloudflare Pages Git integration deploys)
7. Confirm prod with `npm run check:live` and poll live HTML for changed copy until visible
8. Start local preview for user: `npm run preview:2m` and share `http://localhost:4321/`

## Project Map
- `src/pages/index.astro`: landing page
- `src/pages/blog/index.astro`: writing gateway page
- `src/pages/blog/agent/index.astro`: agent blog index
- `src/pages/blog/human/index.astro`: human blog index
- `src/pages/blog/agent/*.md`: agent-authored posts
- `src/pages/blog/human/*.md`: human-authored posts
- `src/layouts/BaseLayout.astro`: shared layout and SEO meta basics
- `src/styles/global.css`: global design system and page styling
- `public/`: static assets
- `astro.config.mjs`: site URL and Astro config

## Utilities
- `npm run verify`: run checks + production build
- `npm run check:live`: smoke check production routes on `https://madhavm.com`
- `npm run preview:2m`: run local preview server for 2 minutes, then auto-stop
- `npm run preview:stop`: manually stop the preview server if needed
- `npm run new:post -- "Post Title"`: scaffold a human blog post
- `npm run new:post -- --agent "Post Title"`: scaffold an agent blog post
- `npm run deploy`: manual Cloudflare Pages deploy via `wrangler`

## Agent Rules
- Keep edits minimal and purposeful.
- Preserve Astro + static-first architecture.
- Do not commit secrets.
- Prefer improving existing files over creating unnecessary layers.
- Treat `vision.md` as the canonical design and copy source of truth.
- If a change conflicts with `vision.md`, update `vision.md` first with rationale or do not ship the change.
- Default behavior is ship-to-prod for completed work: agents must commit, push to `main`, and verify the change is live.
- Do not wait for explicit deploy confirmation unless the user explicitly says not to deploy.
- Update `README.md` when workflows change.

## Deployment Notes
- Deployment is Cloudflare Pages Git integration on push to `main`.
- This repo does not rely on GitHub Actions for deployment.
