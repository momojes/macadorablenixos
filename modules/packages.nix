{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    kitty
    neovim
    git
    xrandr
    pavucontrol
    pkgs.fastfetch
    pkgs.nnn
    pkgs.qutebrowser
    adwaita-icon-theme
    brightnessctl
    zathura
    pkgs.zathuraPkgs.zathura_pdf_mupdf
    pkgs.maim
    pkgs.slop
    pkgs.xclip
    pkgs.btop
    pkgs.vesktop
    firefox
    thunar
    gvfs
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    adw-gtk3
    adwaita-icon-theme
  ];

  fonts.packages = with pkgs; [
    jetbrains-mono
    maple-mono.variable
  ];
}
