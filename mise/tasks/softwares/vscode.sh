#!/usr/bin/env bash

for x in $(grep -vE "^\s*#" ${RESOURCES}/vscode/extensions.list  | tr "\n" " "); do
    code --install-extension $x
done
