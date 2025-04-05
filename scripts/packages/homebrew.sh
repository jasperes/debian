#!/usr/bin/env bash

homebrew_installer() {
    set -e
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
    test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.bashrc
}

homebrew_packages() {
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    brew install $(grep -vE "^\s*#" ${RESOURCES}/homebrew/brews.txt  | tr "\n" " ")
}
