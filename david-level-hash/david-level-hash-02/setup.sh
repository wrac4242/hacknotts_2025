#! /bin/bash
#put the user of the next level here
user="hash2"
pwd="mantis"

echo "$user"
../../general_setups/new_user.sh "$user" "$pwd"

cp dictionary /home/"$user"/
cp hash /home/"$user"/

cp README.md /home/$user
chown $user:$user README.md
