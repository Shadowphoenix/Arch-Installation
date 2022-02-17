#!/bin/bash

set -x #Enables Terminaloutput

#setting systemtime
ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime
hwclock --systohc

#Configuring Hostname, Locale and localhost
echo "Arch" > /etc/hostname
echo "LANG=de_DE.UTF-8" > /etc/locale.conf
echo "de_DE.UTF-8  UTF-8" >> /etc/locale.gen
locale-gen
echo "KEYMAP=de-latin1" > /etc/vconsole.conf
echo "127.0.0.1    localhost" >> /etc/hosts
echo "::1          localhost " >> /etc/hosts
echo "127.0.1.1    arch.localdomain    arch" >> /etc/hosts

#Creating init-ramfs
mkinitcpio -p linux

#Altering Rootpassword
passwd

#Installing Grub
pacman -Syu grub efibootmgr os-prober
grub-install --target=x86_64-efi --efi-directory=/boot/EFI --bootloader-id=GRUB

#Uncomment "Disable OS-Prober" if multibooting
nano /etc/default/grub

#Writing Grub-Config to EFI-Directory
grub-mkconfig -o /boot/grub/grub.cfg

#Creating user - Remember to edit as needed, especially if your /home is not on a separate partition and hence got wiped during reinstallation
useradd -d /home/neko -M neko #redirecting the user to already existing homepartition
chown -R neko:neko /home/neko #User to own his ~/
passwd neko #set pw for user
EDITOR=nano visudo #edit sudoers-file to add "wheel" to sudo
usermod --append --groups wheel neko #adding user to group wheel (grants sudoprivilege)

#installing SDDM + KDE + Videodrivers as well as nano and fish-shell

pacman -Syu --needed fish nano wget kget nvidia nvidia-settings opencl-nvidia nvidia-utils mesa xf86-video-intel plasma-desktop sddm sddm-kcm kate konsole dolphin dolphin-plugins partitionmanager spectacle latte-dock sweeper kdeconnect plasma-systemmonitor plasma-firewall powerdevil filelight kcron firewalld neofetch lolcat discover packagekit-qt5 fwupd kdeplasma-addons purpose qt5-webengine quota-tools plasma-nm kmix kde-gtk-config firefox ntfs-3g exfatprogs kgamma5

systemctl enable NetworkManager
systemctl enable sddm

#installing other stuff and winedependencies - enable Multilib beforehand
nano /etc/pacman.conf

pacman -Syu --needed steam steam-native-runtime wine winetricks lib32-opencl-nvidia lib32-vulkan-intel wine-mono wine-gecko libreoffice-fresh discord obs-studio giflib lib32-giflib libpng lib32-libpng libldap lib32-libldap gnutls lib32-gnutls mpg123 lib32-mpg123 openal lib32-openal v4l-utils lib32-v4l-utils libpulse lib32-libpulse alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib libjpeg-turbo lib32-libjpeg-turbo libxcomposite lib32-libxcomposite libxinerama lib32-libxinerama ncurses lib32-ncurses opencl-icd-loader lib32-opencl-icd-loader libxslt lib32-libxslt libva lib32-libva gtk3 lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader cups samba dosbox lutris pycharm-community-edition ipython intellij-idea-community-edition lldb

