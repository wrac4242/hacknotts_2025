#!/bin/sh

rm /home/background_scripts/background_scripts.sh
touch /home/background_scripts/background_scripts.sh
chmod +x /home/background_scripts/background_scripts.sh
mkdir /home/background_scripts/scripts
mkdir -p /home/background_scripts/logs/{out,err}

chown -R background_scripts:background_scripts /home/background_scripts
