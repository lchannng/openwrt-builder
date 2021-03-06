FROM debian:buster-slim

MAINTAINER lchannng <lchannng@gmail.com>

RUN apt-get update -qq &&\
    apt-get install -y \
        build-essential \
        curl \
        file \
        gawk \
        gettext \
        git \
        libncurses5-dev \
        libssl-dev \
        python2.7 \
        python3 \
        rsync \
        subversion \
        sudo \
        swig \
        unzip \
        wget \
        zlib1g-dev \
        && apt-get -y autoremove \
        && apt-get clean \
        && rm -rf /var/lib/apt/lists/*

RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN useradd -c "OpenWrt Builder" -m -d /home/build -G sudo -s /bin/bash build

COPY --chown=build:build ./openwrt/ /home/build/openwrt/
RUN chown build:build /home/build/openwrt/

USER build
ENV HOME /home/build
WORKDIR /home/build/openwrt
