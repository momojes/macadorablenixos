# MacAdorable Notes

These are implementation notes and discoveries made while configuring this machine.

---

# Display

HiDPI:

```
Xft.dpi: 144
```

X startup:

```sh
xrdb -merge ~/.Xresources
xrandr --dpi 144
```
---

# Fish

Default shell.

Useful variables:

```fish
set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx SUDO_EDITOR nvim
```

Vi mode enabled & Caps Lock acts as Escape.

---

Screenshot Tool

Packages:

```nix
pkgs.maim
pkgs.slop
pkgs.xclip
```

I'm not sure why but I need to use 'pkgs.' to get them to play nicely.

---

# Keyboard

Keyboard backligh device:

```
spi::kbd_backlight
```

Maximum brightness:

```
255
```

---

# PDF Reader

Zathura with MuPDF backend.

Dark Mode:

```conf
set recolor true
set recolor-lightcolor "#181818"
set recolor-darkcolor "c8c8c8"
set recolor-keephue true
```
---

# Browser

Primary Browser

- qutebrowser

Secondary Browser

- firefox

Downloads:

```python
c.downloads.location.directory = ~/downloads"
```

---

# File Manager

Terminal file manager:

```
nnn
```

Launch:

```bash
nnn
```

---

# Fastfetch

OS Age is calculated using:

```
/etc/nixos/install-date
```

---

# Maintenance

The system automatically keeps the latest 10 NixOS system generations.

Weekly systemd timer:

1. Lists the system generations.
2. Deletes all but the newest 10.
3. Runs Nix store garbage collection.

The systemd-boot menu is also limited to 10 configurations.

Store optimization is enabled with:

```nix
nix.settings.auto-optimize-store = true;
```

---

# Git workflow

```bash
cd /etc/nixos

git status

git add .
git commit -m "..."

sudo nixos-rebuild test

sudo nixos-rebuild switch

git push
```

---

# Future Ideas

- Further split components into modules.
- Look into Dendritic NixOS.
- Add Home Manager & Flakes.
- Replace i3status with i3status-rust.
- Add automatic backups

