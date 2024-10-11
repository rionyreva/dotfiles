{ config, pkgs, lib, ... }:

{

  # Enable the LXQt Desktop Environment.

  services.xserver.enable = true;

  services.displayManager.lightdm.enable = true;
  services.desktopManager.lxqt.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

}
