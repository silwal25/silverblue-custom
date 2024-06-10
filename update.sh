#!/bin/bash

# Checking whether or not the script is running as root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# DateTime stamp for marking the build
date=$(date '+%Y%m%d')
time=$(date +%H%M%S)
dateTimeStamp=$date$time

# Using buildah to build and save it to a location
sudo buildah bud -t oci-archive:/var/cache/Images/silverblue-custom-$dateTimeStamp.tar.gz .

# Rebasing the current os to the above build
rpm-ostree rebase ostree-unverified-image:oci-archive:/var/cache/Images/silverblue-custom-$dateTimeStamp.tar.gz

# Rebooting sequence
read -p "Do you want to reboot? (Y/n): " prompt
if [[ $prompt == [Yy] ]]
  then 
    echo "Rebooting in 5......"
    sleep 1
    echo "Rebooting in 4......"
    sleep 1
    echo "Rebooting in 3......"
    sleep 1
    echo "Rebooting in 2......"
    sleep 1
    echo "Rebooting in 1......"
    sleep 1
    systemctl reboot
else if [[ $prompt == [Nn] ]]
  then exit
  fi
fi