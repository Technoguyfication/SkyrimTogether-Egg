#!/bin/ash

# SkyrimTogether Egg Installation Script
# Author: Hayden Andreyka (haydenandreyka@gmail.com)

# Description: Uses custom installer image that contains SkyrimTogether binaries and copies binaries to mounted persistent folder on Pterodactyl.
# This setup is not ideal but due to the "creative" build process of the ST server, it's the most reliable solution possible.

# Delete existing binaries
if [ -d "/mnt/server/bin" ]
then
    rm -rf /mnt/server/bin/*
else
    mkdir -p /mnt/server/bin
fi
# Copy binaries from their home on installer image to the persistent mount point
cp /home/server/* /mnt/server/bin

# Done!
echo "Done installing. Re-run the installer to update the server."
