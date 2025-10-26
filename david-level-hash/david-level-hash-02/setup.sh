#! /bin/bash
#put the user of the next level here
user="temp04"
pwd="d847cf087ab2b5ebdffded4a2e874ecbe5896395ff9ea806cf35148f841d68bb"

echo "$user"
../../general_setups/new_user.sh "$user" "$pwd"

cp dictionary /home/"$user"/
cp hash /home/"$user"/

cp README.md /home/$user
chown $user:$user /home/$user/README.md
