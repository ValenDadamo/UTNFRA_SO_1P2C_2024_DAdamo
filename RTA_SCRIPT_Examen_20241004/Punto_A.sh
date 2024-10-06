#!/bin/bash

echo "Creo Estructura de directorio"

mkdir -p $HOME/Examenes_UTN/{alumno_{1..3}/parcial_{1..3},profesores}

echo "Mostramos estructura"
tree $HOME/Examenes_UTN
