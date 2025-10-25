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
    cd "$dir" || return
    ./setup.sh
    
done

# Remove MOTDs 
chmod -R 0644 /etc/update-motd.d/

# Add any MOTD updates?
