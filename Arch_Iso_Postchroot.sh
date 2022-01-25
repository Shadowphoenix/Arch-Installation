#!/bin/bash

ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime
nano /etc/localtime
echo arch > /etc/hostname
echo LANG=de_DE.UTF-8 > /etc/locale.conf
echo de_DE.UTF-8 > /etc/locale.gen
locale-gen
echo MEYMAP=de-latin1 > /etc/vconsole.conf
cat /etc/hosts
nano /etc/hosts
mkinitcpio -p linux
passwd
pacman -Syu grub efibootmgr os-prober
grub-install --target=x86_64-efi --efi-directory=/efi/ --bootloader-id=GRUB
nano /etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg
nano /etc/hosts
useradd -G wheel,audio,video -m neko
passwd neko
