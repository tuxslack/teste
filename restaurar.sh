#!/bin/bash

# Script usado no sysresccd para clonar e restaurar imagem de sistema (Windows 10 Pro).

clear

# HD="/dev/sdc"

echo "
Dispositivo localizados:
"

fdisk -l | grep /dev/sd | grep Disk  | awk '{print $2}'| sort  | cut -d: -f1 
# fdisk -l | grep /dev/sd | grep Disco | awk '{print $2}'| sort  | cut -d: -f1

lsblk -o KNAME,TYPE,FSTYPE,SIZE,LABEL,UUID,MOUNTPOINT


echo "
Qual o dispositivo que será usado na restauração da imagem? Ex: /dev/sdc"
read HD


sfdisk –force $HD sda.sf

dd if=sda-mbr of=$HD bs=512 count=1

cat sda1.ntfs-ptcl-img.gz.a* | gunzip -c | partclone.ntfs -N -d -r -s  - -o "$HD"1
cat sda2.ntfs-ptcl-img.gz.a* | gunzip -c | partclone.ntfs -N -d -r -s  - -o "$HD"2

