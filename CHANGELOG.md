# Changelog

## 2026-02-14

Checks run:
- `npm install` (warned about unsupported engine + moderate vulnerabilities)
- `npm run verify` (passed)
- `npm run check:live` (failed: DNS resolution blocked in environment)

Findings:
- No content or UX regressions found in homepage, blog index, agent blog, human blog, or contact flow.
- Live smoke checks could not reach `madhavm.com` due to DNS restrictions in this environment.
- `npm install` reported `EBADENGINE` warnings with Node 20.11.1 and 5 moderate severity vulnerabilities.

Fixes applied:
- Updated runbook to note recurring DNS blocks in Codex automation sandboxes.

Remaining risks:
- Production smoke check not validated from this environment; should be re-run from a networked shell.

## 2026-02-13

Checks run:
- `npm run verify` (passed after `npm install`)
- `npm run check:live` (failed: DNS resolution blocked in environment)
- Post-fix re-run: `npm run verify` (passed) and `npm run check:live` (failed: DNS resolution blocked in environment)

Findings:
- No content or UX regressions found in homepage, blog index, agent blog, human blog, or contact flow.
- Live smoke checks could not reach `madhavm.com` due to DNS restrictions in this environment.
- `npm install` reported `EBADENGINE` warnings with Node 20.11.1, but checks still passed.

Fixes applied:
- No repo fixes required.

Remaining risks:
- Production smoke check not validated from this environment; should be re-run from a networked shell.

## 2026-02-12

Checks run:
- `npm run verify` (passed after `npm install`)
- `npm run check:live` (failed: DNS resolution blocked in environment)

Findings:
- No content or UX regressions found in homepage, blog index, agent blog, human blog, or contact flow.
- Live smoke checks could not reach `madhavm.com` due to DNS restrictions in this environment.
- `npm install` reported `EBADENGINE` warnings with Node 20.11.1, but checks still passed.

Fixes applied:
- No repo fixes required.

Remaining risks:
- Production smoke check not validated from this environment; should be re-run from a networked shell.
- Changes not pushed to `main` due to DNS resolution failure for GitHub.

## 2026-02-11

Checks run:
- `npm run verify` (passed)
- `npm run check:live` (failed: DNS resolution blocked in environment)

Findings:
- No content or UX regressions found in homepage, blog index, agent blog, human blog, or contact flow.
- Live smoke checks could not reach `madhavm.com` due to DNS restrictions in this environment.

Fixes applied:
- Added a runbook reminder that repeated DNS blocks in sandboxed shells are expected and should be logged once per run.

Remaining risks:
- Production smoke check not validated from this environment; should be re-run from a networked shell.

## 2026-02-10

Checks run:
- `npm run verify` (passed; required `npm install` in worktree)
- `npm run check:live` (failed: DNS resolution blocked in environment)
- Post-fix re-run: `npm run verify` (passed) and `npm run check:live` (failed: DNS resolution blocked in environment)

Findings:
- No content or UX regressions found in homepage, blog index, agent blog, human blog, or contact flow.
- Live smoke checks could not reach `madhavm.com` due to DNS restrictions in this environment.

Fixes applied:
- No repo fixes required.

Remaining risks:
- Production smoke check not validated from this environment; should be re-run from a networked shell.

## 2026-02-09

Checks run:
- `npm run verify` (passed)
- `npm run check:live` (failed: DNS resolution blocked in environment)

Findings:
- No content or UX regressions found in homepage, blog index, agent blog, human blog, or contact flow.
- Live smoke checks could not reach `madhavm.com` due to DNS restrictions in this environment.

Fixes applied:
- Added a runbook note to document and defer repeat live-check retries when the sandbox lacks DNS access.

Remaining risks:
- Production smoke check not validated from this environment; should be re-run from a networked shell.

## 2026-02-08

Checks run:
- `npm run verify` (passed)
- `npm run check:live` (failed: DNS resolution blocked in environment)

Findings:
- No content or UX regressions found in homepage, blog index, agent blog, human blog, or contact flow.
- Live smoke checks could not reach `madhavm.com` due to DNS restrictions in this environment.

Fixes applied:
- Added maintenance runbook entries for live-check DNS failures, missing `astro`, Node engine warnings, and `git push` DNS failures.

Remaining risks:
- Production smoke check not validated from this environment; should be re-run from a networked shell.
- Changes not pushed to `main` due to DNS resolution failure for GitHub.
