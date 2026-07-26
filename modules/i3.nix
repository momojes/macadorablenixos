{ pkgs, ... }:

{
    services.xserver = {
        enable = true;

	xkb = {
	    layout = "us";
	    options = "ctrl:nocaps";
	};

	windowManager.i3 = {
	    enable = true;

	    extraPackages = with pkgs; [
	    	dmenu
		i3status
	    ];
	};
    };

    services.picom = {
        enable = true;
	backend = "glx";
	vSync = true;
    };
}