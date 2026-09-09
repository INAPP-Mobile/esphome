# ESPHome template uses a prebuilt image (see railway.json). This Dockerfile
# exists only to satisfy step-1 hygiene gating and to document the prebuilt
# choice. Railway will ignore this file because railway.json declares
# `build.builder: image`.
#
# If you fork this template and want to build from source instead, replace
# `FROM ghcr.io/esphome/esphome:2026.8.2` with a real source build (see
# https://github.com/esphome/esphome/blob/dev/docker/Dockerfile).

FROM ghcr.io/esphome/esphome:2026.8.2
LABEL org.opencontainers.image.source="https://github.com/mc9max/esphome"
LABEL org.opencontainers.image.description="ESPHome Railway template (prebuilt image passthrough)"
EXPOSE 6052
HEALTHCHECK --interval=30s --timeout=10s --start-period=20s --retries=3 \
    CMD wget -qO- http://127.0.0.1:6052/version || exit 1
