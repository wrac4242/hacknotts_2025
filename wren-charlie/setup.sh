echo "python3 ~/scripts/wren_charlie.py > ~/logs/out/wren_charlie.txt 2> ~/logs/out/wren_charlie.txt &" >> /home/background_scripts/background_scripts.sh
cp listening_script.py /home/background_scripts/scripts/wren_charlie.py
chown background_scripts:background_scripts /home/background_scripts/scripts/wren_charlie.py


echo "pip install inotify-simple --break-system-packages" >> /home/background_scripts/prerunning.sh

user="temp08"
pwd="EmWxWdDwjWeaiUZaEfBmTSuu0VGnvQT0"


cp README.md /home/$user
chown $user:$user /home/$user/README.md
