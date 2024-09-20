{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];
  
  ## Network stuff
  # Setting hostname
  networking.hostName = "IEEE-MinecraftKiosk"; # Define your hostname.

  # Enable networkmanager
  networking.networkmanager.enable = true;

  ## Bootloader DON'T TOUCH UNLESS YOU KNOW WHAT YOU ARE DOING
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/vda";
  boot.loader.grub.useOSProber = true;
  boot.loader.timeout = 1;

  ## Localization
  # Set your time zone.
  time.timeZone = "America/Denver";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  ## Users
  # User to modify the box
  users.users.ieee = {
    isNormalUser = true;
    description = "ieee";
    extraGroups = [ "networkmanager" "wheel" "mc" ];
    # Minecraft user doesn't need these
    packages = with pkgs; [
  	git
	wget
	kitty
	neovim
    ];
  };

  # User that handles minecraft process
  users.users.minecraft = {
  	isNormalUser = true;
	home = "/home/minecraft";
	extraGroups = ["wheel"];
  };

  # sudo modification to shutdown
  security.sudo = {
  	enable = true;
	extraRules = [{
		commands = [ 
			{command = "/run/current-system/sw/bin/poweroff"; options = [ "NOPASSWD" ];}
		];
		groups = ["wheel"];
	}];
  };

  ## Packages
  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
	firefox
	prismlauncher
  ];



  ## Services
  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Kiosk window mangaer
  services.cage = {
  	enable = true;
	user = "minecraft";
	program = "/home/minecraft/startup.sh";
  };



  ## DON'T TOUCH THIS
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
