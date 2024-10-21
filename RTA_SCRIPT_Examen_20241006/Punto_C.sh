#!/bin/bash

# Crear grupos
echo "Creando grupos secundarios..."
sudo groupadd p1c2_2024_gAlumno
sudo groupadd p1c2_2024_gProfesores
echo

# Obtener el hash de la contraseña del usuario actual
PASSWD=$(sudo grep $(whoami) /etc/shadow | awk -F ':' '{print $2}')

# Crear usuarios con el hash de la contraseña
echo "Creando usuarios..."
sudo useradd -m -s /bin/bash -p "${PASSWD}" -G p1c2_2024_gAlumno p1c2_2024_A1
sudo useradd -m -s /bin/bash -p "${PASSWD}" -G p1c2_2024_gAlumno p1c2_2024_A2
sudo useradd -m -s /bin/bash -p "${PASSWD}" -G p1c2_2024_gAlumno p1c2_2024_A3
sudo useradd -m -s /bin/bash -p "${PASSWD}" -G p1c2_2024_gProfesores p1c2_2024_P1
echo

# Ajustar propietarios y permisos
echo "Ajustando propietarios y permisos..."
sudo chown -R p1c2_2024_A1.p1c2_2024_A1 /Examenes-UTN/alumno_1
sudo chown -R p1c2_2024_A2.p1c2_2024_A2 /Examenes-UTN/alumno_2
sudo chown -R p1c2_2024_A3.p1c2_2024_A3 /Examenes-UTN/alumno_3
sudo chown -R p1c2_2024_P1.p1c2_2024_gProfesores /Examenes-UTN/profesores

sudo chmod -R 750 /Examenes-UTN/alumno_1
sudo chmod -R 760 /Examenes-UTN/alumno_2
sudo chmod -R 700 /Examenes-UTN/alumno_3
sudo chmod -R 775 /Examenes-UTN/profesores
echo



# Crear archivo validar.txt
echo "Creando archivo validar.txt..."
sudo su -c "whoami > /Examenes-UTN/alumno_1/validar.txt" p1c2_2024_A1
sudo su -c "whoami > /Examenes-UTN/alumno_2/validar.txt" p1c2_2024_A2
sudo su -c "whoami > /Examenes-UTN/alumno_3/validar.txt" p1c2_2024_A3
sudo su -c "whoami > /Examenes-UTN/profesores/validar.txt" p1c2_2024_P1
echo

# Mostrar contenido de validar.txt
sudo grep -R p1c2 /Examenes-UTN/
echo
echo "Script finalizado."

