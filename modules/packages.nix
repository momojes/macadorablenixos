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
    zathura
    zathura-pdf-mupdf
  ];

  fonts.packages = with pkgs; [
    jetbrains-mono
  ];
}
