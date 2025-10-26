#! /bin/bash
#put the user of the next level here
user="temp3"
pwd="heYm8vi1ykKvqyt3wkD75iojk4Gm3ias"

echo "$user"
../../general_setups/new_user.sh "$user" "$pwd"

cp dictionary /home/"$user"/
cp hash /home/"$user"/

cp README.md /home/$user
chown $user:$user README.md
