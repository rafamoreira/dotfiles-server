#! /bin/bash

# ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
# hwclock --systohc
# sed -i 's/^#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
# sed -i 's/^#pt_BR.UTF-8 UTF-8/pt_BR.UTF-8 UTF-8/' /etc/locale.gen
# locale-gen
# echo "LANG=en_US.UTF-8" >> /etc/locale.conf
# echo "KEYMAP=us-acentos" >> /etc/vconsole.conf
# echo "127.0.0.1	localhost" >> /etc/hosts
# echo "::1 localhost" >> /etc/hosts
# echo "127.0.1.1 jupiter.rafaelmoreira.org jupiter" >> /etc/hosts
# systemctl enable dhcpcd.service
# mkinitcpio -p linux
# passwd
# pacman -Syu
# pacman -S vim intel-ucode grub efibootmgr
# grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=arch
# sed -i 's/^GRUB_CMDLINE_LINUX_DEFAULT="quiet"/GRUB_CMDLINE_LINUX_DEFAULT=""/' /etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg
