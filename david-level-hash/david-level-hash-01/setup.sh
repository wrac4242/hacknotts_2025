#! /bin/bash
#put the user of the next level here
user="hash1"
pwd="hash1"

echo "$user"
../../general_setups/new_user.sh "$user" "$pwd"

cp dictionary /home/"$user"/
