#!/usr/bin/env bash

set -e

APPS_LIST="${RESOURCES}/repository/git.csv"

while read PKG; do
    FOLDER=''
    NAME=''
    REPO=''

    [[ "$(echo "$PKG" | sed 's/#.*//')" == "" ]] && continue

    n=0
    for ARG in ${PKG//;/ } ; do
        n=$((n+1))
        [[ "$n" = "1" ]] && FOLDER="$ARG"
        [[ "$n" = "2" ]] && NAME="$ARG"
        [[ "$n" = "3" ]] && REPO="$ARG"
    done

    echo "Updating ~/${FOLDER}/${NAME}..."
    cd ~/${FOLDER}/${NAME} && git pull --rebase &> /dev/null && echo "...Success!" || echo "...Failure!"
    echo
done < ${APPS_LIST}
