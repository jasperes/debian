#!/bin/env bash

set -e

sudo apt install make

make apt/packages

make amd/installer
make swapfile/setup
make shell/setup

make misc/ssh

make script/packages
make git/clone

make rcm/setup

make themes/dracula

make deb/packages

make flatpak/packages
make flatpak/setup

make appimage/packages

make gnome/extensions
make gnome/sets
make gnome/shortcuts

make mise/packages
make vscode/extensions
make powershell/modules
