{ config, lib, pkgs, ... }:

{
  # System packages.
  environment.systemPackages = with pkgs; [
  prismlauncher
  modrinth-app
  space-cadet-pinball
  protonup-qt
  pokemmo-installer
  
  # Lutris - Adding missing dependencies.
  # Libraries
    (lutris.override {
      extraLibraries =  pkgs: [
        # List library dependencies here
      ];
    })
  # Packages
    (lutris.override {
       extraPkgs = pkgs: [
         # List package dependencies here
       ];
    })

  # Heroic Games Launcher - Optional Dependencies.
  (heroic.override {
    extraPkgs = pkgs: [
      #pkgs.gamescope
    ];
  })
  
  wine-staging
  mangohud
  goverlay
  ];

  # Steam.
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };
  
  # GameScope.
  programs.gamescope.enable = true;
  
  # GameMode.
  programs.gamemode.enable = true;

}
