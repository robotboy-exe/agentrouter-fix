#!/usr/bin/env bash
DIR="$(cd "$(dirname "$0")" && pwd)"
if ! pgrep -f "$DIR/proxy.py" >/dev/null; then
  nohup python3 "$DIR/proxy.py" >/dev/null 2>&1 &
  sleep 1
fi
OPENCODE_CONFIG="$DIR/oc.json" exec opencode "$@"
