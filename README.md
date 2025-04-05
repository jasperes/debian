# Debian Setup

Scripts to configure Debian SID.

This distro will use Flatpak and Homebrew for updated softwares.

Kernel, Drivers, Sudo Softwares and Core Libs will use APT to install.

Dotfiles will configure the system settings.

## Requirements

Install make

```sh
apt install make
```

## Usage

```sh
make [options...]
```

For more help:

```sh
make help
```

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
