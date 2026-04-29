#!/usr/bin/with-contenv bashio

# Ambil Config dari UI HA
USERNAME=$(bashio::config 'username')
PASSWORD=$(bashio::config 'password')

# Buat file password baru setiap kali restart agar sinkron dengan UI
bashio::log.info "Mempersiapkan autentikasi Mosquitto..."
touch /etc/mosquitto/passwd
mosquitto_passwd -b /etc/mosquitto/passwd "$USERNAME" "$PASSWORD"

# Perbaiki permission agar Mosquitto tidak menolak file
chown mosquitto:mosquitto /etc/mosquitto/passwd
chmod 600 /etc/mosquitto/passwd

bashio::log.info "Memulai Mosquitto Broker untuk user: $USERNAME"

# Jalankan mosquitto menggunakan 'exec' agar s6-overlay tetap menjadi PID 1
exec mosquitto -c /etc/mosquitto/mosquitto.conf
