{ pkgs, ... }:

{
  nix.settings.auto-optimise-store = true;

  systemd.services.nix-gc-keep-ten = {
    description = "Keep the latest 10 NixOS generations";

    path = with pkgs; [
      nix
      coreutils
      gawk
    ];

    serviceConfig.Type = "oneshot";

    script = ''
      profile="/nix/var/nix/profiles/system"

      mapfile -t generations < <(
        nix-env \
          --profile "$profile" \
          --list-generations |
        awk '{ print $1 }' |
        sort -n
      )

      generation_count="''${#generations[@]}"

      if (( generation_count > 10 )); then
        delete_count=$((generation_count - 10))
        old_generations=("''${generations[@]:0:delete_count}")

        echo "Deleting old NixOS generations: ''${old_generations[*]}"

        nix-env \
          --profile "$profile" \
          --delete-generations "''${old_generations[@]}"
      else
        echo "Only $generation_count generations exist; nothing to delete."
      fi

      nix-store --gc
    '';
  };

  systemd.timers.nix-gc-keep-ten = {
    description = "Weekly NixOS generation cleanup";
    wantedBy = [ "timers.target" ];

    timerConfig = {
      OnCalendar = "weekly";
      Persistent = true;
      Unit = "nix-gc-keep-ten.service";
    };
  };

  # Also limit the number shown in the boot menu.
  boot.loader.systemd-boot.configurationLimit = 10;
}