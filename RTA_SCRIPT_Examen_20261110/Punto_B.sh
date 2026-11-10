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

