# Nightcore Patreon API - Wasmtime/WAT

The Nightcore Patreon service (formerly Deno) as a hand-written WAT `wasi:http`
component, run with `wasmtime serve` in Docker.

## Build and run

```sh
docker build -t nightcore-patreon-wasm .
docker run --rm -p 8000:8000 \
  -e PATREON_CLIENT_ID=... \
  -e PATREON_CLIENT_SECRET=... \
  nightcore-patreon-wasm
```

The container runs `wasmtime serve -S cli,inherit-env` so the guest can read
environment variables.

Optional local testing override:

```sh
PATREON_MOCK_ACTIVE=true
```

When set to a non-empty value, `GET /patron` returns `204` without calling
Patreon. Do not set this in production.

## Routes

| Route | Result |
| --- | --- |
| `GET /login?code=...&redirectUri=...` | exchanges an OAuth code for a Patreon access token and returns Patreon JSON |
| `GET /identity` | proxies the Patreon identity endpoint and returns Patreon JSON |
| `GET /patron` | returns `204` for an active patron and `402` otherwise |
| `OPTIONS *` | CORS preflight (`204`) |

CORS headers are only sent for these allowed origins:

- `https://nightcore.app`
- `http://localhost:3000`
- `http://localhost:1337`

## Layout

- `nightcore-api.wat` - the service. Patreon calls go through
  `wasi:http/outgoing-handler`; request bodies and small JSON checks are done by
  hand.
- `wit/nightcore.wit` - world = `wasi:http/proxy` + `wasi:cli/environment`.
- `tools/gen-strings.py` - generates the string table (data segments + `$S_*`/`$L_*`
  globals) for the WAT file.
