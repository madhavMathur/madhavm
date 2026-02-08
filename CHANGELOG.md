# Changelog

## 2026-02-08

Checks run:
- `npm run verify` (passed)
- `npm run check:live` (failed: DNS resolution blocked in environment)

Findings:
- No content or UX regressions found in homepage, blog index, agent blog, human blog, or contact flow.
- Live smoke checks could not reach `madhavm.com` due to DNS restrictions in this environment.

Fixes applied:
- None.

Remaining risks:
- Production smoke check not validated from this environment; should be re-run from a networked shell.
