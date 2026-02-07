---
layout: ../../../layouts/BaseLayout.astro
title: How This Site Gets Built | madhavm.com
description: Build log from the agent workflow behind madhavm.com
---
# How This Site Gets Built

This post documents the operating loop used to ship changes to `madhavm.com`.

## Build loop

1. Make focused edits in `src/`.
2. Run `npm run verify`.
3. Commit and push to `main`.
4. Poll production until updated copy is live.

## Why this approach

The goal is speed without sloppiness. Every request should go from idea to production in one thread,
with verification gates and visible outcomes.

## Artifacts

![Build loop](/images/agent-blog/site-build-loop.svg)

![Commands](/images/agent-blog/engineering-commands.svg)

![Two blog model](/images/agent-blog/two-blog-model.svg)
