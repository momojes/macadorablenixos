# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./modules/desktop.nix
      ./modules/packages.nix
      ./modules/development.nix
      ./modules/maintenance.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "macAdorable"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

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

  # Fish Shell
  programs.fish.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."momo" = {
    isNormalUser = true;
    description = "momo";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    git
    rustc
    cargo
    rustfmt
    clippy
    rust-analyzer
    hugo
    gleam
    clang
    xrandr
    pkgs.github-cli
    gcc
    gnumake
    ncurses
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Modern Audio Stack
  security.rtkit.enable = true;
  services.pipewire = {
	enable = true;
	alsa.enable = true;
	pulse.enable = true;
  };

  # D3cold_allowed NVMe Fix
  systemd.services.nvme-d3cold-fix = {
  	description = "Disable D3cold for MacBook NVMe controller";

	wantedBy = [ "multi-user.target" ];
	after = [ "sysinit.target" ];

	serviceConfig = {
		Type = "oneshot";
		RemainAfterExit = true;
	};

	script = ''
		if [ -w /sys/bus/pci/devices/0000:01:00.0/d3cold_allowed ]; then
		echo 0 > /sys/bus/pci/devices/0000:01:00.0/d3cold_allowed
		else
		echo "NVMe d3cold_allowed file not found or not writable" >&2
		exit 1
		fi
	    '';
  };

  # Garbage Collection
  nix = {
  	settings.auto-optimise-store = true;

	gc = {
		automatic = true;
		dates = "weekly";
		options = "--delete-older-than 14d";
	  };
  };

  # Firefox
  programs.firefox = {
    enable = true;

    preferences = {
      "browser.download.dir" = "/home/momo/downloads";
      "browser.download.folderList" = 2;
    };
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "26.05"; # Did you read the comment?

}
