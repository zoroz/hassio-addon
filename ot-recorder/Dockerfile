ARG BUILD_FROM=owntracks/recorder:latest
FROM $BUILD_FROM

ENV LANG C.UTF-8
# Copy root filesystem
#COPY rootfs /

# Setup base
#RUN apk add --no-cache minidlna

# Build arugments
ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION

# Labels
LABEL \
    io.hass.name="ot-recorder" \
    io.hass.description="Install ot-recorder to your Hass.io host" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="Zoro Zorec" \
