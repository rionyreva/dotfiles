# gaming.nix

{ config, pkgs, ... }:

{

  # System Enviroment Packages.
  environment.systemPackages = with pkgs; [
    prismlauncher
    pokemmo-installer
  ];
  
}
