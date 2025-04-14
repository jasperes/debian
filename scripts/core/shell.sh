#!/usr/bin/env bash

shell_setup() {
    set -e

    # add shells
    SHELLS_FILE=/etc/shells

    ## add zsh
    ZSH_FILE=/bin/zsh
    if [[ -f $ZSH_FILE ]] && [[ -z $(grep $ZSH_FILE $SHELLS_FILE) ]]; then
        echo $ZSH_FILE | sudo tee -a $SHELLS_FILE
    fi

    ## add tmux
    TMUX_FILE=/bin/tmux
    if [[ -f $TMUX_FILE ]] && [[ -z $(grep $TMUX_FILE $SHELLS_FILE) ]]; then
        echo $TMUX_FILE | sudo tee -a $SHELLS_FILE
    fi

    # configure default terminal
    sudo update-alternatives --config x-terminal-emulator

    # configure default shell
    chsh -s $SHELL_BIN $USER
}
