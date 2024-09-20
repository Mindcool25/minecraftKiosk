#/bin/bash

mv log.txt oldlog.txt
echo "Starting Kiosk mode" > /home/minecraft/log.txt
prismlauncher -l IEEEKioskMods > /home/minecraft/log.txt 2>&1
echo "Ending Kiosk mode"
