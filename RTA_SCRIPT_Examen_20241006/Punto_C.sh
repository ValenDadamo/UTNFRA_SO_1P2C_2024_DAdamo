#!/bin/bash

# Crear grupos
echo "Creando grupos secundarios..."
sudo groupadd p1c2_2024_gAlumno
sudo groupadd p1c2_2024_gProfesores
echo

# Obtener el hash de la contraseña del usuario actual
PASSWD="$(sudo grep $(whoami) /etc/shadow | awk -F ':' '{ print $2 }')"

# Crear usuarios con el hash de la contraseña
echo "Creando usuarios..."
sudo useradd -m -s /bin/bash -G p1c2_2024_gAlumno -p "$PASSWD" p1c2_2024_A1
sudo useradd -m -s /bin/bash -G p1c2_2024_gAlumno -p "$PASSWD" p1c2_2024_A2
sudo useradd -m -s /bin/bash -G p1c2_2024_gAlumno -p "$PASSWD" p1c2_2024_A3
sudo useradd -m -s /bin/bash -G p1c2_2024_gProfesores -p "$PASSWD" p1c2_2024_P1
echo

# Ajustar propietarios y permisos de las carpetas
echo "Ajustando propietarios y permisos..."
sudo chown -R p1c2_2024_A1:p1c2_2024_gAlumno /Examenes-UTN/alumno_1
sudo chmod 750 /Examenes-UTN/alumno_1

sudo chown -R p1c2_2024_A2:p1c2_2024_gAlumno /Examenes-UTN/alumno_2
sudo chmod 760 /Examenes-UTN/alumno_2

sudo chown -R p1c2_2024_A3:p1c2_2024_gAlumno /Examenes-UTN/alumno_3
sudo chmod 700 /Examenes-UTN/alumno_3

sudo chown -R p1c2_2024_P1:p1c2_2024_gProfesores /Examenes-UTN/profesores
sudo chmod 770 /Examenes-UTN/profesores
echo

# Crear archivo validar.txt
echo "Creando archivo validar.txt..."
sudo -u p1c2_2024_A1 bash -c "whoami > /Examenes-UTN/alumno_1/validar.txt"
sudo -u p1c2_2024_A2 bash -c "whoami > /Examenes-UTN/alumno_2/validar.txt"
sudo -u p1c2_2024_A3 bash -c "whoami > /Examenes-UTN/alumno_3/validar.txt"
sudo -u p1c2_2024_P1 bash -c "whoami > /Examenes-UTN/profesores/validar.txt"
echo

# Mostrar contenido de validar.txt
echo "Contenido de los archivos validar.txt:"
sudo -u p1c2_2024_A1 bash -c "cat /Examenes-UTN/alumno_1/validar.txt"
sudo -u p1c2_2024_A2 bash -c "cat /Examenes-UTN/alumno_2/validar.txt"
sudo -u p1c2_2024_A3 bash -c "cat /Examenes-UTN/alumno_3/validar.txt"
sudo -u p1c2_2024_P1 bash -c "cat /Examenes-UTN/profesores/validar.txt"
echo

echo "Script finalizado."

