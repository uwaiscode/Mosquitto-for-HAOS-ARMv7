#!/usr/bin/with-contenv bashio

bashio::log.info "Starting Mosquitto MQTT Broker..."

# Read credentials from addon options
MQTT_USER=$(bashio::config 'mqtt_username')
MQTT_PASS=$(bashio::config 'mqtt_password')

bashio::log.info "Creating password file for user: ${MQTT_USER}"

# Generate hashed password file
mosquitto_passwd -c -b /etc/mosquitto/passwd "${MQTT_USER}" "${MQTT_PASS}"

# Ensure persistence directory exists
mkdir -p /data/mosquitto

bashio::log.info "MQTT broker listening on port 1883 (MQTT) and 9001 (WebSocket)"
bashio::log.info "Username: ${MQTT_USER}"

# Start mosquitto with config
exec mosquitto -c /etc/mosquitto/mosquitto.conf
