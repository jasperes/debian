#!/usr/bin/env bash

flatpak_packages() {
    flatpak remote-add --user --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
    flatpak install --user flathub -y $(grep -vE "^\s*#" ${RESOURCES}/flatpak/flatpaks.txt  | tr "\n" " ")
}

flatpak_setup() {
    # setup filesystem
    OVERRIDE_FILE="${RESOURCES}/flatpak/override.txt"

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
}
