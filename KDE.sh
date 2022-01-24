#!/bin/bash

set -x #echo on

pacman -Syu plasma-desktop sddm sddm-kcm kate konsole dolphin dolphin-plugins partitionmanager spectacle latte-dock libreoffice-fresh discord firefox sweeper kdeconnect plasma-systemmonitor powerdevil filelight kcron firewalld neofetch lolcat discover packagekit-qt5 fwupd obs-studio kdeplasma-addons purpose qt5-webengine quota-tools plasma-nm kmix kde-gtk-config

systemctl enable NetworkManager
systemctl enable sddm

exit0
