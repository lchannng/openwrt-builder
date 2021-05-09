#!/bin/bash
# File  : prepare.sh
# Author: lchannng <l.channng@gmail.com>
# Date  : 2020/08/18 19:24:13

TAG=ijk/openwrt-builder

OPENWRT_ARCH="${OPENWRT_ARCH:-ramips}"
OPENWRT_HOST="${OPENWRT_HOST:-Linux-x86_64}"
OPENWRT_TARGET="${OPENWRT_TARGET:-mt7621}"
OPENWRT_VERSION="${OPENWRT_VERSION:-21.02.0-rc1}"

BUILDER_NAME="openwrt-imagebuilder-${OPENWRT_VERSION}-${OPENWRT_ARCH}-${OPENWRT_TARGET}.${OPENWRT_HOST}"
BUILDER_URL="https://downloads.openwrt.org/releases/${OPENWRT_VERSION}/targets/${OPENWRT_ARCH}/${OPENWRT_TARGET}/${BUILDER_NAME}.tar.xz"

if [ ! -f ${BUILDER_NAME}.tar.xz ]; then
    echo "downloading ${BUILDER_URL}..." && \
    curl ${BUILDER_URL} -o ${BUILDER_NAME}.tar.xz && \
    tar xvf ${BUILDER_NAME}.tar.xz
fi

ln -snf ${BUILDER_NAME} openwrt
docker build -t ${TAG} .
