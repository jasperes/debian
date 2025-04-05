SHELL = /bin/bash

.DEFAULT_GOAL := help
.ONESHELL:

include Makefile.config
export

##@
##@ drivers
##@

amd/installer: ##@ install amd drivers
	@source $(SCRIPTS)/drivers/nvidia.sh
	amd_installer

nvidia/prepare: ##@ prepare nvidia driver (run without gui, as root)
	@source $(SCRIPTS)/drivers/nvidia.sh
	nvidia_prepare

nvidia/installer: ##@ install nvidia drivers (run without gui, as root)
	@source $(SCRIPTS)/drivers/nvidia.sh
	nvidia_installer

nvidia/setup: ##@ configure nvidia
	@source $(SCRIPTS)/drivers/nvidia.sh
	nvidia_setup

##@
##@ core
##@

swapfile/setup: ##@ configure swapfile
	@source $(SCRIPTS)/core/swapfile.sh
	swapfile_setup

##@
##@ packages
##@

apt/packages: ##@ install apt packages
	@source $(SCRIPTS)/packages/apt.sh
	apt_packages

homebrew/installer: ##@ install homebrew manager
	@source $(SCRIPTS)/packages/homebrew.sh
	homebrew_installer

homebrew/packages: ##@ install homebrew packages
	@source $(SCRIPTS)/packages/homebrew.sh
	homebrew_packages

flatpak/packages: ##@ install flatpak packages
	@source $(SCRIPTS)/packages/flatpak.sh
	flatpak_packages

flatpak/setup: ##@ configure flatpak settings
	@source $(SCRIPTS)/packages/flatpak.sh
	flatpak_setup

appimage/packages: ##@ install appimage packages
	@source $(SCRIPTS)/packages/appimage.sh
	appimage_packages

mise/installer: ##@ install mise
	@source $(SCRIPTS)/packages/mise.sh
	mise_installer

mise/packages: ##@ install mise packages
	@source $(SCRIPTS)/packages/mise.sh
	mise_packages

##@
##@ dotfiles
##@

rcm/setup: ##@ configure rcm
	@source $(SCRIPTS)/dotfiles/rcm.sh
	rcm_setup

##@
##@ shell
##@

ohmyzsh/installer: ##@ install oh my zshell
	@source $(SCRIPTS)/shell/ohmyzsh.sh
	ohmyzsh_installer

shell/setup: ##@ configure shell terminal
	@source $(SCRIPTS)/shell/shell.sh
	shell_setup

##@
##@ softwares
##@

docker/installer: ##@ install docker
	@source $(SCRIPTS)/softwares/docker.sh
	docker_installer

vscode/extensions: ##@ install vscode extensions
	@source $(SCRIPTS)/softwares/vscode.sh
	vscode_extensions

powershell/installer: ##@ install powershell
	@source $(SCRIPTS)/softwares/powershell.sh
	powershell_installer

amdgputop/installer: ##@ install amdgpu_top
	@source $(SCRIPTS)/softwares/amdgputop.sh
	amdgputop_installer

wallpaper-engine/kde/installer: ##@ install wallpaper engine for kde
	@source $(SCRIPTS)/softwares/wallpaper-engine.sh
	wallpaper_engine_kde_installer

##@
##@ desktop environments
##@

gnome/sets: ##@ configure gnome sets
	@source $(SCRIPTS)/desktop_environment/gnome.sh
	gnome_sets

gnome/shortcuts: ##@ configure gnome shortcuts
	@source $(SCRIPTS)/desktop_environment/gnome.sh
	gnome_shortcuts

gnome/extensions: ##@ configure gnome extensions
	@source $(SCRIPTS)/desktop_environment/gnome.sh
	gnome_extensions

##@
##@ themes
##@

themes/dracula: ##@ install dracula theme
	@source $(SCRIPTS)/themes/dracula.sh
	dracula_installer

##@
##@ misc
##@

misc/cedilla: ##@ configure cedilla
	@source $(SCRIPTS)/misc/cedilla.sh
	cedilla_setup

# https://gist.github.com/prwhite/8168133
help: ##@ show this help
	@printf "\n usage: make [options...]\n"
	@grep -F -h "##@" $(MAKEFILE_LIST) | grep -F -v grep -F | sed -e 's/\\$$//' | awk 'BEGIN {FS = ":*[[:space:]]*##@[[:space:]]*"}; \
	{ \
		if($$2 == "") \
			pass; \
		else if($$0 ~ /^#/) \
			printf "\n %s\n\n", $$2; \
		else if($$1 == "") \
			printf "     %-20s%s\n", "", $$2; \
		else \
			printf "    \033[34m%-20s\033[0m %s\n", $$1, $$2; \
	}'
	@echo
