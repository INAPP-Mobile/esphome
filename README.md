# Deploy and Host

[![Deploy on Railway](https://railway.app/button.svg)](https://railway.com/new/template/esphome)

![ESPHome](https://raw.githubusercontent.com/mc9max/esphome/main/template-icon.svg)

ESPHome is a system to control your ESP32, ESP8266, BK72xx, RP2040, and other microcontrollers by simple yet powerful configuration files and control them remotely through Home Automation systems.

## About Hosting

The template deploys a single ESPHome service from the official `ghcr.io/esphome/esphome:2026.8.2` image:

- **esphome** — Full dashboard + compile environment on port `6052` with `/version` health check

Railway provides compute, TLS at the edge, and a public URL. The container includes PlatformIO, all ESP-IDF toolchains, and the full Device Builder dashboard — no additional dependencies needed.

## Why Deploy

- **Web-based dashboard** — Full YAML editor, OTA updates, live logs, and serial monitor from any browser
- **Compile in the cloud** — Build firmware for ESP32, ESP8266, BK72xx, RP2040, RTL87xx, and more
- **OTA deployment** — Push compiled firmware over-the-air to devices on your network
- **Home Assistant integration** — Native API for seamless smart home setup
- **Configuration validation** — Real-time YAML validation and error highlighting

## Common Use Cases

- **Custom sensors** — Build ESP32-based temperature, humidity, motion, or air quality sensors
- **Smart switches** — Replace dumb wall switches with Wi-Fi controlled relays
- **IR blasters** — Control TVs, AC units, and other IR devices via Home Assistant
- **Bluetooth proxies** — Use ESP32 as a Bluetooth LE proxy for Home Assistant
- **Node management** — Manage all ESP devices from a single dashboard

## Dependencies for ESPHome

ESPHome has no external service dependencies — it runs as a single container.

### Deployment Dependencies

- **No external database required** — Configuration stored as YAML files in `/config`
- **No external cache required** — PlatformIO packages and build cache persist on volume
- **No message queue required** — All operations are synchronous within the dashboard

### Optional Add-ons

- **Persistent storage** — Mount a volume at `/config` to retain configurations across deploys
- **Build cache** — Mount `/cache` to reuse PlatformIO dependencies between builds (faster compile times)

## First-Run Steps

1. Click **Deploy** — Railway creates the service from the official image
2. Open the dashboard at your public URL
3. Click **Add Device** and follow the wizard to configure your first ESP device
4. Compile firmware and flash via USB or OTA
5. Integrate with Home Assistant via the native API

## Environment Variables

| Variable | Default | Description |
|----------|---------|-------------|
| `PORT` | `6052` | Dashboard HTTP port (must match exposed port) |
| `TZ` | `UTC` | Timezone for log timestamps |

> [!NOTE]
> The container uses the official `esphome-device-builder` dashboard by default. All CLI commands (`compile`, `run`, `config`, `logs`) also work via the web terminal.

## Volumes

| Mount | Purpose |
|-------|---------|
| `/config` | YAML configurations, secrets, and platformio.ini |
| `/cache` | PlatformIO platforms, packages, and build cache (optional, speeds up rebuilds) |

## Updating

Redeploy from the Railway dashboard to pull the latest `ghcr.io/esphome/esphome` image. Configuration in `/config` persists across deploys when using a volume.

## Links

- **Documentation**: https://esphome.io
- **GitHub**: https://github.com/esphome/esphome
- **Discord**: https://discord.gg/KhAMKrd
- **Home Assistant Community**: https://community.home-assistant.io/c/esphome
