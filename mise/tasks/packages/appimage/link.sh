#!/usr/bin/env bash

set -e

APPS_LIST="${RESOURCES}/appimage/images.pkg.link.csv"

mkdir -p $APPIMAGE_FOLDER

echo "AppImage Location: $APPIMAGE_FOLDER"

while read APP; do
    NAME=''
    LINK=''

    [[ "$(echo "$APP" | sed 's/#.*//')" == "" ]] && continue

    n=0
    for ARG in ${APP//;/ } ; do
        n=$((n+1))
        [[ "$n" = "1" ]] && NAME="$ARG"
        [[ "$n" = "2" ]] && LINK="$ARG"
    done

    echo "Installing ${NAME}..."

    wget -O "${APPIMAGE_FOLDER}/${NAME}.AppImage" "$LINK"

    chmod +x "${APPIMAGE_FOLDER}/${NAME}.AppImage"

    echo "...Success!"
done < ${APPS_LIST}
