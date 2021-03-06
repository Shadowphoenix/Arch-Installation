#!/bin/bash

set -x #Enables Terminaloutput

#setting QWERTZ As default Layout - not mandatory
loadkeys de-latin1

#enabling WLAN - deviate to other services as needed
iwctl

#enabling network-based time-sync
timedatectl set-npt true
timedatectl status

#formatting drives, replace /dev/nvme with your mountpoint (i.e. /dev/sda1)
lsblk
cfdisk /dev/nvme0n1


#Mounting / and swap
lsblk
mkfs.ext4 -L ROOT /dev/nvme0n1p6
mkswap -L SWAP /dev/nvme0n1p4
swapon /dev/nvme0n1p4
mount /dev/nvme0n1p6 /mnt

#Mounting EFI-Partition - Script uses Grub
mkdir /mnt/boot
mkdir /mnt/boot/EFI
mount /dev/nvme0n1p1 /mnt/boot/EFI

#Mountpoint for separate Homepartition, can be left out if doesnt exist
mkfs.ext4 -L HOME /dev/nvme0n1p7
mkdir /mnt/home
mount /dev/nvme0n1p7 /mnt/home

#Mountpoint for second drive to be used later, alter "install as needed"
mkdir /mnt/mnt/install

#base installation
pacstrap /mnt base base-devel linux linux-firmware dhcpcd nano iwd git
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt
