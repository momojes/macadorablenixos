{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    firefox
    kitty
    neovim
    git
    jetbrains-mono
    xclip
    pavucontrol
    pkgs.fastfetch
    pkgs.nnn
    pkgs.apostrophe
    adwaita-icon-theme
    brightnessctl
  ];

  fonts.packages = with pkgs; [
    jetbrains-mono
  ];
}
