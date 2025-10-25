#!/bin/env bash

set -e

LOCAL_BIN=$(realpath ./bin)
PATH="$LOCAL_BIN:$PATH"

mise run install
