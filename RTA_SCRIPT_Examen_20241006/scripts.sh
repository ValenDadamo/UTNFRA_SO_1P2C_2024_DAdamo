#!/bin/bash

# Script para ejecutar todos los scripts desde Punto_A.sh hasta Punto_F.sh

# Lista de scripts a ejecutar
scripts=("Punto_A.sh" "Punto_B.sh" "Punto_C.sh" "Punto_D.sh" "Punto_E.sh" "Punto_F.sh")

# Iterar sobre cada script y ejecutarlo
for script in "${scripts[@]}"; do
    echo "Ejecutando $script..."
    ./$script
    
    # Verifica el código de salida del script
    if [ $? -ne 0 ]; then
        echo "$script falló. Saliendo..."
        exit 1
    fi
done

echo "Todos los scripts se ejecutaron correctamente."

