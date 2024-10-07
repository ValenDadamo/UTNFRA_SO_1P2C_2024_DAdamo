#!/bin/bash

echo "Creación de la estructura."
mkdir -p "$HOME/Estructura_Asimetrica"/{{correo,clientes}/cartas{1..100},correo/carteros{1..10}}
echo

echo "Validación de la estructura."
tree "$HOME/Estructura_Asimetrica/" --noreport | pr -T -s' ' -w 90 --column 4
echo

