# plasma.nix

{ config, pkgs, lib, ... }:

{

  ## KDE Plasma 6 Desktop Environment. ##

  # Enable the KDE Plasma 6 Desktop Environment.

  #services.xserver.enable = true;
  #services.displayManager.sddm.enable = true;
  #services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Excluding some KDE Plasma applications from the default install
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    plasma-browser-integration
  ];

  # GTK themes are not applied in Wayland applications / Window Decorations missing / Cursor looks different
  programs.dconf.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

}
