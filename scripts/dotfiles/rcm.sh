#!/usr/bin/env bash

rcm_setup() {
    set -e
    cp "${RC_FOLDER}/rcrc" ~/.rcrc
    rcup -v
}
