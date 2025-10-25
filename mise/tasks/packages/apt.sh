#!/usr/bin/env bash

set -e
sudo apt update
sudo apt install -y $(grep -vE "^\s*#" ${RESOURCES}/debian/apt.list  | tr "\n" " ")
