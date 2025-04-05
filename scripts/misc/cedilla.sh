#!/usr/bin/env bash

cedilla_setup() {
    set -e

    # add cedilla
    ENVIRONMENT_FILE="/etc/environment"

    ## set gtk cedilla
    GTK_CONFIG="GTK_IM_MODULE=cedilla"
    if [[ -z $(grep $GTK_CONFIG $ENVIRONMENT_FILE) ]]; then
        echo $GTK_CONFIG | sudo tee -a $ENVIRONMENT_FILE
    fi

    ## set qt cedilla
    QT_CONFIG="QT_IM_MODULE=cedilla"
    if [[ -z $(grep $QT_CONFIG $ENVIRONMENT_FILE) ]]; then
        echo $QT_CONFIG | sudo tee -a $ENVIRONMENT_FILE
    fi
}
