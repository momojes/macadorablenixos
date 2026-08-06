{ pkgs, ... }:

{
  services.flatpak.enable = true;

  systemd.services.flatkpak-setup = {
    description = "Configure Flathub & Install Pixelorama";

    wantedBy = [ "multi-user.target" ];
    wants = [ "network-online.target" ];
    after = [ "network-online.target" ];

    path = [ pkgs.flatpak ];

    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
    };

    script = ''
     flatpak remote-add \
     --system \
     --if-not-exists \
     flathub \
     https://dl.flathub.org/repo/flathub.flatpakrepo

     flatpak install
     --system \
     --noninteractive \
     --or-update \
     flathub \
     com.orama_interactive.Pixelorama
   '';
  };
}
