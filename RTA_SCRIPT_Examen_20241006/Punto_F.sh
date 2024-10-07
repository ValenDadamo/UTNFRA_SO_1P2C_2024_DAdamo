#!/bin/bash

echo "Nos dirigimos al repositorio."
cd $HOME/repogit/UTNFRA_SO_1P2C_2024_DAdamo

echo "Filtrando todas las líneas, enviándolas al archivo 'Filtro_Avanzado.txt'."
echo -e "Mi IP Pública es: $(curl -s ifconfig.me | grep -v vagrant)\nMi usuario es: $(whoami)\nEl Hash de mi Usuario es: $(sudo grep vagrant /etc/shadow | awk -F ':' '{print $2}')\nLa URL de mi repositorio es: $(git remote get-url origin)" > RTA_ARCHIVOS_Examen_20241006/Filtro_Avanzado.txt

echo "Leo el archivo 'Filtro_Avanzado.txt'."
cat RTA_ARCHIVOS_Examen_20241006/Filtro_Avanzado.txt

