FROM debian:bookworm-slim AS build

ARG WASMTIME_VERSION=39.0.0
ARG WASM_TOOLS_VERSION=1.261.0

RUN apt-get update \
  && apt-get install -y --no-install-recommends ca-certificates curl xz-utils gzip tar \
  && rm -rf /var/lib/apt/lists/* \
  && arch="$(uname -m)" \
  && case "$arch" in \
    x86_64) target="x86_64-linux" ;; \
    aarch64|arm64) target="aarch64-linux" ;; \
    *) echo "Unsupported architecture: $arch" >&2; exit 1 ;; \
  esac \
  && curl -fsSL "https://github.com/bytecodealliance/wasmtime/releases/download/v${WASMTIME_VERSION}/wasmtime-v${WASMTIME_VERSION}-${target}.tar.xz" -o /tmp/wasmtime.tar.xz \
  && tar -xJf /tmp/wasmtime.tar.xz -C /tmp \
  && mv /tmp/wasmtime-v${WASMTIME_VERSION}-${target}/wasmtime /usr/local/bin/wasmtime \
  && curl -fsSL "https://github.com/bytecodealliance/wasm-tools/releases/download/v${WASM_TOOLS_VERSION}/wasm-tools-${WASM_TOOLS_VERSION}-${target}.tar.gz" -o /tmp/wasm-tools.tar.gz \
  && tar -xzf /tmp/wasm-tools.tar.gz -C /tmp \
  && mv /tmp/wasm-tools-${WASM_TOOLS_VERSION}-${target}/wasm-tools /usr/local/bin/wasm-tools \
  && rm -rf /tmp/wasmtime* /tmp/wasm-tools*

WORKDIR /src
COPY nightcore-api.wat ./nightcore-api.wat
COPY wit/nightcore.wit ./nightcore.wit
RUN curl -fsSL https://github.com/WebAssembly/wasi-http/archive/refs/tags/v0.2.8.tar.gz -o /tmp/wasi-http.tar.gz \
  && tar -xzf /tmp/wasi-http.tar.gz -C /tmp \
  && cp nightcore.wit /tmp/wasi-http-0.2.8/wit/nightcore.wit \
  && wasm-tools parse nightcore-api.wat -o nightcore-api.core.wasm \
  && wasm-tools component embed /tmp/wasi-http-0.2.8/wit nightcore-api.core.wasm \
      --world wasi:http/nightcore --emit-canonical-names -o nightcore-api.embed.wasm \
  && wasm-tools component new nightcore-api.embed.wasm -o nightcore-api.wasm \
  && wasmtime compile -o nightcore-api.cwasm nightcore-api.wasm

FROM debian:bookworm-slim
RUN apt-get update \
  && apt-get install -y --no-install-recommends ca-certificates \
  && rm -rf /var/lib/apt/lists/* \
  && useradd --system --no-create-home nightcore
COPY --from=build /usr/local/bin/wasmtime /usr/local/bin/wasmtime
WORKDIR /app
COPY --from=build /src/nightcore-api.cwasm ./nightcore-api.cwasm
USER nightcore
ENV TOKIO_WORKER_THREADS=2 HOME=/tmp
EXPOSE 8000
# Concurrency safety: this guest keeps per-request state in process globals /
# fixed scratch buffers ($r_*, $origin_*, $auth_*, 0x2000–0xC000). That is only
# correct when at most one handle() runs per instance at a time.
# WASIp2 already defaults to concurrent-reuse=1 (and cannot go higher); pin it
# explicitly so a future wasmtime default change cannot silently race.
# Serial reuse (>1) is OK with heap reset + immortal env cache, and is what
# makes the env cache pay off across requests.
ENTRYPOINT ["/usr/local/bin/wasmtime", "serve", \
  "-S", "cli,inherit-env", \
  "--allow-precompiled", \
  "--max-instance-concurrent-reuse-count", "1", \
  "--max-instance-reuse-count", "128", \
  "--addr", "0.0.0.0:8000", \
  "/app/nightcore-api.cwasm"]
