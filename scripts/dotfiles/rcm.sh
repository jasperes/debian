#!/usr/bin/env bash

rcm_setup() {
    set -e
    rm -f ~/.rcrc
    cp "${RC_FOLDER}/rcrc" ~/.rcrc
    rcup -v
}
