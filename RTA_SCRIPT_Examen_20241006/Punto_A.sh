#!/bin/bash

echo "Creamos y mostramos estructura de directorio"

mkdir -p $HOME/Examenes-UTN/{alumno_{1..3}/parcial_{1..3},profesores} | tree $HOME/Examenes-UTN

