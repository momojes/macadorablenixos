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
 }
