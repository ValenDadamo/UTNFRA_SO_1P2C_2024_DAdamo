#!/bin/bash

# Obtener el disco de 10 GiB
DISCO="/dev/sdc"
echo "Particiono el disco: $DISCO"
echo

# Particionamiento del disco
sudo fdisk $DISCO << PARTICIONES
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
p
4

+1G
n
p
5

+1G
n
p
6

+1G
n
p
7

+1G
n
p
8

+1G
n
p
9

+1G
n
p
10

+1G
w
PARTICIONES

echo
echo "Mis Particiones: "
sudo fdisk -l $DISCO
echo 

# Formateo de las particiones
echo "Formateo las Particiones: "
for i in {1..10}; do
    sudo mkfs.ext4 "${DISCO}p$i"
done
echo

# Crear directorios para montar
echo "Monto las Particiones: "
for i in {1..10}; do
    MONTAR_DIR="$HOME/Examenes_UTN/alumno_$((i % 3 + 1))/parcial_$i"
    sudo mkdir -p "$MONTAR_DIR"
    sudo mount "${DISCO}p$i" "$MONTAR_DIR"
done

echo
echo "Valido montaje: "
df -h | grep "$HOME/Examenes_UTN"

