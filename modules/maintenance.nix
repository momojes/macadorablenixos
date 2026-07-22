{ pkgs, ... }:

{
  nix.settings.auto-optimise-store = true;

  systemd.services.nix-gc-keep-ten = {
    description = "Keep the latest 10 NixOS generations";

    serviceConfig = {
    	Type = "oneshot";
    };

    script = ''
    	   ${pkgs.nix}/bin/nix-env \
	   --profile /nix/var/nix/profiles/system \
	   --delete-generations + 10
	   ${pkgs.nix}/bin/nix-store --gc
	'';
    };

    systemd.timers.nix-gc-keep-ten = {
      description = "Weekly NixOS generation cleanup";
      wantedBy= [ "timers.target" ];
      timerConfig = {
      		  OnCalendar = "weekly";
		  Persistent = true;
		  Unit = "nix-gc-keep-ten.service";
		 };
    };

    boot.loader.systemd-boot.configurationLimit =10;
}