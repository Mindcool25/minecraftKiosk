# Minecraft Kiosk NixOS config
This is a funky project I built to give the computer in the IEEE snack shack at USU.

## Instillation
1. Do a normal NixOS install with no desktop
    Note: I have the username set to ``ieee`` so you will want to set the username when installing to that, or change the configuration.nix file to reflect the desired username.
2. Clone this repository.
    Note:  This is where you will want to do any modifications to the given configs.
3. Run ``sudo cp minecraftKiosk/configuration.nix /etc/nixos/`` followed by ``sudo nixos-rebuild switch`` to build the system.
4. Give the minecraft user a password with ``sudo passwd`` (because security I guess)
5. Run ``sudo cp minecraftKiosk/IEEEKioskMods.mrpack /home/minecraft && sudo chown minecraft:users /home/minecraft/IEEEKioskMods.mrpack`` to set put the modpack file into the minecraft user's directory
6. Run ``sudo cp minecraftKiosk/config /home/minecraft && sudo mv /home/minecraft/config /home/minecraft/.confg && sudo chown -R minecraft:users /home/minecraft/.config`` to set up the minecraft user's config files
7. Change the line in ``.config/bspwm/bspwmrc`` that launches minecraft to only launch prismlauncher
8. Take note of the IP so you can SSH in, then reboot, it should launch prismlauncher on boot.
9. Import modpack, open it up, change language to something other than ``en_US``, create new world named ``main``, then change language back to ``en_US``.
10. Change the line back to what it was from ssh, then reboot one more time. It should then launch right into the modpack.
