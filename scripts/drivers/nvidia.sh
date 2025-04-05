#!/usr/bin/env bash

### STEP 1: pre-install ###
nvidia_prepare() {
    # validate permissions
    [[ $DISPLAY ]] && echo "Plean run without GUI" && exit 1
    [[ "$EUID" -ne 0 ]] && echo "Please run as root" && exit 1
    [[ ! -f "$NVIDIA_INSTALLER" ]] && echo "Incorrect NVidia installer path" && exit 1

	# login as root
	sudo su

	# add 32bit
	dpkg --add-architecture i386
	apt update

	# install dependencies
	apt install \
		linux-headers-amd64 \
		build-essential \
		libglvnd-dev \
		pkg-config \
		libc6:i386 \
	;

	# first install driver nvidia: remove nouveau
	chmod +x "$NVIDIA_INSTALLER"
	$NVIDIA_INSTALLER

	# restart
	reboot
}

### STEP 2: install ###
nvidia_installer() {
    # validate permissions
    [[ $DISPLAY ]] && echo "Plean run without GUI" && exit 1
    [[ "$EUID" -ne 0 ]] && echo "Please run as root" && exit 1
    [[ ! -f "$NVIDIA_INSTALLER" ]] && echo "Incorrect NVidia installer path" && exit 1

	# second install driver nvidia: install
	chmod +x "$NVIDIA_INSTALLER"
	$NVIDIA_INSTALLER

	# restart
	reboot
}

### STEP 3: post-install ###
nvidia_setup() {
	(
        # login as root
        sudo su

        # add nvidia to grub kernel module
        echo 'GRUB_CMDLINE_LINUX="$GRUB_CMDLINE_LINUX nvidia-drm.modeset=1"' > /etc/default/grub.d/nvidia-modeset.cfg

        # setup nvidia
        echo 'options nvidia NVreg_PreserveVideoMemoryAllocations=1' > /etc/modprobe.d/nvidia-power-management.conf
    )

    # update grub
    sudo update-grub

    # update xconfig to use prime
    [[ "$NVIDIA_PRIME" == "true" ]] && sudo nvidia-xconfig --prime

	# restart
	sudo reboot
}
