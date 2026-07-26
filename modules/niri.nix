{ pkgs, ... }:

{
   programs.niri.enable = true;

   environment.systemPackages = with pkgs; [
     fuzzel
     waybar
     mako
     swaylock
     wl-clipboard
     xwayland-satellite
  ];
}