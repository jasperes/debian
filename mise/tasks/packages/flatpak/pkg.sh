#!/usr/bin/env bash

flatpak remote-add --user --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install --user flathub -y $(grep -vE "^\s*#" ${RESOURCES}/flatpak/flatpaks.list  | tr "\n" " ")
