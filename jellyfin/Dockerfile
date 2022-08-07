ARG BUILD_FROM
# hadolint ignore=DL3006
FROM $BUILD_FROM

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN apt-get update \
    \
    && apt-get install -y --no-install-recommends \
        jq=1.6-1ubuntu0.20.04.1

RUN sed -i "s|/config/data|/share/jellyfin/data|g" /etc/services.d/jellyfin/run \
    && sed -i "s|/config/log|/share/jellyfin/log|g" /etc/services.d/jellyfin/run \
    && sed -i "s|/config/cache|/share/jellyfin/cache|g" /etc/services.d/jellyfin/run \
    && sed -i "s|/config|/config/jellyfin|g" /etc/services.d/jellyfin/run \
    && sed -i "s|/config/{log,data,cache}|/xxx/jellyfin|g" /etc/cont-init.d/30-config \
    && sed -i "s|/config|/config/jellyfin|g" /etc/cont-init.d/30-config \
    && sed -i "s|/xxx|/config|g" /etc/cont-init.d/30-config \
    && sed -i "s|/data|/share/jellyfin/data|g" /etc/cont-init.d/30-config

RUN cat /etc/services.d/jellyfin/run && cat /etc/cont-init.d/30-config

# copy local files
COPY root/ /
