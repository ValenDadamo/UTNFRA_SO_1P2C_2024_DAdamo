#!/bin/bash

echo "Creo grupos secundarios."
sudo groupadd p1c2_2024_gAlumno
sudo groupadd p1c2_2024_gProfesores
echo

echo "Cambio la clave del usuario vagrant."
echo "vagrant:clave1" | sudo chpasswd
echo

echo "Creo todos los usuarios con la misma clave que vagrant."
for i in {1..3}; do
    sudo useradd -m -s /bin/bash -G p1c2_2024_gAlumno -p "$(sudo grep vagrant /etc/shadow | awk -F ':' '{print $2}')" p1c2_2024_A$i
done
sudo useradd -m -s /bin/bash -G p1c2_2024_gProfesores -p "$(sudo grep vagrant /etc/shadow | awk -F ':' '{print $2}')" p1c2_2024_P1
echo

echo "Cambio los propietarios y grupos a las carpetas creadas en el Punto_A."
for i in {1..3}; do
    sudo chown -R p1c2_2024_A$i:p1c2_2024_gAlumno ~/Examenes-UTN/alumno_$i/
done
sudo chown -R p1c2_2024_P1:p1c2_2024_gProfesores ~/Examenes-UTN/profesores/
echo

echo "Cambio los permisos de cada carpeta."
sudo chmod 750 ~/Examenes-UTN/alumno_1/
sudo chmod 760 ~/Examenes-UTN/alumno_2/
sudo chmod 700 ~/Examenes-UTN/alumno_3/
sudo chmod 777 ~/
echo

echo "Creo el archivo 'validar.txt' con el nombre de cada usuario en sus respectivas carpetas."
for i in {1..3}; do
    sudo -u p1c2_2024_A$i bash -c "whoami > /home/vagrant/Examenes-UTN/alumno_$i/validar.txt"
done
sudo -u p1c2_2024_P1 bash -c "whoami > /home/vagrant/Examenes-UTN/profesores/validar.txt"
echo

echo "Muestro el contenido de los archivos 'validar.txt'."
for i in {1..3}; do
    sudo -u  p1c2_2024_A$i bash -c "cat /home/vagrant/Examenes-UTN/alumno_$i/validar.txt"
done
sudo -u p1c2_2024_P1 bash -c "cat /home/vagrant/Examenes-UTN/profesores/validar.txt"
echo

