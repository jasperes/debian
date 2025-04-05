#!/usr/bin/env bash

swapfile_setup() {
    set -e

    # check swapfile exists
    CURRENT_SIZE=$(sudo wc -c $SWAP_FILE | awk '{print $1}' || echo '0')
    if [[ "$CURRENT_SIZE" != "${SWAP_SIZE}000000" ]]; then
        # delete current swapfile
        if [[ -f $SWAP_FILE ]]; then
            sudo swapoff $SWAP_FILE
            sudo rm $SWAP_FILE
        fi

        # create swap
        sudo dd if=/dev/zero of=$SWAP_FILE bs=1MB count=$SWAP_SIZE
    fi

    # setup swap
    if [[ -z $(swapon --show | grep "$SWAP_FILE file") ]]; then
        sudo chmod 600 $SWAP_FILE
        sudo mkswap $SWAP_FILE
        sudo swapon $SWAP_FILE
    fi

    # persist swap
    SWAP_CONFIG="$SWAP_FILE swap swap defaults 0 0"
    FSTAB=/etc/fstab
    if [[ -z $(grep $SWAP_CONFIG $FSTAB) ]]; then
        echo $SWAP_CONFIG | sudo tee -a $FSTAB
    fi
}
