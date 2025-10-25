#!/bin/bash

# Usage - ./<script>.sh <username> <password>

useradd -m -s /bin/bash -f 0 $1
echo "$1:$2" | chpasswd

mkdir -p /hacknotts/secrets
echo $2 > /hacknotts/secrets/$1_password
chown $1:$1 /hacknotts/secrets/$1_password
chmod 440 /hacknotts/secrets/$1_password
