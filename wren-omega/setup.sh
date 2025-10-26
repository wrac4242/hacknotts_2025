user="temp09"
pwd="aacb2748b33f3957046eede30ac00bddc30443a9c72813ba4f0c445b2cbd0316"

echo "$user"
../general_setups/new_user.sh "$user" "$pwd"

cp README.md /home/$user/
chown $user:$user /home/$user/README.md
