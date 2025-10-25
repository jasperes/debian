#!/usr/bin/env bash

set -e
cd temp

dpkg --add-architecture i386
apt install \
    linux-headers-amd64 \
    nvidia-kernel-common \
    build-essential \
    libglvnd-dev \
    pkg-config \
    libc6:i386 \
;

wget https://developer.download.nvidia.com/compute/cuda/repos/debian12/x86_64/cuda-keyring_1.1-1_all.deb
sudo dpkg -i cuda-keyring_1.1-1_all.deb
sudo apt update
sudo apt upgrade
sudo apt -V install cuda-drivers

cd -
