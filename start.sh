#!/bin/bash
# File  : start.sh
# Author: lchannng <l.channng@gmail.com>
# Date  : 2021/05/08 23:44:18

docker run -it --rm -v `pwd`/bin:/home/build/openwrt/bin ijk/openwrt-builder
