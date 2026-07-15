{ pkgs, ... }:

let
  myEmacs = pkgs.emacs.pkgs.withPackages (epkgs: with epkgs; [
    use-package
    magit
    vterm
    pdf-tools
    vertico
    orderless
    marginalia
    consult
    which-key
    helpful
    org-modern
    ace-window
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
  ];

  services.emacs = {
    enable = true;
    package = myEmacs;

    startWithGraphical = true;

 }
