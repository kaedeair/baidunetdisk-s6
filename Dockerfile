FROM debian:13.4-slim

ARG S6_VER=3.2.2.0
ARG BAIDUNETDISK_VER=4.17.8
ARG NOVNC_VER=1.6.0
ENV DEBIAN_FRONTEND="noninteractive"
ENV TZ=Asia/Shanghai
ENV DISPLAY=:0
ENV VNC_PASSWORD_FILE="/app/.vnc/passwd"

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        adduser \
        wget \
        xz-utils \
        tigervnc-tools \
        tigervnc-standalone-server \
        fluxbox \
        fonts-wqy-microhei \
        websockify \
        libasound2 \
        libgtk-3-0 \
        libnotify4 \
        libnss3 \
        libxss1 \
        libxtst6 \
        xdg-utils \
        libatspi2.0-0 \
        libsecret-1-0 && \
    apt-get --quiet clean && \
    rm -rf /var/lib/apt/lists/*

RUN wget -O /tmp/novnc.tgz https://github.com/novnc/noVNC/archive/refs/tags/v${NOVNC_VER}.tar.gz &&  \
    mkdir -p /opt/noVNC &&\
    tar -xzf /tmp/novnc.tgz -C /opt/noVNC --strip 1 && \
    mv /opt/noVNC/vnc.html /opt/noVNC/index.html && \
    rm /tmp/novnc.tgz

RUN wget -P /tmp https://github.com/just-containers/s6-overlay/releases/download/v${S6_VER}/s6-overlay-noarch.tar.xz && \
    wget -P /tmp https://github.com/just-containers/s6-overlay/releases/download/v${S6_VER}/s6-overlay-$(uname -m).tar.xz && \
    tar -C / -Jxpf /tmp/s6-overlay-noarch.tar.xz && \
    tar -C / -Jxpf /tmp/s6-overlay-$(uname -m).tar.xz && \
    rm -rf /tmp/*

RUN wget -O /tmp/client.deb https://pkg-ant.baidu.com/issue/netdisk/LinuxGuanjia/4.17.8/baidunetdisk_4.17.8_amd64.deb  && \
    dpkg -i /tmp/client.deb && \
    rm /tmp/client.deb

RUN useradd -s /usr/sbin/nologin -d /tmp app

COPY rootfs /

EXPOSE 5900 8080

ENTRYPOINT ["/init"]