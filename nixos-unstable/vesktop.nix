# vesktop.nix

{ config, pkgs, ... }:

{

  # System Enviroment Packages.
  environment.systemPackages = with pkgs; [
    vesktop
];
  
}
