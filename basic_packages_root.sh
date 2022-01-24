#!/bin/bash

set -x #echo on

pacman -Syu fish nano git wget kget nvidia nvidia-settings opencl-nvidia nvidia-utils mesa xf86-video-intel plasma-desktop sddm sddm-kcm kate konsole dolphin dolphin-plugins partitionmanager spectacle latte-dock sweeper kdeconnect plasma-systemmonitor powerdevil filelight kcron firewalld neofetch lolcat discover packagekit-qt5 fwupd kdeplasma-addons purpose qt5-webengine quota-tools plasma-nm kmix kde-gtk-config

systemctl enable NetworkManager
systemctl enable sddm

exit0
