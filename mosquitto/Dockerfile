ARG BUILD_FROM=alpine:3.20
FROM $BUILD_FROM

# ===== S6-OVERLAY INSTALLATION (WAJIB untuk HAOS Add-on) =====
ARG S6_OVERLAY_VERSION=3.2.0.2
ARG TARGETARCH=arm

# Download & extract s6-overlay (noarch + arch-specific)
ADD https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-noarch.tar.xz /tmp
ADD https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-${TARGETARCH}.tar.xz /tmp

RUN tar -C / -Jxpf /tmp/s6-overlay-noarch.tar.xz && \
    tar -C / -Jxpf /tmp/s6-overlay-${TARGETARCH}.tar.xz && \
    rm -rf /tmp/*.tar.xz && \
    \
# ===== INSTALL DEPENDENCIES =====
    apk add --no-cache \
        mosquitto \
        jq \
        openssl \
        tzdata && \
    \
# ===== SETUP USER & DIRECTORIES =====
    mkdir -p /etc/mosquitto /data/mosquitto /var/lib/mosquitto && \
    chown -R mosquitto:mosquitto /etc/mosquitto /data/mosquitto /var/lib/mosquitto

# ===== COPY CONFIGURATION =====
COPY mosquitto.conf /etc/mosquitto/mosquitto.conf

# ===== COPY S6 SERVICES (run.sh dipindah ke struktur s6) =====
COPY rootfs/ /

# ===== ENTRYPOINT WAJIB: /init dari s6-overlay =====
ENTRYPOINT ["/init"]