ARG BUILD_FROM=alpine:3.20
FROM $BUILD_FROM

# Install mosquitto (includes mosquitto_passwd) and jq
RUN apk add --no-cache mosquitto jq

# Copy mosquitto config
COPY mosquitto.conf /etc/mosquitto/mosquitto.conf

# Copy startup script
COPY run.sh /run.sh
RUN chmod +x /run.sh

ENTRYPOINT ["/run.sh"]
