#!/usr/bin/env bash

amd_installer() {
    (
        sudo su;

        apt install \
            linux-headers-amd64 \
            firmware-linux-nonfree \
            firmware-amd-graphics \
            libgl1-mesa-dri \
            libglx-mesa0 \
            mesa-vulkan-drivers \
            xserver-xorg-video-all \
            dkms \
            vulkan-utils \
        ;

        # FIXME
        # echo > /etc/X11/xorg.conf.d/20-amdgpu.conf <<-EOF
        #     Section "Device"
        #         Identifier  "AMD Graphics"
        #         Driver      "amdgpu"
        #         Option      "TearFree"  "true"
        #     EndSection
        # EOF
    )
}
