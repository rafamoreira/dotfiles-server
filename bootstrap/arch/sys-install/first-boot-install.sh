#!/bin/bash

pacman -Syu
pacman -S elinks zsh git

echo "type username: "
read user
useradd -m -s /bin/zsh $user
passwd $user
usermod -aG wheel,users,disk,storage $user

git clone https://github.com/rafamoreira/dotfiles.git /home/$user/dotfiles

echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
