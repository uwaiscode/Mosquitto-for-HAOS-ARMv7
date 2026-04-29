ARG BUILD_FROM=ghcr.io/home-assistant/armv7-base:latest
FROM $BUILD_FROM

# Instalasi Mosquitto
RUN apk add --no-cache \
    mosquitto \
    mosquitto-clients

# Persiapan folder dan permission
RUN mkdir -p /var/lib/mosquitto /etc/mosquitto && \
    chown -R mosquitto:mosquitto /var/lib/mosquitto /etc/mosquitto

# Copy konfigurasi
COPY mosquitto.conf /etc/mosquitto/mosquitto.conf
COPY run.sh /
RUN chmod a+x /run.sh

# Port standar
EXPOSE 1883 9001

CMD [ "/run.sh" ]
