#!/usr/bin/env bash

set -e
rm -f ~/.rcrc
cp "${RC_FOLDER}/rcrc" ~/.rcrc
rcup -v
