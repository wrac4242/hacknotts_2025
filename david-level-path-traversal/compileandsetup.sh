#! /bin/bash

#put the user of the next level here
user="david";

# This file compiles the faulty c program and sets the suid bit to the correct user

# check if it exists first
if [ -f "lookup-project/lookup" ]; then
    rm lookup-project/lookup
fi

#compile the project
gcc -o lookup-project/lookup lookup-project/lockup.c
# set up the permission
chown "$user" lookup-project/lookup
chmod u+s lookup-project/lookup