#!/bin/bash

grep MemTotal /proc/meminfo > ~/repogit/UTNFRA_SO_1P2C_2024_DAdamo/RTA_ARCHIVOS_Examen_20241006/Filtro_Basico.txt
sudo dmidecode -t chassis | grep Manufacturer >> Filtro_Basico.txt
echo "Fin Punto E"

