#!/bin/bash

DISCO="/dev/sdc"
echo "Particiono el disco: $DISCO"
echo

# Particionamiento del disco
sudo fdisk $DISCO << EOF
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

+7166M
n

+1G
n

+1G
n

+1G
n

+1G
n

+1G
n

+1G
n

+1014M
w
EOF

echo
echo "Mis Particiones: "
sudo fdisk -l $DISCO
echo

# Formateo de las particiones
echo "Formateo las Particiones: "
for i in {1..11}; do
    sudo mkfs.ext4 "${DISCO}$i"
done
echo

# Montar los discos en las carpetas correspondientes
echo "Monto las Particiones: "
sudo mount /dev/sdc1 $HOME/Examenes-UTN/alumno_1/parcial_1
sudo mount /dev/sdc2 $HOME/Examenes-UTN/alumno_1/parcial_2
sudo mount /dev/sdc3 $HOME/Examenes-UTN/alumno_1/parcial_3
sudo mount /dev/sdc5 $HOME/Examenes-UTN/alumno_2/parcial_1
sudo mount /dev/sdc6 $HOME/Examenes-UTN/alumno_2/parcial_2
sudo mount /dev/sdc7 $HOME/Examenes-UTN/alumno_2/parcial_3
sudo mount /dev/sdc8 $HOME/Examenes-UTN/alumno_3/parcial_1
sudo mount /dev/sdc9 $HOME/Examenes-UTN/alumno_3/parcial_2
sudo mount /dev/sdc10 $HOME/Examenes-UTN/alumno_3/parcial_3
sudo mount /dev/sdc11 $HOME/Examenes-UTN/profesores
echo

echo "Valido montaje: "
lsblk -f | grep "$HOME/Examenes-UTN"

