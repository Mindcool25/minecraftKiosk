# Minecraft Kiosk NixOS config
This is a funky project I built to give the computer in the IEEE snack shack at USU.

## Instillation
1. Do a normal NixOS install with no desktop
    Note: I have the username set to ``ieee`` so you will want to set the username when installing to that, or change the configuration.nix file to reflect the desired username.
2. Clone this repository.
    Note:  This is where you will want to do any modifications to the given configs.
3. Run ``sudo cp minecraftKiosk/configuration.nix /etc/nixos/`` followed by ``sudo nixos-rebuild switch`` to build the system.
4. Give the minecraft user a password with ``sudo passwd`` (because security I guess)
5. Run ``sudo cp minecraftKiosk/IEEEKioskMods.mrpack /home/minecraft``, then change the permissions of the file with ``sudo chown minecraft:users /home/minecraft/IEEEKioskMods.mrpack``.
6. Do the same with the ``startup.sh`` file, ``sudo cp minecraftKiosk/startup.sh /home/minecraft && sudo chown minecraft:users /home/minecraft/startup.sh``.
    Note: Make sure that startup.sh is executable.
7. Run ``su minecraft`` to switch over to the minecraft, then ``cd`` to go to it's home directory. Edit the line with the ``prismlauncher`` command to be ``prismlauncher #<whatever after that>`` to allow the machine to boot to just prism launcher.
8. Make sure you take note of the IP address, you will need it to ssh into the box after you reboot.
9. Reboot.
10. Once prismlauncher stars up, log in to your minecraft account, then import the mrpack file.
11. ssh into the box and remove the ``#`` added to startup.sh, then reboot one more time. It will now boot into minecraft.
12. Change the language to something other than ``en_us``, which will make the setup button appear. Make a world with the name ``main``, then change the language back to ``en_us``.
Now when you click the play button, it should put you into the world you just generated.
