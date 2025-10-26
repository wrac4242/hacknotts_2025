echo "python3 ~/scripts/wren_charlie.py > ~/logs/out/wren_charlie.txt 2> ~/logs/out/wren_charlie.txt &" >> /home/background_scripts/background_scripts.sh
cp listening_script.py /home/background_scripts/scripts/wren_charlie.py
chown background_scripts:background_scripts /home/background_scripts/scripts/wren_charlie.py


echo "pip install inotify-simple --break-system-packages" >> /home/background_scripts/prerunning.sh

user="temp08"
pwd="EmWxWdDwjWeaiUZaEfBmTSuu0VGnvQT0"

echo "$user"
../general_setups/new_user.sh "$user" "$pwd"

mkdir /tmp/listening_to_you
chown background_scripts:background_scripts /tmp/listening_to_you
chmod 777 /tmp/listening_to_you

cp README.md /home/$user
chown $user:$user README.md
