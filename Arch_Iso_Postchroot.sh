#!/bin/bash

set -x #echo on

ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime
hwclock --systohc
echo "arch" > /etc/hostname
echo "LANG=de_DE.UTF-8" > /etc/locale.conf
echo "de_DE.UTF-8  UTF-8" >> /etc/locale.gen
locale-gen
echo "KEYMAP=de-latin1" > /etc/vconsole.conf
echo "127.0.0.1    localhost" >> /etc/hosts
echo "::1          localhost " >> /etc/hosts
echo "127.0.1.1    arch.localdomain    arch" >> /etc/hosts
mkinitcpio -p linux
passwd
pacman -Syu grub efibootmgr os-prober
grub-install --target=x86_64-efi --efi-directory=/efi/ --bootloader-id=GRUB
nano /etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg
useradd -d /home/neko -M neko
chown -R neko:neko /home/neko
passwd neko


#installing SDDM + KDE + Videodrivers 

pacman -Syu fish nano wget kget nvidia nvidia-settings opencl-nvidia nvidia-utils mesa xf86-video-intel plasma-desktop sddm sddm-kcm kate konsole dolphin dolphin-plugins partitionmanager spectacle latte-dock sweeper kdeconnect plasma-systemmonitor powerdevil filelight kcron firewalld neofetch lolcat discover packagekit-qt5 fwupd kdeplasma-addons purpose qt5-webengine quota-tools plasma-nm kmix kde-gtk-config firefox ntfs-3g exfatprogs kgamma5

systemctl enable NetworkManager
systemctl enable sddm

#installing other stuff and winedependencies - enable Multilib beforehand
sudo nano /etc/pacman.conf

sudo pacman -Syu steam steam-native-runtime wine winetricks lib32-opencl-nvidia lib32-vulkan-intel wine-mono wine-gecko libreoffice-fresh discord obs-studio giflib lib32-giflib libpng lib32-libpng libldap lib32-libldap gnutls lib32-gnutls mpg123 lib32-mpg123 openal lib32-openal v4l-utils lib32-v4l-utils libpulse lib32-libpulse alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib libjpeg-turbo lib32-libjpeg-turbo libxcomposite lib32-libxcomposite libxinerama lib32-libxinerama ncurses lib32-ncurses opencl-icd-loader lib32-opencl-icd-loader libxslt lib32-libxslt libva lib32-libva gtk3 lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader cups samba dosbox lutris
