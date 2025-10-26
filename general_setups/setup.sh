#! /bin/bash
file_loc="$(dirname "$0")/.."
cd "$file_loc" || exit

base=$(pwd)


# find all the setup files
file_list=$(find -H "$base" -name setup.sh -not -path "*/general_setups/setup.sh" )
readarray -t files <<<"$file_list"

for file in "${files[@]}"
do
    dir=$(dirname "$file")
    chmod +x $file
    cd "$dir" || exit
    ./setup.sh
    cd "$base" || exit

    
done

# Remove MOTDs 
chmod -R 0644 /etc/update-motd.d/

# Add any MOTD updates?

to_run="mkdir /tmp/listening_to_you
chown background_scripts:background_scripts /tmp/listening_to_you
chmod 777 /tmp/listening_to_you"

to_run > /root/startup.sh
chmod +x /root/startup.sh

(crontab -l; echo "@reboot /root/startup.sh") | sort -u | crontab -
./root/startup.sh # so its ran now

(crontab -l -u background_scripts; echo "@reboot /home/background_scripts/background_scripts.sh") | sort -u | crontab -u background_scripts -

su background_scripts -s /home/background_scripts/prerunning.sh 
su background_scripts -s /home/background_scripts/background_scripts.sh
