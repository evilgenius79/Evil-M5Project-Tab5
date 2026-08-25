@echo off
REM One-shot installer for the Evil-M5Tab5 (ESP32-P4) full port Arduino libraries.
REM Requires arduino-cli on PATH (bundled with Arduino IDE 2.x, or install separately).
REM SSH and AsyncWebServer are disabled in-source, so libssh / ESPAsyncWebServer are NOT needed.
echo Installing Evil-M5Tab5 libraries...
arduino-cli lib install "M5Unified" "M5GFX" "TinyGPSPlus" "Adafruit NeoPixel" "ArduinoJson@6.21.5" "IniFile" "ESPping"
echo.
echo Done. If you also want the ESP32-P4 board: arduino-cli core install m5stack:esp32  (or the M5Stack board URL)
pause
