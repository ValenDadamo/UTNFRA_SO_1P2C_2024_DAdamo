#!/bin/bash
ARCHIVO_FILTRO_BASICO="$HOME/repogit/UTNFRA_SO_1P2C_2024_DAdamo/RTA_ARCHIVOS_Examen_20241006/Filtro_Basico.txt"

echo "Generando el archivo: $ARCHIVO_FILTRO_BASICO"
echo
grep -i memtotal /proc/meminfo |tee $ARCHIVO_FILTRO_BASICO
sudo dmidecode -t chassis |grep -iE 'chassis|manufacture' | tee -a $ARCHIVO_FILTRO_BASICO

