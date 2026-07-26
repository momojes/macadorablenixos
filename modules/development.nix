{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    
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
    zig
    hare

    github-cli
  ];
}
