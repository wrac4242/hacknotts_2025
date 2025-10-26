user="temp09"
pwd="oD9UDytDkvynaiBnm0AP4tt2LRRj4cqs"

echo "$user"
../general_setups/new_user.sh "$user" "$pwd"

cp README.md /home/$user/
chown $user:$user /home/$user/README.md
