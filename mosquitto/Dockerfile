ARG BUILD_FROM=eclipse-mosquitto:2
FROM $BUILD_FROM

# Install jq to read /data/options.json from HAOS
RUN apk add --no-cache jq

# Copy mosquitto config
COPY mosquitto.conf /mosquitto/config/mosquitto.conf

# Copy startup script
COPY run.sh /run.sh
RUN chmod +x /run.sh

ENTRYPOINT ["/run.sh"]
