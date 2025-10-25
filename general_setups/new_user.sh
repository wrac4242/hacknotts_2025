#!/bin/bash

# Usage - ./<script>.sh <username> <password> <destroy>


if [ -v "$3" ] && [ "$3" == 1 ]; then
#piped to null to stop it complaining about missing mail spools
    userdel -r "$1" > /dev/null
    rm /hacknotts/secrets/"$1"_password


else
useradd -m -s /bin/bash -f 0 $1
echo "$1:$2" | chpasswd

mkdir -p /hacknotts/secrets
echo "$2" > /hacknotts/secrets/"$1"_password
chown "$1":"$1" /hacknotts/secrets/"$1"_password
chmod 440 /hacknotts/secrets/"$1"_password
fi