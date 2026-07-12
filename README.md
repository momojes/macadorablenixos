# MacAdorable

A minimalist NixOS configuration for my 12-inch Macbook.

The goal of this project is to build a clean, reproducible workstation with
only the software I actually use. Every package, service, and configuration
change is intentional.

## Philosophy

- Keep the system simple.
- Avoid unnecessary desktop bloat.
- Prefer small, focused applications.
- Version control everything.
- Build from scratch instead of inheriting configurations.

## Hardware

| Component | Details |
|-----------|---------|
| Device | Apple MacBook (12-inch Retina) |
| CPU | Intel Core m-series|
| Display | 2304x1440 Retina |
| Graphics | Intel HD Graphics |
| Window Manager | i3 |
| Display Manager | Ly |

## Software

### Desktop

- i3
- Ly
- Picom
- Fish
- Kitty
- qutebrowser
- FastFetch

### Writing

- Apostrophe
- Zathura (MuPDF backend)

### Terminal

- Kitty
- Neovim
- nnn

### Development

- Git
- Rust
- Hugo
- Gleam
- GCC
- Clang
- Make

## Features

- HiDPI configuration
- Caps Lock -> Escape
- Fish Vi mode
- Keyboard backlight support
- Screenshot shortcuts
- Automatic garbage collection
-Store optimization

## Repository Layout

```
/etc/nixos
├──configuration.nix
├──hardware-configuration.nix
├──install-date
├──README.md
├──NOTES.md
└──modules/
      ├──desktop.nix
      ├──packages.nix
      ├──development.nix
      └──maintenance.nix
```
## Workflox

After making changes:

```bash
git add .
git commit -m "Describe change"
sudo nixos-rebuild test
sudo nixos-rebuild switch
git push
```
Testing before switching helps catch mistakes without attempting to make
a new generation unnecessarily.

## Inspiration

Partially, this machine is intended to feel like a purpose-built, UNIX-style,
writingstation while harnessing the power of NixOS to make configurations stable,
reproducible, and pleasant to use.

