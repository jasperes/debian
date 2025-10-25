#!/usr/bin/env bash

set -e

STC_LIST="${RESOURCES}/gnome/shortcuts.csv"

# create shortcuts array
n=0
while read s; do
    [[ "$n" != "0" ]] && GSET_ARRAY="${GSET_ARRAY},"
    GSET_ARRAY="${GSET_ARRAY}'/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom${n}/'"
    n=$((n+1))
done < ${STC_LIST}

gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "[$GSET_ARRAY]"

# install each from array
n=0
while read s; do
    nn=0
    for sk in ${s//;/ } ; do
        nn=$((nn+1))
        [[ "$nn" = "1" ]] && gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom${n}/ binding "$sk"
        [[ "$nn" = "2" ]] && gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom${n}/ command "$sk"
        [[ "$nn" = "3" ]] && gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom${n}/ name "$sk"
    done
    n=$((n+1))
done < ${STC_LIST}

# success
true
