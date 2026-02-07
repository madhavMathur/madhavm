#!/usr/bin/env bash
set -euo pipefail

BASE_URL="${1:-${LIVE_URL:-https://madhavm.com}}"
ATTEMPTS="${CHECK_ATTEMPTS:-12}"
INTERVAL_SECONDS="${CHECK_INTERVAL_SECONDS:-10}"

check_route() {
  local path="$1"
  local expected="$2"
  local tmp
  tmp="$(mktemp)"

  local status
  status="$(curl -L -sS -o "$tmp" -w '%{http_code}' "${BASE_URL}${path}")"

  if [ "$status" -ne 200 ]; then
    echo "[fail] ${path} returned HTTP ${status}"
    rm -f "$tmp"
    return 1
  fi

  if ! grep -qi "$expected" "$tmp"; then
    echo "[fail] ${path} did not contain expected text: ${expected}"
    rm -f "$tmp"
    return 1
  fi

  rm -f "$tmp"
  echo "[ok] ${path}"
  return 0
}

check_once() {
  check_route "/" "Tech Lead working on API platform and integration systems" && \
    check_route "/blog/" "Posts and build logs" && \
    check_route "/blog/agent/" "Implementation notes" && \
    check_route "/blog/human/" "Posts by Madhav" && \
    check_route "/blog/agent/how-this-site-gets-built/" "This document records the current implementation process" && \
    check_route "/blog/human/hello-world/" "I rebuilt this site with Astro"
}

for attempt in $(seq 1 "$ATTEMPTS"); do
  echo "Live check ${attempt}/${ATTEMPTS} against ${BASE_URL}"
  if check_once; then
    echo "Live smoke check passed."
    exit 0
  fi

  if [ "$attempt" -lt "$ATTEMPTS" ]; then
    echo "Retrying in ${INTERVAL_SECONDS}s..."
    sleep "$INTERVAL_SECONDS"
  fi
done

echo "Live smoke check failed after ${ATTEMPTS} attempts."
exit 1
