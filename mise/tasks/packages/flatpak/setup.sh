#!/usr/bin/env bash

OVERRIDE_FILE="${RESOURCES}/flatpak/override.csv"

while read -r OVR; do
    OPTION=''
    VALUE=''
    APP=''

    [[ "$(echo "$OVR" | sed 's/#.*//')" == "" ]] && continue

    n=0
    for ARG in ${OVR//;/ } ; do
        n=$((n+1))
        [[ "$n" = "1" ]] && OPTION="$ARG"
        [[ "$n" = "2" ]] && VALUE="$ARG"
        [[ "$n" = "3" ]] && APP="$ARG"
    done

    echo "Flatpak override ${OPTION}=${VALUE} ${APP}..."

    cmd="flatpak override --user --$OPTION=$VALUE $APP"
    $cmd

    echo "...Success!"
done < "${OVERRIDE_FILE}"
