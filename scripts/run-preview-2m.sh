#!/usr/bin/env bash
set -euo pipefail

PORT="${1:-4321}"
HOST="0.0.0.0"
LOG_FILE="/tmp/madhavm-preview-${PORT}.log"
PID_FILE="/tmp/madhavm-preview-${PORT}.pid"

if [ -f "$PID_FILE" ] && kill -0 "$(cat "$PID_FILE")" 2>/dev/null; then
  echo "Preview already running on port ${PORT}."
  echo "URL: http://localhost:${PORT}/"
  exit 0
fi

nohup npm run dev -- --host "$HOST" --port "$PORT" >"$LOG_FILE" 2>&1 &
PID=$!
echo "$PID" > "$PID_FILE"

(
  sleep 120
  if kill -0 "$PID" 2>/dev/null; then
    kill "$PID" 2>/dev/null || true
  fi
  rm -f "$PID_FILE"
) >/dev/null 2>&1 &

echo "Preview started for 2 minutes."
echo "URL: http://localhost:${PORT}/"
echo "PID: $PID"
echo "Log: $LOG_FILE"
