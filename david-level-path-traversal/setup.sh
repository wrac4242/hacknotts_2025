#! /bin/bash
#put the user of the next level here
user="temp02"


nxtUser="temp03"

.

# This file compiles the faulty c program and sets the suid bit to the correct user

# check if it exists first
if [ ! -f "lookup-project/lookup" ]; then
    echo "compiling"
    ./compile.sh
fi


# set up the permission

cp -r lookup-project/* /home/$user/

echo "setup perms"
chown $nxtUser:$nxtUser /home/$user/lookup
chmod 555 /home/$user/lookup
chmod g+s /home/$user/lookup
