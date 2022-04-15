#!/bin/bash
# Run it on VPS that have 1GB or less RAM

sudo fallocate -l 1G /swapfile
sudo dd if=/dev/zero of=/swapfile bs=1024 count=1048576
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
echo '/swapfile swap swap defaults 0 0' | sudo tee -a /etc/fstab # for automatically using it on reboot
sudo swapon --show # for verification
sudo free -h # for verification
