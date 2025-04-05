#!/usr/bin/env bash

mise_installer() {
    curl https://mise.run | sh
}

mise_packages() {
    mise install $(grep -vE "^\s*#" ${RESOURCES}/mise/packages.txt  | tr "\n" " ")
    mise use -g $(grep -vE "^\s*#" ${RESOURCES}/mise/defaults.txt  | tr "\n" " ")
}
