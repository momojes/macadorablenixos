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
    pkgs.zathuraPkgs.zathura_pdf_mupdf
  ];

  fonts.packages = with pkgs; [
    jetbrains-mono
  ];
}
