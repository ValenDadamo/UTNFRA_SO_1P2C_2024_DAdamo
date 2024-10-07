#!/bin/bash

RUTA_BASE="$HOME/repogit/UTNFRA_SO_1P2C_2024_DAdamo/RTA_ARCHIVOS_Examen_20241006"

echo "Filtrando la información del total de memoria RAM, pasandola al archivo 'Filtro_Basico.txt'."
grep MemTotal /proc/meminfo > "$RUTA_BASE/Filtro_Basico.txt"

echo "Agrego la información del fabricante del chasis."
sudo dmidecode -t chassis | grep Chassis -A 1 >> "$RUTA_BASE/Filtro_Basico.txt"
echo

cat "$RUTA_BASE/Filtro_Basico.txt"

