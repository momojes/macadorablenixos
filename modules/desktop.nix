{ pkgs, ... }:

{
  services.xserver = {
    enable = true;

    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        dmenu
        i3status
      ];
    };

    xkb = {
      layout = "us";
      options = "caps:escape";
    };
  };

  services.displayManager.ly.enable = true;

  services.libinput = {
    enable = true;

    touchpad = {
      tapping = true;
      disableWhileTyping = true;
      naturalScrolling = true;
      clickMethod = "clickfinger";
    };
  };

  services.picom = {
    enable = true;
    backend = "glx";
    vSync = true;
  };

  programs.dconf.enable = true;

  xdg.portal = {
     enable = true;
     extraPortals = with pkgs; [
     	  xdg-desktop-portal-gtk
     ];
  };
}
