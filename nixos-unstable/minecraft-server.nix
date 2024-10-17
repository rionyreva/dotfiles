# minecraft-server.nix

{ config, pkgs, ... }:

{
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # System Enviroment Packages.
  environment.systemPackages = with pkgs; [
		jdk
  ];
  
}
