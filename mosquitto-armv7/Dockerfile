# Gunakan Alpine standar untuk ARMv7
FROM alpine:3.18

# Instalasi Mosquitto
RUN apk add --no-cache \
    mosquitto \
    mosquitto-clients \
    bash

# Persiapan folder
RUN mkdir -p /var/lib/mosquitto /etc/mosquitto && \
    chown -R mosquitto:mosquitto /var/lib/mosquitto /etc/mosquitto

COPY mosquitto.conf /etc/mosquitto/mosquitto.conf
COPY run.sh /
RUN chmod a+x /run.sh

EXPOSE 1883 9001

# Jalankan langsung scriptnya
ENTRYPOINT ["/bin/bash", "/run.sh"]
