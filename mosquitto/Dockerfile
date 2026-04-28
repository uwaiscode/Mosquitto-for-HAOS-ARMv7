ARG BUILD_FROM=ghcr.io/home-assistant/armv7-base:3.20
FROM $BUILD_FROM

# Install mosquitto MQTT broker
RUN apk add --no-cache mosquitto

# Create required directories
RUN mkdir -p /etc/mosquitto /data/mosquitto

# Copy mosquitto config
COPY mosquitto.conf /etc/mosquitto/mosquitto.conf

# Copy s6 init script (runs once on startup)
COPY cont-init.d/mosquitto-init.sh /etc/cont-init.d/mosquitto-init.sh

# Copy s6 service scripts (runs as persistent service)
COPY services.d/mosquitto/run /etc/services.d/mosquitto/run
COPY services.d/mosquitto/finish /etc/services.d/mosquitto/finish

RUN chmod a+x \
    /etc/cont-init.d/mosquitto-init.sh \
    /etc/services.d/mosquitto/run \
    /etc/services.d/mosquitto/finish
