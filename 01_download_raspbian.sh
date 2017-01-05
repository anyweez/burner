wget --content-disposition https://downloads.raspberrypi.org/raspbian_lite_latest

# Unzip to get .img file
unzip *.zip -d images/

# Delete zip files
rm *.zip
