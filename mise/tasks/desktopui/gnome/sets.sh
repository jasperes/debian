#!/usr/bin/env bash

SET_LIST="${RESOURCES}/gnome/sets.list"

while read set; do
    cmd="gsettings set $set"
    $cmd
done < ${SET_LIST}
