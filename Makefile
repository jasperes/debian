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

shell/setup: ##@ configure shell terminal
	@source $(SCRIPTS)/core/shell.sh
	shell_setup

##@
##@ packages
##@

apt/packages: ##@ install apt packages
	@source $(SCRIPTS)/packages/apt.sh
	apt_packages

deb/packages: ##@ install deb packages
	@source $(SCRIPTS)/packages/deb.sh
	deb_packages

flatpak/packages: ##@ install flatpak packages
	@source $(SCRIPTS)/packages/flatpak.sh
	flatpak_packages

flatpak/setup: ##@ configure flatpak settings
	@source $(SCRIPTS)/packages/flatpak.sh
	flatpak_setup

appimage/packages: ##@ install appimage packages
	@source $(SCRIPTS)/packages/appimage.sh
	appimage_packages

git/clone: ##@ clone git projects
	@source $(SCRIPTS)/packages/git.sh
	git_clone

git/update: ##@ update git projects
	@source $(SCRIPTS)/packages/git.sh
	git_update

script/packages: ##@ install programs from script
	@source $(SCRIPTS)/packages/script.sh
	script_packages

##@
##@ dotfiles
##@

rcm/setup: ##@ configure dotfiles
	@source $(SCRIPTS)/dotfiles/rcm.sh
	rcm_setup

##@
##@ softwares
##@

mise/packages: ##@ install mise packages
	@source $(SCRIPTS)/softwares/mise.sh
	mise_packages

vscode/extensions: ##@ install vscode extensions
	@source $(SCRIPTS)/softwares/vscode.sh
	vscode_extensions

powershell/modules: ##@ install powershell modules
	@source $(SCRIPTS)/softwares/pwsh.sh
	powershell_modules

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

misc/ssh: ##@ generate ssh keys
	@source $(SCRIPTS)/misc/ssh.sh
	ssh_generate

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
