echo "python3 ~/scripts/wren_alpha.py > ~/logs/out/wren_alpha.txt 2> ~/logs/out/wren_alpha.txt &" >> /home/background_scripts/background_scripts.sh
cp listening_script.py /home/background_scripts/scripts/wren_alpha.py
chown background_scripts:background_scripts /home/background_scripts/scripts/wren_alpha.py

user="wren-alpha"
pwd="wren-alpha"

echo "$user"
../general_setups/new_user.sh "$user" "$pwd"

cp README.md /home/$user
chown $user:$user README.md
