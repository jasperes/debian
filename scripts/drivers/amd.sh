#!/usr/bin/env bash

amd_installer() {
    sudo apt install \
        linux-headers-amd64 \
        firmware-linux-nonfree \
        firmware-amd-graphics \
        libgl1-mesa-dri \
        libglx-mesa0 \
        mesa-vulkan-drivers \
        xserver-xorg-video-all \
        dkms \
    ;
}
