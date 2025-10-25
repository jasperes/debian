#!/usr/bin/env bash

set -e

APPS_LIST="${RESOURCES}/appimage/images.pkg.git.csv"

mkdir -p $APPIMAGE_FOLDER

echo "AppImage Location: $APPIMAGE_FOLDER"

while read APP; do
    NAME=''
    REPO=''
    ARCH=''

    [[ "$(echo "$APP" | sed 's/#.*//')" == "" ]] && continue

    n=0
    for ARG in ${APP//;/ } ; do
        n=$((n+1))
        [[ "$n" = "1" ]] && NAME="$ARG"
        [[ "$n" = "2" ]] && REPO="$ARG"
        [[ "$n" = "3" ]] && ARCH="$ARG"
    done

    echo "Installing ${NAME}..."

    curl -s "https://api.github.com/repos/${REPO}/releases/latest" \
    | grep "browser_download_url.*${ARCH}.AppImage" \
    | cut -d : -f 2,3 \
    | tr -d \" \
    | wget -O "${APPIMAGE_FOLDER}/${NAME}.AppImage" -qi -

    chmod +x "${APPIMAGE_FOLDER}/${NAME}.AppImage"

    echo "...Success!"
done < ${APPS_LIST}
