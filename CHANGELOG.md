# Changelog

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
