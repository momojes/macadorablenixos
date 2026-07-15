{ pkgs, ... }:

let
  myEmacs = pkgs.emacs.pkgs.withPackages (epkgs: with epkgs; [
    use-package
    magit
    vterm
    markdown-mode
    grip-mode
    pdf-tools
    vertico
    orderless
    marginalia
    consult
    which-key
    helpful
    org-modern
    ace-window
    ox-hugo
  ]);
in
{
  environment.systemPackages = with pkgs; [
    myEmacs

    pkgs.git
    pkgs.cmake
    pkgs.gcc
    pkgs.libtool
    pkgs.mupdf
    pkgs.pandoc
    pkgs.grip
  ];

  services.emacs = {
    enable = true;
    package = myEmacs;

    startWithGraphical = true;
  };

 }
