#! /bin/bash
#put the user of the next level here
user="temp3"
pwd="26d87ec38a54300635add88dd39d4cacefe3d64434d0df273deccfa3c25dd776"

echo "$user"
../../general_setups/new_user.sh "$user" "$pwd"

cp dictionary /home/"$user"/
cp hash /home/"$user"/
