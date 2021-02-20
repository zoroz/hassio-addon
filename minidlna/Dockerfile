ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8
# Copy root filesystem
COPY rootfs /
ADD minidlna.conf /etc/minidlna.conf

# Setup base
RUN apk add --no-cache minidlna

# Build arugments
ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION

# Labels
LABEL \
    io.hass.name="MiniDLNA" \
    io.hass.description="Install ReadyMedia (MiniDLNA) to your Hass.io host" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="Zoro Zorec" \
