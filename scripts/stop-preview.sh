#!/usr/bin/env bash
set -euo pipefail

PORT="${1:-4321}"
PID_FILE="/tmp/madhavm-preview-${PORT}.pid"

if [ ! -f "$PID_FILE" ]; then
  echo "No preview pid file found for port ${PORT}."
  exit 0
fi

PID="$(cat "$PID_FILE")"
if kill -0 "$PID" 2>/dev/null; then
  kill "$PID" 2>/dev/null || true
  echo "Stopped preview process $PID on port ${PORT}."
else
  echo "Process $PID not running."
fi

rm -f "$PID_FILE"
