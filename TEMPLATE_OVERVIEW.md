# Deploy and Host Esphome on Railway

ESPHome is an open-source platform for configuring ESP32, ESP8266, BK72xx, and RP2040 microcontrollers using declarative YAML files. Its web dashboard provides a visual YAML editor, firmware compiler, OTA update delivery, live device logs, and serial monitoring — all accessible from any browser.

## About Hosting Esphome

The template deploys a single ESPHome service from the official `ghcr.io/esphome/esphome:2026.8.2` image, exposing the dashboard on port `6052` with a `/version` health check. Railway provides compute, TLS termination, a public URL, and persistent volumes. Two volume mounts are pre-configured: `/config` retains YAML configurations, secrets, and `platformio.ini` across deploys, while `/cache` stores PlatformIO platforms and build artifacts to accelerate recompilation. The container ships with PlatformIO and all ESP-IDF toolchains pre-installed — no additional dependencies or build steps are required.

## Common Use Cases

- **Custom sensor builds** — Configure ESP32-based temperature, humidity, motion, or air quality sensors via YAML, compile firmware in-browser, and deploy OTA
- **Smart home switches** — Replace wall switches with Wi-Fi controlled relays, managed through Home Assistant's native ESPHome API
- **Bluetooth proxies** — Deploy ESP32 as a Bluetooth LE proxy to extend Home Assistant's device range across the home
- **IR blaster control** — Manage TVs, AC units, and other IR devices through a unified dashboard with automation rules
- **Fleet management** — Monitor, update, and troubleshoot all ESP devices from a single web interface with centralized OTA

## Dependencies for Esphome Hosting

- **No external database** — All configurations are stored as YAML files in `/config`, persisted via Railway volume
- **No message queue** — Operations are synchronous within the dashboard; no broker or event bus required
- **No external cache service** — PlatformIO packages and build artifacts persist on the mounted `/cache` volume
- **No additional microservices** — ESPHome runs as a single container with all toolchains pre-installed

## Why Deploy Esphome on Railway?

<!-- Recommended: Keep this section as shown below -->
Railway is singular platform to deploy your infrastructure stack. Railway will host your infrastructure so you don't have to deal with configuration, while allowing you to vertically and horizontally scale it.

By deploying Esphome on Railway, you are one step closer to supporting complete full-stack application with minimal burden. Host your servers, databases, AI agents, and more on Railway.
<!-- End recommended section -->
