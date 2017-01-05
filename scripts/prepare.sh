# IMAGE_ROOT is the / directory of the mounted image. All changes should be relative
# to this path!

# Create a /boot/ssh file. This will enable ssh by default.
touch $IMAGE_ROOT/boot/ssh

# Enable automatic updates (needs to be paired with apt-get install unattended-upgrades on boot)
printf "APT::Periodic::Update-Package-Lists \"1\";\nAPT::Periodic::Unattended-Upgrade \"1\";" > $IMAGE_ROOT/etc/apt/apt.conf.d/20auto-upgrades
