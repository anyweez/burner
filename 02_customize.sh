#!/bin/bash

if [ "$#" -ne 1 ]; then
        echo "Usage: $0 image_name"
        exit 1
fi

if [[ ! "$1" =~ ^.+\.img$ ]]; then
        echo "Your input file needs to be a .img file."
        exit 1
fi

echo $1
sudo kpartx -av $1
sudo mount /dev/mapper/loop0p2 mnt
sudo chown -R `whoami` mnt
sudo chgrp -R `whoami` mnt

# Set up some env variables and call an external script that establishes what we should
# actually be doing to this image. Everything should be relative to IMAGE_ROOT.
#
# TODO: is there a way to ensure its relative to IMAGE_ROOT and can't be higher in the hierarchy?
printf "Running preparation script..."
IMAGE_ROOT=`pwd`/mnt
. scripts/prepare.sh

# Revert permissions and unmount. Image is ready to go!
sudo chown -R root mnt
sudo chgrp -R root mnt
sudo umount mnt
sudo kpartx -d $1
