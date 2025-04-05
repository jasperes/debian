#!/usr/bin/env bash

dracula_installer() {
    set -e

    TEMP_DIR="${TEMP}/dracula"

    rm -rf $TEMP_DIR || true
    mkdir -p $TEMP_DIR
    cd $TEMP_DIR

    wget "https://github.com/dracula/gtk/archive/refs/heads/master.zip" -O "dracula.zip"
    wget "https://github.com/m4thewz/dracula-icons/archive/refs/heads/main.zip" -O "dracula-icons.zip"

    unzip dracula.zip
    unzip dracula-icons.zip

    mkdir -p \
        ~/.themes \
        ~/.icons \
        ~/.config/assets \
        ~/.config/gtk-2.0 \
        ~/.config/gtk-3.0 \
        ~/.config/gtk-3.20 \
        ~/.config/gtk-4.0 \
        ~/.local/share/icons \
        ~/.local/share/aurorae/themes \
        ~/.local/share/color-schemes \
        ~/.local/share/plasma/desktoptheme \
        ~/.local/share/plasma/look-and-feel \
    ;

    rm -rf ~/.themes/Dracula || true
    rm -rf ~/.icons/Dracula || true
    rm -rf ~/.icons/Dracula-cursors || true
    rm -rf ~/.config/assets || true
    rm -rf ~/.config/gtk-2.0/Dracula || true
    rm -rf ~/.config/gtk-3.0/Dracula || true
    rm -rf ~/.config/gtk-3.20/Dracula || true
    rm -rf ~/.config/gtk-4.0/Dracula || true
    rm -rf ~/.config/gtk-4.0/gtk.css || true
    rm -rf ~/.config/gtk-4.0/gtk-dark.css || true
    rm -rf ~/.local/share/icons/Dracula || true
    rm -rf ~/.local/share/icons/Dracula-cursors || true
    rm -rf ~/.local/share/aurorae/themes/Dracula || true
    rm -rf ~/.local/share/color-schemes/Dracula.colors || true
    rm -rf ~/.local/share/plasma/desktoptheme/Dracula || true
    rm -rf ~/.local/share/plasma/look-and-feel/Dracula-kde5 || true
    rm -rf ~/.local/share/plasma/look-and-feel/Dracula-kde6 || true

    cp -r dracula-icons-main ~/.icons/Dracula
    cp -r gtk-master/assets ~/.config/assets
    cp -r gtk-master ~/.themes/Dracula
    cp -r gtk-master/gtk-2.0 ~/.config/gtk-2.0/Dracula
    cp -r gtk-master/gtk-3.0 ~/.config/gtk-3.0/Dracula
    cp -r gtk-master/gtk-3.20 ~/.config/gtk-3.20/Dracula
    cp -r gtk-master/gtk-4.0 ~/.config/gtk-4.0/Dracula
    cp -r gtk-master/gtk-4.0/gtk.css ~/.config/gtk-4.0/gtk.css
    cp -r gtk-master/gtk-4.0/gtk-dark.css ~/.config/gtk-4.0/gtk-dark.css
    cp -r dracula-icons-main ~/.local/share/icons/Dracula
    cp -r gtk-master/kde/cursors/Dracula-cursors ~/.local/share/icons/Dracula-cursors
    cp -r gtk-master/kde/aurorae/Dracula ~/.local/share/aurorae/themes/Dracula
    cp -r gtk-master/kde/color-schemes/Dracula.colors ~/.local/share/color-schemes/Dracula.colors
    cp -r gtk-master/kde/plasma/desktoptheme/Dracula ~/.local/share/plasma/desktoptheme/Dracula
    cp -r gtk-master/kde/plasma/desktoptheme/Dracula-Solid ~/.local/share/plasma/desktoptheme/Dracula-Solid
    cp -r gtk-master/kde/plasma/look-and-feel/Dracula ~/.local/share/plasma/look-and-feel/Dracula-kde5
    cp -r gtk-master/kde/plasma/look-and-feel/Plasma6/Dracula ~/.local/share/plasma/look-and-feel/Dracula-kde6

    # https://github.com/m4thewz/dracula-icons/pull/11
    (cd ~/.icons/Dracula/scalable/places && ln -s folder.svg inode-directory.svg)

    cd -; rm -rf $TEMP_DIR
}
