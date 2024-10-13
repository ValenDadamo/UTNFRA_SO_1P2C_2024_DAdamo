#!/bin/bash

DISK="/dev/sdc"

# Creacion de particiones
sudo fdisk $DISK << EOF
n
p
1

+1G
n
p
2

+1G
n
p
3

+1G
n
e
4

n
l

+1G
n
l

+1G
n
l

+1G
n
l

+1G
n
l

+1G
n
l

+1G
n
l

+1G
n
l


w
EOF

# Formateo de particiones
sudo mkfs.ext4 ${DISK}1
sudo mkfs.ext4 ${DISK}2
sudo mkfs.ext4 ${DISK}3
sudo mkfs.ext4 ${DISK}5
sudo mkfs.ext4 ${DISK}6
sudo mkfs.ext4 ${DISK}7
sudo mkfs.ext4 ${DISK}8
sudo mkfs.ext4 ${DISK}9
sudo mkfs.ext4 ${DISK}10
sudo mkfs.ext4 ${DISK}11

# Escribir en /etc/fstab para indicar donde se montaran las particiones
echo "${DISK}1     /Examenes-UTN/alumno_1/parcial_1     ext4    defaults        0 0" | sudo tee -a /etc/fstab
echo "${DISK}2     /Examenes-UTN/alumno_1/parcial_2     ext4    defaults        0 0" | sudo tee -a /etc/fstab
echo "${DISK}3     /Examenes-UTN/alumno_1/parcial_3     ext4    defaults        0 0" | sudo tee -a /etc/fstab
echo "${DISK}5     /Examenes-UTN/alumno_2/parcial_1     ext4    defaults        0 0" | sudo tee -a /etc/fstab
echo "${DISK}6     /Examenes-UTN/alumno_2/parcial_2     ext4    defaults        0 0" | sudo tee -a /etc/fstab
echo "${DISK}7     /Examenes-UTN/alumno_2/parcial_3     ext4    defaults        0 0" | sudo tee -a /etc/fstab
echo "${DISK}8     /Examenes-UTN/alumno_3/parcial_1     ext4    defaults        0 0" | sudo tee -a /etc/fstab
echo "${DISK}9     /Examenes-UTN/alumno_3/parcial_2     ext4    defaults        0 0" | sudo tee -a /etc/fstab
echo "${DISK}10    /Examenes-UTN/alumno_3/parcial_3     ext4    defaults        0 0" | sudo tee -a /etc/fstab
echo "${DISK}11    /Examenes-UTN/profesores     ext4    defaults        0 0" | sudo tee -a /etc/fstab

# Montar particiones de forma persistente
sudo mount -a

# Mostrar resultado
lsblk -f $DISK

echo "Fin Punto B"

