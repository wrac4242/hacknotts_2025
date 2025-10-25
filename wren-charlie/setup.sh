echo "python3 ~/scripts/wren_charlie.py > ~/logs/out/wren_charlie.txt 2> ~/logs/out/wren_charlie.txt &" >> /home/background_scripts/background_scripts.sh
cp listening_script.py /home/background_scripts/scripts/wren_charlie.py
chown background_scripts:background_scripts /home/background_scripts/scripts/wren_charlie.py

echo "pip install inotify-simple" >> /home/background_scripts/prerunning.sh

user="wren-charlie"
pwd="wren-charlie"

echo "$user"
../general_setups/new_user.sh "$user" "$pwd"
