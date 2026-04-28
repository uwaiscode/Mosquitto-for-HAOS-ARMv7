#!/bin/bash
set -e

USERNAME=$(jq -r '.mqtt_username // "neutron"' /data/options.json)
PASSWORD=$(jq -r '.mqtt_password // "neutron123"' /data/options.json)

mkdir -p /data/mosquitto

mosquitto_passwd -c -b /etc/mosquitto/passwd "${USERNAME}" "${PASSWORD}"

echo "[mosquitto] Password file created for user: ${USERNAME}"
