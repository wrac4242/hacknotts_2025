#! /bin/bash
#put the user of the next level here
user="hash2"
pwd="hashbr0wns"

echo "$user"
../../general_setups/new_user.sh "$user" "$pwd"

cp dictionary /home/"$user"/
cp hash /home/"$user"/
