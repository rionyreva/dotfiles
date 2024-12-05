{ config, lib, pkgs, ... }:

{
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  
  # Manage Applications and Extensions.
  environment.systemPackages = with pkgs; [
    gnomeExtensions.rclone-manager
    gnomeExtensions.blur-my-shell
    gnomeExtensions.appindicator
    gnomeExtensions.fly-pie
    gnomeExtensions.wiggle
    gnomeExtensions.ddterm
  ];

  # Enable GSConnect.
  programs.kdeconnect = {
    enable = true;
    package = pkgs.gnomeExtensions.gsconnect;
  };

  # Ensure gnome-settings-daemon udev rules are enabled.
  services.udev.packages = with pkgs; [ gnome-settings-daemon ];

  # Excluding GNOME Applications.
  environment.gnome.excludePackages = with pkgs; [
    # orca
    # evince
    # file-roller
    # geary
    # gnome-disk-utility
    # seahorse
    # sushi
    # sysprof
    # gnome-shell-extensions
    # adwaita-icon-theme
    # nixos-background-info
    # gnome-backgrounds
    # gnome-bluetooth
    # gnome-color-manager
    # gnome-control-center
    # gnome-shell-extensions
    # gnome-tour # GNOME Shell detects the .desktop file on first log-in.
    # gnome-user-docs
    # glib # for gsettings program
    # gnome-menus
    # gtk3.out # for gtk-launch program
    # xdg-user-dirs # Update user dirs as described in https://freedesktop.org/wiki/Software/xdg-user-dirs/
    # xdg-user-dirs-gtk # Used to create the default bookmarks
    # baobab
    # epiphany
    # gnome-text-editor
    # gnome-calculator
    # gnome-calendar
    # gnome-characters
    # gnome-clocks
    # gnome-console
    # gnome-contacts
    # gnome-font-viewer
    # gnome-logs
    # gnome-maps
    # gnome-music
    # gnome-system-monitor
    # gnome-weather
    # loupe
    # nautilus
    # gnome-connectionse
    # simple-scan
    # snapshot
    # totem
    # yelp
    # gnome-software
  ];

  # KDE desktop integration. Using the following example configuration, QT applications will have a look similar to the GNOME desktop, using a dark theme.
  qt = {
    enable = true;
    platformTheme = "gnome";
    style = "adwaita-dark";
  };

}
