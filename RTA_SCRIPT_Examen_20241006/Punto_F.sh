#!/bin/bash
cd $HOME/repogit/UTNFRA_SO_1P2C_2024_DAdamo/ 

ARCHIVO_FILTRO_AVANZADO="$HOME/repogit/UTNFRA_SO_1P2C_2024_DAdamo/RTA_ARCHIVOS_Examen_20241006/Filtro_Avanzado.txt"

echo "Generando el archivo: $ARCHIVO_FILTRO_AVANZADO"
echo

cat << EOF |tee $ARCHIVO_FILTRO_AVANZADO
Mi IP Publica es: $(curl -s ifconfig.me)
Mi usuario es: $(whoami)
El Hash de mi usuario es: $(sudo grep $USER /etc/shadow | awk -F ':' '{ print $2}')
La URL de mi repositorio es: $(git remote get-url origin)
EOF

