#!/usr/bin/env bash

script_packages() {
    set -e

    APPS_LIST="${RESOURCES}/repository/script.csv"

    while read PKG; do
        NAME=''
        LINK=''
        SHELL=''

        [[ "$(echo "$PKG" | sed 's/#.*//')" == "" ]] && continue

        n=0
        for ARG in ${PKG//;/ } ; do
            n=$((n+1))
            [[ "$n" = "1" ]] && NAME="$ARG"
            [[ "$n" = "2" ]] && LINK="$ARG"
            [[ "$n" = "3" ]] && SHELL="$ARG"
        done

        echo "Installing ${NAME} from $SHELL..."
        curl -fsSL "$LINK" | $SHELL && echo "...Success!" || echo "...Failure!"
        echo
    done < ${APPS_LIST}
}
