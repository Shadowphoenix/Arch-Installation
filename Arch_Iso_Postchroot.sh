#!/bin/bash

set -x #echo on

ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime
hwclock --systohc
echo "arch" > /etc/hostname
echo "LANG=de_DE.UTF-8 UTF-8" > /etc/locale.conf
echo "de_DE.UTF-8" >> /etc/locale.gen
locale-gen
echo "KEYMAP=de-latin1" > /etc/vconsole.conf
echo "127.0.0.1    localhost" >> /etc/hosts
echo "::1          localhost " >> /etc/hosts
echo "127.0.1.1    arch.localdomain    arch" >> /etc/hosts
nano /etc/hosts
mkinitcpio -p linux
passwd
pacman -Syu grub efibootmgr os-prober
grub-install --target=x86_64-efi --efi-directory=/efi/ --bootloader-id=GRUB
nano /etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg
useradd -s bash -d /home/neko -M neko
chown -R neko:neko /home/neko
passwd neko
