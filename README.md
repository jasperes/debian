# Debian Setup

Scripts to configure Debian SID.

## Software

The strategy is to:

- Use native packages minimally for core functionality to reduce conflicts
- Install desktop software via Flatpak for library isolation and security
- Manage common/daily tools using mise
- Use AppImage and DEB files as last-resort alternatives
- Source plugins directly from Git repositories
- Install programs via script only when it's the optimal method

## GPU Drivers

Separate installers are provided for AMD and NVIDIA:

- **AMD**: Uses native Mesa drivers
- **NVIDIA**: Uses proprietary drivers

## Desktop Environment

Currently configured for GNOME with environment-specific settings.

## Plugins

Script installs/configures plugins for:

- VS Code
- Zsh
- GNOME extensions
- Other tools

## Dotfiles

System settings are managed entirely through dotfiles, installed and configured using RCM.

## Manual Usage

Execute:

```sh
make run
```

or

```sh
mise tasks ls
```

## Script Usage

The setup can be installed via `install.sh`.

## Manual Post-Installation Steps

### GNOME Settings

- Keyboard configuration
- Monitor arrangement
- Wallpaper selection
- Power saving preferences
- User avatar setup

### GNOME Login (GDM)

```sh
nano /etc/gdm3/greeter.dconf-defaults
dpkg-reconfigure gdm3
```

### GNOME Extensions

- Open GNOME Tweaks
- Configure extensions

### Software Management

- Disable automatic system updates
