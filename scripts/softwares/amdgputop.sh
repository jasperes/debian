#!/usr/bin/env bash

# https://github.com/Umio-Yasuno/amdgpu_top
amdgputop_installer() {
    set -e

    TEMP_DIR="${TEMP}/amdgputop"

    mkdir -p $TEMP_DIR
    cd $TEMP_DIR

    # install dependencies
    sudo apt libdrm-dev

    # install wallpaper engine kde
    wget https://github.com/Umio-Yasuno/amdgpu_top/releases/download/v0.10.4/amdgpu-top_0.10.4-1_amd64.deb
    sudo apt install amdgpu-top_0.10.4-1_amd64.deb

    cd -; rm -rf $TEMP_DIR
}
