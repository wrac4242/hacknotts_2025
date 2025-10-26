#! /bin/bash
#put the user of the next level here
user="hash3"
pwd="recipient"

echo "$user"
../../general_setups/new_user.sh "$user" "$pwd"

cp dictionary /home/"$user"/
cp hash /home/"$user"/
