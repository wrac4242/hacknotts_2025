echo "python3 ~/scripts/wren_bravo.py > ~/logs/out/wren_bravo.txt 2> ~/logs/out/wren_bravo.txt &" >> /home/background_scripts/background_scripts.sh
cp listening_script.py /home/background_scripts/scripts/wren_bravo.py
chown background_scripts:background_scripts /home/background_scripts/scripts/wren_bravo.py

