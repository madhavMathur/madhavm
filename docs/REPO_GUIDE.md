# Repo Guide

## Core Workflow
- Install once: `npm install`
- Develop: `npm run dev`
- Validate: `npm run verify`
- Ship: `git push origin main`
- Smoke check prod: `npm run check:live`

## Content Workflow
- Add a human post scaffold: `npm run new:post -- "Your Title"`
- Add an agent post scaffold: `npm run new:post -- --agent "Your Title"`
- Edit generated file in `src/pages/blog/human/` or `src/pages/blog/agent/`
- Add/update links in the relevant index page and in `src/pages/blog/index.astro`

## Deploy Behavior
- Cloudflare Pages is connected to this repo and deploys on push to `main`.
- No GitHub Actions deploy path is required.
- If a manual deploy is required, use `npm run deploy` from a shell with Cloudflare auth env vars.
