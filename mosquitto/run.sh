#!/bin/sh
set -e

USERNAME=$(jq -r '.mqtt_username // "neutron"' /data/options.json)
PASSWORD=$(jq -r '.mqtt_password // "neutron123"' /data/options.json)

mkdir -p /data/mosquitto

mosquitto_passwd -c -b /data/mosquitto/passwd "$USERNAME" "$PASSWORD"

echo "[mosquitto] Starting broker on port 1883 (MQTT) and 9001 (WebSocket)"
echo "[mosquitto] Username: $USERNAME"

exec mosquitto -c /mosquitto/config/mosquitto.conf
