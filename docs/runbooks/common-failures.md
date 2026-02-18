# Common Failures and Fastest Fixes

This runbook captures issues seen during automated maintenance runs and the fastest known fix paths.

## Live smoke check fails with "Could not resolve host"

Symptoms:
- `npm run check:live` retries and returns HTTP 000 with `curl: (6) Could not resolve host: madhavm.com`.
- Current script behavior: retries 12 times with ~10s delays, so failures take ~2 minutes before exit.

Likely root causes:
- Network access or DNS resolution is blocked in the execution environment.
- Known recurring constraint: Codex automation sandboxes can block DNS for external domains.

Fastest fix steps:
1. Re-run `npm run check:live` from a networked local shell (not a restricted sandbox).
2. If it fails locally, verify DNS for `madhavm.com` and Cloudflare Pages status.
3. Once resolved, re-run `npm run check:live` and record results in the changelog.
4. If the failure is due to a known restricted environment, log the blocker in the changelog and skip repeat retries until a networked shell is available.
5. To avoid long retry loops in restricted shells, do a quick DNS probe (for example `getent hosts madhavm.com`) before running the full live check.
6. If the sandbox consistently blocks DNS, expect repeat failures; log once per run and proceed without further retries.

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
3. If the warnings persist but `npm run verify` succeeds, log the warning and proceed.

## npm audit reports moderate vulnerabilities

Symptoms:
- `npm install` or `npm audit` reports moderate severity vulnerabilities.

Likely root causes:
- Transitive dependency advisories that do not always have a low-risk patch.

Fastest fix steps:
1. Run `npm audit` to review details and impacted packages.
2. If a non-breaking update is available, run `npm audit fix` and re-run `npm run verify`.
3. If only breaking updates are offered, log the advisory in the changelog and schedule a dependency upgrade later.
4. If the site builds cleanly, proceed but track the open vulnerability count.

Current baseline:
- As of 2026-02-18, `npm install` reports 6 moderate vulnerabilities in this repo. Treat this as the baseline unless the count changes.

## `git push` fails with \"Could not resolve host\"

Symptoms:
- `git push` returns `Could not resolve host: github.com`.

Likely root causes:
- DNS resolution or network access is blocked in the execution environment.

Fastest fix steps:
1. Retry `git push` from a networked local shell.
2. If still failing, confirm DNS settings and network access to GitHub.
