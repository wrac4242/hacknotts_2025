#!/bin/sh

useradd -m -f 0 "background_scripts"

rm /home/background_scripts/background_scripts.sh
rm /home/background_scripts/prerunning.sh
touch /home/background_scripts/background_scripts.sh
touch /home/background_scripts/prerunning.sh
chmod +x /home/background_scripts/background_scripts.sh /home/background_scripts/prerunning.sh
mkdir /home/background_scripts/scripts
mkdir -p /home/background_scripts/logs/out /home/background_scripts/logs/err

chown -R background_scripts:background_scripts /home/background_scripts

# installing
apt install -y python3-pip 
