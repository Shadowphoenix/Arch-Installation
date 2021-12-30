# Arch-Installation
## Disclaimer
Script of commands for mostly unattended Installation of Arch Linux, hopefully all the way to installation of KDE Plasma, my primary desktop atm.

I kinda want to go in a similar way to the ArchTitus-Scripts where you call certain scripts as steps through one Masterscript as needed. Like that one doesnt need to scim through the entire script to make changes as needed but can pull up specificparts or even disable them entirely



Rather than just lazily forking someone else i want to use this project as a means to get more proficient with bashfile-scripting so this will be from 0 with all the potential hassle included.

The following planned steps are as of now probably incomplete and will likely change over the course of the project and are in no particular order - Tips and ideas are always welcome :) 

# Already working stuff

### Installationscript for general purpose tools (to be executed as root rather than sudo)
  fish
  nano
  vim
  micro
  git
  wget
  kget
  nvidia
  nvidia-settings
  opencl-nvidia
  lib32-opencl-nvidia
  nvidia-utils
  lib32-nvidia-utils
  mesa
  xf86-video-intel


### AUR-Helpers
  Pamac-Aur
  Yay

# To Do

### Arch itself - probably the hardest part?

  Initial Installation
  1 user account
  snapper + config
  grub + config
  grub-btrfs
  snap-pac
  enabling multilib
  linux-Kernel
  linux-firmware
  base
  base-devel

### Desktop Environment and other packages i always install
  sddm
  sddm-kcm
  plasma-desktop
  kdeplasma-addons
  kate
  konsole
  dolphin
  dolphin-plugins
  partitionmanager
  spectacle
  latte-dock
  libreoffice-fresh
  discord
  steam
  firefox
  discover + optionals
  sweeper
  kdeconnect
  plasma-systemmonitor
  powerdevil
  filelight
  font-forge
  kcron
  lutris
  
## Other stuff
Optionals

### Eye-Candy
  Automatically set fish as primary shell - YES I WANT THAT :P
  neofetch|lolcat on konsole-boot
  Full/Partly installation of the KDE Sweet Dark Global Theme
  Transparency
  KDE Force-Blur (currently requires the useage of X11)

### Script to automatically pull my most common tools from the AUR using yay

  davinci-resolve
  bottles-git
  dxvk-bin
  isw
  lib32-dxvk
  libdxvk
  ntfix-git
  optimus-manager
  optimus-manager-qt
  protondb-tags-git
  proton-ge-custom-bin
  protontricks-git
  q4wine
  ruby-fusuma
  vk3d-proton-git
  wine-ge-custom
  winetricks-git
  winscp
  ytmdesktop-bin
