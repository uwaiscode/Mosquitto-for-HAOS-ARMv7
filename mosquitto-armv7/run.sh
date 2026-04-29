#!/usr/bin/with-contenv bashio

# Mengambil konfigurasi dari UI Home Assistant
USERNAME=$(bashio::config 'username')
PASSWORD=$(bashio::config 'password')

# Buat folder dan file password
mkdir -p /etc/mosquitto
touch /etc/mosquitto/passwd
mosquitto_passwd -b /etc/mosquitto/passwd "$USERNAME" "$PASSWORD"

# Set izin akses agar Mosquitto tidak error (chmod 600)
chown mosquitto:mosquitto /etc/mosquitto/passwd
chmod 600 /etc/mosquitto/passwd

bashio::log.info "Memulai Mosquitto Broker untuk user: $USERNAME"

# Jalankan mosquitto
exec mosquitto -c /etc/mosquitto/mosquitto.conf
