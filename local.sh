#!/usr/bin/env bash
set -euo pipefail

IMAGE="${IMAGE:-nightcore-patreon-wasm}"
CONTAINER="${CONTAINER:-nightcore-patreon-wasm-local}"
PORT="${PORT:-8000}"
ENV_FILE="${ENV_FILE:-.env.prod}"

cd "$(dirname "$0")"

if [[ ! -f "$ENV_FILE" ]]; then
  echo "Missing env file: $ENV_FILE" >&2
  echo "Create it with PATREON_CLIENT_ID=... and PATREON_CLIENT_SECRET=..." >&2
  exit 1
fi

docker build -t "$IMAGE" .

docker rm -f "$CONTAINER" >/dev/null 2>&1 || true

docker run --rm \
  --name "$CONTAINER" \
  -p "$PORT:8000" \
  --env-file "$ENV_FILE" \
  "$IMAGE"
