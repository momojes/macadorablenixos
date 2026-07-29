{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    kitty
    neovim
    xrandr
    pavucontrol
    fastfetch
    nnn
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
    mpv
  ];

  fonts.packages = with pkgs; [
    jetbrains-mono
    maple-mono.variable
  ];
}
