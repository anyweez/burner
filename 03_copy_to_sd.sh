#!/bin/bash

if [ "$#" -ne 2 ]; then
	echo "Usage: $0 image_name device_name"
	exit 1
fi

if [ ! -f $1 ]; then
	echo "Specified image file does not exist."
	exit 1
fi

if [[ ! "$1" =~ ^.+\.img$ ]]; then
	echo "Your input file needs to be a .img file."
	exit 1
fi

IMAGE_FILE=$1
OUTPUT_DEVICE=$2

sudo dd bs=4M if=$IMAGE_FILE of=$OUTPUT_DEVICE
