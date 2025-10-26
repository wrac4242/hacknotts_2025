#! /bin/bash
#put the user of the next level here
user="temp04"
pwd="ba70fca74e9687f79ac3ea495eea81c1e02785ac45c89db388599938e3c2d0d5"

echo "$user"
../../general_setups/new_user.sh "$user" "$pwd"

cp dictionary /home/"$user"/
cp hash /home/"$user"/

cp README.md /home/$user
chown $user:$user /home/$user/README.md
