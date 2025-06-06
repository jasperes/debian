#!/bin/env bash

set -e

sudo apt install make

make apt/packages

make amd/installer
make swapfile/setup
make shell/setup

make rcm/setup
make themes/dracula

make deb/packages

make flatpak/packages
make flatpak/setup

make appimage/packages

make script/packages
make git/clone

make gnome/extensions
make gnome/sets
make gnome/shortcuts

make misc/ssh

make mise/packages
make vscode/extensions
make powershell/modules
