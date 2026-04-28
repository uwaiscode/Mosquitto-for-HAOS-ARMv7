# Mosquitto MQTT Broker — Home Assistant OS Addon (ARMv7)

Addon **Mosquitto MQTT Broker** untuk Home Assistant OS (HAOS) yang dioptimalkan untuk arsitektur **ARMv7 (32-bit)**.

Mendukung koneksi MQTT standar dan MQTT over WebSocket.

---

## Fitur

- **MQTT** pada port `1883`
- **MQTT over WebSocket** pada port `9001`
- Autentikasi username & password
- Persistent storage (pesan & subscription tersimpan saat restart)
- Konfigurasi username/password langsung dari UI Home Assistant

---

## Persyaratan

- Home Assistant OS dengan arsitektur **ARMv7** (32-bit)
- Contoh perangkat: Raspberry Pi 2, Orange Pi, atau SBC ARMv7 lainnya

---

## Instalasi

### 1. Tambahkan Repository

1. Buka Home Assistant → **Settings** → **Add-ons** → **Add-on Store**
2. Klik ikon tiga titik (⋮) di pojok kanan atas → **Repositories**
3. Tambahkan URL:
   ```
   https://github.com/YOUR_GITHUB_USERNAME/mosquitto-For-HAOS-ARMv7
   ```
4. Klik **Add** → **Close**

### 2. Install Addon

1. Refresh halaman Add-on Store
2. Temukan **Mosquitto MQTT Broker** di daftar
3. Klik **Install**
4. Tunggu proses build selesai

### 3. Konfigurasi

Di tab **Configuration** addon, sesuaikan:

```yaml
mqtt_username: neutron
mqtt_password: neutron123
```

> Ganti password dengan nilai yang lebih aman untuk lingkungan produksi.

### 4. Jalankan

1. Klik **Start**
2. Aktifkan **Start on boot** dan **Watchdog** sesuai kebutuhan

---

## Informasi Koneksi Default

| Parameter  | Nilai         |
|------------|---------------|
| Host       | IP perangkat HAOS Anda |
| MQTT Port  | `1883`        |
| WS Port    | `9001`        |
| Username   | `neutron`     |
| Password   | `neutron123`  |

---

## Contoh Koneksi

### Python (paho-mqtt)

```python
import paho.mqtt.client as mqtt

client = mqtt.Client()
client.username_pw_set("neutron", "neutron123")
client.connect("192.168.1.x", 1883, 60)
client.publish("home/sensor/suhu", "25.5")
```

### MQTT.js (WebSocket)

```javascript
const mqtt = require('mqtt');
const client = mqtt.connect('ws://192.168.1.x:9001', {
  username: 'neutron',
  password: 'neutron123'
});
client.on('connect', () => {
  client.subscribe('home/#');
});
```

### ESP32 / ESP8266 (Arduino)

```cpp
#include <PubSubClient.h>

const char* mqtt_server = "192.168.1.x";
const int   mqtt_port   = 1883;
const char* mqtt_user   = "neutron";
const char* mqtt_pass   = "neutron123";

client.connect("ESP_Device", mqtt_user, mqtt_pass);
```

---

## Struktur File

```
mosquitto-For-HAOS-ARMv7/
├── config.json        # Konfigurasi addon HAOS
├── build.json         # Konfigurasi build Docker (ARMv7)
├── Dockerfile         # Docker image definition
├── mosquitto.conf     # Konfigurasi Mosquitto broker
├── run.sh             # Script startup addon
└── README.md          # Dokumentasi ini
```

---

## Troubleshooting

**Addon tidak muncul setelah tambah repo?**
Refresh browser atau clear cache, lalu coba lagi.

**Koneksi ditolak (Connection Refused)?**
- Pastikan addon sudah **Running**
- Cek port 1883/9001 tidak diblokir firewall

**Authentication Failed?**
- Pastikan username dan password di konfigurasi sudah benar
- Klik **Save** dan **Restart** addon setelah mengubah konfigurasi

---

## Lisensi

MIT License — bebas digunakan dan dimodifikasi.
