#! /bin/bash
#put the user of the next level here
user="temp04"


cp dictionary /home/"$user"/
cp hash /home/"$user"/

cp README.md /home/$user
chown $user:$user /home/$user/README.md
