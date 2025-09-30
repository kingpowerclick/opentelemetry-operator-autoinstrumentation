FROM ghcr.io/open-telemetry/opentelemetry-operator/autoinstrumentation-nodejs:0.64.1 AS source

FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

COPY --from=source /autoinstrumentation /autoinstrumentation
