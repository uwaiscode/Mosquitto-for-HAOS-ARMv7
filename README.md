# Mosquitto Broker for HAOS ARMv7

A lightweight, high-performance **MQTT Broker (Mosquitto)** specifically optimized for **ARMv7 (32-bit)** architectures. This add-on is designed for users running Home Assistant on legacy or specialized hardware like **Orange Pi One, Raspberry Pi 2/3 (32-bit OS), and Sonoff iHost**.

## 🚀 Features
* **Architecture Specific**: Tailored for `armv7` to ensure compatibility where official images might fail.
* **Dual Listener**: Supports standard MQTT (`1883`) and WebSockets (`9001`).
* **Persistence Enabled**: Retains MQTT messages and subscriptions across restarts.
* **Integrated Security**: Easy username/password configuration directly via the Home Assistant UI.
* **Lightweight**: Built on Alpine Linux for minimal RAM and CPU footprint.

---

## 🛠️ Installation

1. **Add Repository**:
   * Open your Home Assistant instance.
   * Go to **Settings** > **Add-ons** > **Add-on Store**.
   * Click the three dots in the top right corner and select **Repositories**.
   * Add this URL: `https://github.com/uwaiscode/Mosquitto-for-HAOS-ARMv7`
   * Click **Add** and then **Close**.

2. **Install Add-on**:
   * Search for "Mosquitto for HAOS ARMv7" in the store.
   * Click **Install**.

3. **Configuration**:
   * Go to the **Configuration** tab of the add-on.
   * Set your desired `username` and `password`.
   * Click **Save**.

4. **Start**:
   * Go back to the **Info** tab and click **Start**.

---

## 📡 Connecting Clients

To connect external devices (like Zigbee2MQTT, ESP32, or Tasmota), use the following settings:

| Parameter | Value |
| :--- | :--- |
| **Broker/Host** | `your_device_ip` (e.g., `192.168.18.7`) |
| **Port** | `1883` |
| **Protocol** | `mqtt://` |
| **Username** | *(As set in config)* |
| **Password** | *(As set in config)* |

### Connecting from other Add-ons (e.g., Zigbee2MQTT)
If Zigbee2MQTT is running on the same Home Assistant instance, use the internal hostname:
`mqtt://mosquitto_armv7:1883`

---

## 📄 Configuration Example (`mosquitto.conf`)
The add-on uses a pre-configured `mosquitto.conf` that allows external access and enforces password authentication. 

```conf
listener 1883 0.0.0.0
protocol mqtt

listener 9001 0.0.0.0
protocol websockets

allow_anonymous false
password_file /etc/mosquitto/passwd
```

---

## 🛠 Troubleshooting

* **PID 1 Error**: This add-on uses a specialized startup script to ensure compatibility with `s6-overlay`. Always use the provided `run.sh`.
* **Connection Refused**: Ensure the add-on is started and that your firewall allows traffic on port `1883`.
* **Authentication Failure**: Double-check the credentials in the Configuration tab and restart the add-on after any changes.

---

## 👤 Author
**Triyadi (Abu Uwais)** Full-stack Developer & IoT Engineer.  
*Specializing in Industrial Automation, SCADA, and Embedded Systems.*

---

## ⚖️ License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
