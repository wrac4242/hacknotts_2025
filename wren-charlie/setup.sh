echo "python3 ~/scripts/wren_charlie.py > ~/logs/out/wren_charlie.txt 2> ~/logs/out/wren_charlie.txt &" >> /home/background_scripts/background_scripts.sh
cp listening_script.py /home/background_scripts/scripts/wren_charlie.py
chown background_scripts:background_scripts /home/background_scripts/scripts/wren_charlie.py

