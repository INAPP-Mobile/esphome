# ESPHome Railway template.
# Builds from the prebuilt upstream image. Railway reads this Dockerfile
# when source.repo is set; railway.json supplies the volume mounts +
# healthcheck path.
#
# Why USER root: the upstream image's ENTRYPOINT (`/entrypoint.sh`) exec's
# `esphome-device-builder`, which writes temp files (NamedTemporaryFile
# mode="wb" dir="/config") and JSON state files inside /config. Railway
# mounts /config as a root-owned volume (uid 0); the upstream image's
# default user (esphome, uid 1000) cannot write to a root-owned path and
# the container restart-loops on PermissionError. Switching to USER root
# matches the official Railway convention (RAILWAY_RUN_UID=0 equiv).

FROM ghcr.io/esphome/esphome:2026.8.2
USER root
LABEL org.opencontainers.image.source="https://github.com/mc9max/esphome"
LABEL org.opencontainers.image.description="ESPHome Railway template"
EXPOSE 6052
HEALTHCHECK --interval=30s --timeout=10s --start-period=20s --retries=3 \
    CMD wget -qO- http://127.0.0.1:6052/version || exit 1
