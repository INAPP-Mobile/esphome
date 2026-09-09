# ESPHome Railway template.
# Builds from the prebuilt upstream image. Railway reads this Dockerfile
# when source.repo is set; railway.json supplies the volume mounts +
# healthcheck path.
#
# Two non-default settings, both required for Railway:
#
# 1. USER root — the upstream image runs as `esphome` (uid 1000) by default.
#    esphome-device-builder writes temp files (NamedTemporaryFile mode="wb"
#    dir="/config") and JSON state files inside /config. Railway mounts
#    /config as a root-owned volume (uid 0); uid 1000 cannot write to a
#    root-owned path and the container restart-loops on PermissionError.
#    Switching to USER root matches Railway's RAILWAY_RUN_UID=0 convention.
#
# 2. ESPHOME_DATA_DIR=/tmp/esphome — by default esphome-device-builder
#    places its single-instance flock file at `<config_dir>/.esphome/
#    .device-builder.lock`, i.e. /config/.esphome/.device-builder.lock.
#    /config is a Railway volume that persists across container restarts,
#    so each redeploy leaves a stale lock on disk and the next start
#    spuriously reports "Another device-builder is already running" with
#    PID/start_ts from the previous (dead) container. Pointing the lock
#    at the ephemeral /tmp makes every fresh start get a clean slate.

FROM ghcr.io/esphome/esphome:2026.8.2
USER root
ENV ESPHOME_DATA_DIR=/tmp/esphome
LABEL org.opencontainers.image.source="https://github.com/mc9max/esphome"
LABEL org.opencontainers.image.description="ESPHome Railway template"
EXPOSE 6052
# Note: no Docker HEALTHCHECK — the upstream image ships no wget/curl,
# and Railway's platform healthcheck is already wired to /version
# via railway.json deploy.healthcheckPath. A redundant in-container
# HEALTHCHECK would just mark the container unhealthy with the same
# /version probe Railway runs anyway.
