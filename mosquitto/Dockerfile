ARG BUILD_FROM=ghcr.io/home-assistant/armv7-base:3.20
FROM $BUILD_FROM

# Install mosquitto MQTT broker
RUN apk add --no-cache mosquitto

# Create required directories
RUN mkdir -p /etc/mosquitto /data/mosquitto

# Copy addon files
COPY mosquitto.conf /etc/mosquitto/mosquitto.conf
COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD ["/run.sh"]
