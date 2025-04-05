#!/usr/bin/env bash

vscode_extensions() {
    for x in $(grep -vE "^\s*#" ${RESOURCES}/vscode/extensions.txt  | tr "\n" " "); do 
        code --install-extension $x
    done
}
