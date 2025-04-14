#!/usr/bin/env bash

powershell_modules() {
    set -e

    APPS_LIST="${RESOURCES}/powershell/modules.list"

    for PKG in $(cat $APPS_LIST); do
        echo "Installing $PKG..."
        pwsh --Command "Install-Module -Name $PKG -Repository PSGallery -Force"
        echo "...Done!"
    done
}
