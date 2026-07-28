{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    kitty
    neovim
    xrandr
    pavucontrol
    pkgs.fastfetch
    pkgs.nnn
    pkgs.qutebrowser
    adwaita-icon-theme
    brightnessctl
    zathura
    zathuraPkgs.zathura_pdf_mupdf
    maim
    slop
    xclip
    btop
    vesktop
    cider-2
    firefox
    pinta
    udiskie
    dino
    mpv
  ];

  fonts.packages = with pkgs; [
    jetbrains-mono
    maple-mono.variable
  ];
}
