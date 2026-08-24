# 🆕 This fork: M5Stack Tab5 (ESP32-P4) support

This fork of **Evil-M5Project** adds support for the **M5Stack Tab5** (ESP32-P4) on top
of everything the upstream project already does. Nothing existing was removed — the Tab5
is added the same way every other device is (its own firmware `.ino`), so all other
M5 devices keep working exactly as before.

**What this fork changes / adds**
- **New firmware: [`Evil-Tab5-v1-0.ino`](./Evil-Tab5-v1-0.ino)** — a Tab5 port of
  `Evil-M5Core3` (closest analog: a large M5Unified touch device with no keyboard).
- **Tab5 board detection** via `m5::board_t::board_M5Tab5`.
- **SDMMC/SDIO microSD** support (the Tab5 wires the card over SDIO, not SPI).
- **UI scaled for the Tab5's 1280×720 panel** — larger text, full-height menus and
  lists, centred splash, and a bottom navigation bar (all driven by one scale knob).
- **Docs:** the [Tab5 Beta Notes](#tab5-notes) section below,
  covering the ESP32-P4 + hosted ESP32-C6 radio, its limits, and build settings.

**Tab5 needs a WiFi co-processor for full support.** The Tab5's main SoC (ESP32-P4)
has **no native radio** — WiFi/BLE come from an on-board ESP32-C6 (2.4 GHz only) over
ESP-Hosted. For 5 GHz and robust monitor/deauth/EAPOL work, pair the Tab5 with an
external **ESP32-C5 (e.g. M5Stamp C5)** running [`slave/C5-Slave`](./slave/C5-Slave).
See the [Tab5 Beta Notes](#tab5-notes) for details.

> ⚠️ Tab5 support is new and hardware-dependent: the app logic is identical to the
> proven Core3 build, but the ESP32-P4 + hosted-C6 path has not had the same field
> testing as the native-ESP32 devices. Verify radio-heavy features on hardware.

---

<div align="center">
  
  # Evil-M5Project

  <img src="https://github.com/7h30th3r0n3/Evil-M5Core2/blob/main/SD-Card-File/img/startup.jpg" width="300" />

  <b>Evil-M5Project</b> is an innovative tool developed for ethical testing and exploration of WiFi networks. It harnesses the power of the M5Core2 device to scan, monitor, and interact with WiFi networks in a controlled environment. This project is designed for educational purposes, aiding in understanding network security and vulnerabilities.

  > <i>Disclaimer</i>: The creator of Evil-M5Core2 is not responsible for any misuse of this tool. It is intended solely for ethical and educational purposes. Users are reminded to comply with all applicable laws and regulations in their jurisdiction. All files provided with Evil-M5Core2 are designed to be used in a controlled environment and must be used in compliance with all applicable laws and regulations. Misuse or illegal use of this tool is strictly prohibited and not supported by the creator.

  #### Evil-M5Family

  <img src="./Github-Img/M5family.jpg" width="300" />
  <img src="./Github-Img/CYD-Stick.jpg" width="200" />
  
<hr />
<h2 style="text-align:center;">☕️ Support This Project</h2>

<p style="text-align:center; font-size:1.1em;">
  If you find this project useful, consider supporting its development! <br> ⭐ leave a star, it can really help ⭐ ! 
</p>

<!-- Ko-fi -->
<div style="text-align:center; margin: 1em 0;">
  <a href="https://ko-fi.com/7h30th3r0n3" target="_blank" style="text-decoration:none;">
    <img src="https://ko-fi.com/img/githubbutton_sm.svg" alt="Support me on Ko-fi" />
  </a>
</div>

<!-- M5 Affiliate -->
<div style="text-align:center; margin: 2em 0;">
  <a href="https://shop.m5stack.com/products/m5stack-cardputer-adv-version-esp32-s3?ref=7h30th3r0n3" target="_blank">
    <img src="https://static.goaffpro.com/4973/images/1561376655877.png" alt="Support via M5Stack shop" width="120" />
  </a>
  <p><a href="https://shop.m5stack.com/products/m5stack-cardputer-adv-version-esp32-s3?ref=7h30th3r0n3" target="_blank"><strong>Buy M5Stack product</strong></a> <br />using my affiliate link to help me keep building new tools 🛠️</p>
</div>

<!-- AliExpress -->
<div style="text-align:center; margin: 2em 0;">
  <a href="https://s.click.aliexpress.com/e/_c4CfjBAR" target="_blank">
    <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/3/3b/Aliexpress_logo.svg/3840px-Aliexpress_logo.svg.png" alt="AliExpress Logo" width="120" style="margin-bottom: 0.5em;" />
  </a>
  <p>
    <a href="https://s.click.aliexpress.com/e/_c4CfjBAR" target="_blank"><strong>Buy anything on AliExpress</strong></a><br />
    <span>Just by using this link before searching, you're directly supporting the project 🙌</span>
  </p>
</div>

<p><em>Every small click and donation keeps this open-source project alive ✨ just clicking can make a difference 😊</em></p>

<hr />

  </br>

  Join the Evil-M5 discord for help and updates 😉:

  <a href="https://discord.com/invite/qbwAJch25S">
    <img src="https://cdn.prod.website-files.com/6257adef93867e50d84d30e2/66e278299a53f5bf88615e90_Symbol.svg" width="75" alt="Join Discord" />
  </a>


---
## For More Information Check The Wiki ! 
<a href="https://github.com/7h30th3r0n3/Evil-M5Project/wiki">
  <img src="./Github-Img/wiki.png" width="300" alt="For More Information Check The Wiki !" />
</a>

https://github.com/7h30th3r0n3/Evil-M5Project/wiki 


---


## Compatible Hardware
<h2>🧱 M5Stack Devices</h2>
<table>
  <tr>
    <th>Device</th>
    <th>Links to buy</th>
  </tr>
  <tr>
    <td> Better one : M5Cardputer</td>
    <td><a href="https://shop.m5stack.com/products/m5stack-cardputer-adv-version-esp32-s3?ref=7h30th3r0n3">M5Stack</a> / <a href="https://s.click.aliexpress.com/e/_c4CfjBAR">AliExpress</a></td>
     </tr>
  <tr>
     <td>M5Stack Core2</td>
    <td><a href="https://shop.m5stack.com/products/m5stack-core2-esp32-iot-development-kit-v1-1?ref=7h30th3r0n3">M5Stack</a> / <a href="https://s.click.aliexpress.com/e/_DBIMh8l">AliExpress</a></td>
  </tr>
  <tr>
    <td>M5Stack Fire</td>
    <td><a href="https://shop.m5stack.com/products/m5stack-fire-iot-development-kit-psram-v2-7?ref=7h30th3r0n3">M5Stack</a></td>
  </tr>
  <tr>
    <td>M5Stack Core1</td>
    <td><a href="https://shop.m5stack.com/products/atoms3-dev-kit-w-0-85-inch-screen?ref=7h30th3r0n3">M5Stack</a></td>
  </tr>
  <tr>
    <td>M5Stack AWS</td>
    <td><a href="https://shop.m5stack.com/products/atoms3-dev-kit-w-0-85-inch-screen?ref=7h30th3r0n3">M5Stack</a></td>
  </tr>
  <tr>
    <td>M5Stack CoreS3</td>
    <td><a href="https://shop.m5stack.com/products/m5stack-cores3-esp32s3-lotdevelopment-kit?ref=7h30th3r0n3">M5Stack</a> / <a href="https://s.click.aliexpress.com/e/_DlFvqIT">AliExpress</a></td>
  </tr>
  <tr>
    <td>M5Stack CoreS3 SE</td>
    <td><a href="https://shop.m5stack.com/products/m5stack-cores3-se-iot-controller-w-o-battery-bottom?ref=7h30th3r0n3">M5Stack</a></td>
  </tr>
  <tr>
    <td>M5Stack Tab5 (Beta – ESP32-P4)</td>
    <td><a href="https://shop.m5stack.com/products/m5stack-tab5-iot-development-kit-esp32-p4?ref=7h30th3r0n3">M5Stack</a></td>
  </tr>
  <tr>
    <td>M5AtomS3 (GPS needed)</td>
    <td><a href="https://shop.m5stack.com/products/atoms3-dev-kit-w-0-85-inch-screen?ref=7h30th3r0n3">M5Stack</a></td>
  </tr>
  <tr>
    <td>↳ GPS Module</td>
    <td><a href="https://shop.m5stack.com/products/atomic-gps-base-m8030-kt?ref=7h30th3r0n3">M5Stack</a></td>
  </tr>
  <tr>
    <td>LLM Module</td>
    <td><a href="https://shop.m5stack.com/products/m5stack-llm-large-language-model-module-kit-ax630c?ref=7h30th3r0n3">M5Stack</a> / <a href="https://s.click.aliexpress.com/e/_omg0Ezb">AliExpress</a></td>
  </tr>
</table>

<h2>🧪 In Beta</h2>
<table>
  <tr>
    <th>Device</th>
    <th>Links</th>
  </tr>
  <tr>
    <td>CYD2USB</td>
    <td><a href="https://s.click.aliexpress.com/e/_oCIMyQN">AliExpress</a></td>
  </tr>
  <tr>
    <td>CYD1USB</td>
    <td><em>(No link yet)</em></td>
  </tr>
  <tr>
    <td>M5Stick v1.1</td>
    <td><a href="https://s.click.aliexpress.com/e/_olZdFPx">AliExpress</a></td>
  </tr>
  <tr>
    <td>M5Stick v2</td>
    <td><a href="https://s.click.aliexpress.com/e/_oBAJVn3">AliExpress</a></td>
  </tr>
</table>
</div>
<h2>📦 Required Extras</h2>
<ul>
  <li><strong>SD Card</strong> (FAT32, SDHC, max 16Go – 8Go is already enough)</li>
  <li><strong>GPS Module</strong>: 
    <a href="https://shop.m5stack.com/products/gps-bds-unit-with-sma-antenna-at6668">M5Stack</a> / 
    <a href="https://s.click.aliexpress.com/e/_oB7Yknf">DIY</a>
  </li>
</ul>

---

<a id="tab5-notes"></a>
## 🧪 M5Stack Tab5 (ESP32-P4) — Beta Notes

The **Tab5** firmware is `Evil-Tab5-v1-0.ino`, a port of `Evil-M5Core3` (the closest
existing device: a large touch screen with no keyboard, driven by M5Unified). The Tab5
is architecturally different from every other supported device, so read this before
flashing:

- **SoC / radio:** The Tab5's main chip is an **ESP32-P4 (RISC-V)** which has **no
  native Wi-Fi or Bluetooth**. Wi-Fi 2.4 GHz and BLE are provided by an on-board
  **ESP32-C6** that the P4 drives over ESP-Hosted (SDIO). The usual `WiFi.h` /
  `esp_wifi_*` calls are routed to the C6 through `esp_wifi_remote`. Promiscuous mode
  and raw `esp_wifi_80211_tx()` are exposed through that remote layer, but throughput
  and frame handling are more constrained than on a native ESP32, and behaviour
  depends on your installed arduino-esp32 / `esp_wifi_remote` version. **Monitor-mode
  and injection-heavy features (sniffing, deauth, karma, handshake capture) should be
  validated on hardware** — they are the ones most likely to differ from Core3.
- **No 5 GHz:** the C6 is 2.4 GHz only.
- **microSD:** the Tab5 wires the card in **SDMMC/SDIO mode** (CLK 43, CMD 44,
  D0–D3 39/40/41/42), not SPI, so this port mounts it through `SD_MMC` instead of the
  SPI `SD` driver used by the other devices.
- **No RGB LED:** the Tab5 has no NeoPixel, so the LED animation is disabled.

### Pair it with an ESP32-C5 for what the Tab5 lacks
For **5 GHz** work, and to offload monitor/deauth/EAPOL from the hosted C6 radio, pair
the Tab5 with an external **ESP32-C5 (e.g. M5Stamp C5)** running the firmware in
[`slave/C5-Slave`](./slave/C5-Slave). The C5 does dual-band (2.4 + 5.8 GHz) scan /
deauth / sniff and forwards results, exactly like the ESP32-C5 Serial Toolkit already
used on the Cardputer. This is the recommended way to get robust radio attacks on the
Tab5 platform.

### Compile in the Arduino IDE (Tab5 / ESP32-P4)

**1. Board / core**
- Install a recent **ESP32 Arduino core with ESP32-P4 support** (via the M5Stack /
  Espressif boards URL), then select the **M5Tab5** board. An older core will not
  list the Tab5 — update it first.

**2. Required libraries** (Tools → Manage Libraries…). Install these *exact* entries:

| Library (search name in Library Manager) | Author | Min version | Provides / notes |
|------------------------------------------|--------|-------------|------------------|
| **M5Unified**   | M5Stack   | ≥ **0.2.17** | core device API; also pulls in M5GFX |
| **M5GFX**       | M5Stack   | ≥ **0.2.22** | Tab5 panel + `board_M5Tab5` support |
| **TinyGPSPlus** | Mikal Hart | ≥ 1.0.3 | provides `TinyGPS++.h` — see note below |
| **Adafruit NeoPixel** | Adafruit | ≥ 1.12.0 | LED lib (LED is disabled on Tab5, but the include must resolve) |
| **ArduinoJson** | Benoit Blanchon | **6.x** | use a **6.x** release — the code uses the v6 API |

> ⚠️ **TinyGPSPlus vs `TinyGPS++.h`:** the sketch includes `TinyGPS++.h` (two `+`),
> which is correct — that is the real header name. But in Library Manager there is
> **no** entry called "TinyGPS++". The library that ships that header is
> **"TinyGPSPlus" by Mikal Hart** (`mikalhart/TinyGPSPlus`). Installing the older
> **"TinyGPS"** (header `TinyGPS.h`, no `++`) will *not* satisfy the include and you
> will get `fatal error: TinyGPS++.h: No such file or directory`. Do not edit the
> include — install the right library. After install, confirm the file exists at
> `…/Arduino/libraries/TinyGPSPlus/src/TinyGPS++.h`.
>
> `WiFi`, `WebServer`, `DNSServer`, `SD`, `SD_MMC` and `BLEDevice` come from the ESP32
> core itself and do **not** need to be installed separately.

**3. Board settings (Tools menu)**
- **Partition Scheme:** a large-app / 16MB scheme (the P4 has 16 MB flash, 32 MB PSRAM).
- **PSRAM:** enabled.
- Wi-Fi on the P4 automatically pulls in the `esp_wifi_remote` / ESP-Hosted component
  that talks to the on-board ESP32-C6.

**4. Upload (enter download mode first)**
- Connect **USB-C** (or have battery power).
- **Long-press Reset ~2 s** until the internal green LED blinks rapidly, then release
  to enter download mode.
- Select the port and click Upload.

### Build with PlatformIO
A ready [`platformio.ini`](./platformio.ini) is included (env `m5tab5`, using the
**pioarduino** ESP32-P4 platform; it compiles only the Tab5 sketch and pins the
library versions above). Build with `pio run -e m5tab5` and flash with
`pio run -e m5tab5 -t upload` after entering download mode.

> ⚠️ Tab5 support is new and hardware-dependent. The device is recognised
> (`M5.getBoard() == board_M5Tab5`), the display/touch/SD paths are adapted, and the
> app logic is identical to the proven Core3 build — but the ESP32-P4 + hosted-C6
> radio path has not been through the same field testing as the native-ESP32 devices.
> Please report results on the Discord.

---

Features may vary depending on the firmware/device you are using:
| Feature                       | Evil-Cardputer v1.5.4 | Evil-M5Core2 1.3.9 | Evil-M5Core3 1.1.9 | Evil-AtomS3 v1.1.7 | Evil-Face v1.0 |
|-------------------------------|-----------------------|--------------------|--------------------|--------------------|----------------|
| WiFi Network Scanning         | ✅                     | ✅                  | ✅                  | ✅                  | ❌              |
| Network Cloning               | ✅                     | ✅                  | ✅                  | ✅                  | ❌              |
| Captive Portal Management     | ✅                     | ✅                  | ✅                  | ✅                  | ❌              |
| Credential Handling           | ✅                     | ✅                  | ✅                  | ✅                  | ❌              |
| Remote Web Server             | ✅                     | ✅                  | ✅                  | ✅                  | ❌              |
| Probes Attack                 | ✅                     | ✅                  | ✅                  | ✅                  | ❌              |
| Sniffing probes               | ✅                     | ✅                  | ✅                  | ✅                  | ❌              |
| Karma Attack                  | ✅                     | ✅                  | ✅                  | ✅                  | ❌              |
| Automated Karma Attack        | ✅                     | ✅                  | ✅                  | ✅                  | ✅              |
| Karma Spear                   | ✅                     | ✅                  | ✅                  | ❌                  | ❌              |
| Bluetooth Keyboard            | ✅                     | ✅                  | ❌                  | ❌                  | ❌              |
| Wardriving                    | ✅                     | ✅                  | ✅                  | ✅                  | ❌              |
| Wardriving Master             | ✅                     | ❌                  | ❌                  | ❌                  | ❌              |
| Beacon Spam                   | ✅                     | ✅                  | ✅                  | ✅                  | ❌              |
| Deauther                      | ✅                     | ✅                  | ❌                  | ❌                  | ❌              |
| Auto Deauther                 | ✅                     | ❌                  | ❌                  | ❌                  | ❌              |
| Evil-Twin                     | ✅                     | ❌                  | ❌                  | ❌                  | ❌              |
| Handshake Master              | ✅                     | ✅                  | ❌                  | ❌                  | ❌              |
| Check Handshakes              | ✅                     | ❌                  | ❌                  | ❌                  | ❌              |
| Client Sniff                  | ✅                     | ✅                  | ❌                  | ❌                  | ❌              |
| Raw Sniffing                  | ✅                     | ✅                  | ❌                  | ❌                  | ❌              |
| Wi-Fi Channel Visualizer      | ✅                     | ✅                  | ❌                  | ❌                  | ❌              |
| Client Sniff And Deauth       | ✅                     | ✅                  | ❌                  | ❌                  | ❌              |
| EAPOL/Deauth detection        | ✅                     | ✅                  | ✅ (No EAPOL)       | ❌                  | ❌              |
| Wall Of Flipper               | ✅                     | ✅                  | ✅                  | ❌                  | ❌              |
| Send tesla code with RFunit   | ✅                     | ❌                  | ❌                  | ❌                  | ❌              |
| Scan Network and port         | ✅                     | ✅                  | ❌                  | ❌                  | ❌              |
| Full Network and port Scan    | ✅                     | ✅                  | ❌                  | ❌                  | ❌              |
| SSH Shell                     | ✅                     | ❌                  | ❌                  | ❌                  | ❌              |
| Web Crawler                   | ✅                     | ❌                  | ❌                  | ❌                  | ❌              |
| PwnGrid                       | ✅                     | ✅                  | ❌                  | ❌                  | ❌              |
| Skimmer Detector              | ✅                     | ✅                  | ❌                  | ❌                  | ❌              |
| Mouse Jiggler                 | ✅                     | ❌                  | ❌                  | ❌                  | ❌              |
| BadUSB                        | ✅                     | ❌                  | ❌                  | ❌                  | ❌              |
| WebUi BadUSB                  | ✅                     | ❌                  | ❌                  | ❌                  | ❌              |
| Customing Theming             | ✅                     | ✅                  | ❌                  | ❌                  | ❌              |
| Full Network Scan             | ✅                     | ✅                  | ❌                  | ❌                  | ❌              |
| Reverse TCP Tunnel            | ✅                     | ✅                  | ❌                  | ❌                  | ❌              |
| DHCP Starvation               | ✅                     | ✅                  | ❌                  | ❌                  | ❌              |
| Rogue DHCP                    | ✅                     | ✅                  | ❌                  | ❌                  | ❌              |
| Switch DNS                    | ✅                     | ✅                  | ❌                  | ❌                  | ❌              |
| Network Hijacking             | ✅                     | ✅                  | ❌                  | ❌                  | ❌              |
| Detect Printer                | ✅                     | ✅                  | ❌                  | ❌                  | ❌              |
| File Print                    | ✅                     | ✅                  | ❌                  | ❌                  | ❌              |
| Check printer status          | ✅                     | ✅                  | ❌                  | ❌                  | ❌              |
| HoneyPot                      | ✅ (with Webhook)      | ✅                  | ❌                  | ❌                  | ❌              |
| LLM Chat Stream               | ✅                     | ❌                  | ❌                  | ❌                  | ❌              |
| EvilChatMesh                  | ✅                     | ❌                  | ❌                  | ❌                  | ❌              |
| SD on USB                     | ✅                     | ❌                  | ❌                  | ❌                  | ❌              |
| Responder                     | ✅                     | ❌                  | ❌                  | ❌                  | ❌              |
| WPAD Abuse                    | ✅                     | ❌                  | ❌                  | ❌                  | ❌              |
| Crack NTLMv2                  | ✅                     | ❌                  | ❌                  | ❌                  | ❌              |
| File Manager                  | ✅                     | ❌                  | ❌                  | ❌                  | ❌              |
| UART Shell                    | ✅                     | ❌                  | ❌                  | ❌                  | ❌              |
| SIP ToolKit                   | ✅                     | ❌                  | ❌                  | ❌                  | ❌              |
| CCTV ToolKit                  | ✅                     | ❌                  | ❌                  | ❌                  | ❌              |
| SSDP Poisoner                 | ✅                     | ❌                  | ❌                  | ❌                  | ❌              |
| SkyJack                       | ✅                     | ❌                  | ❌                  | ❌                  | ❌              |
| WiFi Dead Drop                | ✅                     | ❌                  | ❌                  | ❌                  | ❌              |
| BLENameFlood                  | ✅                     | ❌                  | ❌                  | ❌                  | ❌              |
| Wall Of Airtag                | ✅                     | ❌                  | ❌                  | ❌                  | ❌              |
| FindMyEvil                    | ✅                     | ❌                  | ❌                  | ❌                  | ❌              |
| UPnP Mapping Viewer           | ✅                     | ❌                  | ❌                  | ❌                  | ❌              |
| UPnP NAT                      | ✅                     | ❌                  | ❌                  | ❌                  | ❌              |
| LDAPDump                      | ✅                     | ❌                  | ❌                  | ❌                  | ❌              |
| IMSI Catcher                  | ✅                     | ❌                  | ❌                  | ❌                  | ❌              |
| Open Wifi Checker             | ✅                     | ❌                  | ❌                  | ❌                  | ❌              |
| ESP32-C5 Serial Toolkit       | ✅                     | ❌                  | ❌                  | ❌                  | ❌              |
| Aircrack (WPA2 Cracking)      | ✅                     | ❌                  | ❌                  | ❌                  | ❌              |
| Autodiscover Abuse            | ✅                     | ❌                  | ❌                  | ❌                  | ❌              |
| Evil Navigator WebUI          | ✅                     | ❌                  | ❌                  | ❌                  | ❌              |
| CIW ZeroClick                | ✅                     | ❌                  | ❌                  | ❌                  | ❌              |
| TagTinker ESL               | ✅                     | ❌                  | ❌                  | ❌                  | ❌              |
| CSI Radar                   | ✅                     | ❌                  | ❌                  | ❌                  | ❌              |
| Settings                      | ✅                     | ✅                  | ✅                  | ✅                  | ❌              |


----------------------------------------------------------

## Installation

### M5burner
1. Connect your device to your computer.
2. Download M5burner in UIFLOW FIRMWARE BURNING TOOL section : [M5Stack Download Center](https://docs.m5stack.com/en/download)
3. Place the necessary SD file content at the root of SD card. (This is needed to access all the files of the project).⚠️ the SD-Card-Folder files now need to be in a folder named evil at root of the sd card ⚠️
4. Type "evil-" in search bar and check for the device you have.
5. Click download and flash.


### Compile Yourself
1. Connect your device to your computer.
2. Open the Arduino IDE and load the provided code.
3. Ensure the Board tutorial from M5 and `Adafruit_NeoPixel`, `ArduinoJson`, `ESPping`, `IniFile`, `M5GFX`, `M5Unified`, `TinyGPSPlus`, and `esp8266audio` libraries are installed. Follow these tutorials for guidance on M5 Board tutorial:
   - [Arduino Board Setup](https://docs.m5stack.com/en/arduino/arduino_board)
   - [Arduino Library Installation](https://docs.m5stack.com/en/arduino/arduino_library)
4. Ensure the ESP32 and M5Stack board definitions are installed. **Note:** Errors occur with ESP32 version `3.0.0-alpha3` for no M5stack devices. Please use M5stack board with ESP32 version `2.1.4` and below.
5. Place the necessary SD file content at the root of SD card. (This is needed to access the `IMG` startup and `sites` folder). ⚠️ the SD-Card-Folder files now need to be in a folder named evil at root of the sd card ⚠️
6. (Optional) Edit theme.ini on the SD card to customize your device's color theme. (Only supported for cardputer, other devices to be implemented later) 
7. Ensure to run the script in `utilities/deauth_prerequisites` to bypass the ESP32 firmware.
8. Add libraries for BadUSB functionality. See `utilities/Bad_Usb_Lib/README.md`
9. Ensure that the baud rate is set to `115200`.
10. Ensure that `PSRAM` is disabled in the tools menu.
11. Upload the script to your M5Core2 device.
12. Restart the device if needed.

Warning : for Cardputer you need to change the Flash size to 8MB and the Partition Scheme to 8M with spiffs (3MB APP/1.5MB SPIFFS) or space error may occur.
It's your first time with arduino IDE or something not working correctly? You should check out video section or ask help on the discord ! 

### Compile with arduino-cli
If you prefer the command line over the Arduino IDE:
```bash
# Install M5Stack core if not already done
arduino-cli core install m5stack:esp32

# Compile
arduino-cli compile --fqbn m5stack:esp32:m5stack_cardputer \
  --build-property "build.partitions=huge_app" \
  --build-property "upload.maximum_size=3145728" \
  Evil-Cardputer-v1-5-4.ino

# Flash
arduino-cli upload --fqbn m5stack:esp32:m5stack_cardputer --port COMXX \
  Evil-Cardputer-v1-5-4.ino
```
Replace `COMXX` with your actual serial port.

----------------------------------------------------------

# ESP32 Rig Slave
### You can use any ESP32 as slave to collect SSID for wigle and sniff EAPOL
By using 14 ESP32 devices, you can monitor all 14 Wi-Fi channels on the 2.4GHz band simultaneously without channel hopping. The **Cardputer** uses GPS to link each received SSID to a CSV file compatible with Wigle.

This slave code is designed to run on any ESP32 and use it as a slave for wardriving in combination with the wardriving master mode on **Cardputer**.
Each ESP32 collects SSIDs of nearby access points (APs) on a specific channel or can hop between configured channels. 
You can add multiple ESP32 devices to improve the accuracy and strength of the scan. Devices with external antennas can enhance performance for wardriving.

## Tested on:
- **AtomS3**: [Buy here](https://s.click.aliexpress.com/e/_DnDXSKJ)
- **AtomS3 Lite**: [Buy here](https://s.click.aliexpress.com/e/_Dm0e95D)
- **ESP32-C3** (with external antenna): [Buy here](https://s.click.aliexpress.com/e/_DD1yibp) (Be carefull to select sets WITH antenna)
- **WEMOS D1 Mini**: [Buy here](https://s.click.aliexpress.com/e/_DEWPrnz)
- **ESP32 C5**: [Buy here](https://fr.aliexpress.com/item/1005009128201189.html)

## Features:
- **Multi-Device Support**: Add any number of ESP32 devices to increase AP detection and improve coverage.
- **Channel Hopping**: Configure the ESP32 to scan on a specific channel or hop between selected channels.
- **Better Signal Strength**: ESP32 devices with external antennas provide improved signal capture for long-range wardriving.
- **Master-Slave Communication**: Use in combination with the **Cardputer** in wardriving master mode to aggregate and monitor data from multiple ESP32 slaves.
- **GPS Integration**: The **Cardputer** witg GPS link SSID data with geographic coordinates and generate Wigle-compatible CSV files.

## How it Works:
1. Deploy one or more ESP32 devices in slave mode.
2. Each device scans and captures SSID information on designated channels.
3. The data is sent to the **Evil**, which aggregates it and reduces missed APs while improving overall scan accuracy and signal strength.

## Hardware Requirements:
- Evil with v1.3.0 
- ESP32 devices (e.g., AtomS3, AtomS3 Lite, ESP32-C3, WEMOS D1 Mini)
- External antenna (optional, for enhanced performance)

Here an assembly with 8 esp32-c3 connected in parallel and which scans 1,3,6,9,11,13 in static mode and in hopping for 2 others on 2,4,5,7 and 8,10,12,14 :
<div align="center">
<img src="https://github.com/7h30th3r0n3/Evil-M5Core2/blob/main/Github-Img/slavemonster1.jpg" width="300" /> <img src="https://github.com/7h30th3r0n3/Evil-M5Core2/blob/main/Github-Img/slavemonster2.jpg" width="300" />
</div>

# Acknowledgements

- [@SpacehuhnTech](https://github.com/SpacehuhnTech) for the deauther bypass and for the fantastic work that is really inspiring.
- [@evilsocket](https://github.com/evilsocket) for the concept of pwnagotchi and pwngrid.
- [@G4lile0](https://github.com/G4lile0) for the wifi-hash-monster.
- [@K3YOMI](https://github.com/K3YOMI) for the Wall Of Flipper.
- [@pr3y](https://github.com/pr3y) for help and Bruce code.
- [@bmorcelli](https://github.com/bmorcelli) for the help and Bruce code too.
- [@justcallmekoko](https://github.com/justcallmekoko) for the Marauder.
- [@Talking Sasquach](https://www.youtube.com/@TalkingSasquach) for creating video content about the project.
- [@Sam X Plogs](https://www.youtube.com/@samxplogs) for creating video content about the project.
- [@dagnazty](https://github.com/dagnazty) for the fantastic work on M5dial. 
- [@LaikaSpaceDawg](https://github.com/LaikaSpaceDawg) for the work on the code.
- [@geo-tp](https://github.com/geo-tp/) for the work on the sd-card to usb.
- [@Furrtek](https://www.furrtek.org/?a=esl) for the incredible work of reverse ingeneriing of ESL tag. (You should definitely check the blog if you like hardware).
- [@i12bp8](https://github.com/i12bp8) for porting ESLtagtinker on the flipper. 
- [@PierreAdams](https://github.com/PierreAdams/) for the documentation on the rig build. 

and to all Beta-testers on the discord : 

- [@KamiLocura]</br>
- [@Skedone]</br>
- [@toxiccpappii]</br>
- [@OarisKiller]</br>
- [@hosseios]</br>
- [@BrownNoise]</br>
- [@DAKKA]</br>
- [@KNAX]</br>
- [@jader242]</br>
- [@anubisdarkwatch]</br>

----------------------------------------------------------

# License

MIT License

Copyright (c) 2023 7h30th3r0n3

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

