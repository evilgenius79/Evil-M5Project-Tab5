#!/usr/bin/env bash
# One-shot installer for the Evil-M5Tab5 (ESP32-P4) full port Arduino libraries.
# Requires arduino-cli. SSH and AsyncWebServer are disabled in-source, so
# libssh / ESPAsyncWebServer are NOT needed.
set -e
arduino-cli lib install "M5Unified" "M5GFX" "TinyGPSPlus" "Adafruit NeoPixel" "ArduinoJson@6.21.5" "IniFile" "ESPping"
echo "Done."
