ARG BUILD_FROM=ghcr.io/home-assistant/armv7-base:latest
FROM $BUILD_FROM

RUN apk add --no-cache mosquitto mosquitto-clients

# Persiapan folder
RUN mkdir -p /var/lib/mosquitto /etc/mosquitto && \
    chown -R mosquitto:mosquitto /var/lib/mosquitto /etc/mosquitto

COPY mosquitto.conf /etc/mosquitto/mosquitto.conf
COPY run.sh /
RUN chmod a+x /run.sh

EXPOSE 1883 9001

CMD [ "/run.sh" ]
