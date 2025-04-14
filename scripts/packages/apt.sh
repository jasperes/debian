#!/usr/bin/env bash

apt_packages() {
    set -e
    sudo apt update
    sudo apt install -y $(grep -vE "^\s*#" ${RESOURCES}/debian/packages.list  | tr "\n" " ")
}
