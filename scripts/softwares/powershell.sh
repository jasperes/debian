#!/usr/bin/env bash

# https://learn.microsoft.com/en-us/powershell/scripting/install/install-debian?view=powershell-7.5
powershell_installer() {
    set -e

    TEMP_DIR="${TEMP}/powershell"

    mkdir -p $TEMP_DIR
    cd $TEMP_DIR

    # Download the Microsoft repository GPG keys
    wget -q https://packages.microsoft.com/config/debian/12/packages-microsoft-prod.deb

    # Register the Microsoft repository GPG keys
    sudo dpkg -i packages-microsoft-prod.deb

    # Delete the Microsoft repository GPG keys file
    rm packages-microsoft-prod.deb

    # Update the list of packages after we added packages.microsoft.com
    sudo apt update

    # Install PowerShell
    sudo apt install -y powershell

    cd -; rm -rf $TEMP_DIR
}
