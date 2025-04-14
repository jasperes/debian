#!/usr/bin/env bash

deb_packages_git() {
    set -e

    APPS_LIST="${RESOURCES}/debian/deb.pkg.git.csv"
    TEMP_DIR="${TEMP}/debs"

    mkdir -p $TEMP_DIR

    while read APP; do
        NAME=''
        REPO=''
        ARCH=''
        TAG=''
        # DEPS=''

        [[ "$(echo "$APP" | sed 's/#.*//')" == "" ]] && continue

        n=0
        for ARG in ${APP//;/ } ; do
            n=$((n+1))
            [[ "$n" = "1" ]] && NAME="$ARG"
            [[ "$n" = "2" ]] && REPO="$ARG"
            [[ "$n" = "3" ]] && ARCH="$ARG"
            [[ "$n" = "4" ]] && TAG="$ARG"
            # [[ "$n" = "5" ]] && DEPS="$ARG"
        done

        echo "Installing ${NAME}..."

        curl -s "https://api.github.com/repos/${REPO}/releases/${TAG}" \
        | grep "browser_download_url.*${ARCH}.deb" \
        | cut -d : -f 2,3 \
        | tr -d \" \
        | wget -O "${TEMP_DIR}/${NAME}.deb" -qi -

        sudo dpkg -i "${TEMP_DIR}/${NAME}.deb" || (
            sudo apt install --fix-broken --assume-yes && sudo dpkg -i "${TEMP_DIR}/${NAME}.deb"
        )

        echo "...Success!"
    done < ${APPS_LIST}

    rm -rf $TEMP_DIR
}

deb_packages_link() {
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
}

deb_packages() {
    echo "Installing from Git..."
    deb_packages_git

    echo;

    echo "Installing from Links..."
    deb_packages_link

    echo; echo "All Done!"
}
