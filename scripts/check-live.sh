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
  check_route "/" "Madhav Mathur" && \
    check_route "/blog/" "Writing" && \
    check_route "/blog/hello-world/" "Hello World"
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
