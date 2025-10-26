#! /bin/bash
#put the user of the next level here
user="temp02"
pwd="l6YaJIlR0Gcz1zt5a2RJ4wOu9yd8WbIV"

nxtUser="temp03"

../general_setups/new_user.sh "$user" "$pwd"

# This file compiles the faulty c program and sets the suid bit to the correct user

# check if it exists first
if [ ! -f "lookup-project/lookup" ]; then
    echo "compiling"
    ./compile.sh
fi


# set up the permission

cp -r lookup-project/* /home/$user/

echo "setup perms"
chown "$nxtUser:$nxtUser" /home/$user/lookup
chmod 555 /home/$user/lookup
chmod g+s /home/$user/lookup
