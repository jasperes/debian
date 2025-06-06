#!/usr/bin/env bash

ssh_generate() {
    set -e

    SSH_KEYS="${RESOURCES}/ssh/gen.csv"

    while read PKG; do
        EMAIL=''
        FILE=''

        [[ "$(echo "$PKG" | sed 's/#.*//')" == "" ]] && continue

        n=0
        for ARG in ${PKG//;/ } ; do
            n=$((n+1))
            [[ "$n" = "1" ]] && EMAIL="$ARG"
            [[ "$n" = "2" ]] && FILE="${HOME}/.ssh/${ARG}"
        done

        if [[ -f "$FILE" ]]; then
            echo "Ignoring Key $FILE that already exists."
        else
            echo "Generating SSH for $EMAIL for $FILE..."
            ssh-keygen -t rsa -b 4096 -C "$EMAIL" -f "$FILE" && echo "...Success!" || echo "...Failure!"
            echo
        fi
    done < ${SSH_KEYS}
}
