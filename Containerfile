ARG FREEBSD_RELEASE

FROM ghcr.io/appjail-makejails/x11appjail-base:${FREEBSD_RELEASE}-x11

ARG NO_PKGCLEAN

LABEL org.opencontainers.image.title="appjail4win" \
    org.opencontainers.image.description="Spin up new Windows VM quickly on FreeBSD" \
    org.opencontainers.image.source="https://github.com/AppJail-makejails/appjail4win" \
    org.opencontainers.image.url="https://github.com/AppJail-makejails/appjail4win" \
    org.opencontainers.image.vendor="DtxdF" \
    org.opencontainers.image.authors="Jesús Daniel Colmenares Oviedo <dtxdf@disroot.org>"

RUN set -xe; \
    \
    pkg update; \
    pkg install \
        cdrtools \
        tigervnc-viewer \
        devel/py-wait-for-it \
        7-zip; \
    \
    if [ -z "${NO_PKGCLEAN}" ]; then \
        pkg clean -a; \
        rm -rf /var/cache/pkg/*; \
    fi; \
    rm -rf /var/db/pkg/repos/*

COPY vncviewer.sh /vncviewer.sh

RUN chmod +x /vncviewer.sh
