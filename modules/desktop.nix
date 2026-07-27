{ pkgs, ... }:

{
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

   programs.dconf.enable = true;

   services.udisks2.enable = true;
}