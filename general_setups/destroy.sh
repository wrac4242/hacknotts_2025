#! /bin/bash


file_loc="$(dirname "$0")/.."
cd "$file_loc" || exit

base=$(pwd)


# find all the setup files
file_list=$(find -H "$base" -name destroy.sh -not -path "*/general_setups/destroy.sh" )
readarray -t files <<<"$file_list"

for file in "${files[@]}"
do
    dir=$(dirname "$file")
    chmod +x "$file"
    cd "$dir" || exit
    ./destroy.sh
    cd "$base" || exit

    
    
done

# Remove MOTDs 
chmod -R 0644 /etc/update-motd.d/

killall -u background_scripts -s 9
deluser --remove-home background_scripts
rm -rf /home/background_scripts

rm -rf /tmp/listening_to_you
