{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    kitty
    neovim
    git
    jetbrains-mono
    xclip
    pavucontrol
    pkgs.fastfetch
    pkgs.nnn
    pkgs.apostrophe
    pkgs.qutebrowser
    adwaita-icon-theme
    brightnessctl
  ];

  fonts.packages = with pkgs; [
    jetbrains-mono
  ];
}
