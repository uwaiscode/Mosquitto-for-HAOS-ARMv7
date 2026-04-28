#!/usr/bin/with-contenv bashio

MQTT_USER=$(bashio::config 'mqtt_username')
MQTT_PASS=$(bashio::config 'mqtt_password')

mkdir -p /data/mosquitto

mosquitto_passwd -c -b /etc/mosquitto/passwd "${MQTT_USER}" "${MQTT_PASS}"

bashio::log.info "Mosquitto: password file created for user '${MQTT_USER}'"
