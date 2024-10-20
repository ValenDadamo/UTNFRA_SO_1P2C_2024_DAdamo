#!/bin/bash

DISCO="/dev/sdc"

# Creacion de particiones
sudo fdisk $DISCO << EOF
n
e
1


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

+1G
n

+1G
n

+1G
n


w
EOF

# Formateo de particiones
sudo fdisk /dev/sdc -l |grep Linux |awk '{print $1}' |xargs -I PARTICION sudo mkfs.ext4 PARTICION

# Escribir en /etc/fstab para indicar donde se montaran las particiones
cat << EOF | sudo tee -a /etc/fstab

${DISCO}5     /Examenes-UTN/alumno_1/parcial_1     ext4    defaults             0   0   
${DISCO}6     /Examenes-UTN/alumno_1/parcial_2     ext4    defaults        0    0
${DISCO}7     /Examenes-UTN/alumno_1/parcial_3     ext4    defaults        0    0
${DISCO}8     /Examenes-UTN/alumno_2/parcial_1     ext4    defaults        0    0
${DISCO}9     /Examenes-UTN/alumno_2/parcial_2     ext4    defaults        0    0
${DISCO}10    /Examenes-UTN/alumno_2/parcial_3     ext4    defaults        0    0
${DISCO}11    /Examenes-UTN/alumno_3/parcial_1     ext4    defaults        0    0
${DISCO}12    /Examenes-UTN/alumno_3/parcial_2     ext4    defaults        0    0
${DISCO}13    /Examenes-UTN/alumno_3/parcial_3     ext4    defaults        0    0
${DISCO}14    /Examenes-UTN/profesores                 ext4    defaults         0   0

EOF

# Montar particiones de forma persistente
sudo mount -a

# Mostrar resultado
sudo df -h |grep -E 'Filesystem|Examenes-UTN'

echo "Fin Punto B"

