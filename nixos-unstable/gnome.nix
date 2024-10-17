# gnome.nix

{ config, pkgs, lib, ... }:

{

  # GNOME Desktop Environment.
  
  services.xserver.enable = true;  # Enable the X11 windowing system.

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Excluding some GNOME applications.
  environment.gnome.excludePackages = (with pkgs; [
    snapshot # Gnome Camera
    gnome-tour 
    epiphany # Gnome Web browser
    totem # Gnome Music
    yelp # Gnome Help
    geary
    gnome-music
    gnome-font-viewer
    gnome-characters
    gnome-maps
    gnome-software
    gnome-disk-utility # Disks
    baobab # Disk Usage Analyzer
    loupe	# Gnome Image Viewer
  ]) ++ (with pkgs.gnome; [
    
  ]);
  
  # GNOME Enviroment Packages & Extensions.
  environment.systemPackages = (with pkgs; [
    gnome-tweaks
    shotwell
    streamcontroller
    pavucontrol
    # polari # IRC Client
  ]) ++ (with pkgs.gnomeExtensions; [
    appindicator
    blur-my-shell
    wiggle
    just-perfection
		dash-to-panel
    tweaks-in-system-menu
    ddterm
    solaar-extension
    fly-pie
    streamcontroller-integration
  ]);
  
  # GSConnect (KDE Connect for GNOME)
  programs.kdeconnect = {
    enable = true;
    package = pkgs.gnomeExtensions.gsconnect;
  };

  # Ensure gnome-settings-daemon udev rules are enabled.
  services.udev.packages = with pkgs; [ gnome-settings-daemon ];
  
  # Qt applications GNOME desktop integration.
  qt = {
    enable = true;
    platformTheme = "gnome";
    style = "adwaita-dark";
  };
  


####################################################################################################

}
