#!/usr/bin/env bash

EXT_LIST="${RESOURCES}/gnome/extensions.list"

cat $EXT_LIST | while read i || [[ -n $i ]]; do
    busctl --user call org.gnome.Shell.Extensions /org/gnome/Shell/Extensions org.gnome.Shell.Extensions InstallRemoteExtension s ${i} &> /dev/null || true
done
