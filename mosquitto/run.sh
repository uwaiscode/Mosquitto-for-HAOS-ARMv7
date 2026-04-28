#!/bin/sh
set -e

USERNAME=$(jq -r '.mqtt_username // "neutron"' /data/options.json)
PASSWORD=$(jq -r '.mqtt_password // "neutron123"' /data/options.json)

mkdir -p /data/mosquitto

/usr/bin/mosquitto_passwd -c -b /data/mosquitto/passwd "$USERNAME" "$PASSWORD"

echo "[mosquitto] Broker starting — MQTT :1883 | WebSocket :9001 | User: $USERNAME"

exec /usr/sbin/mosquitto -c /etc/mosquitto/mosquitto.conf
