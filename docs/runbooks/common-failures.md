# Common Failures and Fastest Fixes

This runbook captures issues seen during automated maintenance runs and the fastest known fix paths.

## Live smoke check fails with "Could not resolve host"

Symptoms:
- `npm run check:live` retries and returns HTTP 000 with `curl: (6) Could not resolve host: madhavm.com`.

Likely root causes:
- Network access or DNS resolution is blocked in the execution environment.

Fastest fix steps:
1. Re-run `npm run check:live` from a networked local shell (not a restricted sandbox).
2. If it fails locally, verify DNS for `madhavm.com` and Cloudflare Pages status.
3. Once resolved, re-run `npm run check:live` and record results in the changelog.

## `astro: command not found` during `npm run verify`

Symptoms:
- `npm run verify` fails with `astro: command not found`.

Likely root causes:
- Dependencies are not installed in the repo.

Fastest fix steps:
1. Run `npm install` in the repo root.
2. Re-run `npm run verify`.

## npm install warns about unsupported engine

Symptoms:
- `npm install` logs `EBADENGINE` warnings for packages requiring Node >= 20.18.1 or 20.19.0.

Likely root causes:
- Node version is lower than package engine requirement.

Fastest fix steps:
1. Use `nvm install 20.19.0` (or newer) and `nvm use 20.19.0`.
2. Re-run `npm install` and checks.

## `git push` fails with \"Could not resolve host\"

Symptoms:
- `git push` returns `Could not resolve host: github.com`.

Likely root causes:
- DNS resolution or network access is blocked in the execution environment.

Fastest fix steps:
1. Retry `git push` from a networked local shell.
2. If still failing, confirm DNS settings and network access to GitHub.
