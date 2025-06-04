# Debian Setup

Scripts to configure Debian SID.

## Softwares

The idea is to use native packages only minimal to work,
getting less conflicts or possible problems.

I'll use Flatpak for desktop softwares, isolating libs and security.

Mise to install common or daily tools.

App Image and DEB files as an alternative, but last.

Git repos for source projects, like plugins.

Programs installed via script are specific, only when i see as best way to install.

## GPU Drivers

Theres is two installers for AMD and NVidia.

For AMD it uses native drivers (Mesa).

For NVidia it uses proprietarie drivers.
It is difficult to install and maintain,
i have not configured everything needed to work with it.

## Desktop Environment

Current i am using Gnome and configure with it in mind.

## Plugins

This script install and configure plugins for softwares, like VSCode, ZSH, Gnome, etc.

## Dotfile

Dotfiles will configure the system settings.
Everything is installed and configured with dofile settings.

To manage dotfiles i am using RCM.

## Requirements

Install make

```sh
apt install make
```

## Manual Usage

Run

```sh
make [options...]
```

For more help:

```sh
make help
```

## Script Usage

The current setup is installed with `install.sh` script.

## Manual Setups

Post instalation, somethings must be configured manually.

### Gnome Settings

- keyboard
- monitor
- wallpaper
- power saving
- user avatar

### Gnome Login (GDM)

- nano /etc/gdm3/greeter.dconf-defaults
- dpkg-reconfigure gdm3

### Gnome Extensions

- open tweaks
- edit extensions

### Softwares

- Disable auto update system
