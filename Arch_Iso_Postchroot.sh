#!/bin/bash

ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime
hwclock --systohc
echo "arch" > /etc/hostname
nano /etc/hostname
echo "LANG=de_DE.UTF-8" > /etc/locale.conf
nano /etc/locale.conf
echo "de_DE.UTF-8" >> /etc/locale.gen
nano /etc/locale.gen
locale-gen
echo MEYMAP=de-latin1 > /etc/vconsole.conf
echo "127.0.0.1 localhost \n ::1  localhost \n 127.0.1.1 arch.localdomain arch" >> /etc/hosts
nano /etc/hosts
mkinitcpio -p linux
passwd
pacman -Syu grub efibootmgr os-prober
grub-install --target=x86_64-efi --efi-directory=/efi/ --bootloader-id=GRUB
nano /etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg
useradd -G wheel,audio,video -m neko
passwd neko
