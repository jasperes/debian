#!/usr/bin/env bash

set -e

APPS_LIST="${RESOURCES}/debian/deb.pkg.link.csv"
TEMP_DIR="${TEMP}/debs"

mkdir -p $TEMP_DIR

while read APP; do
    NAME=''
    LINK=''
    # DEPS=''

    [[ "$(echo "$APP" | sed 's/#.*//')" == "" ]] && continue

    n=0
    for ARG in ${APP//;/ } ; do
        n=$((n+1))
        [[ "$n" = "1" ]] && NAME="$ARG"
        [[ "$n" = "2" ]] && LINK="$ARG"
        # [[ "$n" = "3" ]] && DEPS="$ARG"
    done

    echo "Installing ${NAME}..."

    wget -O "${TEMP_DIR}/${NAME}.deb" "$LINK"

    sudo dpkg -i "${TEMP_DIR}/${NAME}.deb" || (
        sudo apt install --fix-broken --assume-yes && sudo dpkg -i "${TEMP_DIR}/${NAME}.deb"
    )

    echo "...Success!"
done < ${APPS_LIST}

rm -rf $TEMP_DIR
