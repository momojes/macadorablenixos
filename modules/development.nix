{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    rustc
    cargo
    rustfmt
    clippy
    rust-analyzer

    clang
    gcc
    gnumake
    ncurses
    pkg-config

    hugo
    gleam
  ];
}
