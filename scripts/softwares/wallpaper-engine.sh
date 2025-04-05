#!/usr/bin/env bash

# https://github.com/slynobody/SteamOS-wallpaper-engine-kde-plugin
wallpaper_engine_kde_installer() {
    set -e

    TEMP_DIR="${TEMP}/wekde"

    mkdir -p $TEMP_DIR
    cd $TEMP_DIR

    # install dependencies
    sudo apt install \
        qml-module-qtwebsockets \
        gir1.2-gst-plugins-bad-1.0 \
        python3-websockets \
        libmpv2 \
        libqt6websockets6 \
        qml6-module-qtwebsockets \
    ;

    # install wallpaper engine kde
    wget https://github.com/slynobody/SteamOS-wallpaper-engine-kde-plugin/releases/download/0.5.5b/int_wallpaper_engine_qt6-1-1_amd64.deb
    sudo apt install int_wallpaper_engine_qt6-1-1_amd64.deb

    cd -; rm -rf $TEMP_DIR
}
