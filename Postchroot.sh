#!/bin/bash

set -x #Enables Terminaloutput

#setting systemtime
ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime
hwclock --systohc

#Configuring Hostname, Locale and localhost
echo "Arch" > /etc/hostname
echo "LANG=de_DE.UTF-8" > /etc/locale.conf
sed -i 's,#de_DE.UTF-8 UTF-8,de_DE.UTF-8 UTF-8,' /etc/locale.gen
locale-gen
echo "KEYMAP=de-latin1" > /etc/vconsole.conf
echo "127.0.0.1    localhost" >> /etc/hosts
echo "::1          localhost " >> /etc/hosts
echo "127.0.1.1    arch.localdomain    Arch" >> /etc/hosts

#Creating init-ramfs
mkinitcpio -p linux

#Altering Rootpassword
passwd

#Installing Grub
pacman -Syu --needed grub efibootmgr os-prober --noconfirm
grub-install --target=x86_64-efi --efi-directory=/boot/EFI --bootloader-id=GRUB

#Uncomment "Disable OS-Prober" if multibooting
sed -i 's,#GRUB_DISABLE_OS_PROBER=false,GRUB_DISABLE_OS_PROBER=false,' /etc/default/grub

#Writing Grub-Config to EFI-Directory
grub-mkconfig -o /boot/grub/grub.cfg

#Creating user - Remember to edit as needed, especially if your /home is not on a separate partition and hence got wiped during reinstallation
useradd -G wheel,audio,video,input -m neko
chown -R neko:neko /home/neko #User to own his ~/
passwd neko #set pw for user

#edit sudoers-file to add "wheel" to sudo
sed -i 's/^# %wheel ALL=(ALL) ALL/%wheel ALL=(ALL) ALL/' /etc/sudoers
sed -i 's/^# %wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL/' /etc/sudoers

#enabling multilib

sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf

pacman -Syu --needed fish nano plasma-desktop sddm sddm-kcm kate konsole dolphin firewalld neofetch lolcat firefox ntfs-3g exfatprogs networkmanager --noconfirm

systemctl enable NetworkManager
systemctl enable sddm
