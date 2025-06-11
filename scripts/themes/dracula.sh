#!/usr/bin/env bash

dracula_installer() {
    set -e

    rm -rf ~/.icons/Dracula-cursors || true
    rm -rf ~/.local/share/icons/Dracula || true
    rm -rf ~/.local/share/icons/Dracula-cursors || true
    rm -rf ~/.config/assets || true
    rm -rf ~/.config/gtk-2.0/Dracula || true
    rm -rf ~/.config/gtk-3.0/Dracula || true
    rm -rf ~/.config/gtk-3.20/Dracula || true
    rm -rf ~/.config/gtk-4.0/Dracula || true
    rm -rf ~/.config/gtk-4.0/gtk.css || true
    rm -rf ~/.config/gtk-4.0/gtk-dark.css || true
    rm -rf ~/.local/share/aurorae/themes/Dracula || true
    rm -rf ~/.local/share/color-schemes/Dracula.colors || true
    rm -rf ~/.local/share/plasma/desktoptheme/Dracula || true
    rm -rf ~/.local/share/plasma/desktoptheme/Dracula-Solid || true
    rm -rf ~/.local/share/plasma/look-and-feel/Dracula-kde5 || true
    rm -rf ~/.local/share/plasma/look-and-feel/Dracula-kde6 || true

    mkdir -p ~/.local/share/icons/ || true
    mkdir -p ~/.config/gtk-2.0/ || true
    mkdir -p ~/.config/gtk-3.0/ || true
    mkdir -p ~/.config/gtk-3.20/ || true
    mkdir -p ~/.config/gtk-4.0/ || true
    mkdir -p ~/.local/share/aurorae/themes/ || true
    mkdir -p ~/.local/share/color-schemes/ || true
    mkdir -p ~/.local/share/plasma/desktoptheme/ || true
    mkdir -p ~/.local/share/plasma/look-and-feel/ || true

    ln -s ~/.themes/Dracula/kde/cursors/Dracula-cursors ~/.icons/Dracula-cursors || true
    ln -s ~/.icons/Dracula ~/.local/share/icons/Dracula || true
    ln -s ~/.themes/Dracula/kde/cursors/Dracula-cursors ~/.local/share/icons/Dracula-cursors || true
    ln -s ~/.themes/Dracula/assets ~/.config/assets || true
    ln -s ~/.themes/Dracula/gtk-2.0 ~/.config/gtk-2.0/Dracula || true
    ln -s ~/.themes/Dracula/gtk-3.0 ~/.config/gtk-3.0/Dracula || true
    ln -s ~/.themes/Dracula/gtk-3.20 ~/.config/gtk-3.20/Dracula || true
    ln -s ~/.themes/Dracula/gtk-4.0 ~/.config/gtk-4.0/Dracula || true
    ln -s ~/.themes/Dracula/gtk-4.0/gtk.css ~/.config/gtk-4.0/gtk.css || true
    ln -s ~/.themes/Dracula/gtk-4.0/gtk-dark.css ~/.config/gtk-4.0/gtk-dark.css || true
    ln -s ~/.themes/Dracula/kde/aurorae/Dracula ~/.local/share/aurorae/themes/Dracula || true
    ln -s ~/.themes/Dracula/kde/color-schemes/Dracula.colors ~/.local/share/color-schemes/Dracula.colors || true
    ln -s ~/.themes/Dracula/kde/plasma/desktoptheme/Dracula ~/.local/share/plasma/desktoptheme/Dracula || true
    ln -s ~/.themes/Dracula/kde/plasma/desktoptheme/Dracula-Solid ~/.local/share/plasma/desktoptheme/Dracula-Solid || true
    ln -s ~/.themes/Dracula/kde/plasma/look-and-feel/Dracula ~/.local/share/plasma/look-and-feel/Dracula-kde5 || true
    ln -s ~/.themes/Dracula/kde/plasma/look-and-feel/Plasma6/Dracula ~/.local/share/plasma/look-and-feel/Dracula-kde6 || true

    # https://github.com/m4thewz/dracula-icons/pull/11
    (cd ~/.icons/Dracula/scalable/places && ln -s folder.svg inode-directory.svg || true)
}
