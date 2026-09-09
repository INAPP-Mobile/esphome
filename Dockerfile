# ESPHome Railway template.
# Builds from the prebuilt upstream image and adds ESPHome-specific labels.
# Railway reads this Dockerfile when source.repo is set; railway.json
# supplies the volume mounts + healthcheck path. Build verified locally
# with podman build (succeeds in ~5s on the FROM-only path).

FROM ghcr.io/esphome/esphome:2026.8.2
LABEL org.opencontainers.image.source="https://github.com/mc9max/esphome"
LABEL org.opencontainers.image.description="ESPHome Railway template"
EXPOSE 6052
HEALTHCHECK --interval=30s --timeout=10s --start-period=20s --retries=3 \
    CMD wget -qO- http://127.0.0.1:6052/version || exit 1
