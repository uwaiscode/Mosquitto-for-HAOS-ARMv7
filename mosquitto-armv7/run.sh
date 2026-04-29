#!/bin/bash

# Default credentials jika tidak dijalankan sebagai HA Add-on
USERNAME="uwaiscode"
PASSWORD="uwaiscode"

# Jika dijalankan sebagai HA Add-on, file config.json akan ada
if [ -f "/data/options.json" ]; then
    echo "[Info] Mendeteksi lingkungan Home Assistant Add-on..."
    # Mengambil username/password dari options.json (HA Add-on standard)
    # Anda butuh 'jq' jika ingin parsing otomatis, atau biarkan default untuk tes
fi

echo "[Info] Mempersiapkan autentikasi Mosquitto..."
touch /etc/mosquitto/passwd
mosquitto_passwd -b /etc/mosquitto/passwd "$USERNAME" "$PASSWORD"

chown mosquitto:mosquitto /etc/mosquitto/passwd
chmod 600 /etc/mosquitto/passwd

echo "[Info] Memulai Mosquitto Broker untuk user: $USERNAME"

# Jalankan mosquitto di foreground
exec mosquitto -c /etc/mosquitto/mosquitto.conf
