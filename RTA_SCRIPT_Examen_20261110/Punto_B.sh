#!/bin/bash

DISCO=$(sudo fdisk -l | grep "10 G" | awk '{print $2}' | awk -F ':' '{ print $1}')


sudo fdisk $DISCO << EOF
n
e
1


n

+1G
n

+1G
n

+1G
n

+1G
n

+1G
n

+1G
n

+1G
n

+1G
n

+1G
n


w
EOF

sudo partprobe $DISCO

sudo fdisk -l $DISCO


read -p "Enter para continuar"


sudo fdisk /dev/sdc -l | grep Linux | awk '{print $1}' | xargs -I PARTICION sudo mkfs.ext4 PARTICION


read -p "Presiones enter"

echo
echo


cat << EOF | sudo tee -a /etc/fstab

${DISCO}5   /Examenes-UTN/Alumno_1/parcial_1  ext4 defaults 0 0
${DISCO}6   /Examenes-UTN/Alumno_1/parcial_2  ext4 defaults 0 0
${DISCO}7   /Examenes-UTN/Alumno_1/parcial_3  ext4 defaults 0 0
${DISCO}8   /Examenes-UTN/Alumno_2/parcial_1  ext4 defaults 0 0
${DISCO}9   /Examenes-UTN/Alumno_2/parcial_2  ext4 defaults 0 0
${DISCO}10  /Examenes-UTN/Alumno_2/parcial_3  ext4 defaults 0 0
${DISCO}11  /Examenes-UTN/Alumno_3/parcial_1  ext4 defaults 0 0
${DISCO}12  /Examenes-UTN/Alumno_3/parcial_2  ext4 defaults 0 0
${DISCO}13  /Examenes-UTN/Alumno_3/parcial_3  ext4 defaults 0 0
${DISCO}14  /Examenes-UTN/Profesores          ext4 defaults 0 0

EOF

echo
echo

sudo mount -a


echo
sudo df -h  |grep -E 'Filesystem|Examenes-UTN'



