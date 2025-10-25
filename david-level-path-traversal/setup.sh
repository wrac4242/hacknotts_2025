#! /bin/bash
#put the user of the next level here
user="david1"
pwd="david1"

echo "$user"
../general_setups/new_user.sh "$user" "$pwd"

# This file compiles the faulty c program and sets the suid bit to the correct user

# check if it exists first
if [ ! -f "lookup-project/lookup" ]; then
    echo "compiling"
    ./compile.sh
fi


# set up the permission
echo "setup perms"
sudo chown "$user:$user" lookup-project/lookup
sudo chmod 101 lookup-project/lookup
sudo chmod u+s lookup-project/lookup

cp lookup-project /home/"$user"/